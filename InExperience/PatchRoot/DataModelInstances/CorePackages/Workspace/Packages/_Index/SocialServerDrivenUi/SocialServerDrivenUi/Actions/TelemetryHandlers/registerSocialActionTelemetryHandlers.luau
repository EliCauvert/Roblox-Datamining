local parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local getSduiTelemetryHandlerNameRegistry = require(parent.SduiCoreSystem).getSduiTelemetryHandlerNameRegistry
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiSearchPeoplePlayerTileTelemetry = sharedFlagsModule.FFlagSduiSearchPeoplePlayerTileTelemetry
local fFlagSduiSocialUpsellButtonClickTelemetry = sharedFlagsModule.FFlagSduiSocialUpsellButtonClickTelemetry

return function()
	-- upvalues: getSduiTelemetryHandlerNameRegistry (ref), fFlagSduiSearchPeoplePlayerTileTelemetry (ref), fFlagSduiSocialUpsellButtonClickTelemetry (ref)
	getSduiTelemetryHandlerNameRegistry().registerTelemetryHandlers({
		PlayerTileClick = if fFlagSduiSearchPeoplePlayerTileTelemetry then {
			lazyHandler = function()
				return require(script.Parent.SduiPlayerTileClickTelemetryHandler)
			end
		} else nil,
		SocialUpsellButtonClick = if fFlagSduiSocialUpsellButtonClickTelemetry then {
			lazyHandler = function()
				return require(script.Parent.SduiSocialUpsellButtonClickTelemetryHandler)
			end
		} else nil
	})
end