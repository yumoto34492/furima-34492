const pay = () => {
  Payjp.setPublicKey("pk_test_f112c62e10d86ad46bae2951");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

      const formResult = document.getElementById("charge-form");
      const formData = new FormData(formResult);

      const card = {
        number: formData.get("purchases_shipping_address[number]"),
        exp_month: formData.get("purchases_shipping_address[exp_month]"),
        exp_year: `20${formData.get("purchases_shipping_address[exp_year]")}`,
        cvc: formData.get("purchases_shipping_address[cvc]"),
      };

      Payjp.createToken(card, (status, response) => {
        if (status == 200 ) {
          const token = response.id;
          const renderDom = document.getElementById("charge-form");
          const tokenObj = `<input value=${token} name='token' type="hidden">`;
          renderDom.insertAdjacentHTML("beforeend", tokenObj);
        }

      document.getElementById("purchases_shipping_address_number").removeAttribute("name");
      document.getElementById("purchases_shipping_address_exp_month").removeAttribute("name");
      document.getElementById("purchases_shipping_address_exp_year").removeAttribute("name");
      document.getElementById("purchases_shipping_address_cvc").removeAttribute("name");
      });
  });
};

window.addEventListener("load", pay);