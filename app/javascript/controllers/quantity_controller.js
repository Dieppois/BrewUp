
import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="quantity"
export default class extends Controller {
  static targets = ["quantity"];

  increment() {
    this.quantityTarget.value = Number(this.quantityTarget.value) + 1;
  }

  decrement() {
    if (this.quantityTarget.value > 1) {
      this.quantityTarget.value = Number(this.quantityTarget.value) - 1;
    }
  }

/*   addToCart() {
    const quantity = this.quantityTarget.value;
    alert(`Ajouté au panier : ${quantity} x ${this.element.dataset.name}`);
  } */
}
