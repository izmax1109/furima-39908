const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);

  const addTaxDom = document.getElementById("add-tax-price");
  const taxPrice = Math.floor(inputValue * 0.1)
  addTaxDom.textContent = taxPrice;
})
