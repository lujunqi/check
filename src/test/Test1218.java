package test;

public class Test1218 {
	public static void main(String[] args) {
		try {
			int code = 1;
			int code_num = 100000;
			int len = ((code + code_num) + "").length();
			for (int i = code; i < code + code_num; i++) {
				String info = rightFillMethod(i + "", len);
				System.out.println(info);
			}
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
