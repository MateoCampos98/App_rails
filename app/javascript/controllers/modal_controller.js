import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["sidebar"]
  connect() {
    this.element.addEventListener("turbo:submit-end", (event) => {
      if (event.detail.success) {
        Turbo.visit(event.detail.fetchResponse.response.url)
      }
    })
  }
  
  close() {
    this.sidebarTarget.classList.add('visible')

    setTimeout (() => {
      this.element.remove()
    }, 250)
  }
}