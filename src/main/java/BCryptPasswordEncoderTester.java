import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class BCryptPasswordEncoderTester {
	
	@Autowired 
	BCryptPasswordEncoder bcrypt;  // new를 하지 않고 injection됨
	
	public static void main(String[]args) {
		BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
		System.out.println(bpe.encode("1234"));
	}
}
