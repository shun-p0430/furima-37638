 function calcProfit(){
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  itemPrice.addEventListener("keyup",() => {
    const ATPValue = Math.floor(itemPrice.value * 0.1);
    const PValue = itemPrice.value - ATPValue;
    addTaxPrice.innerHTML = ATPValue;
    profit.innerHTML = PValue;
  });
};
window.addEventListener("load", calcProfit);