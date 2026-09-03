local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiImpressionEventType = sduiCoreSystemModule.SduiImpressionEventType
local getSduiImpressionHandlerRegistry = sduiCoreSystemModule.getSduiImpressionHandlerRegistry
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local fFlagSduiEdpStoreImpressionsLogging = require(parent.SharedFlags).FFlagSduiEdpStoreImpressionsLogging
local fFlagSduiDevStoreSeeAllImpressionsLogging = require(parent.SharedFlags).FFlagSduiDevStoreSeeAllImpressionsLogging
local fFlagSduiQueryImpressionsLogging = require(parent.SharedFlags).FFlagSduiQueryImpressionsLogging

return function()
	-- upvalues: sduiImpressionEventType (ref), serverDrivenUi (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiEdpStoreImpressionsLogging (ref), fFlagSduiDevStoreSeeAllImpressionsLogging (ref), fFlagSduiQueryImpressionsLogging (ref), getSduiImpressionHandlerRegistry (ref)
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
		[sduiImpressionEventType.socialLinksImpressions] = if fFlagSduiExperienceDetailsSupport then {
			skipItemImpressionsLog = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Impressions.SduiSocialLinksImpressionsHandler)
			end
		} else nil,
		[sduiImpressionEventType.virtualEventImpressions] = if fFlagSduiExperienceDetailsSupport then {
			skipItemImpressionsLog = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Impressions.SduiVirtualEventImpressionsHandler)
			end
		} else nil,
		[sduiImpressionEventType.experienceStoreImpressions] = if fFlagSduiEdpStoreImpressionsLogging then {
			skipItemImpressionsLog = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Impressions.SduiEdpStoreImpressionsHandler)
			end
		} else nil,
		[sduiImpressionEventType.marketplaceItemImpressions] = if fFlagSduiEdpStoreImpressionsLogging then {
			skipItemImpressionsLog = false,
			lazyHandler = function()
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Impressions.SduiMarketplaceItemImpressionsHandler)
			end
		} else nil,
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