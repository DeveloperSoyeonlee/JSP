package ex;

public class Test5 {

	public static void main(String[] args) {
		
		//String str = new String("hello");
		String str = "hello";
		System.out.println(str);
		String tmp = str.toUpperCase(); // 대문자 변경 -> 이때만
		System.out.println(str.toUpperCase());
		System.out.println(tmp);
		
		// String 메서드실행 결과를 저장 X (저장하려면 실행결과를 변수에 따로 저장)
		/////////////////////////////////////////////////
		
		System.out.println("---------------------------------");
		StringBuffer sb = new StringBuffer("hello");
		System.out.println(sb);
		sb.reverse();
		System.out.println(sb);
		// StringBuffer 메서드실행 결과를 저장O
		
		
		
		
		
	}

}
