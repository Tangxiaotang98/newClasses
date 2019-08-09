package com.tangyanyan.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Properties;
/**
 * @author 14761
  * 获取aliyun属性文件中的内容
 */
public class AliyunConfig {
	  private static final String PROPERTIES_DEFAULT = "aliyunConfig.properties";
	    public static String accessKeyId;
	    public static String accessKeySecret;
	    public static String regionId;
	    public static String endpoint;
	    public static String bucketName;
	    public static Properties properties;

	    static{
	        init();
	    }

	    /**
	     * 初始化
	     */
	    private static void init() {
	        properties = new Properties();
	        try{
	            InputStream inputStream = AliyunConfig.class.getClassLoader().getResourceAsStream(PROPERTIES_DEFAULT);
//	          properties.load(inputStream);
//	          inputStream.close();
	            //解决中文乱码，采取reader把inputStream转换成reader用字符流来读取中文
	            BufferedReader bf = new BufferedReader(new InputStreamReader(inputStream));  
	            properties.load(bf); 
	            accessKeyId = properties.getProperty("accessKeyId");
	            accessKeySecret = properties.getProperty("accessKeySecret");
	            regionId = properties.getProperty("regionId");
	            endpoint = properties.getProperty("endpoint");
	            bucketName = properties.getProperty("bucketName");
	        } catch(IOException e){
	            e.printStackTrace();
	        }
	    }

}
