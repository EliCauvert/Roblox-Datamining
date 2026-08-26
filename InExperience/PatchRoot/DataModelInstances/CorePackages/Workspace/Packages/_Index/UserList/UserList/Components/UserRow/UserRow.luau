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

return reactModule.memo(function(p1)
	-- upvalues: useUserDataValuesModule (ref), fFlagEnableBlackbirdCheck (ref), useIsRobloxSubscriber (ref), fFlagFixUserRowCombinedName (ref), fFlagUserListUsernameFallbackConfig (ref), foundationModule (ref), convertToFoundationPresenceEnum (ref), reactModule (ref), baseRowModule (ref), fFlagAddStatusIndicatorToBaseRow (ref), fFlagUserListCtaIntegrationEnabled (ref), enumsModule (ref)
	local var1 = useUserDataValuesModule(p1.entityId)
	local var2 = if fFlagEnableBlackbirdCheck then useIsRobloxSubscriber(if p1.entityId then p1.entityId else nil) else nil
	local var3 = if fFlagFixUserRowCombinedName then if var1.combinedName ~= "" then nil else var1.combinedName elseif var1.displayName ~= "" then nil else var1.displayName
	local var4 = if p1.configs and p1.configs.showSubtitle ~= nil then p1.configs.showSubtitle else true
	local var5 = if fFlagUserListUsernameFallbackConfig then if var1.username ~= "" then nil else `@{var1.username}` else nil
	
	return reactModule.createElement(baseRowModule, {
		userId = p1.entityId,
		userPresenceType = if (if p1.configs and p1.configs.showPresence ~= nil then p1.configs.showPresence else true) and p1.presence then convertToFoundationPresenceEnum(p1.presence) else foundationModule.Enums.UserPresence.None,
		title = var3,
		subtitle = if fFlagUserListUsernameFallbackConfig then if var4 then var5 else nil elseif var4 and var1.username ~= "" then `@{var1.username}` else nil,
		layoutMode = p1.layoutMode,
		onActivated = p1.onActivated,
		isTitleLoading = if p1.loadingState and p1.loadingState.title ~= nil then p1.loadingState.title else var1.isLoading,
		isSubtitleLoading = if p1.loadingState and p1.loadingState.subtitle ~= nil then p1.loadingState.subtitle else var1.isLoading,
		isContextualInfoLoading = p1.loadingState and p1.loadingState.contextualInfo,
		contextualInfo = if fFlagUserListUsernameFallbackConfig then if not fFlagUserListUsernameFallbackConfig then if p1.configs and p1.configs.showUsernameAsContextualFallback and not p1.contextualInfo then { text = var5 } else p1.contextualInfo else nil else p1.contextualInfo,
		primaryCta = p1.primaryCta,
		secondaryCta = p1.secondaryCta,
		shouldShowNewIndicator = if fFlagAddStatusIndicatorToBaseRow then p1.shouldShowNewIndicator else nil,
		ctaLoading = if fFlagUserListCtaIntegrationEnabled then p1.ctaLoading else nil,
		trailingContent = p1.trailingContent,
		layoutOrder = p1.layoutOrder,
		trustedConnectionIndicatorEnabled = p1.layoutMode == enumsModule.RowLayoutMode.Wide,
		isRobloxSubscriber = if fFlagEnableBlackbirdCheck then var2 else nil
	})
end)