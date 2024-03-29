const price = () => {
  const priceInput = document.getElementById("item-price");
  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;

      const addTaxDom = document.getElementById("add-tax-price");
      const profitDom = document.getElementById("profit");

      const taxPrice = Math.floor(inputValue * 0.1);
      addTaxDom.innerHTML = taxPrice;

      const profitPrice = inputValue - taxPrice;
      profitDom.innerHTML = profitPrice;
      console.log("OK");
    });
  }
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
