local socialServerDrivenUi = script:FindFirstAncestor("SocialServerDrivenUi")
local parent = socialServerDrivenUi.Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiImpressionEventType = sduiCoreSystemModule.SduiImpressionEventType
local getSduiImpressionHandlerRegistry = sduiCoreSystemModule.getSduiImpressionHandlerRegistry
local fFlagSduiSearchPeoplePlayerTileTelemetry = require(parent.SharedFlags).FFlagSduiSearchPeoplePlayerTileTelemetry

return function() --[[ line: 13 | named "registerSocialImpressions" ]]
	-- upvalues: sduiImpressionEventType (ref), fFlagSduiSearchPeoplePlayerTileTelemetry (ref), socialServerDrivenUi (ref), getSduiImpressionHandlerRegistry (ref)
	getSduiImpressionHandlerRegistry().registerImpressionHandlerConfigs({
		[sduiImpressionEventType.playerTileImpressions] = if fFlagSduiSearchPeoplePlayerTileTelemetry then {
			skipItemImpressionsLog = true,
			lazyHandler = function() --[[ line: 17 ]]
				-- upvalues: socialServerDrivenUi (copy)
				return require(socialServerDrivenUi.Impressions.SduiPlayerTileImpressionsHandler)
			end
		} else nil
	})
end