package com.chby.controller;

import com.chby.pojo.Paper;
import com.chby.service.PaperService;
import com.chby.service.TeacherService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/paper")
public class PaperController {
    @Autowired(required = false)
    private PaperService paperService;

    @Autowired(required = false)
    private TeacherService teacherService;

    @RequestMapping("/allPaper")
    public String list(Model model, HttpServletRequest request,int pageNum, HttpServletResponse response,String level) throws IOException {
        response.setHeader("Content-type", "text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        //第一页不再上一页
        int pageSize = 5;
        PageHelper.startPage(pageNum, pageSize);

        //第pageNum页 每页pageSize
        List<Paper> paperList = paperService.queryAllPaper();

        //得到分页的结果对象
        PageInfo<Paper> personPageInfo = new PageInfo<>(paperList);

        //得到分页中的person条目对象
        List<Paper> pageList = personPageInfo.getList();
        int listSize = pageList.size();
        //将结果存入map进行传送
        model.addAttribute("list", pageList);
        request.getSession().setAttribute("pageNum", pageNum);
        request.getSession().setAttribute("listSize", listSize);
        if(paperList.size() == 0){
            model.addAttribute("pageInfor",  " Page: " + pageNum + "  is null." );
        }
        model.addAttribute("level", level);
        return "allPaper";
    }

    @RequestMapping("/toAddPaper")
    public String toAddPaper(Model model, @RequestParam("teacherid") String tid) {
        model.addAttribute("addId", tid);
        return "addPaper";
    }

    @RequestMapping("/del/{paperId}")
    public String deletePaper(@PathVariable("paperId") Long id) {
        paperService.deletePaperById(id);
        return "redirect:/paper/allPaper";
    }

    @RequestMapping("toUpdatePaper")
    public String toUpdatePaper(Model model, Long id,HttpServletRequest request) {
        request.getSession().setAttribute("id_infor",id);
        return "updatePaper";
    }

    @RequestMapping("/updatePaper")
    public String updatePaper(Model model, Paper paper, @RequestParam("paperId")long id) {
        String detail = paper.getPaperDetail();
        paper.setPaperId(id);
        Integer num = paperService.updatePaper(paper);
        paper = paperService.queryById(paper.getPaperId());
        model.addAttribute("paper", paper);
        return "redirect:/paper/allPaper";
    }
}


