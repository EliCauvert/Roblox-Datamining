local EdpStoreAnalytics = script:FindFirstAncestor("EdpStoreAnalytics")
local Parent = EdpStoreAnalytics.Parent
local CryoModule = require(Parent.Cryo)
local AvatarExperienceAnalyticsModule = require(Parent.AvatarExperienceAnalytics)
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local UnifiedLoggingSurface = require(Parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local SendUnifiedEventLogForInstanceFunction = AvatarExperienceAnalyticsModule.sendUnifiedEventLogForInstance
local ConstantsModule = require(EdpStoreAnalytics.Constants)

return function(Edp)
	-- upvalues: SendUnifiedEventLogForInstanceFunction (copy), CryoModule (copy), UnifiedEventLogEnums (copy), ConstantsModule (copy), UnifiedLoggingSurface (copy)
	return function(p1)
		-- upvalues: SendUnifiedEventLogForInstanceFunction (upval), CryoModule (upval), UnifiedEventLogEnums (upval), Edp (copy), ConstantsModule (upval), UnifiedLoggingSurface (upval)
		local VisibleInstance = p1.visibleInstance
		SendUnifiedEventLogForInstanceFunction(VisibleInstance, CryoModule.Dictionary.join(VisibleInstance:GetAttributes() or {}, {
			action = UnifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_IMPRESSION,
			surface = if Edp == ConstantsModule.StoreEnums.LocationType.Edp then UnifiedLoggingSurface.EDP_PREVIEW else UnifiedLoggingSurface.EDP_STORE
		}), {
			includeScreenSize = true,
			includeElementSizeAndPosition = true
		})
	end
end