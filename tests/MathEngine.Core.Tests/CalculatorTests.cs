using MathEngine.Core;
using Xunit;

namespace MathEngine.Core.Tests
{
    public class CalculatorTests
    {
        [Fact]
        public void Add_ValidInputs_ReturnsSum()
        {
            var calc = new Calculator();
            var result = calc.Add(2, 3);
            Assert.Equal(5, result);
        }

        [Fact]
        public void Divide_ByZero_ThrowsException()
        {
            var calc = new Calculator();
            Assert.Throws<DivideByZeroException>(() => calc.Divide(1, 0));
        }
    }
}
