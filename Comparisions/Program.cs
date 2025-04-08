using Comparisions;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


public class Program
{
    static int HighCounter;
    static int MediumCounter;
    static int LowCounter;

    static float HighSalarys;
    static float MediumSalaries;
    static float LowSalaries;

    static void Main(string[] args)
    {
        DataTable dataTable = UpdateSalary.GetAllEmps();
        Stopwatch stopwatch = Stopwatch.StartNew();

        foreach (DataRow row in dataTable.Rows)
        {

            if ((int)row["PerformanceRating"] >= 80)
            {
                Console.WriteLine($"Rate is: {UpdateSalary.UpdateEmpsBonus((string)row["Name"], "High")}");
                HighCounter++;
                HighSalarys += Convert.ToSingle( row["Salary"]);
            }
            else if ((int)row["PerformanceRating"] < 80 && (int)row["PerformanceRating"] >= 60)
            {
                Console.WriteLine($"Rate is: {UpdateSalary.UpdateEmpsBonus((string)row["Name"], "Medium")}");
                MediumCounter++;
                MediumSalaries += Convert.ToSingle(row["Salary"]);

            }
            else
            {
                Console.WriteLine($"Rate is: {UpdateSalary.UpdateEmpsBonus((string)row["Name"], "Low")}");

                LowCounter++;
                LowSalaries += Convert.ToSingle(row["Salary"]);
            }
           
            


        }
        Console.WriteLine($"Performance Category = High, Count: {HighCounter}, Average: {HighSalarys / HighCounter}");
        Console.WriteLine($"Performance Category = Medium, Count: {MediumCounter}, Average: {MediumSalaries / MediumCounter}");
        Console.WriteLine($"Performance Category = Low, Count: {LowCounter}, Average: {LowSalaries/ LowCounter}");
        stopwatch.Stop();
        Console.WriteLine(stopwatch.ElapsedMilliseconds);
    }
}

