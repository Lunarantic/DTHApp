package util;

import java.util.HashMap;
import java.util.Map;

import pojo.StbTypePojo;

public class Cache {

	private static Map<String, StbTypePojo> stbs = new HashMap<>();
	
	public static StbTypePojo get(String id) {
		return stbs.get(id);
	}
	
	public static boolean put(StbTypePojo stb) {
		return stbs.put(stb.toString(), stb).equals(stb);
	}
}
