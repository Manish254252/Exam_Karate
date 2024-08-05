package automation.getRequest;


import com.intuit.karate.junit5.Karate;

import com.intuit.karate.junit5.Karate.Test;
import org.junit.jupiter.api.AfterAll;


public class TestRunner {
   @Test
    public  Karate runTest()
    {
      return    Karate.run("classpath://features").reportDir("Cucumber-karate").outputCucumberJson(true);
    }
//    @AfterAll
//    static void reporter()
//    {
//        System.out.println("after all run");
//        JsonMerger.JsonGenerator();
//    }
}
