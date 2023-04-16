package feature;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.Test;

import static org.junit.Assert.assertTrue;

public class TestSuite {

    @Test
    public void testParallel() {
        Results results = Runner.path("classpath:feature")
                .outputCucumberJson(true)
                .karateEnv("feature")
                .parallel(5);
               assertTrue(results.getErrorMessages(), results.getFailCount() == 0);
    }
}