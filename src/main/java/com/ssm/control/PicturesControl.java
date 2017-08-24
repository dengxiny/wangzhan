package com.ssm.control;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ssm.bean.Page;
import com.ssm.bean.Pictures;
import com.ssm.service.PicturesService;

@Controller
public class PicturesControl {
	@Resource(name = "PicturesService")
	PicturesService picturesService;

	//图片查找
	@RequestMapping(value="/jsp/selpic",method={RequestMethod.GET})
	public String selpic(HttpServletRequest request) {
		String type=request.getParameter("type");
		String pagecode1=request.getParameter("pagecode");
		int pagecode;
		if(pagecode1==null){
			pagecode=1;
		}else{
		pagecode=Integer.valueOf(pagecode1);}
		System.out.println(type);
		Pictures pic=new  Pictures();
		pic.setType(type);
		Page<Pictures> page=new Page<Pictures>();
		page.setPagecode(pagecode);
		page.setPagerecord(9);
		page.setTotalrecord(picturesService.selectTypeCount(pic));
		page.setList(picturesService.selectTypeList(pic,pagecode,page.getPagerecord()));
//		Page<Pictures> page=
//		List<Pictures> list=picturesService.selectType(pic);
//		for (Pictures pictures : list) {
//			System.out.println(pictures.getImagepath());
//		}
		request.setAttribute("pb", page);
		request.setAttribute("type", type);
		return "jsp/test2";
	}
	// "redirect:/index.jsp"
	@RequestMapping(value="/jsp/selpic1",method={RequestMethod.GET})
	public String selpic1(HttpServletRequest request) {
		String type=request.getParameter("type");
		String typedetail=request.getParameter("typedetail");
		Pictures pic=new  Pictures();
		pic.setType(type);
		List<String> list=picturesService.selectTypeDetail(pic);
		list.remove(null);
		request.setAttribute("list2", list);
		request.setAttribute("type", type);
		System.out.println("---------------");
		System.out.println(type);
		System.out.println(typedetail);
		System.out.println("---------------");
		if(typedetail!=null){
			try {
				typedetail=	new String(typedetail.getBytes("ISO-8859-1"),"utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			pic.setTypedetail(typedetail);
			List<Pictures> list1=picturesService.selectType2(pic);
			System.out.println("---------------");
			for (Pictures pictures : list1) {
				System.out.println(pictures.getImagepath());
			}
			System.out.println("---------------");
			request.setAttribute("list", list1);
		}
		return "jsp/test6";
	}
/*	@RequestMapping(value="/jsp/selpic2",method={RequestMethod.GET})
	public String selpic2(HttpServletRequest request) throws Exception {
		String type=request.getParameter("type");
		String typedetail=request.getParameter("typedetail");
		typedetail=	new String(typedetail.getBytes("ISO-8859-1"),"utf-8");
		Pictures pic=new  Pictures();
		pic.setType(type);
		pic.setTypedetail(typedetail);
		List<Pictures> list=picturesService.selectType2(pic);
		for (Pictures pictures : list) {
			System.out.println(pictures.getImagepath());
		}
		List<String> list1=new ArrayList<String>();
		list1.add("动物");list1.add("人物");
		request.setAttribute("list2", list1);
		request.setAttribute("list", list);
		return "jsp/test6";
	}*/
	  @RequestMapping(value = "/download",produces = "application/octet-stream;charset=UTF-8")
      public ResponseEntity<byte[]> download() throws IOException {
//          指定文件,必须是绝对路径
      File file = new File("E:/我去.txt");
//          下载浏览器响应的那个文件名
      String dfileName = "我去.txt";
//          下面开始设置HttpHeaders,使得浏览器响应下载
      HttpHeaders headers = new HttpHeaders();
//          设置响应方式
      headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
//          设置响应文件
      headers.setContentDispositionFormData("attachment", dfileName);
//          把文件以二进制形式写回
      return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
  }
      @RequestMapping("/down")  
      public void down(HttpServletRequest request,HttpServletResponse response) throws Exception{  
          //模拟文件，myfile.txt为需要下载的文件  
         // String fileName = request.getSession().getServletContext().getRealPath("upload")+"/myfile.txt";  
          //获取输入流  
          InputStream bis = new BufferedInputStream(new FileInputStream(new File("C:/我气.wmv")));  
          //假如以中文名下载的话  
          String filename = "我气.wmv";  
          //转码，免得文件名中文乱码  
          filename = URLEncoder.encode(filename,"UTF-8");  
          //设置文件下载头  
          response.addHeader("Content-Disposition", "attachment;filename=" + filename);    
          //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型    
          response.setContentType("multipart/form-data");   
          BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());  
          byte[] b = new byte[1024];
          int len = 0;  
          while((len = bis.read(b)) != -1){  
              out.write(b,0,len);  
              out.flush();  
          }  
          out.close();  
      }  
      @RequestMapping("/jsp/insertPIC")  
      public void insertPIC(HttpServletRequest request,HttpServletResponse response) throws Exception{  
    	  picturesService.add();
    	 
      } 
}
