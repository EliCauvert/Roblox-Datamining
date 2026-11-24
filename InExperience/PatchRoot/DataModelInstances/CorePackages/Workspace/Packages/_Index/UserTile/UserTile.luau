return {
	["jest.config"] = script["jest.config"],
	UserTileEventHandlers = require(script.Components.UserTileEventHandlers),
	UserTile = if game:DefineFastFlag("UserTileAddDataHydrationWrapper", false) then require(script.UserTileEntry.UserTileContainer) else require(script.Components.UserTile),
	LayoutMode = require(script.Enums.LayoutMode),
	InsigniaGroup = require(script.Components.InsigniaGroup.InsigniaGroup),
	InsigniaType = require(script.Enums.InsigniaType)
}