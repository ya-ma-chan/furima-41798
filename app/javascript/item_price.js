const price = () => {
  const priceInputDOM = document.getElementById("item-price");
  priceInputDOM.addEventListener("input", () => {
    const inputValue = priceInputDOM.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const tax = Math.floor(inputValue * 0.1);
    addTaxDom.innerHTML = tax.toLocaleString('ja-JP');
    const profitDOM = document.getElementById("profit");
     const profit = inputValue - tax;
    profitDOM.innerHTML = profit.toLocaleString('ja-JP');
  });
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);