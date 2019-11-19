package util;


public class Checks {

	public static boolean isEmpty(String str) {
		if (str == null || str.trim().equals("")) return true;
		return false;
	}
	
	public static boolean isEmpty(Object obj) {
		if (obj == null) return true;
		return false;
	}
}