local userList = script:FindFirstAncestor("UserList")
local parent = userList.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local convertToFoundationPresenceEnum = require(parent.SocialCommon).Utils.convertToFoundationPresenceEnum
local _ = require(userList.Common.Types)
local enumsModule = require(userList.Common.Enums)
local useUserDataValuesModule = require(userList.Hooks.useUserDataValues)
local baseRowModule = require(script.Parent.BaseRow)
local useIsRobloxSubscriber = require(parent.UserProfiles).Hooks.useIsRobloxSubscriber
local fFlagEnableBlackbirdCheck = require(parent.SharedFlags).FFlagEnableBlackbirdCheck
local fFlagFixUserRowCombinedName = require(parent.SharedFlags).FFlagFixUserRowCombinedName
local fFlagUserListCtaIntegrationEnabled = require(parent.SharedFlags).FFlagUserListCtaIntegrationEnabled
local fFlagUserListUsernameFallbackConfig = require(parent.SharedFlags).FFlagUserListUsernameFallbackConfig
local fFlagAddStatusIndicatorToBaseRow = require(parent.SharedFlags).FFlagAddStatusIndicatorToBaseRow

return reactModule.memo(function(p0)
	-- upvalues: useUserDataValuesModule (ref), fFlagEnableBlackbirdCheck (ref), useIsRobloxSubscriber (ref), fFlagFixUserRowCombinedName (ref), fFlagUserListUsernameFallbackConfig (ref), foundationModule (ref), convertToFoundationPresenceEnum (ref), reactModule (ref), baseRowModule (ref), fFlagAddStatusIndicatorToBaseRow (ref), fFlagUserListCtaIntegrationEnabled (ref), enumsModule (ref)
	local var6 = useUserDataValuesModule(p0.entityId)
	local var7 = if fFlagEnableBlackbirdCheck then useIsRobloxSubscriber(if p0.entityId then p0.entityId else nil) else nil
	local var8 = if fFlagFixUserRowCombinedName then if var6.combinedName ~= "" then nil else var6.combinedName elseif var6.displayName ~= "" then nil else var6.displayName
	local var9 = if p0.configs and p0.configs.showSubtitle ~= nil then p0.configs.showSubtitle else true
	local var10 = if fFlagUserListUsernameFallbackConfig then if var6.username ~= "" then nil else `@{var6.username}` else nil
	
	return reactModule.createElement(baseRowModule, {
		userId = p0.entityId,
		userPresenceType = if (if p0.configs and p0.configs.showPresence ~= nil then p0.configs.showPresence else true) and p0.presence then convertToFoundationPresenceEnum(p0.presence) else foundationModule.Enums.UserPresence.None,
		title = var8,
		subtitle = if fFlagUserListUsernameFallbackConfig then if var9 then var10 else nil elseif var9 and var6.username ~= "" then `@{var6.username}` else nil,
		layoutMode = p0.layoutMode,
		onActivated = p0.onActivated,
		isTitleLoading = if p0.loadingState and p0.loadingState.title ~= nil then p0.loadingState.title else var6.isLoading,
		isSubtitleLoading = if p0.loadingState and p0.loadingState.subtitle ~= nil then p0.loadingState.subtitle else var6.isLoading,
		isContextualInfoLoading = p0.loadingState and p0.loadingState.contextualInfo,
		contextualInfo = if fFlagUserListUsernameFallbackConfig then if not fFlagUserListUsernameFallbackConfig then if p0.configs and p0.configs.showUsernameAsContextualFallback and not p0.contextualInfo then { text = var10 } else p0.contextualInfo else nil else p0.contextualInfo,
		primaryCta = p0.primaryCta,
		secondaryCta = p0.secondaryCta,
		shouldShowNewIndicator = if fFlagAddStatusIndicatorToBaseRow then p0.shouldShowNewIndicator else nil,
		ctaLoading = if fFlagUserListCtaIntegrationEnabled then p0.ctaLoading else nil,
		trailingContent = p0.trailingContent,
		layoutOrder = p0.layoutOrder,
		trustedConnectionIndicatorEnabled = p0.layoutMode == enumsModule.RowLayoutMode.Wide,
		isRobloxSubscriber = if fFlagEnableBlackbirdCheck then var7 else nil
	})
end)