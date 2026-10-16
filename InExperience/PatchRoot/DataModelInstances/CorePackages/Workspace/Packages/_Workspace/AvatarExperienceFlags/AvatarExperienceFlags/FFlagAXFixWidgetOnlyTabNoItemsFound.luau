local FFlagAXMoveAllTabToWidgetOnlyModule = require(script.Parent.FFlagAXMoveAllTabToWidgetOnly)

return require(script.Parent.FFlagAXRootRFYMigration) and (FFlagAXMoveAllTabToWidgetOnlyModule and game:DefineFastFlag("AXFixWidgetOnlyTabNoItemsFound", false))