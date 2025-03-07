import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["quantity", "button"];
  static values = { unitPrice: { type: Number, default: 0 } };

  connect() {
    const unitPrice = this.element.dataset.unitPriceValue;
    this.unitPriceValue = parseFloat(unitPrice);
  }

  update(event) {
    const quantity =  event?.detail?.quantity || this.quantityTarget.value || 1;
    const totalPrice = (this.unitPriceValue * quantity);
    this.buttonTarget.value = `Buy (${totalPrice}€)`;
  }
}
