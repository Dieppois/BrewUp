
import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="quantity"
export default class extends Controller {
  static targets = ["quantity", "button"];
  static values = { unitPrice: { type: Number, default: 1 } };

  connect() {
    const unitPrice = this.element.dataset.unitPriceValue;
    this.unitPriceValue = parseFloat(unitPrice);
    console.log(unitPrice);
  }

  increment() {
    let currentValue = parseInt(this.quantityTarget.value, 10) || 0;
    this.quantityTarget.value = currentValue + 1;
    console.log(this.quantityTarget.value);
    this.update();

  }
  decrement() {
    let currentValue = parseInt(this.quantityTarget.value, 10) || 0;
    if (currentValue > 1) { // Prevent going below 1
      this.quantityTarget.value = currentValue - 1;
      console.log(this.quantityTarget.value);
      this.update();
    }
  }
  update() {
    const quantity = this.quantityTarget.value || 1;
    const unitPrice = this.element.dataset.unitPriceValue;
    const totalPrice = (unitPrice * quantity);
    console.log(totalPrice);

    this.buttonTarget.value = `Buy (${totalPrice}€)`;
  }
}
