function calc() {
  const input = document.getElementById("item_price");

  input.addEventListener("input", (e) => {
    const inputData = document.getElementById("item_price").value;
    const price = Number(inputData);
    const taxArea = document.getElementById("add-tax-price");
    const profitArea = document.getElementById("profit");
    let commissionRate = 0.1;
    if (inputData.match(/^([1-9]\d*|0)$/)) {
    const taxPrice = Math.floor(price * commissionRate);
    const profit = Math.floor(price - taxPrice);

    taxArea.innerHTML = taxPrice.toLocaleString();
    profitArea.innerHTML = profit.toLocaleString();
    } else {
      taxArea.innerHTML = "半角数字のみ入力可能";
      profitArea.innerHTML = "半角数字のみ入力可能";
    }
    e.preventDefault();
  })
}
setInterval(calc, 1000);