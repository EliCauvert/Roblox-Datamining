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
local fFlagHomepagePYMKUseHorizontalUserList = require(parent.SharedFlags).FFlagHomepagePYMKUseHorizontalUserList
local fFlagFixUserRowCombinedName = require(parent.SharedFlags).FFlagFixUserRowCombinedName

return reactModule.memo(function(p0) --[[ line: 41 | named "UserRow" ]]
	-- upvalues: useUserDataValuesModule (ref), fFlagEnableBlackbirdCheck (ref), useIsRobloxSubscriber (ref), fFlagFixUserRowCombinedName (ref), foundationModule (ref), convertToFoundationPresenceEnum (ref), fFlagHomepagePYMKUseHorizontalUserList (ref), reactModule (ref), baseRowModule (ref), enumsModule (ref)
	local var12, var14
	local var6 = useUserDataValuesModule(p0.entityId)
	local var7 = if fFlagEnableBlackbirdCheck then useIsRobloxSubscriber(if p0.entityId then p0.entityId else nil) else nil
	local var8 = if fFlagFixUserRowCombinedName then if var6.combinedName ~= "" then nil else var6.combinedName elseif var6.displayName ~= "" then nil else var6.displayName
	local var9 = if (if p0.configs and p0.configs.showSubtitle ~= nil then p0.configs.showSubtitle else true) and var6.username ~= "" then `@{var6.username}` else nil
	local var10 = if (if p0.configs and p0.configs.showPresence ~= nil then p0.configs.showPresence else true) and p0.presence then convertToFoundationPresenceEnum(p0.presence) else foundationModule.Enums.UserPresence.None
	
	if p0.loadingState then
		local var11
		if fFlagHomepagePYMKUseHorizontalUserList then
			var11 = p0.loadingState.title ~= nil
			var11 = nil
		else
			var11 = p0.loadingState.title
		end
		var12 = if var11 then p0.loadingState.title else var6.isLoading
	end
	if p0.loadingState then
		local var13
		if fFlagHomepagePYMKUseHorizontalUserList then
			var13 = p0.loadingState.subtitle ~= nil
			var13 = nil
		else
			var13 = p0.loadingState.subtitle
		end
		var14 = if var13 then p0.loadingState.subtitle else var6.isLoading
	end
	return reactModule.createElement(baseRowModule, {
		userId = p0.entityId,
		userPresenceType = var10,
		title = var8,
		subtitle = var9,
		layoutMode = p0.layoutMode,
		onActivated = p0.onActivated,
		isTitleLoading = var12,
		isSubtitleLoading = var14,
		isContextualInfoLoading = p0.loadingState and p0.loadingState.contextualInfo,
		contextualInfo = p0.contextualInfo,
		primaryCta = p0.primaryCta,
		secondaryCta = p0.secondaryCta,
		trailingContent = p0.trailingContent,
		layoutOrder = p0.layoutOrder,
		trustedConnectionIndicatorEnabled = p0.layoutMode == enumsModule.RowLayoutMode.Wide,
		isRobloxSubscriber = if fFlagEnableBlackbirdCheck then var7 else nil
	})
end)