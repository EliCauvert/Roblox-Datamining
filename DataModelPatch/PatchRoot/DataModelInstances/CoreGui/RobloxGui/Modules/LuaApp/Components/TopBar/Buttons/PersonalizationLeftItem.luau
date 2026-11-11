local CorePackages = game:GetService("CorePackages")
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors
local FFlagSignalsNavP3bTopBar = SharedFlagsModule.FFlagSignalsNavP3bTopBar
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3bTopBar then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local CryoModule = require(CorePackages.Packages.Cryo)
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ReactModule = require(CorePackages.Packages.React)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ProfileLeftHeaderModule = require(Modules.LuaApp.Components.TopBar.Buttons.ProfileLeftHeader)
local MakeBackButtonModule = require(Modules.LuaApp.Components.TopBar.Buttons.makeBackButton)
local ShouldShowProfileInHeaderBarModule = require(Modules.LuaApp.Components.TopBar.Utils.shouldShowProfileInHeaderBar)
local FFlagEnableFlyoutSidePanelModule = require(Modules.LuaApp.Flags.FFlagEnableFlyoutSidePanel)
local FFlagEnableHomeRobloxLogo = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableHomeRobloxLogo
local FlyoutLeftHeader = nil
local FlyoutSidePanelIXP = nil
local ShouldShowLeftHeaderFunction = nil

if FFlagEnableFlyoutSidePanelModule or FFlagEnableHomeRobloxLogo then
	FlyoutSidePanelIXP = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP
	local FlyoutSidePanelModule = require(CorePackages.Workspace.Packages.FlyoutSidePanel)
	FlyoutLeftHeader = FlyoutSidePanelModule.Components.FlyoutLeftHeader
	ShouldShowLeftHeaderFunction = FlyoutSidePanelModule.Utils.shouldShowLeftHeader
end
local PersonalizationLeftItem = ReactModule.Component:extend("PersonalizationLeftItem")

function PersonalizationLeftItem.init(p1, _)
	-- upvalues: MakeBackButtonModule (copy)
	p1.backButton = MakeBackButtonModule(nil)
end

local function _(p1)
	-- upvalues: FFlagEnableFlyoutSidePanelModule (copy), FFlagEnableHomeRobloxLogo (copy), ShouldShowLeftHeaderFunction (ref), ShouldShowProfileInHeaderBarModule (copy)
	local Name = p1.currentRoute[1].name
	local Name1 = p1.currentRoute[#p1.currentRoute].name
	
	return if FFlagEnableFlyoutSidePanelModule or FFlagEnableHomeRobloxLogo then ShouldShowLeftHeaderFunction(p1.routeName, Name1, p1.isSearching) else ShouldShowProfileInHeaderBarModule(Name, Name1, p1.formFactor, p1.isSearching)
end

function PersonalizationLeftItem.didMount(p1)
	-- upvalues: FFlagEnableFlyoutSidePanelModule (copy), FFlagEnableHomeRobloxLogo (copy), ShouldShowLeftHeaderFunction (ref), ShouldShowProfileInHeaderBarModule (copy)
	if FFlagEnableFlyoutSidePanelModule or FFlagEnableHomeRobloxLogo then
		local Props = p1.props
		local Name = Props.currentRoute[1].name
		local Name1 = Props.currentRoute[#Props.currentRoute].name
		local ShouldShowLeftHeader = if FFlagEnableFlyoutSidePanelModule or FFlagEnableHomeRobloxLogo then ShouldShowLeftHeaderFunction(Props.routeName, Name1, Props.isSearching) else ShouldShowProfileInHeaderBarModule(Name, Name1, Props.formFactor, Props.isSearching)
		
		if ShouldShowLeftHeader then
			p1.props.setVisible(ShouldShowLeftHeader)
		end
	end
end

function PersonalizationLeftItem.didUpdate(p1, p2)
	-- upvalues: FFlagEnableFlyoutSidePanelModule (copy), FFlagEnableHomeRobloxLogo (copy), ShouldShowLeftHeaderFunction (ref), ShouldShowProfileInHeaderBarModule (copy)
	local Name = p2.currentRoute[1].name
	local Name1 = p2.currentRoute[#p2.currentRoute].name
	local ShouldShowLeftHeader = if FFlagEnableFlyoutSidePanelModule or FFlagEnableHomeRobloxLogo then ShouldShowLeftHeaderFunction(p2.routeName, Name1, p2.isSearching) else ShouldShowProfileInHeaderBarModule(Name, Name1, p2.formFactor, p2.isSearching)
	local Props = p1.props
	local Name2 = Props.currentRoute[1].name
	local Name21 = Props.currentRoute[#Props.currentRoute].name
	local ShouldShowLeftHeader1 = if FFlagEnableFlyoutSidePanelModule or FFlagEnableHomeRobloxLogo then ShouldShowLeftHeaderFunction(Props.routeName, Name21, Props.isSearching) else ShouldShowProfileInHeaderBarModule(Name2, Name21, Props.formFactor, Props.isSearching)
	
	if ShouldShowLeftHeader ~= ShouldShowLeftHeader1 then
		p1.props.setVisible(ShouldShowLeftHeader1)
	end
end

function PersonalizationLeftItem.render(p1)
	-- upvalues: FFlagEnableFlyoutSidePanelModule (copy), FFlagEnableHomeRobloxLogo (copy), ShouldShowLeftHeaderFunction (ref), ShouldShowProfileInHeaderBarModule (copy), ReactModule (copy), FlyoutLeftHeader (ref), FlyoutSidePanelIXP (ref), ProfileLeftHeaderModule (copy)
	local Props = p1.props
	local Name = Props.currentRoute[1].name
	local Name1 = Props.currentRoute[#Props.currentRoute].name
	local ShouldShowLeftHeader = if FFlagEnableFlyoutSidePanelModule or FFlagEnableHomeRobloxLogo then ShouldShowLeftHeaderFunction(Props.routeName, Name1, Props.isSearching) else ShouldShowProfileInHeaderBarModule(Name, Name1, Props.formFactor, Props.isSearching)
	
	return if ShouldShowLeftHeader then if FFlagEnableFlyoutSidePanelModule or FFlagEnableHomeRobloxLogo then ReactModule.createElement(FlyoutLeftHeader, {
		formFactor = p1.props.formFactor,
		titleText = p1.props.titleText,
		buttonRef = p1.props.buttonRef,
		routeName = p1.props.routeName,
		isFlyoutEntrypointEnabled = if FFlagEnableHomeRobloxLogo then FlyoutSidePanelIXP.isFlyoutSidePanelEnabled() else nil,
		isRobloxLogoEnabled = if FFlagEnableHomeRobloxLogo then true else FlyoutSidePanelIXP.isRobloxLogoEnabled(),
		isAlternateEntryPointEnabled = FlyoutSidePanelIXP.isAlternateEntryPointEnabled()
	}) else ReactModule.createElement(ProfileLeftHeaderModule, {
		formFactor = p1.props.formFactor,
		titleText = p1.props.titleText,
		buttonRef = p1.props.buttonRef
	}) else ReactModule.createElement(p1.backButton, {
		formFactor = p1.props.formFactor,
		isCompactView = p1.props.isCompactView,
		isSearching = p1.props.isSearching,
		isSecondary = p1.props.isSecondary,
		cancelSearch = p1.props.cancelSearch,
		activateSearch = p1.props.activateSearch,
		setVisible = p1.props.setVisible,
		buttonRef = p1.props.buttonRef
	})
end

return if FFlagSignalsNavP3bTopBar then function(p1)
	-- upvalues: GetLegacyNavigationStore (copy), UseSignalStateFunction (copy), ReactModule (copy), PersonalizationLeftItem (copy), CryoModule (copy)
	return ReactModule.createElement(PersonalizationLeftItem, CryoModule.Dictionary.union(p1, {
		currentRoute = UseSignalStateFunction(GetLegacyNavigationStore(false).getCurrentLegacyRoute)
	}))
end else RoactRoduxModule.connect(function(p1, _)
	-- upvalues: FFlagUseNavigationSelectors (copy), Selectors (copy)
	return {
		currentRoute = if FFlagUseNavigationSelectors then Selectors.selectCurrentLegacyRoute(p1) else p1.Navigation.history[#p1.Navigation.history]
	}
end)(PersonalizationLeftItem)