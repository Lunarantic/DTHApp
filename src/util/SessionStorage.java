package util;

import java.util.HashMap;
import java.util.Map;

import pojo.Customer;

public class SessionStorage {

	private static Map<String, Customer> store = new HashMap<>();
	
	public static boolean storeSession(String key, Customer obj) {
		return store.put(key, obj) == obj;
	}
	
	public static Customer getSession(String key) {
		return store.get(key);
	}
	
	public static boolean removeSession(String key) {
		if (key == null) return false;
		return store.remove(key) != null;
	}
}
