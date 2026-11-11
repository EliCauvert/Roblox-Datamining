local CorePackages = game:GetService("CorePackages")
local NavigationEvents = require(CorePackages.Packages.RoactNavigation).NavigationEvents
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local TModule = require(CorePackages.Packages.t)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local AppNavBarModule = require(CorePackages.Workspace.Packages.AppNavBar)
local UserInputService = game:GetService("UserInputService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local MoreGridModule = require(Modules.LuaApp.Components.More.MoreGrid)
local MoreGridItemModule = require(Modules.LuaApp.Components.More.MoreGridItem)
local MoreLogOutModule = require(Modules.LuaApp.Components.More.MoreLogOut)
local FFlagEnableMorePageExitButtonSupport = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableMorePageExitButtonSupport
local MoreExitAppModule = if FFlagEnableMorePageExitButtonSupport then require(Modules.LuaApp.Components.More.MoreExitApp) else nil
local FFlagMorePageTermsPrivacyFooterModule = require(Modules.LuaApp.Flags.FFlagMorePageTermsPrivacyFooter)
local MoreFooterModule = if FFlagMorePageTermsPrivacyFooterModule then require(Modules.LuaApp.Components.More.MoreFooter) else nil
local TenFootMoreHeaderModule = require(Modules.LuaApp.Components.More.TenFootMoreHeader)
local MoreSwitchAccountModule = require(Modules.LuaApp.Components.More.MoreSwitchAccount)
local RoactModule = require(Modules.Common.Roact)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactAnalyticsAuthEventsModule = require(Modules.LuaApp.Services.RoactAnalyticsAuthEvents)
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local FFlagAppIaScrollAway = SharedFlagsModule.FFlagAppIaScrollAway
local GetFFlagUIBloxUseFoundationButtonFunction = SharedFlagsModule.UIBlox.GetFFlagUIBloxUseFoundationButton
local ConstantsModule = require(Modules.LuaApp.Constants)
local AppStorageUtilities = require(CorePackages.Workspace.Packages.AuthCommon).Utils.AppStorageUtilities
local AuthPageloadFunction = require(CorePackages.Workspace.Packages.AuthAnalytics).Events.authPageload
local FFlagEnableLuaAccountSwitchModule = require(Modules.LuaApp.Flags.FFlagEnableLuaAccountSwitch)
local FFlagLuaAccountSwitchExperimentBypassBackdoorDevModule = require(Modules.LuaApp.Flags.FFlagLuaAccountSwitchExperimentBypassBackdoorDev)
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local AppBtidLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppBtidLayers
local FFlagFixMorePageLogOutCutOffModule = require(Modules.LuaApp.Flags.FFlagFixMorePageLogOutCutOff)
local FFlagAuthSecExclusions = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAuthSecExclusions
local FFlagEnableMorePageDirectionalLayoutRolloutFix = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableMorePageDirectionalLayoutRolloutFix
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local FFlagMorePageGateAccountSwitcherByCachedVariantId = require(CorePackages.Workspace.Packages.SharedFlags).FFlagMorePageGateAccountSwitcherByCachedVariantId
local GetFStringAccountSwitcherTruthyVariantIdFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFStringAccountSwitcherTruthyVariantId
local GetFStringAccountSwitcherFalsyVariantIdFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFStringAccountSwitcherFalsyVariantId
local GetFFlagEnableAccountSwitcherRedesignIXPFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAccountSwitcherRedesignIXP
local FFlagEnableLuaLoginRevamp = SharedFlagsModule.FFlagEnableLuaLoginRevamp
local FStringLuaLoginRevampIxpLayer = SharedFlagsModule.FStringLuaLoginRevampIxpLayer
local FFlagLuaAppsDefaultSelection = SharedFlagsModule.FFlagLuaAppsDefaultSelection
local FFlagEnableAuthButtonShownEvent = SharedFlagsModule.FFlagEnableAuthButtonShownEvent
local GridMetrics = UIBloxModule.App.Grid.GridMetrics
local VerticalScrollViewWithMargin = UIBloxModule.App.Container.VerticalScrollViewWithMargin
local v1: number = if GetFFlagUIBloxUseFoundationButtonFunction() then 2 else 0
local MorePageContent = RoactModule.PureComponent:extend("MorePageContent")
local UserModule = require(script.Parent.Parent.Parent.Thunks.Authentication.User)
MorePageContent.validateProps = TModule.strictInterface({
	isWideView = TModule.boolean,
	itemTable = TModule.table,
	topBarHeight = TModule.integer,
	isDirectional = TModule.optional(TModule.boolean),
	isExitButtonSupported = TModule.optional(TModule.boolean),
	isAccountSwitcherEnabled = if game:DefineFastFlag("FixMorePageContentValidateProps", false) and FFlagEnableLuaAccountSwitchModule then TModule.optional(TModule.boolean) else nil,
	enableFoundationDesign = TModule.optional(TModule.boolean),
	enableSignedOutAccounts = TModule.optional(TModule.boolean),
	navBarPlacement = if FFlagFixMorePageLogOutCutOffModule then TModule.valueOf(AppNavBarModule.Placement) else nil,
	excludeAccountSwitcher = TModule.optional(TModule.boolean),
	defaultFocusRef = if FFlagLuaAppsDefaultSelection then TModule.optional(TModule.callback) else nil,
	authAnalytics = if FFlagEnableAuthButtonShownEvent then TModule.table else nil
})

function MorePageContent.init(p1)
	-- upvalues: RoactModule (copy), GridMetrics (copy), MoreGridItemModule (copy), FFlagEnableMorePageDirectionalLayoutRolloutFix (copy), UserInputService (copy), UserGameSettings (copy)
	p1.shouldResize = true
	p1.scrollviewRef = RoactModule.createRef()
	p1.contentRef = RoactModule.createRef()
	
	function p1.onWillFocus()
		-- upvalues: p1 (copy)
		if p1.scrollviewRef.current then
			local _ = p1.scrollviewRef.current.AbsoluteCanvasSize
		end
	end
	
	function p1.onResize(Frame)
		-- upvalues: p1 (copy), GridMetrics (upval)
		if not p1.shouldResize then return end
		local X = nil
		
		if p1.contentRef.current then
			X = p1.contentRef.current.AbsoluteSize.X
		else
			if not Frame then return end
			X = Frame.AbsoluteSize.X
		end
		local IsWideView = p1.props.isWideView
		
		if p1.props.isDirectional then
			local Gutter = nil
			local GridCellsInARow = nil
			if #p1.props.itemTable[1] <= 4 then
				Gutter = 36
				GridCellsInARow = 4
			else
				Gutter = 48
				GridCellsInARow = 5
			end
			local PaddingHorizontal = 96
			p1:setState({
				gridCellSize = math.floor((X - (GridCellsInARow - 1) * Gutter - 2 * PaddingHorizontal) / GridCellsInARow),
				gridCellsInARow = GridCellsInARow,
				gutter = Gutter,
				paddingHorizontal = PaddingHorizontal
			})
			
			return
		else
			local Gutter = nil
			local XRatio = nil
			if IsWideView then
				Gutter = 24
				XRatio = if X > 1020 then (X - 924) / 2 else 48
			else
				Gutter = 12
				XRatio = if X < 360 then 12 else 24
			end
			local XDelta = X - 2 * XRatio
			
			if XDelta > 0 then
				local MediumMetrics = GridMetrics.getMediumMetrics(XDelta, Gutter)
				p1:setState({
					gridCellSize = MediumMetrics.itemWidth,
					gridCellsInARow = MediumMetrics.itemsPerRow,
					gutter = Gutter,
					paddingHorizontal = XRatio
				})
				
				return
			end
		end
	end
	
	function p1.renderGridItem(Item, LayoutOrder)
		-- upvalues: RoactModule (upval), MoreGridItemModule (upval), FFlagEnableMorePageDirectionalLayoutRolloutFix (upval), p1 (copy)
		return RoactModule.createElement(MoreGridItemModule, {
			item = Item,
			layoutOrder = LayoutOrder,
			isDirectional = if FFlagEnableMorePageDirectionalLayoutRolloutFix then p1.props.isDirectional else nil
		})
	end
	
	p1.statusBarTappedConnection = UserInputService.StatusBarTapped:Connect(function()
		-- upvalues: p1 (copy), UserGameSettings (upval)
		local Current = p1.scrollviewRef.current
		
		if not Current then return end
		if UserGameSettings.ReducedMotion then
			Current.CanvasPosition = Vector2.new(0, 0)
			
			return
		else
			Current:ScrollToTop()
		end
	end)
	p1:setState({
		gridCellSize = 1,
		gridCellsInARow = 1,
		gutter = 12,
		paddingHorizontal = 12
	})
end

function MorePageContent.willUnmount(p1)
	p1.shouldResize = false
	p1.statusBarTappedConnection:Disconnect()
end

function MorePageContent.didUpdate(p1, p2, _)
	if p2.isWideView ~= p1.props.isWideView then
		p1.onResize(nil)
	end
end

function MorePageContent.render(p1)
	-- upvalues: UserModule (copy), FFlagEnableLuaAccountSwitchModule (copy), FFlagLuaAccountSwitchExperimentBypassBackdoorDevModule (copy), FFlagMorePageGateAccountSwitcherByCachedVariantId (copy), AppStorageUtilities (copy), GetFStringAccountSwitcherTruthyVariantIdFunction (copy), GetFStringAccountSwitcherFalsyVariantIdFunction (copy), AuthPageloadFunction (copy), FFlagAuthSecExclusions (copy), EventStreamConstantsModule (copy), FFlagEnableAuthButtonShownEvent (copy), GetFFlagUIBloxUseFoundationButtonFunction (copy), v1 (copy), FFlagEnableMorePageExitButtonSupport (copy), FFlagMorePageTermsPrivacyFooterModule (copy), FFlagAppIaScrollAway (copy), AppNavBarModule (copy), RoactModule (copy), MoreSwitchAccountModule (copy), FFlagFixMorePageLogOutCutOffModule (copy), ConstantsModule (copy), FFlagEnableLeftNavOnConsole (copy), NavigationEvents (copy), VerticalScrollViewWithMargin (copy), TenFootMoreHeaderModule (copy), MoreGridModule (copy), FFlagLuaAppsDefaultSelection (copy), MoreLogOutModule (copy), MoreExitAppModule (copy), MoreFooterModule (copy)
	local GridCellSize: number = p1.state.gridCellSize
	local GridCellsInARow = p1.state.gridCellsInARow
	local Gutter: number = p1.state.gutter
	local PaddingHorizontal = p1.state.paddingHorizontal
	local Item = p1.props.itemTable[1]
	local ItemEntry = p1.props.itemTable[2][1]
	local TopBarHeight: number = p1.props.topBarHeight
	local CountItem = #Item
	local IsDirectional = p1.props.isDirectional
	
	if IsDirectional then
		GridCellsInARow = if #Item <= 4 then 4 else 5
	end
	local CeiledDelta = math.ceil(CountItem / GridCellsInARow) * (GridCellSize + Gutter) - Gutter
	local IsNotIsUnder = UserModule.fromLocalStorage().isUnder13 ~= true
	local v2 = false
	local v3 = false
	
	if FFlagEnableLuaAccountSwitchModule then
		local IsAccountSwitcherEnabled = p1.props.isAccountSwitcherEnabled or FFlagLuaAccountSwitchExperimentBypassBackdoorDevModule == true
		
		if FFlagMorePageGateAccountSwitcherByCachedVariantId then
			local AccountSwitcherAvailableByVariantId = AppStorageUtilities.getAccountSwitcherAvailableByVariantId()
			
			if AccountSwitcherAvailableByVariantId == nil then
				AppStorageUtilities.setAccountSwitcherExperimentVariantId(if IsAccountSwitcherEnabled then GetFStringAccountSwitcherTruthyVariantIdFunction() else GetFStringAccountSwitcherFalsyVariantIdFunction())
				AppStorageUtilities.flush()
				AuthPageloadFunction("userEnrolledInCachedAs", (tostring(IsAccountSwitcherEnabled)))
			else
				IsAccountSwitcherEnabled = AccountSwitcherAvailableByVariantId
				AuthPageloadFunction("morePageCachedAsValue", (tostring(AccountSwitcherAvailableByVariantId)))
			end
		end
		v3 = p1.props.excludeAccountSwitcher and FFlagAuthSecExclusions
		v2 = not v3 and (IsNotIsUnder and IsAccountSwitcherEnabled)
	end
	local SwitchAccountsExclusionsHidden = if v3 then EventStreamConstantsModule.State.SwitchAccountsExclusionsHidden elseif IsNotIsUnder then if v2 then EventStreamConstantsModule.State.SwitchAccountsShown else EventStreamConstantsModule.State.SwitchAccountsIxpHidden else EventStreamConstantsModule.State.SwitchAccountsU13Hidden
	
	if FFlagEnableAuthButtonShownEvent and p1.reportedAuthButtonShownState ~= SwitchAccountsExclusionsHidden then
		p1.reportedAuthButtonShownState = SwitchAccountsExclusionsHidden
		p1.props.authAnalytics.reportAuthButtonShown(EventStreamConstantsModule.Context.MorePage, EventStreamConstantsModule.Button.SwitchAccounts, SwitchAccountsExclusionsHidden, EventStreamConstantsModule.Origin.MoreMenu)
	end
	local ButtonHeight: number = if IsDirectional then if GetFFlagUIBloxUseFoundationButtonFunction() then v1 + 72 else 72 elseif GetFFlagUIBloxUseFoundationButtonFunction() then v1 + 48 else 48
	local ButtonMaxWidth: number = if IsDirectional then 1024 else 640
	local Offset: number = if v2 then CeiledDelta + 2 * Gutter + ButtonHeight * 2 else CeiledDelta + 2 * Gutter + ButtonHeight
	
	if FFlagEnableMorePageExitButtonSupport and p1.props.isExitButtonSupported then
		Offset = Offset + ButtonHeight + (if v2 then Gutter else 0)
	end
	if FFlagMorePageTermsPrivacyFooterModule then
		Offset = Offset + 38 + Gutter
	end
	if IsDirectional then
		Offset += 200
	end
	if FFlagAppIaScrollAway and AppNavBarModule.getScrollAwayEnabled() then
		Offset += TopBarHeight
	end
	local BOTTOMBARSIZE = if FFlagFixMorePageLogOutCutOffModule and p1.props.navBarPlacement == AppNavBarModule.Placement.Bottom then ConstantsModule.BOTTOM_BAR_SIZE else 0
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = if FFlagAppIaScrollAway and AppNavBarModule.getScrollAwayEnabled() then nil else UDim2.fromOffset(0, TopBarHeight),
		Size = if FFlagAppIaScrollAway and AppNavBarModule.getScrollAwayEnabled() then UDim2.new(1, 0, 1, 0) elseif FFlagFixMorePageLogOutCutOffModule then UDim2.new(1, 0, 1, -TopBarHeight - BOTTOMBARSIZE) else UDim2.new(1, 0, 1, -TopBarHeight - ConstantsModule.BOTTOM_BAR_SIZE)
	}, {
		UIPadding = RoactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, Gutter) }),
		Content = RoactModule.createElement("Frame", {
			BackgroundTransparency = if IsDirectional and not FFlagEnableLeftNavOnConsole then 0 else 1,
			Size = UDim2.new(1, 0, 1, 0),
			[RoactModule.Ref] = p1.contentRef,
			[RoactModule.Change.AbsoluteSize] = p1.onResize
		}, {
			UIGradient = if IsDirectional and not FFlagEnableLeftNavOnConsole then RoactModule.createElement("UIGradient", {
				Rotation = 90,
				Color = ColorSequence.new(Color3.new(0, 0, 0)),
				Transparency = NumberSequence.new(1, 0.4)
			}) else nil,
			NavigationEvents = RoactModule.createElement(NavigationEvents, { onWillFocus = p1.onWillFocus }),
			VerticalScrollViewWithMargin = RoactModule.createElement(VerticalScrollViewWithMargin, {
				canvasSizeY = UDim.new(0, Offset),
				paddingHorizontal = PaddingHorizontal,
				paddingTop = if FFlagAppIaScrollAway and AppNavBarModule.getScrollAwayEnabled() then TopBarHeight else nil,
				[RoactModule.Ref] = p1.scrollviewRef,
				Selectable = false
			}, {
				UIListLayout = RoactModule.createElement("UIListLayout", {
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, Gutter),
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				TenFootMoreHeader = if IsDirectional then RoactModule.createElement(TenFootMoreHeaderModule) else nil,
				MoreGrid = RoactModule.createElement(MoreGridModule, {
					layoutOrder = 1,
					defaultFocusRef = if FFlagLuaAppsDefaultSelection then p1.props.defaultFocusRef else nil,
					size = UDim2.new(1, 0, 0, CeiledDelta),
					gridCellPadding = Gutter,
					gridCellSize = GridCellSize,
					items = Item,
					renderItem = p1.renderGridItem
				}),
				MoreSwitchAccount = if v2 then RoactModule.createElement(MoreSwitchAccountModule, {
					layoutOrder = 2,
					buttonHeight = ButtonHeight,
					buttonMaxWidth = ButtonMaxWidth,
					item = p1.props.itemTable[2][1],
					enableFoundationDesign = p1.props.enableFoundationDesign,
					enableSignedOutAccounts = p1.props.enableSignedOutAccounts,
					showLoginRevamp = p1.props.showLoginRevamp
				}) else nil,
				MoreLogOut = RoactModule.createElement(MoreLogOutModule, {
					layoutOrder = 3,
					buttonHeight = ButtonHeight,
					buttonMaxWidth = ButtonMaxWidth,
					item = ItemEntry
				}),
				MoreExitAppButton = if FFlagEnableMorePageExitButtonSupport and MoreExitAppModule and p1.props.isExitButtonSupported then RoactModule.createElement(MoreExitAppModule, {
					layoutOrder = 4,
					buttonMaxWidth = ButtonMaxWidth,
					buttonHeight = ButtonHeight
				}) else nil,
				MoreFooter = if FFlagMorePageTermsPrivacyFooterModule and MoreFooterModule then RoactModule.createElement(MoreFooterModule, { layoutOrder = 5, height = 38 }) else nil
			})
		})
	})
end

local v2 = RoactAppPolicy.connect(function(p1, _)
	return { excludeAccountSwitcher = p1.getExcludeAccountSwitcher() }
end)(MorePageContent)

if FFlagEnableAuthButtonShownEvent then
	v2 = RoactServices.connect({ authAnalytics = RoactAnalyticsAuthEventsModule })(v2)
end
if FFlagEnableLuaAccountSwitchModule == true then
	v2 = RoactAppExperimentModule.connectBrowserTrackerLayer({ AppBtidLayers.AccountSwitcherLayer }, function(p1, _)
		-- upvalues: AppBtidLayers (copy), GetFFlagEnableAccountSwitcherRedesignIXPFunction (copy)
		local v3 = p1[AppBtidLayers.AccountSwitcherLayer] or {}
		local config = { isAccountSwitcherEnabled = v3.isAccountSwitcherEnabled }
		
		if GetFFlagEnableAccountSwitcherRedesignIXPFunction() then
			config.enableFoundationDesign = v3.enableAccountSwitcherFoundationDesign == true
			config.enableSignedOutAccounts = v3.enableAccountSwitcherSignedOutAccounts == true
			
			return config
		else
			config.enableFoundationDesign = true
			config.enableSignedOutAccounts = true
			
			return config
		end
	end)(v2)
end
if FFlagEnableLuaLoginRevamp then
	v2 = RoactAppExperimentModule.connectBrowserTrackerLayer({ FStringLuaLoginRevampIxpLayer }, function(p1, _)
		-- upvalues: FStringLuaLoginRevampIxpLayer (copy)
		return {
			showLoginRevamp = (p1[FStringLuaLoginRevampIxpLayer] or {}).showLoginRevamp
		}
	end)(v2)
end
return v2