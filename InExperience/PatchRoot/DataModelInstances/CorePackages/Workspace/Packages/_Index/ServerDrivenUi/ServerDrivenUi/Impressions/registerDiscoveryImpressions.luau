local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiImpressionEventType = sduiCoreSystemModule.SduiImpressionEventType
local getSduiImpressionHandlerRegistry = sduiCoreSystemModule.getSduiImpressionHandlerRegistry
local fFlagSduiChartsSupport = require(parent.SharedFlags).FFlagSduiChartsSupport
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local fFlagSduiEdpStoreImpressionsLogging = require(parent.SharedFlags).FFlagSduiEdpStoreImpressionsLogging
local fFlagSduiDevStoreSeeAllImpressionsLogging = require(parent.SharedFlags).FFlagSduiDevStoreSeeAllImpressionsLogging

return function() --[[ line: 17 | named "registerDiscoveryImpressions" ]]
	-- upvalues: sduiImpressionEventType (ref), fFlagSduiChartsSupport (ref), serverDrivenUi (ref), fFlagSduiExperienceDetailsSupport (ref), fFlagSduiEdpStoreImpressionsLogging (ref), fFlagSduiDevStoreSeeAllImpressionsLogging (ref), getSduiImpressionHandlerRegistry (ref)
	getSduiImpressionHandlerRegistry().registerImpressionHandlerConfigs({
		[sduiImpressionEventType.filterImpressions] = if fFlagSduiChartsSupport then {
			skipItemImpressionsLog = true,
			lazyHandler = function() --[[ line: 21 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Impressions.SduiFilterImpressionsHandler)
			end
		} else nil,
		[sduiImpressionEventType.gameImpressions] = {
			skipItemImpressionsLog = false,
			lazyHandler = function() --[[ line: 28 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Impressions.SduiGameImpressionsHandler)
			end
		},
		[sduiImpressionEventType.socialLinksImpressions] = if fFlagSduiExperienceDetailsSupport then {
			skipItemImpressionsLog = false,
			lazyHandler = function() --[[ line: 35 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Impressions.SduiSocialLinksImpressionsHandler)
			end
		} else nil,
		[sduiImpressionEventType.virtualEventImpressions] = if fFlagSduiExperienceDetailsSupport then {
			skipItemImpressionsLog = false,
			lazyHandler = function() --[[ line: 43 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Impressions.SduiVirtualEventImpressionsHandler)
			end
		} else nil,
		[sduiImpressionEventType.experienceStoreImpressions] = if fFlagSduiEdpStoreImpressionsLogging then {
			skipItemImpressionsLog = false,
			lazyHandler = function() --[[ line: 51 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Impressions.SduiEdpStoreImpressionsHandler)
			end
		} else nil,
		[sduiImpressionEventType.marketplaceItemImpressions] = if fFlagSduiEdpStoreImpressionsLogging then {
			skipItemImpressionsLog = false,
			lazyHandler = function() --[[ line: 59 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Impressions.SduiMarketplaceItemImpressionsHandler)
			end
		} else nil,
		[sduiImpressionEventType.devStoreSeeAllImpressions] = if fFlagSduiDevStoreSeeAllImpressionsLogging then {
			skipItemImpressionsLog = false,
			lazyHandler = function() --[[ line: 67 ]]
				-- upvalues: serverDrivenUi (copy)
				return require(serverDrivenUi.Impressions.SduiDevStoreSeeAllImpressionsHandler)
			end
		} else nil
	})
end