local Parent = script:FindFirstAncestor("UserSearch").Parent
local ReactModule = require(Parent.React)
local CollectionHeader = require(Parent.CollectionViews).CollectionHeader
local View = require(Parent.Foundation).View
local UseGetPersonalizationSettingItemFunction = require(Parent.SocialCommon).Hooks.useGetPersonalizationSettingItem

local function openPersonalizationSettings(SurfaceKey)
	-- upvalues: Parent (copy)
	local AccountSettingsEntryPointsModule = require(Parent.AccountSettingsEntryPoints)
	AccountSettingsEntryPointsModule.openAccountSettings(AccountSettingsEntryPointsModule.Page.PersonalizedRecommendations, { surfaceKey = SurfaceKey })
end

return function(p1)
	-- upvalues: UseGetPersonalizationSettingItemFunction (copy), openPersonalizationSettings (copy), ReactModule (copy), View (copy), CollectionHeader (copy)
	local UseGetPersonalizationSettingItemResult = UseGetPersonalizationSettingItemFunction({
		surfaceKey = p1.personalizationSettingsSurfaceKey or "",
		openPersonalizationSettings = openPersonalizationSettings
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseGetPersonalizationSettingItemResult (copy)
		return if UseGetPersonalizationSettingItemResult then { UseGetPersonalizationSettingItemResult } else nil
	end, { UseGetPersonalizationSettingItemResult })
	
	return if UseMemoResult then ReactModule.createElement(View, { tag = "size-full-0 auto-y", LayoutOrder = p1.layoutOrder }, {
		Header = ReactModule.createElement(CollectionHeader, { title = p1.title, menuItems = UseMemoResult })
	}) else nil
end