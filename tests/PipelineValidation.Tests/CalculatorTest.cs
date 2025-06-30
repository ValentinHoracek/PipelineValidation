namespace PipelineValidation.Tests;

public class CalculatorTest
{
    [Fact]
    public void Add_ReturnsSum()
    {
        Assert.Equal(7, Calculator.Add(3, 4));
    }

    [Fact]
    public void Subtract_ReturnsDifference()
    {
        Assert.Equal(1, Calculator.Subtract(5, 4));
    }
}