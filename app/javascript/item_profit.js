const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);

  const profitDom = document.getElementById("profit");
  const taxPrice = Math.floor(inputValue * 0.1);
  const profitPrice = inputValue - taxPrice
  profitDom.textContent = profitPrice;
})
