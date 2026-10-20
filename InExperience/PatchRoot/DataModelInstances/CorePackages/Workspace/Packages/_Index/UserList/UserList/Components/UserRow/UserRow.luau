local UserList = script:FindFirstAncestor("UserList")
local Parent = UserList.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ConvertToFoundationPresenceEnumFunction = require(Parent.SocialCommon).Utils.convertToFoundationPresenceEnum
local _ = require(UserList.Common.Types)
local EnumsModule = require(UserList.Common.Enums)
local UseUserDataValuesModule = require(UserList.Hooks.useUserDataValues)
local BaseRowModule = require(script.Parent.BaseRow)
local UseIsRobloxSubscriberFunction = require(Parent.UserProfiles).Hooks.useIsRobloxSubscriber
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck
local FFlagFixUserRowCombinedName = require(Parent.SharedFlags).FFlagFixUserRowCombinedName
local FFlagUserListCtaIntegrationEnabled = require(Parent.SharedFlags).FFlagUserListCtaIntegrationEnabled
local FFlagUserListUsernameFallbackConfig = require(Parent.SharedFlags).FFlagUserListUsernameFallbackConfig
local FFlagAddStatusIndicatorToBaseRow = require(Parent.SharedFlags).FFlagAddStatusIndicatorToBaseRow
local FFlagUserListSurfaceExtensions = require(Parent.SharedFlags).FFlagUserListSurfaceExtensions

return ReactModule.memo(function(p1)
	-- upvalues: UseUserDataValuesModule (copy), FFlagEnableBlackbirdCheck (copy), UseIsRobloxSubscriberFunction (copy), FFlagFixUserRowCombinedName (copy), FFlagUserListUsernameFallbackConfig (copy), FoundationModule (copy), ConvertToFoundationPresenceEnumFunction (copy), ReactModule (copy), BaseRowModule (copy), FFlagAddStatusIndicatorToBaseRow (copy), FFlagUserListCtaIntegrationEnabled (copy), EnumsModule (copy), FFlagUserListSurfaceExtensions (copy)
	local UseUserDataValuesModuleResult = UseUserDataValuesModule(p1.entityId)
	local UseIsRobloxSubscriberResult = if FFlagEnableBlackbirdCheck then UseIsRobloxSubscriberFunction(if p1.entityId then p1.entityId else nil) else nil
	local NoConfigs = not p1.configs or p1.configs.showSubtitle == nil or p1.configs.showSubtitle
	local Text = if FFlagUserListUsernameFallbackConfig then if UseUserDataValuesModuleResult.username == "" then nil else `@{UseUserDataValuesModuleResult.username}` else nil
	local NoConfigs1 = not p1.configs or p1.configs.showPresence == nil or p1.configs.showPresence
	local Config = if FFlagUserListUsernameFallbackConfig then if p1.configs and p1.configs.showUsernameAsContextualFallback and not p1.contextualInfo then { text = Text } else p1.contextualInfo else nil
	
	return ReactModule.createElement(BaseRowModule, {
		userId = p1.entityId,
		userPresenceType = if NoConfigs1 and p1.presence then ConvertToFoundationPresenceEnumFunction(p1.presence) else FoundationModule.Enums.UserPresence.None,
		title = if FFlagFixUserRowCombinedName then if UseUserDataValuesModuleResult.combinedName == "" then nil else UseUserDataValuesModuleResult.combinedName elseif UseUserDataValuesModuleResult.displayName == "" then nil else UseUserDataValuesModuleResult.displayName,
		subtitle = if FFlagUserListUsernameFallbackConfig then if NoConfigs then Text else nil elseif NoConfigs and UseUserDataValuesModuleResult.username ~= "" then `@{UseUserDataValuesModuleResult.username}` else nil,
		layoutMode = p1.layoutMode,
		onActivated = p1.onActivated,
		isTitleLoading = if p1.loadingState and p1.loadingState.title ~= nil then p1.loadingState.title else UseUserDataValuesModuleResult.isLoading,
		isSubtitleLoading = if p1.loadingState and p1.loadingState.subtitle ~= nil then p1.loadingState.subtitle else UseUserDataValuesModuleResult.isLoading,
		isContextualInfoLoading = p1.loadingState and p1.loadingState.contextualInfo,
		contextualInfo = if FFlagUserListUsernameFallbackConfig then Config else p1.contextualInfo,
		primaryCta = p1.primaryCta,
		secondaryCta = p1.secondaryCta,
		shouldShowNewIndicator = if FFlagAddStatusIndicatorToBaseRow then p1.shouldShowNewIndicator else nil,
		ctaLoading = if FFlagUserListCtaIntegrationEnabled then p1.ctaLoading else nil,
		trailingContent = p1.trailingContent,
		layoutOrder = p1.layoutOrder,
		trustedConnectionIndicatorEnabled = p1.layoutMode == EnumsModule.RowLayoutMode.Wide,
		isRobloxSubscriber = if FFlagEnableBlackbirdCheck then UseIsRobloxSubscriberResult else nil,
		disableRowActivation = if FFlagUserListSurfaceExtensions and p1.configs then p1.configs.disableRowActivation else nil
	})
end)