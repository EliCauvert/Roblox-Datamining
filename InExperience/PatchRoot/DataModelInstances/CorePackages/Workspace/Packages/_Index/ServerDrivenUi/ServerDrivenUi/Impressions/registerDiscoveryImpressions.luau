local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiImpressionEventType = sduiCoreSystemModule.SduiImpressionEventType
local getSduiImpressionHandlerRegistry = sduiCoreSystemModule.getSduiImpressionHandlerRegistry
local fFlagSduiDevStoreSeeAllImpressionsLogging = require(parent.SharedFlags).FFlagSduiDevStoreSeeAllImpressionsLogging
local fFlagSduiQueryImpressionsLogging = require(parent.SharedFlags).FFlagSduiQueryImpressionsLogging

return function()
	-- upvalues: sduiImpressionEventType (ref), serverDrivenUi (ref), fFlagSduiDevStoreSeeAllImpressionsLogging (ref), fFlagSduiQueryImpressionsLogging (ref), getSduiImpressionHandlerRegistry (ref)
	getSduiImpressionHandlerRegistry().registerImpressionHandlerConfigs({
		[sduiImpressionEventType.filterImpressions] = {
			skipItemImpressionsLog = true,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Impressions.SduiFilterImpressionsHandler)
			end
		},
		[sduiImpressionEventType.gameImpressions] = {
			skipItemImpressionsLog = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Impressions.SduiGameImpressionsHandler)
			end
		},
		[sduiImpressionEventType.socialLinksImpressions] = {
			skipItemImpressionsLog = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Impressions.SduiSocialLinksImpressionsHandler)
			end
		},
		[sduiImpressionEventType.virtualEventImpressions] = {
			skipItemImpressionsLog = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Impressions.SduiVirtualEventImpressionsHandler)
			end
		},
		[sduiImpressionEventType.experienceStoreImpressions] = {
			skipItemImpressionsLog = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Impressions.SduiEdpStoreImpressionsHandler)
			end
		},
		[sduiImpressionEventType.marketplaceItemImpressions] = {
			skipItemImpressionsLog = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Impressions.SduiMarketplaceItemImpressionsHandler)
			end
		},
		[sduiImpressionEventType.devStoreSeeAllImpressions] = if fFlagSduiDevStoreSeeAllImpressionsLogging then {
			skipItemImpressionsLog = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Impressions.SduiDevStoreSeeAllImpressionsHandler)
			end
		} else nil,
		[sduiImpressionEventType.queryImpressions] = if fFlagSduiQueryImpressionsLogging then {
			skipItemImpressionsLog = true,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Impressions.SduiQueryImpressionsHandler)
			end
		} else nil
	})
end