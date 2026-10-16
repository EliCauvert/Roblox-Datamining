local Parent = script:FindFirstAncestor("SocialServerDrivenUi").Parent
local GetSduiTelemetryHandlerNameRegistryFunction = require(Parent.SduiCoreSystem).getSduiTelemetryHandlerNameRegistry
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSduiSearchPeoplePlayerTileTelemetry = SharedFlagsModule.FFlagSduiSearchPeoplePlayerTileTelemetry
local FFlagSduiSocialUpsellButtonClickTelemetry = SharedFlagsModule.FFlagSduiSocialUpsellButtonClickTelemetry

return function() --[[ Line: 11 | Named "registerSocialActionTelemetryHandlers" ]]
	-- upvalues: GetSduiTelemetryHandlerNameRegistryFunction (copy), FFlagSduiSearchPeoplePlayerTileTelemetry (copy), FFlagSduiSocialUpsellButtonClickTelemetry (copy)
	GetSduiTelemetryHandlerNameRegistryFunction().registerTelemetryHandlers({
		PlayerTileClick = if FFlagSduiSearchPeoplePlayerTileTelemetry then {
			lazyHandler = function() --[[ Line: 15 ]]
				return require(script.Parent.SduiPlayerTileClickTelemetryHandler)
			end
		} else nil,
		SocialUpsellButtonClick = if FFlagSduiSocialUpsellButtonClickTelemetry then {
			lazyHandler = function() --[[ Line: 22 ]]
				return require(script.Parent.SduiSocialUpsellButtonClickTelemetryHandler)
			end
		} else nil
	})
end