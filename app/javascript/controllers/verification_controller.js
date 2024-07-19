import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['form', 'input', 'submit']

  connect() {
  }

  move(e){
    const index = this.inputTargets.indexOf(e.currentTarget);

    if (e.key === 'Delete' || e.key === 'Backspace') {
      if (index > 0) {
        this.inputTargets[index].value = '';
        this.inputTargets[index - 1].focus();
      }
    } else if( 
        e.key !== 'Delete'
        && e.key !== 'Tab'
        && e.key !== 'Shift'
        && e.key !== 'Option'
        && e.key !== 'Escape'
        && !e.metaKey
        && index < this.inputTargets.length - 1
    ) {
      this.inputTargets[index + 1].focus();
      e.stopImmediatePropagation()
    }
  }
}
