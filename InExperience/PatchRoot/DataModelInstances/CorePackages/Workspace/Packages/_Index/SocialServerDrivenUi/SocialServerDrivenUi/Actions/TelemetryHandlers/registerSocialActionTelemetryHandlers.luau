local parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local getSduiTelemetryHandlerNameRegistry = require(parent.SduiCoreSystem).getSduiTelemetryHandlerNameRegistry
local fFlagSduiSearchPeoplePlayerTileTelemetry = require(parent.SharedFlags).FFlagSduiSearchPeoplePlayerTileTelemetry

return function()
	-- upvalues: getSduiTelemetryHandlerNameRegistry (ref), fFlagSduiSearchPeoplePlayerTileTelemetry (ref)
	getSduiTelemetryHandlerNameRegistry().registerTelemetryHandlers({
		PlayerTileClick = if fFlagSduiSearchPeoplePlayerTileTelemetry then {
			lazyHandler = function()
				return require(script.Parent.SduiPlayerTileClickTelemetryHandler)
			end
		} else nil
	})
end