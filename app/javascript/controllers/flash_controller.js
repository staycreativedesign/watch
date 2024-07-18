import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    setTimeout(() => { 
      this.element.classList.add('animate__fadeOutUp') 
    }, 2000)
  }
}
