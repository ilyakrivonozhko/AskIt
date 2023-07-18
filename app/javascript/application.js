// Entry point for the build script in your package.json
import * as bootstrap from "bootstrap"
import Turbolinks from "turbolinks"
import Rails from "@rails/ujs"
import '@popperjs/core'

Rails.start()
Turbolinks.start()