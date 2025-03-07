import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["quantity", "button"];
  static values = { unitPrice: { type: Number, default: 0 } };

  connect() {
    const unitPrice = this.element.dataset.unitPriceValue; // Récupère la valeur depuis le DOM
    this.unitPriceValue = parseFloat(unitPrice); // Convertit en nombre
    this.update();
  }

  update(event) {
    const quantity =  event?.detail?.quantity || this.quantityTarget.value || 1;
    const totalPrice = (this.unitPriceValue * quantity);
    console.log(totalPrice);
    this.buttonTarget.value = `Buy (${totalPrice}€)`;
  }
}
