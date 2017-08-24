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

	//ͼƬ����
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
		list1.add("����");list1.add("����");
		request.setAttribute("list2", list1);
		request.setAttribute("list", list);
		return "jsp/test6";
	}*/
	  @RequestMapping(value = "/download",produces = "application/octet-stream;charset=UTF-8")
      public ResponseEntity<byte[]> download() throws IOException {
//          ָ���ļ�,�����Ǿ���·��
      File file = new File("E:/��ȥ.txt");
//          �����������Ӧ���Ǹ��ļ���
      String dfileName = "��ȥ.txt";
//          ���濪ʼ����HttpHeaders,ʹ���������Ӧ����
      HttpHeaders headers = new HttpHeaders();
//          ������Ӧ��ʽ
      headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
//          ������Ӧ�ļ�
      headers.setContentDispositionFormData("attachment", dfileName);
//          ���ļ��Զ�������ʽд��
      return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
  }
      @RequestMapping("/down")  
      public void down(HttpServletRequest request,HttpServletResponse response) throws Exception{  
          //ģ���ļ���myfile.txtΪ��Ҫ���ص��ļ�  
         // String fileName = request.getSession().getServletContext().getRealPath("upload")+"/myfile.txt";  
          //��ȡ������  
          InputStream bis = new BufferedInputStream(new FileInputStream(new File("C:/����.wmv")));  
          //���������������صĻ�  
          String filename = "����.wmv";  
          //ת�룬����ļ�����������  
          filename = URLEncoder.encode(filename,"UTF-8");  
          //�����ļ�����ͷ  
          response.addHeader("Content-Disposition", "attachment;filename=" + filename);    
          //1.�����ļ�ContentType���ͣ��������ã����Զ��ж������ļ�����    
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
