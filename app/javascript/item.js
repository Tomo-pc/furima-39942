function item () {
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  itemPrice.addEventListener("keyup", () => {
    const price = parseFloat(itemPrice.value);
    if (!isNaN(price)) {
      const fee = Math.floor(price * 0.1);
      const salesProfit = price - fee;

      addTaxPrice.textContent = `${fee.toLocaleString()}`;
      profit.textContent = `${salesProfit.toLocaleString()}`;
    } else {
      addTaxPrice.textContent = "";
      profit.textContent = "";
    }
  });
}

// Turboフレームの読み込み後にitem関数を実行
document.addEventListener('turbo:load', item);
window.addEventListener('turbo:render', item);