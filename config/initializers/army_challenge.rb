# Autoload Army Challenge domain classes.
# Load all the domain model classes to make them available throughout the app.
require Rails.root.join("lib/exceptions")
require Rails.root.join("lib/units/unit")
require Rails.root.join("lib/units/pikeman")
require Rails.root.join("lib/units/archer")
require Rails.root.join("lib/units/knight")
require Rails.root.join("lib/civilization")
require Rails.root.join("lib/army")
require Rails.root.join("lib/battle")
