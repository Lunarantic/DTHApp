package util;

import java.util.HashMap;
import java.util.Map;

public class SessionStorage {

	private static Map<String, Object> store = new HashMap<>();
	
	public static boolean storeSession(String key, Object obj) {
		return store.put(key, obj) == obj;
	}
	
	public static Object getSession(String key) {
		return store.get(key);
	}
}
