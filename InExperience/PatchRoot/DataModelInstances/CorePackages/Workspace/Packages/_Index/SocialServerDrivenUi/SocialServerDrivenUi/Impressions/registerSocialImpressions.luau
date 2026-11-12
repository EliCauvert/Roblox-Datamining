local SocialServerDrivenUi = script:FindFirstAncestor("SocialServerDrivenUi")
local Parent = SocialServerDrivenUi.Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiImpressionEventType = SduiCoreSystemModule.SduiImpressionEventType
local GetSduiImpressionHandlerRegistryFunction = SduiCoreSystemModule.getSduiImpressionHandlerRegistry
local FFlagSduiSearchPeoplePlayerTileTelemetry = require(Parent.SharedFlags).FFlagSduiSearchPeoplePlayerTileTelemetry

return function()
	-- upvalues: SduiImpressionEventType (copy), FFlagSduiSearchPeoplePlayerTileTelemetry (copy), SocialServerDrivenUi (copy), GetSduiImpressionHandlerRegistryFunction (copy)
	GetSduiImpressionHandlerRegistryFunction().registerImpressionHandlerConfigs({
		[SduiImpressionEventType.playerTileImpressions] = if FFlagSduiSearchPeoplePlayerTileTelemetry then {
			skipItemImpressionsLog = true,
			lazyHandler = function()
				-- upvalues: SocialServerDrivenUi (upval)
				return require(SocialServerDrivenUi.Impressions.SduiPlayerTileImpressionsHandler)
			end
		} else nil
	})
end