public class Employee {

    private String firstName;
    private String lastName;
    private String address;

    public Employee(){
        firstName = "";
        lastName = "";
        address = "";
    }
    public Employee(String firstName, String lastName, String address){
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
    }

    public void print(){
        System.out.println("Employee -- [" +
                "First Name :"+firstName+" , Last Name : "+lastName+
                ", Address : "+address+" ] ");
    }
}
