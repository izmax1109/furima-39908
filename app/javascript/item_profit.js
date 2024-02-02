document.addEventListener("turbo:load", () => {
  const priceInput = document.getElementById("item-price");
  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;

      const profitDom = document.getElementById("profit");
      const taxPrice = Math.floor(inputValue * 0.1);
      const profitPrice = inputValue - taxPrice;
      profitDom.textContent = profitPrice;
    });
  }
});
