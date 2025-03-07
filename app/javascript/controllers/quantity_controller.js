
import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="quantity"
export default class extends Controller {
  static targets = ["quantity"];

  increment() {
    let currentValue = parseInt(this.quantityTarget.value, 10) || 0;
    this.quantityTarget.value = currentValue + 1;
    this.updateHiddenQuantity();
    this.dispatch("update", { detail: { quantity: this.quantityTarget.value } });
  }
  decrement() {
    let currentValue = parseInt(this.quantityTarget.value, 10) || 0;
    if (currentValue > 1) { // Prevent going below 1
      this.quantityTarget.value = currentValue - 1;
      this.updateHiddenQuantity();
      this.dispatch("update", { detail: { quantity: this.quantityTarget.value } });
    }

  // addToCart() {
  //   const quantity = this.quantityTarget.value;
  //   alert(`Ajouté au panier : ${quantity} x ${this.element.dataset.name}`);
  // }
  }
}
