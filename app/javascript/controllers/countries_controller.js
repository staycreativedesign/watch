import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
  static targets = ['stateSelect', 'countrySelect', 'citySelect']

  connect(){
  }

  change(){
    let country =  this.countrySelectTarget.value
    let target = this.stateSelectTarget.id
    get(`/addresses/states?target=${target}&country=${country}`, {
      responseKind: "turbo-stream"
    })
  }

  cityChange(){
    let country =  this.countrySelectTarget.value
    let state = this.stateSelectTarget.value
    let target = this.citySelectTarget.id
    get(`/addresses/cities?target=${target}&country=${country}&state=${state}`, {
      responseKind: "turbo-stream"
    })

  }
}
