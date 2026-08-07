local edpStoreAnalytics = script:FindFirstAncestor("EdpStoreAnalytics")
local parent = edpStoreAnalytics.Parent
local cryoModule = require(parent.Cryo)
local avatarExperienceAnalyticsModule = require(parent.AvatarExperienceAnalytics)
local unifiedEventLogEnums = avatarExperienceAnalyticsModule.UnifiedEventLogEnums
local unifiedLoggingSurface = require(parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local sendUnifiedEventLogForInstance = avatarExperienceAnalyticsModule.sendUnifiedEventLogForInstance
local constantsModule = require(edpStoreAnalytics.Constants)

return function(p0) --[[ line: 14 | named "EdpUnifiedImpressionsReporter" ]]
	-- upvalues: sendUnifiedEventLogForInstance (ref), cryoModule (ref), unifiedEventLogEnums (ref), constantsModule (ref), unifiedLoggingSurface (ref)
	return function(p1) --[[ line: 15 ]]
		-- upvalues: sendUnifiedEventLogForInstance (copy), cryoModule (copy), unifiedEventLogEnums (copy), p0 (ref), constantsModule (copy), unifiedLoggingSurface (copy)
		local visibleInstance = p1.visibleInstance
		sendUnifiedEventLogForInstance(visibleInstance, cryoModule.Dictionary.join(visibleInstance:GetAttributes() or {}, {
			action = unifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_IMPRESSION,
			surface = if p0 == constantsModule.StoreEnums.LocationType.Edp then unifiedLoggingSurface.EDP_PREVIEW else unifiedLoggingSurface.EDP_STORE
		}), {
			includeScreenSize = true,
			includeElementSizeAndPosition = true
		})
	end
end