using MathEngine.Core;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace MathEngine.Core.Tests
{
    [TestClass]
    public class CalculatorTests
    {
        [TestMethod]
        public void Add_ValidInputs_ReturnsSum()
        {
            var calc = new Calculator();
            var result = calc.Add(2, 3);
            Assert.AreEqual(5, result);
        }

        [TestMethod]
        public void Divide_ByZero_ThrowsException()
        {
            var calc = new Calculator();
            Assert.ThrowsException<DivideByZeroException>(() => calc.Divide(1, 0));
        }
    }
}
