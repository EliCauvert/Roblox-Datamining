local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiImpressionEventType = SduiCoreSystemModule.SduiImpressionEventType
local GetSduiImpressionHandlerRegistryFunction = SduiCoreSystemModule.getSduiImpressionHandlerRegistry
local FFlagSduiDevStoreSeeAllImpressionsLogging = require(Parent.SharedFlags).FFlagSduiDevStoreSeeAllImpressionsLogging
local FFlagSduiQueryImpressionsLogging = require(Parent.SharedFlags).FFlagSduiQueryImpressionsLogging

return function() --[[ Line: 14 | Named "registerDiscoveryImpressions" ]]
	-- upvalues: SduiImpressionEventType (copy), ServerDrivenUi (copy), FFlagSduiDevStoreSeeAllImpressionsLogging (copy), FFlagSduiQueryImpressionsLogging (copy), GetSduiImpressionHandlerRegistryFunction (copy)
	GetSduiImpressionHandlerRegistryFunction().registerImpressionHandlerConfigs({
		[SduiImpressionEventType.filterImpressions] = {
			skipItemImpressionsLog = true,
			lazyHandler = function() --[[ Line: 17 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Impressions.SduiFilterImpressionsHandler)
			end
		},
		[SduiImpressionEventType.gameImpressions] = {
			skipItemImpressionsLog = false,
			lazyHandler = function() --[[ Line: 23 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Impressions.SduiGameImpressionsHandler)
			end
		},
		[SduiImpressionEventType.socialLinksImpressions] = {
			skipItemImpressionsLog = false,
			lazyHandler = function() --[[ Line: 29 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Impressions.SduiSocialLinksImpressionsHandler)
			end
		},
		[SduiImpressionEventType.virtualEventImpressions] = {
			skipItemImpressionsLog = false,
			lazyHandler = function() --[[ Line: 35 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Impressions.SduiVirtualEventImpressionsHandler)
			end
		},
		[SduiImpressionEventType.experienceStoreImpressions] = {
			skipItemImpressionsLog = false,
			lazyHandler = function() --[[ Line: 41 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Impressions.SduiEdpStoreImpressionsHandler)
			end
		},
		[SduiImpressionEventType.marketplaceItemImpressions] = {
			skipItemImpressionsLog = false,
			lazyHandler = function() --[[ Line: 47 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Impressions.SduiMarketplaceItemImpressionsHandler)
			end
		},
		[SduiImpressionEventType.devStoreSeeAllImpressions] = if FFlagSduiDevStoreSeeAllImpressionsLogging then {
			skipItemImpressionsLog = false,
			lazyHandler = function() --[[ Line: 54 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Impressions.SduiDevStoreSeeAllImpressionsHandler)
			end
		} else nil,
		[SduiImpressionEventType.queryImpressions] = if FFlagSduiQueryImpressionsLogging then {
			skipItemImpressionsLog = true,
			lazyHandler = function() --[[ Line: 62 ]]
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Impressions.SduiQueryImpressionsHandler)
			end
		} else nil
	})
end