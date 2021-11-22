import java.util.Scanner;
import java.nio.file.*;
import java.io.*;

public class Main {
    public static void main(String[] args) throws IOException{
        System.out.println("Enter the name of the python file to parse: ");
        Scanner scan = new Scanner(System.in);
        String fileName = scan.nextLine();
        Path path = Paths.get(fileName);

        scan.close();
        // check first if file ends with .py
        if(!fileName.endsWith(".py")){
            System.out.println("File name must end with .py");
            return;
        }
        if (Files.notExists(path)) {
            System.out.println("File does not exist");
            return;
        }
        File fileObj = new File(fileName);
        magicStuff(fileObj);


        
    

    }

    public static void magicStuff(File fileObj) throws IOException{
        // yey

    }
}
