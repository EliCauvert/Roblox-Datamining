local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local TModule = require(CorePackages.Packages.t)
local DashModule = require(CorePackages.Packages.Dash)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local SegmentedControl = require(CorePackages.Packages.UIBlox).App.Control.SegmentedControl
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local AnalyticsModule1 = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local WithAvatarRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute)
local AXTransitionSegmentedMenu = RoactModule.PureComponent:extend("AXTransitionSegmentedMenu")
AXTransitionSegmentedMenu.validateProps = TModule.strictInterface({
	formFactor = TModule.string,
	isCompactView = TModule.boolean,
	isSearching = TModule.boolean,
	setVisible = DashModule.isCallable,
	cancelSearch = DashModule.isCallable,
	activateSearch = DashModule.isCallable,
	buttonRef = TModule.optional(TModule.table),
	navigation = TModule.table,
	avatarRoute = AvatarExperienceNavigationModule.AvatarRoute.AvatarRoute.Interface,
	topBarHeight = TModule.number,
	avatarAnalytics = TModule.table,
	catalogAnalytics = TModule.table,
	[RoactModule.Ref] = TModule.optional(TModule.table)
})

function AXTransitionSegmentedMenu.getOpaquePage(p1)
	return p1.props.avatarRoute.opaque.name
end

function AXTransitionSegmentedMenu.init(p1)
	-- upvalues: AvatarScreen (copy)
	p1:setState({ segmentedControlWidth = 234 })
	
	function p1.goToAvatarEditorPage()
		-- upvalues: p1 (copy), AvatarScreen (upval)
		if p1:getOpaquePage() ~= AvatarScreen.AvatarEditor then
			p1.props.navigation.navigate(AvatarScreen.AvatarEditor)
			p1.props.avatarAnalytics.catalogToAvatarButton()
		end
	end
	
	function p1.goToCatalogPage()
		-- upvalues: p1 (copy), AvatarScreen (upval)
		if p1:getOpaquePage() ~= AvatarScreen.Catalog then
			p1.props.navigation.navigate(AvatarScreen.Catalog)
			p1.props.catalogAnalytics.avatarToCatalogButton()
		end
	end
	
	function p1.onTabActivated(p2)
		-- upvalues: p1 (copy)
		if p2 == 1 then
			p1.goToCatalogPage()
			
			return
		end
		if p2 == 2 then
			p1.goToAvatarEditorPage()
		end
	end
end

function AXTransitionSegmentedMenu.render(p1)
	-- upvalues: WithLocalizationFunction (copy)
	return WithLocalizationFunction({
		customizeText = "Feature.Catalog.Action.Customize",
		shopText = "Feature.Avatar.Action.Marketplace"
	})(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithProviders(p2)
	end)
end

function AXTransitionSegmentedMenu.renderWithProviders(p1, p2)
	-- upvalues: RoactModule (copy), RoactGamepadModule (copy), SegmentedControl (copy), AvatarScreen (copy)
	local IsWIDE = p1.props.formFactor == "WIDE"
	
	return RoactModule.createElement(RoactGamepadModule.Focusable.Frame, {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		[RoactModule.Change.AbsoluteSize] = function(Frame)
			-- upvalues: p1 (copy)
			p1:absoluteSizeChanged(Frame)
		end
	}, {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		SegmentedControl = RoactModule.createElement(SegmentedControl, {
			width = UDim.new(0, p1.state.segmentedControlWidth),
			maxWidth = if IsWIDE then nil else 234,
			selectedTabIndex = if p1:getOpaquePage() == AvatarScreen.Catalog then 1 else 2,
			onTabActivated = p1.onTabActivated,
			tabs = {
				{ tabName = p2.shopText },
				{ tabName = p2.customizeText }
			}
		})
	})
end

function AXTransitionSegmentedMenu.absoluteSizeChanged(p1, Frame)
	p1:setState({
		segmentedControlWidth = if Frame.AbsoluteSize.X >= 234 then 234 else 224
	})
end

return (WithAvatarRouteModule((RoactNavigationModule.withNavigation((RoactServices.connect({
	avatarAnalytics = AnalyticsModule,
	catalogAnalytics = AnalyticsModule1
})((RoactRoduxModule.connect(function(p1, _)
	return { topBarHeight = p1.TopBar.topBarHeight }
end, nil)(AXTransitionSegmentedMenu))))))))