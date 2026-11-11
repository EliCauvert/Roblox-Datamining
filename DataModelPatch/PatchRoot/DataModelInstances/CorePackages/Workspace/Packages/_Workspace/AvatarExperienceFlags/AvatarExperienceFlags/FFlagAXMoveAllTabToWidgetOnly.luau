local FFlagAXPassScreenSizeToWidgetApiModule = require(script.Parent.FFlagAXPassScreenSizeToWidgetApi)

return require(script.Parent.FFlagAXRootRFYMigration) and (FFlagAXPassScreenSizeToWidgetApiModule and game:DefineFastFlag("AXMoveAllTabToWidgetOnly5", false))