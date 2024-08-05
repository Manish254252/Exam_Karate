package automation.getRequest;


import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;
import java.util.Collection;

public class JsonMerger {

    public static void JsonGenerator() {

        String jsonDirectoryPath = "target/karate-reports/";

        String outputFilePath = "target/cucumber.json";

        try {
            mergeJsonFiles(jsonDirectoryPath, outputFilePath);
            System.out.println("JSON files merged successfully!");
        } catch (IOException e) {
            e.printStackTrace();
            System.err.println("Failed to merge JSON files.");
        }
    }

    public static void mergeJsonFiles(String jsonDirectoryPath, String outputFilePath) throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        ArrayNode combinedArray = objectMapper.createArrayNode();

        Collection<File> jsonFiles = FileUtils.listFiles(new File(jsonDirectoryPath), new String[]{"json"}, true);
        for (File file : jsonFiles) {
            JsonNode jsonNode = objectMapper.readTree(file);
            if (jsonNode.isArray()) {
                combinedArray.addAll((ArrayNode) jsonNode);
            } else {
                combinedArray.add(jsonNode);
            }
        }

        objectMapper.writerWithDefaultPrettyPrinter().writeValue(new File(outputFilePath), combinedArray);
    }
}
