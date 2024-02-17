package redis.ex3.Ex03;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.args.ListPosition;
 
public class SimplePost {
 
	private Jedis jedis;
	public static String USERS = "users"; // Key set for users' name
	public static String USERS_List = "usersList"; // Key list for users' name
	public static String USERS_Hash = "usersHash"; // Key hash for users' name
	
	public SimplePost() {
		this.jedis = new Jedis();
	}

	public void clearKey(String key) {
		jedis.del(key);
	}
 
	public void saveUserSet(String username) {
		jedis.sadd(USERS, username);
	}
	public Set<String> getUserSet() {
		return jedis.smembers(USERS);
	}
	
	public Set<String> getAllKeys() {
		return jedis.keys("*");
	}

	public void saveUserListBeggining(String username) {
		jedis.lpush(USERS_List, username);
	}

	public void saveUserListEnd(String username) {
		jedis.rpush(USERS_List, username);
	}

	public void insertUserList(String position, String pivot, String value) {
		if ("before".equalsIgnoreCase(position)){
			jedis.linsert(USERS_List, ListPosition.BEFORE, pivot, value);
		} else if ("after".equalsIgnoreCase(position)){
			jedis.linsert(USERS_List, ListPosition.AFTER, pivot, value);
		} else {
			System.out.println("Invalid arguments, example of use: insertUserList(\"before\", \"Ana\", \"Pedro\")");
		}
	}

	public void popListBeggining() {
		jedis.lpop(USERS_List);
	}

	public void popListEnd() {
		jedis.rpop(USERS_List);
	}

	public void trimList(int start, int end) {
		jedis.ltrim(USERS_List, start, end);
	}

	//remove elements from list
	public void removeList(String value, int count) {
		jedis.lrem(USERS_List, count, value); //count = 0 (remove all elements equal to value)
	}

	public String getElementByIndex(int index) {
		return jedis.lindex(USERS_List, index);
	}

	public List<String> getRange(int start, int end) {
		return jedis.lrange(USERS_List, start, end);
	}

	public void saveUserHash( Map<String , String> fieldValues) {
		if (fieldValues.isEmpty()){
			System.out.println("Invalid arguments, example of use: saveUserHash(\"Ana\", \"Idade\", \"20\")");
			return;
		}
		jedis.hmset(USERS_Hash, fieldValues);
		jedis.close();

	}

	public List<String> getUserHash(String... fields) {
		return jedis.hmget(USERS_Hash, fields);
	}

	public Set<String> getAllUsersHashKeys() {
		return jedis.hkeys(USERS_Hash);
	}

	public List<String> getAllUsersHashValues() {
		return jedis.hvals(USERS_Hash);
	}

	public void removeUserHash(String... fields) {
		jedis.hdel(USERS_Hash, fields);
	}

	public Long countUsersHash() {
		return jedis.hlen(USERS_Hash);
	}


	public Map<String, String> getAllUsersHash() {
		return jedis.hgetAll(USERS_Hash);
	}


	
	public static void main(String[] args) {
		SimplePost board = new SimplePost();
		String[] users = { "Ana", "Pedro", "Maria", "Luis" };
		// set some users
		System.out.println("-------Usage of Set-------");
		for (String user: users) 
			board.saveUserSet(user);
		board.getAllKeys().stream().forEach(System.out::println);
		board.getUserSet().stream().forEach(System.out::println);
		
		// set some users
		System.out.println("-------Usage of List-------");
		for (String user: users) 
			board.saveUserListBeggining(user);
		board.saveUserListEnd("Bernardo");
		board.getRange(0, -1).stream().forEach(System.out::println);
		board.insertUserList("before", "Ana", "Rui");
		board.insertUserList("ola", "Ana", "Rui");
		board.getRange(0, -1).stream().forEach(System.out::println);
		board.popListBeggining();
		System.out.println(board.getElementByIndex(0));
		board.clearKey(USERS_List); //clear list

		System.out.println("-------Usage of Hash-------");
		Map<String, String> fieldValues = new HashMap<>();
		String[] usersHash = { "Ana", "Pedro", "Maria", "Luis", "Joao" };

		for (String user: usersHash) {
			fieldValues.put("Nome", user);
			fieldValues.put("Idade", "20");
			fieldValues.put("Morada", "Porto");
			board.saveUserHash(fieldValues);
			Map<String, String> allUsers = board.getAllUsersHash();
			allUsers.forEach((k,v) -> System.out.println("Key: " + k + ": Value: " + v));
		}

		List<String> newValues = board.getUserHash("Nome", "Idade");

		System.out.println("Name: " + newValues.get(0));
		System.out.println("Age: " + newValues.get(1));

		Set<String> hashKeys = board.getAllUsersHashKeys();
        System.out.println("Hash Keys: " + hashKeys);

		List<String> hashValues = board.getAllUsersHashValues();
		System.out.println("Hash Values: " + hashValues);

		board.removeUserHash("age");
		
		Long count = board.countUsersHash();
        System.out.println("Number of Fields: " + count);

		Map<String, String> allFieldsAndValues = board.getAllUsersHash();
        System.out.println("All Fields and Values: " + allFieldsAndValues);

		}
}



