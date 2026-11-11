local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiImpressionEventType = SduiCoreSystemModule.SduiImpressionEventType
local GetSduiImpressionHandlerRegistryFunction = SduiCoreSystemModule.getSduiImpressionHandlerRegistry
local FFlagSduiChartsSupport = require(Parent.SharedFlags).FFlagSduiChartsSupport
local FFlagSduiExperienceDetailsSupport = require(Parent.SharedFlags).FFlagSduiExperienceDetailsSupport
local FFlagSduiEdpStoreImpressionsLogging = require(Parent.SharedFlags).FFlagSduiEdpStoreImpressionsLogging
local FFlagSduiDevStoreSeeAllImpressionsLogging = require(Parent.SharedFlags).FFlagSduiDevStoreSeeAllImpressionsLogging

return function()
	-- upvalues: SduiImpressionEventType (copy), FFlagSduiChartsSupport (copy), ServerDrivenUi (copy), FFlagSduiExperienceDetailsSupport (copy), FFlagSduiEdpStoreImpressionsLogging (copy), FFlagSduiDevStoreSeeAllImpressionsLogging (copy), GetSduiImpressionHandlerRegistryFunction (copy)
	GetSduiImpressionHandlerRegistryFunction().registerImpressionHandlerConfigs({
		[SduiImpressionEventType.filterImpressions] = if FFlagSduiChartsSupport then {
			skipItemImpressionsLog = true,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Impressions.SduiFilterImpressionsHandler)
			end
		} else nil,
		[SduiImpressionEventType.gameImpressions] = {
			skipItemImpressionsLog = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Impressions.SduiGameImpressionsHandler)
			end
		},
		[SduiImpressionEventType.socialLinksImpressions] = if FFlagSduiExperienceDetailsSupport then {
			skipItemImpressionsLog = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Impressions.SduiSocialLinksImpressionsHandler)
			end
		} else nil,
		[SduiImpressionEventType.virtualEventImpressions] = if FFlagSduiExperienceDetailsSupport then {
			skipItemImpressionsLog = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Impressions.SduiVirtualEventImpressionsHandler)
			end
		} else nil,
		[SduiImpressionEventType.experienceStoreImpressions] = if FFlagSduiEdpStoreImpressionsLogging then {
			skipItemImpressionsLog = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Impressions.SduiEdpStoreImpressionsHandler)
			end
		} else nil,
		[SduiImpressionEventType.marketplaceItemImpressions] = if FFlagSduiEdpStoreImpressionsLogging then {
			skipItemImpressionsLog = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Impressions.SduiMarketplaceItemImpressionsHandler)
			end
		} else nil,
		[SduiImpressionEventType.devStoreSeeAllImpressions] = if FFlagSduiDevStoreSeeAllImpressionsLogging then {
			skipItemImpressionsLog = false,
			lazyHandler = function()
				-- upvalues: ServerDrivenUi (upval)
				return require(ServerDrivenUi.Impressions.SduiDevStoreSeeAllImpressionsHandler)
			end
		} else nil
	})
end