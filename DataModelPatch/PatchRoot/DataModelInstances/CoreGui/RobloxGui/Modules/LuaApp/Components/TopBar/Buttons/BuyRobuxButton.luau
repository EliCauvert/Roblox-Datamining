local HttpService = game:GetService("HttpService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local ConstantsModule = require(Modules.LuaApp.Constants)
local DashModule = require(CorePackages.Packages.Dash)
local CryoModule = require(CorePackages.Packages.Cryo)
local TModule = require(CorePackages.Packages.t)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ReactModule = require(CorePackages.Packages.React)
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local BadgeStates = UIBloxModule.App.Indicator.Enum.BadgeStates
local UtilityActionIcon = UIBloxModule.App.Button.UtilityActionIcon
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseIconSizeFunction = FoundationModule.Hooks.useIconSize
local InputSize = FoundationModule.Enums.InputSize
local RoactAnalyticsTopBarModule = require(Modules.LuaApp.Services.RoactAnalyticsTopBar)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local OpenPurchaseRobuxPageModule = require(Modules.LuaApp.Thunks.Economy.OpenPurchaseRobuxPage)
local SetBuyRobuxButtonClickedModule = require(Modules.LuaApp.Actions.Economy.SetBuyRobuxButtonClicked)
local UseRobuxBadgeModule = require(Modules.LuaApp.Components.TopBar.Utils.useRobuxBadge)
local FFlagRobuxBadgeEnabledModule = require(Modules.LuaApp.Flags.FFlagRobuxBadgeEnabled)
local FFlagEnableWhiteRobuxIconModule = require(Modules.LuaApp.Flags.FFlagEnableWhiteRobuxIcon)
local FFlagRobuxIconColorHotfixModule = require(Modules.LuaApp.Flags.FFlagRobuxIconColorHotfix)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableHeaderBarButtonsUpdate = SharedFlagsModule.FFlagEnableHeaderBarButtonsUpdate
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors
local FFlagSignalsNavP3bTopBar = SharedFlagsModule.FFlagSignalsNavP3bTopBar
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3bTopBar then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local EnableWhiteOrGreyRobuxIcon = game:DefineFastFlag("EnableWhiteOrGreyRobuxIcon", false)
local IconsCommonRobux = if FFlagEnableWhiteRobuxIconModule then Images["icons/common/robux"] else Images["icons/common/goldrobux"]
local ForwardRefResult = if FFlagEnableHeaderBarButtonsUpdate then ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseTokensFunction (copy), EnableWhiteOrGreyRobuxIcon (copy), UseIconSizeFunction (copy), InputSize (copy), ReactModule (copy), FoundationModule (copy), ImageSetLabel (copy), Images (copy), FFlagRobuxBadgeEnabledModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseIconSizeResult = if EnableWhiteOrGreyRobuxIcon then nil else UseIconSizeFunction(InputSize.Medium, true, true)
	local UseMemoResult = if EnableWhiteOrGreyRobuxIcon then nil else ReactModule.useMemo(function()
		-- upvalues: UseTokensResult (copy)
		return {
			radius = UDim.new(0, UseTokensResult.Radius.Circle),
			offset = UseTokensResult.Size.Size_150,
			borderWidth = UseTokensResult.Stroke.Thicker
		}
	end, { UseTokensResult })
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = if EnableWhiteOrGreyRobuxIcon then "auto-xy radius-circle" else "size-1000-1000 radius-circle",
		cursor = if EnableWhiteOrGreyRobuxIcon then nil else UseMemoResult,
		ref = if EnableWhiteOrGreyRobuxIcon then nil else Ref,
		onActivated = if EnableWhiteOrGreyRobuxIcon then nil else p1.onActivated
	}, {
		Icon = if EnableWhiteOrGreyRobuxIcon then ReactModule.createElement(FoundationModule.IconButton, {
			ZIndex = 1,
			isCircular = true,
			icon = FoundationModule.Enums.IconName.Robux,
			onActivated = p1.onActivated,
			ref = Ref
		}) else ReactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			Selectable = false,
			ZIndex = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UseIconSizeResult,
			Image = Images["icons/common/goldrobux"]
		}),
		Badge = if FFlagRobuxBadgeEnabledModule and p1.showBadge then ReactModule.createElement(FoundationModule.StatusIndicator, {
			ZIndex = 2,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0.5, UseTokensResult.Size.Size_50, 0.5, -UseTokensResult.Size.Size_50),
			variant = FoundationModule.Enums.StatusIndicatorVariant.Alert
		}) else nil
	})
end) else nil
local BuyRobuxButton = RoactModule.PureComponent:extend("BuyRobuxButton")
BuyRobuxButton.validateProps = TModule.strictInterface({
	formFactor = TModule.string,
	isCompactView = TModule.boolean,
	isSearching = TModule.boolean,
	isSecondary = TModule.optional(TModule.boolean),
	setVisible = DashModule.isCallable,
	cancelSearch = DashModule.isCallable,
	activateSearch = DashModule.isCallable,
	buttonRef = TModule.optional(TModule.table),
	currentRoute = TModule.table,
	showBadge = if FFlagRobuxBadgeEnabledModule then TModule.boolean else nil,
	openPurchaseRobuxPage = DashModule.isCallable,
	dispatchBuyRobuxButtonClicked = if FFlagRobuxBadgeEnabledModule then DashModule.isCallable else nil,
	analytics = TModule.any,
	disableIAPEntryPoint = TModule.boolean,
	networking = TModule.callback
})

function BuyRobuxButton.init(p1)
	-- upvalues: HttpService (copy), FFlagRobuxBadgeEnabledModule (copy)
	function p1.showBuyRobuxCallback()
		-- upvalues: p1 (copy), HttpService (upval), FFlagRobuxBadgeEnabledModule (upval)
		local Name = p1.props.currentRoute[1].name
		p1.props.openPurchaseRobuxPage(p1.props.disableIAPEntryPoint, p1.props.networking, (HttpService:GenerateGUID(false)))
		
		if FFlagRobuxBadgeEnabledModule then
			p1.props.dispatchBuyRobuxButtonClicked()
		end
		p1.props.analytics.reportRobuxButtonClick(Name)
	end
end

local function _(p1): boolean
	return not p1.isSearching
end

function BuyRobuxButton.updateVisibility(p1, NoIsSearching)
	local NoIsSearching1 = not p1.props.isSearching
	
	if NoIsSearching1 ~= NoIsSearching then
		p1.props.setVisible(NoIsSearching1)
	end
end

function BuyRobuxButton.didMount(p1)
	p1:updateVisibility(nil)
end

function BuyRobuxButton.didUpdate(p1, p2, _)
	p1:updateVisibility(not p2.isSearching)
end

function BuyRobuxButton.render(p1)
	-- upvalues: FFlagEnableHeaderBarButtonsUpdate (copy), ReactModule (copy), ForwardRefResult (copy), FFlagRobuxBadgeEnabledModule (copy), RoactModule (copy), UtilityActionIcon (copy), IconsCommonRobux (copy), BadgeStates (copy), FFlagRobuxIconColorHotfixModule (copy), FFlagEnableWhiteRobuxIconModule (copy)
	return if FFlagEnableHeaderBarButtonsUpdate then ReactModule.createElement(ForwardRefResult, {
		showBadge = if FFlagRobuxBadgeEnabledModule then p1.props.showBadge else nil,
		onActivated = if p1.props.isSearching then p1.props.cancelSearch else p1.showBuyRobuxCallback,
		ref = p1.props.buttonRef
	}) else RoactModule.createElement(UtilityActionIcon, {
		icon = IconsCommonRobux,
		badgeValue = if FFlagRobuxBadgeEnabledModule and p1.props.showBadge then BadgeStates.isEmpty else nil,
		iconColor = if FFlagRobuxIconColorHotfixModule and FFlagEnableWhiteRobuxIconModule then nil else {},
		onActivated = if p1.props.isSearching then p1.props.cancelSearch else p1.showBuyRobuxCallback,
		ref = p1.props.buttonRef
	})
end

local v1 = if FFlagSignalsNavP3bTopBar then function(p1)
	-- upvalues: GetLegacyNavigationStore (copy), UseSignalStateFunction (copy), ReactModule (copy), v1 (copy), CryoModule (copy)
	return ReactModule.createElement(v1, CryoModule.Dictionary.union(p1, {
		currentRoute = UseSignalStateFunction(GetLegacyNavigationStore(false).getCurrentLegacyRoute)
	}))
end else RoactRoduxModule.connect(function(p1, _)
	-- upvalues: FFlagSignalsNavP3bTopBar (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), FFlagRobuxBadgeEnabledModule (copy)
	return {
		currentRoute = if FFlagSignalsNavP3bTopBar then nil elseif FFlagUseNavigationSelectors then Selectors.selectCurrentLegacyRoute(p1) else p1.Navigation.history[#p1.Navigation.history],
		showBadge = if FFlagRobuxBadgeEnabledModule then p1.RobuxVirtualItem.showBuyRobuxButtonBadge else nil
	}
end, function(Callback)
	-- upvalues: SetCurrentToastMessageModule (copy), ConstantsModule (copy), OpenPurchaseRobuxPageModule (copy), FFlagRobuxBadgeEnabledModule (copy), SetBuyRobuxButtonClickedModule (copy)
	return {
		openPurchaseRobuxPage = function(p1, p2, p3)
			-- upvalues: Callback (copy), SetCurrentToastMessageModule (upval), ConstantsModule (upval), OpenPurchaseRobuxPageModule (upval)
			if p1 then
				Callback(SetCurrentToastMessageModule(ConstantsModule.WEBVIEWS_UNAVAILABLE_TOAST))
				
				return
			else
				return Callback(OpenPurchaseRobuxPageModule(nil, p2, p3))
			end
		end,
		dispatchBuyRobuxButtonClicked = if FFlagRobuxBadgeEnabledModule then function()
			-- upvalues: Callback (copy), SetBuyRobuxButtonClickedModule (upval)
			return Callback(SetBuyRobuxButtonClickedModule())
		end else nil
	}
end)(BuyRobuxButton)
local v2 = if FFlagRobuxBadgeEnabledModule then function(p1)
	-- upvalues: UseRobuxBadgeModule (copy), RoactModule (copy), v2 (copy)
	UseRobuxBadgeModule()
	
	return RoactModule.createElement(v2, p1)
end else RoactAppPolicy.connect(function(p1)
	return { disableIAPEntryPoint = p1.getDisableIAPEntryPoint() }
end)((RoactServices.connect({
	analytics = RoactAnalyticsTopBarModule,
	networking = RoactNetworkingModule
})(v1)))

return v2