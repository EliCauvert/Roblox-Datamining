local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(Modules.LuaApp.ArgCheck)
local MorePageSettingsModule = require(Modules.LuaApp.Components.More.Config.MorePageSettings)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AppLinking = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLinking
local LogOutButtonModule = require(Modules.LuaApp.Components.More.LogOutButton)
local MoreButtonModule = require(Modules.LuaApp.Components.More.MoreButton)
local TModule = require(CorePackages.Packages.t)
local AppEventIngestServiceModule = require(Modules.LuaApp.Services.AppEventIngestService)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local OpenExternalBrowserModule = require(Modules.LuaApp.openExternalBrowser)
local GetFFlagEnableGUACControlTOSPPLinksModule = require(Modules.LuaApp.Flags.GetFFlagEnableGUACControlTOSPPLinks)
local FocusNavigationUtilsModule = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local UseFocusGuiObjectFunction = require(CorePackages.Packages.ReactFocusNavigation).useFocusGuiObject
local FFlagEnableFlyoutSidePanelModule = require(Modules.LuaApp.Flags.FFlagEnableFlyoutSidePanel)
local MoreItemContainer = RoactModule.PureComponent:extend("MoreItemContainer")
MoreItemContainer.defaultProps = {
	layoutInfo = {},
	eventIngest = if FFlagEnableFlyoutSidePanelModule then TModule.any else nil
}

function MoreItemContainer.init(p1)
	-- upvalues: GetFFlagEnableGUACControlTOSPPLinksModule (copy), OpenExternalBrowserModule (copy), FFlagEnableFlyoutSidePanelModule (copy), RoactModule (copy)
	function p1.navigateDown()
		-- upvalues: p1 (copy), GetFFlagEnableGUACControlTOSPPLinksModule (upval), OpenExternalBrowserModule (upval), FFlagEnableFlyoutSidePanelModule (upval)
		local Item = p1.props.item
		local Url = Item.context.url
		local TitleKey = Item.context.titleKey
		local NotificationType = Item.context.notificationType
		
		if Item.urlGenerator then
			local LocalUserId = p1.props.localUserId
			Url = if GetFFlagEnableGUACControlTOSPPLinksModule() then Item.urlGenerator(LocalUserId, p1.props.appPolicy) else Item.urlGenerator(LocalUserId)
		end
		local SearchParams = if Item.getSearchParams then Item.getSearchParams(p1.props.formFactor) else nil
		local Config = if TitleKey or SearchParams or NotificationType then {
			titleKey = TitleKey,
			searchParams = SearchParams,
			notificationType = NotificationType
		} else nil
		local IsFallbackToExternalBrowser: boolean = p1.props.disableWebViewSupport == true and Item.context.fallbackToExternalBrowser == true
		
		if Item.shouldOpenInExternalBrowser and p1.props.shouldUseExternalBrowserForMorePageItem() or IsFallbackToExternalBrowser then
			OpenExternalBrowserModule(p1.props.linking, Url)
		else
			p1.props.navigateDown({
				name = Item.context.page,
				detail = Url,
				extraProps = Config
			})
		end
		if FFlagEnableFlyoutSidePanelModule then
			p1.props.eventIngest:sendEventDeferred("moreGridItem", "moreGridItemClick", {
				source = "flyout",
				itemType = Item.itemType,
				url = Url,
				localUserId = p1.props.localUserId
			})
		end
	end
	
	p1.focusableButtonRef = RoactModule.createRef()
end

function MoreItemContainer.didMount(p1)
	local LayoutInfo = p1.props.layoutInfo
	
	if p1.props.focusGuiObject and p1.focusableButtonRef and p1.focusableButtonRef.current and LayoutInfo.LayoutOrder == 1 then
		p1.props.focusGuiObject(p1.focusableButtonRef.current)
	end
end

function MoreItemContainer.render(p1)
	-- upvalues: ArgCheckModule (copy), MorePageSettingsModule (copy), RoactModule (copy), LogOutButtonModule (copy), MoreButtonModule (copy), CryoModule (copy), FFlagEnableFlyoutSidePanelModule (copy)
	local LayoutInfo = p1.props.layoutInfo
	local Item = p1.props.item
	ArgCheckModule.isType(LayoutInfo, "table", "MoreItemContainer.props.layoutInfo")
	ArgCheckModule.isType(Item, "table", "MoreItemContainer.props.item")
	
	return if Item.itemType == MorePageSettingsModule.ItemType.LogOut then RoactModule.createElement(LogOutButtonModule, { onActivated = p1.onActivated }) else RoactModule.createElement(MoreButtonModule, CryoModule.Dictionary.join(LayoutInfo, {
		badgeComponent = Item.badgeComponent,
		badgeCount = Item.badgeCount,
		icon = if FFlagEnableFlyoutSidePanelModule then nil else Item.icon,
		rightImage = Item.rightImage,
		textKey = Item.textKey,
		TextXAlignment = Item.textXAlignment,
		onActivated = p1.navigateDown,
		buttonRef = p1.focusableButtonRef
	}))
end

local v1 = RoactServices.connect({
	linking = AppLinking,
	networkImpl = RoactNetworkingModule,
	eventIngest = if FFlagEnableFlyoutSidePanelModule then AppEventIngestServiceModule else nil
})((RoactAppPolicy.connect(function(p1)
	-- upvalues: GetFFlagEnableGUACControlTOSPPLinksModule (copy)
	return {
		shouldUseExternalBrowserForMorePageItem = p1.shouldUseExternalBrowserForMorePageItem,
		disableWebViewSupport = not p1.getWebViewSupport(),
		appPolicy = if GetFFlagEnableGUACControlTOSPPLinksModule() then p1 else nil
	}
end)((RoactRoduxModule.connect(function(p1, _)
	return { formFactor = p1.FormFactor, localUserId = p1.LocalUserId }
end, function(Callback)
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy)
	return {
		navigateDown = function(p1)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(p1))
				
				return
			else
				Callback(NavigateDownModule(p1))
			end
		end
	}
end)(MoreItemContainer)))))

return function(p1)
	-- upvalues: UseFocusGuiObjectFunction (copy), FocusNavigationUtilsModule (copy), ResponsiveModule (copy), RoactModule (copy), v1 (ref), CryoModule (copy)
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	local UseLastInputResult = FocusNavigationUtilsModule.useLastInputMethod()
	local UseIsSpatialResult = ResponsiveModule.useIsSpatial()
	local NoUseIsSpatialResult: boolean = if UseLastInputResult == "Gamepad" then not UseIsSpatialResult else UseLastInputResult == "Keyboard" and not UseIsSpatialResult
	
	return RoactModule.createElement(v1, CryoModule.Dictionary.join(p1, {
		focusGuiObject = if not NoUseIsSpatialResult then nil else UseFocusGuiObjectResult
	}))
end