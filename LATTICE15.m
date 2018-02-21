public class Problem15
{
    public static void main(String[] args) 
   {

      long totalways =0;
      totalways = routes(20,20);  
      System.out.println(totalways);    
   }
       
  public static long routes(int a , int b)
    {
       long c = 0;
       if(a==0 || b==0)
          c = 1;
       else
          c = routes(a-1,b) + routes(a,b-1);
       return(c);
    }
}
