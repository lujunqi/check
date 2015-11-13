package test;

import java.io.ByteArrayOutputStream;
import java.util.zip.GZIPOutputStream;

public class Test1218 {
	public static byte[] gzip(byte[] data) {
		byte[] b = null;
		try {
			ByteArrayOutputStream bos = new ByteArrayOutputStream();
			GZIPOutputStream gzip = new GZIPOutputStream(bos);
			gzip.write(data);
			gzip.finish();
			gzip.close();
			b = bos.toByteArray();
			bos.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return b;
	}

	public static void main(String[] args) {
		try {
			StringBuffer sb = new StringBuffer();
			sb.append('D');
			sb.append('s');
			sb.append(0.0f);
			sb.append(0.0f);
			sb.append('m');
			sb.append(1.0f);
			sb.append(2.0f);
			sb.append('m');
			sb.append(1.0f);
			sb.append(2.0f);
			sb.append('m');
			sb.append(12.0f);
			sb.append(22.0f);
			sb.append('u');
			sb.append(0.0f);
			sb.append(0.0f);
			
			System.out.println(sb.toString());
			
//			FileReader fr = new FileReader("e:/temp/mina_data/2df2d89d_8a1f_4b74_b5ed_218729d42cc6");
//			byte v = '\n';
//			System.out.println(v);
//			int i = 0;
//			while((i=fr.read())!=-1){
//				System.out.print(i+",");
//				if(i==10){
//					System.out.println();
//				}
//			}
//			fr.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static String rightFillMethod(String str, int j) {
		if (j < str.length()) {
			return str;
		}
		for (int i = 0; i < j - str.length(); i++) {
			str = "0" + str;
		}
		return str;
	}
}
