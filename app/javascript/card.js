const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    //クレカ情報取得・生成したFormDataオブジェクトから、クレジットカードに関する情報を取得し、変数cardに代入するオブジェクトとして定義しています。"order[number]"など
    const card = {
      number: formData.get("purchase_address[number]"),
      cvc: formData.get("purchase_address[cvc]"),
      exp_month: formData.get("purchase_address[exp_month]"),
      exp_year: `20${formData.get("purchase_address[exp_year]")}`,
    };
    //上２つは取得している要素の役割が異なる
    //クレカ情報をトークン化
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        //トークンの値をフォームに含める
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;//type属性の値にhiddenでトークンの値を非表示
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      //クレカ情報消す
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      //サーバーサイドにトークン（フォーム情報）送信
      document.getElementById("charge-form").submit();
      //コントローラー、ストロングパラメーターにmargeで情報取得できるようにする
      //orderモデルにトークンの値追加
      //payjpのgem追加
      //コントローラーのクリエイトに秘密鍵追加、その際バリデーション正常に働いたら決済処理できる記述、
      //見やすくリファクタリングを行う
      //現段階GITHUBプッシュNG
    });
  });
};

window.addEventListener("load", pay);