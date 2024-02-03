document.addEventListener("turbo:load", () => {
  const priceInput = document.getElementById("item-price");
  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;

      const addTaxDom = document.getElementById("add-tax-price");
      const taxPrice = Math.floor(inputValue * 0.1)
      addTaxDom.textContent = taxPrice;
    });
  }
});
