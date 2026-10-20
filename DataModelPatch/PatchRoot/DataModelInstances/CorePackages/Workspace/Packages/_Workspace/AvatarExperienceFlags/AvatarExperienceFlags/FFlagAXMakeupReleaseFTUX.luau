local FFlagAXCustomizeMakeupSupportModule = require(script.Parent.FFlagAXCustomizeMakeupSupport)
local FFlagAXCatalogMakeupSupportModule = require(script.Parent.FFlagAXCatalogMakeupSupport)
local FFlagAXMakeupEquippingModule = require(script.Parent.FFlagAXMakeupEquipping)

return game:DefineFastFlag("AXMakeupReleaseFTUX", false) and (FFlagAXCustomizeMakeupSupportModule and (FFlagAXCatalogMakeupSupportModule and FFlagAXMakeupEquippingModule))