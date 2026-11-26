local UserList = script:FindFirstAncestor("UserList")
local Parent = UserList.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ConvertToFoundationPresenceEnumFunction = require(Parent.SocialCommon).Utils.convertToFoundationPresenceEnum
local _ = require(UserList.Common.Types)
local EnumsModule = require(UserList.Common.Enums)
local UseUserDataValuesModule = require(UserList.Hooks.useUserDataValues)
local UseRowCtaFromClientActionsModule = require(UserList.Hooks.useRowCtaFromClientActions)
local UseContextualInfoFromSourceModule = require(UserList.Hooks.useContextualInfoFromSource)
local BaseRowModule = require(script.Parent.BaseRow)
local UseIsRobloxSubscriberFunction = require(Parent.UserProfiles).Hooks.useIsRobloxSubscriber
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck
local ContextInfoTypes = EnumsModule.ContextInfoTypes
local FFlagUserListCtaIntegrationEnabled = require(Parent.SharedFlags).FFlagUserListCtaIntegrationEnabled
local FFlagUserListSurfaceExtensions = require(Parent.SharedFlags).FFlagUserListSurfaceExtensions
local FFlagProfilePlatformSeededPymk = require(Parent.SharedFlags).FFlagProfilePlatformSeededPymk
local FFlagUserListClientRowProps = require(Parent.SharedFlags).FFlagUserListClientRowProps

local function v16() end

local function UserRow(p1)
	-- upvalues: UseUserDataValuesModule (copy), FFlagEnableBlackbirdCheck (copy), UseIsRobloxSubscriberFunction (copy), FoundationModule (copy), ConvertToFoundationPresenceEnumFunction (copy), FFlagUserListClientRowProps (copy), ContextInfoTypes (copy), ReactModule (copy), BaseRowModule (copy), FFlagUserListCtaIntegrationEnabled (copy), FFlagUserListSurfaceExtensions (copy), EnumsModule (copy), FFlagProfilePlatformSeededPymk (copy)
	local UseUserDataValuesModuleResult = UseUserDataValuesModule(p1.entityId)
	local UseIsRobloxSubscriberResult = if FFlagEnableBlackbirdCheck then UseIsRobloxSubscriberFunction(if p1.entityId then p1.entityId else nil) else nil
	local NoConfigs = not p1.configs or p1.configs.showSubtitle == nil or p1.configs.showSubtitle
	local Text = if UseUserDataValuesModuleResult.username == "" then nil else `@{UseUserDataValuesModuleResult.username}`
	local Text1 = if NoConfigs then Text else nil
	local NoConfigs1 = not p1.configs or p1.configs.showPresence == nil or p1.configs.showPresence
	
	return ReactModule.createElement(BaseRowModule, {
		userId = p1.entityId,
		userPresenceType = if NoConfigs1 and p1.presence then ConvertToFoundationPresenceEnumFunction(p1.presence) else FoundationModule.Enums.UserPresence.None,
		title = if UseUserDataValuesModuleResult.combinedName == "" then nil else UseUserDataValuesModuleResult.combinedName,
		subtitle = Text1,
		layoutMode = p1.layoutMode,
		rowSize = if FFlagUserListClientRowProps then p1.rowSize else nil,
		onActivated = p1.onActivated,
		isTitleLoading = if p1.loadingState and p1.loadingState.title ~= nil then p1.loadingState.title else UseUserDataValuesModuleResult.isLoading,
		isSubtitleLoading = if p1.loadingState and p1.loadingState.subtitle ~= nil then p1.loadingState.subtitle else UseUserDataValuesModuleResult.isLoading,
		isContextualInfoLoading = if FFlagUserListClientRowProps then p1.loadingState and p1.loadingState.contextualInfo or p1.contextualInfo == nil and (p1.contextualInfoSource ~= nil and p1.contextualInfoSource.type == ContextInfoTypes.Loading) else p1.loadingState and p1.loadingState.contextualInfo,
		contextualInfo = if p1.configs and p1.configs.showUsernameAsContextualFallback and not p1.contextualInfo then { text = Text } else p1.contextualInfo,
		primaryCta = p1.primaryCta,
		secondaryCta = p1.secondaryCta,
		shouldShowNewIndicator = p1.shouldShowNewIndicator,
		ctaLoading = if FFlagUserListCtaIntegrationEnabled then p1.ctaLoading else nil,
		trailingContent = p1.trailingContent,
		layoutOrder = p1.layoutOrder,
		trustedConnectionIndicatorEnabled = (not FFlagUserListSurfaceExtensions or not p1.configs or p1.configs.showTrustedFriendIndicator ~= false) and p1.layoutMode == EnumsModule.RowLayoutMode.Wide,
		isRobloxSubscriber = if FFlagEnableBlackbirdCheck then UseIsRobloxSubscriberResult else nil,
		disableRowActivation = if FFlagUserListSurfaceExtensions and p1.configs then p1.configs.disableRowActivation else nil,
		textTruncation = if FFlagProfilePlatformSeededPymk and p1.configs then p1.configs.textTruncation else nil
	})
end

local function UserRowWithContextualInfoSource(Tbl)
	-- upvalues: UseContextualInfoFromSourceModule (copy), ReactModule (copy), UserRow (copy)
	local UseContextualInfoFromSourceModuleResult = UseContextualInfoFromSourceModule(Tbl.contextualInfoSource)
	
	if UseContextualInfoFromSourceModuleResult == nil then
		return ReactModule.createElement(UserRow, Tbl)
	else
		local Copy = table.clone(Tbl)
		Copy.contextualInfo = UseContextualInfoFromSourceModuleResult
		
		return ReactModule.createElement(UserRow, Copy)
	end
end

local function renderUserRow(p1)
	-- upvalues: ReactModule (copy), UserRowWithContextualInfoSource (copy), UserRow (copy)
	return if p1.contextualInfo == nil and p1.contextualInfoSource ~= nil then ReactModule.createElement(UserRowWithContextualInfoSource, p1) else ReactModule.createElement(UserRow, p1)
end

local function UserRowWithClientActions(Tbl)
	-- upvalues: UseRowCtaFromClientActionsModule (copy), v16 (copy), renderUserRow (copy)
	local UseRowCtaFromClientActionsModuleResult = UseRowCtaFromClientActionsModule({
		userId = Tbl.entityId,
		primaryClientAction = Tbl.primaryClientAction,
		secondaryClientAction = Tbl.secondaryClientAction,
		onClientActionSuccess = Tbl.onClientActionSuccess,
		showToast = Tbl.showToast or v16,
		friendshipOriginSourceType = Tbl.friendshipOriginSourceType
	})
	local Copy = table.clone(Tbl)
	Copy.primaryCta = UseRowCtaFromClientActionsModuleResult.primaryCta
	Copy.secondaryCta = UseRowCtaFromClientActionsModuleResult.secondaryCta
	
	return renderUserRow(Copy)
end

local function UserRowWithOptionalClientProps(p1)
	-- upvalues: ReactModule (copy), UserRowWithClientActions (copy), renderUserRow (copy)
	return if p1.primaryClientAction == nil and p1.secondaryClientAction == nil then renderUserRow(p1) else ReactModule.createElement(UserRowWithClientActions, p1)
end

return if FFlagUserListClientRowProps then ReactModule.memo(UserRowWithOptionalClientProps) else ReactModule.memo(UserRow)