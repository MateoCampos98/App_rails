import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  
  static targets = ["items"]
  
  open(){
    this.itemsTarget.classList.remove('hidden');
    this.itemsTarget.classList.remove('visible')
  }

  close(){
    this.itemsTarget.classList.add('visible')
  }
  
}