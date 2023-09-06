import { Controller } from "@hotwired/stimulus"
import { Toast } from "bootstrap"

// Connects to data-controller="toast"
export default class extends Controller {
  connect() {
    this.toast = new Toast(this.element)
    this.toast.show()
  }

  disconnect() {
    // このコードがなくても一見ちゃんと動くが、将来予期せぬ問題が起きる可能性があるので念のためトーストを廃棄する
    this.toast.dispose();
  }
}
