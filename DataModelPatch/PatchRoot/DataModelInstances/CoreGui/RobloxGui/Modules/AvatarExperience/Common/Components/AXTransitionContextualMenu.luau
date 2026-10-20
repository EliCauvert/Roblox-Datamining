local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local BaseMenu = UIBloxModule.App.Menu.BaseMenu
local WithStyleFunction = UIBloxModule.Style.withStyle
local Images = UIBloxModule.App.ImageSet.Images
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local AnalyticsModule1 = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local AnalyticsModule2 = require(Modules.AvatarExperience.ProfilePictureEditor.Services.Analytics)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local WithMappedNavigationParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local WithOverlayFocusHandlingModule = require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)
local WithAvatarRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local NavOverlayContainerModule = require(Modules.AvatarExperience.Common.Components.NavOverlayContainer)
local FFlagAXFixContextualMenuScrimSize = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXFixContextualMenuScrimSize
local IconsMenuCustomize = Images["icons/menu/customize"]
local IconsMenuShop = Images["icons/menu/shop"]
local IconsMenuProfilepicture = Images["icons/menu/profilepicture"]
local AXTransitionContextualMenu = RoactModule.PureComponent:extend("AXTransitionContextualMenu")
AXTransitionContextualMenu.validateProps = TModule.strictInterface({
	defaultChildRef = TModule.optional(TModule.table),
	onOverlayClosed = TModule.optional(TModule.callback),
	focusController = TModule.optional(TModule.table),
	navigation = TModule.table,
	avatarRoute = AvatarExperienceNavigationModule.AvatarRoute.AvatarRoute.Interface,
	screenSize = TModule.Vector2,
	globalGuiInset = TModule.strictInterface({
		left = TModule.integer,
		top = TModule.integer,
		right = TModule.integer,
		bottom = TModule.integer
	}),
	topBarHeight = TModule.number,
	avatarAnalytics = TModule.table,
	catalogAnalytics = TModule.table,
	profilePictureEditorAnalytics = TModule.table,
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	[RoactModule.Ref] = TModule.optional(TModule.table),
	inputBindings = TModule.optional(TModule.table)
})

function AXTransitionContextualMenu.getOpaquePage(p1)
	return p1.props.avatarRoute.opaque.name
end

function AXTransitionContextualMenu.init(p1)
	-- upvalues: RoactModule (copy), AvatarScreen (copy), NavigationUtilsModule (copy)
	p1.contextMenuSize, p1.updateContextMenuSize = RoactModule.createBinding(UDim2.fromScale(1, 1))
	
	function p1.onAbsoluteSizeChanged(Frame)
		-- upvalues: p1 (copy)
		if Frame.AbsoluteSize.X > 640 then
			p1.updateContextMenuSize((UDim2.new(0, 350, 1, 0)))
			
			return
		else
			p1.updateContextMenuSize(UDim2.fromScale(1, 1))
		end
	end
	
	function p1.goToAvatarEditorPage()
		-- upvalues: p1 (copy), AvatarScreen (upval), NavigationUtilsModule (upval)
		if p1:getOpaquePage() ~= AvatarScreen.AvatarEditor then
			NavigationUtilsModule.navigateFromOverlay(p1.props.navigation, AvatarScreen.AvatarEditor)
			p1.props.avatarAnalytics.catalogToAvatarButton()
		end
	end
	
	function p1.goToCatalogPage()
		-- upvalues: p1 (copy), AvatarScreen (upval), NavigationUtilsModule (upval)
		if p1:getOpaquePage() ~= AvatarScreen.Catalog then
			NavigationUtilsModule.navigateFromOverlay(p1.props.navigation, AvatarScreen.Catalog)
			p1.props.catalogAnalytics.avatarToCatalogButton()
		end
	end
	
	function p1.goToProfilePictureEditorPage()
		-- upvalues: p1 (copy), AvatarScreen (upval), NavigationUtilsModule (upval)
		if p1:getOpaquePage() ~= AvatarScreen.ProfilePictureEditorEmotes then
			NavigationUtilsModule.navigateFromOverlay(p1.props.navigation, AvatarScreen.ProfilePictureEditorEmotes)
		end
		p1.props.profilePictureEditorAnalytics.profilePictureEditorButton()
	end
	
	function p1.onDismiss()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy)
		NavigationUtilsModule.closeOverlay(p1.props.navigation)
	end
end

function AXTransitionContextualMenu.render(p1)
	-- upvalues: WithStyleFunction (copy), WithLocalizationFunction (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: WithLocalizationFunction (upval), p1 (copy)
		return WithLocalizationFunction({
			customizeText = "Feature.Catalog.Action.Customize",
			shopText = "Feature.Avatar.Action.Marketplace",
			profilePictureEditorText = "Feature.Avatar.Action.EditProfilePicture"
		})(function(p3)
			-- upvalues: p1 (upval), p2 (copy)
			return p1:renderWithProviders(p2, p3)
		end)
	end)
end

function AXTransitionContextualMenu.renderWithProviders(p1, p2, p3)
	-- upvalues: RoactModule (copy), FFlagAXFixContextualMenuScrimSize (copy), NavOverlayContainerModule (copy), BaseMenu (copy), IconsMenuCustomize (copy), AvatarScreen (copy), IconsMenuShop (copy), IconsMenuProfilepicture (copy)
	local Theme = p2.Theme
	
	return RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
		Background = RoactModule.createElement("TextButton", {
			ZIndex = 1,
			Text = "",
			BorderSizePixel = 0,
			BackgroundColor3 = Theme.Overlay.Color,
			BackgroundTransparency = Theme.Overlay.Transparency,
			AutoButtonColor = false,
			Position = UDim2.fromOffset(-p1.props.globalGuiInset.left, -p1.props.globalGuiInset.top),
			Size = if FFlagAXFixContextualMenuScrimSize then UDim2.fromOffset(p1.props.screenSize.X + p1.props.globalGuiInset.left + p1.props.globalGuiInset.right, p1.props.screenSize.Y + p1.props.globalGuiInset.top + p1.props.globalGuiInset.bottom) else UDim2.fromOffset(p1.props.screenSize.X, p1.props.screenSize.Y),
			[RoactModule.Event.Activated] = p1.onDismiss
		}),
		Container = RoactModule.createElement(NavOverlayContainerModule, {
			ZIndex = 2,
			onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged
		}, {
			SizeFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = p1.contextMenuSize,
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.fromScale(0.5, 0),
				[RoactModule.Ref] = p1.props.defaultChildRef
			}, {
				Menu = RoactModule.createElement(BaseMenu, {
					anchorPoint = Vector2.new(0.5, 0),
					position = UDim2.new(0.5, 0, 0, p1.props.topBarHeight),
					buttonProps = {
						{
							icon = IconsMenuCustomize,
							text = p3.customizeText,
							onActivated = p1.goToAvatarEditorPage,
							selected = p1:getOpaquePage() == AvatarScreen.AvatarEditor
						},
						{
							icon = IconsMenuShop,
							text = p3.shopText,
							onActivated = p1.goToCatalogPage,
							selected = p1:getOpaquePage() == AvatarScreen.Catalog
						},
						{
							icon = IconsMenuProfilepicture,
							text = p3.profilePictureEditorText,
							onActivated = p1.goToProfilePictureEditorPage,
							selected = p1:getOpaquePage() == AvatarScreen.ProfilePictureEditorEmotes
						}
					}
				})
			})
		})
	})
end

return (WithMappedNavigationParamsModule((WithAvatarRouteModule((WithOverlayFocusHandlingModule((RoactServices.connect({
	avatarAnalytics = AnalyticsModule,
	catalogAnalytics = AnalyticsModule1,
	profilePictureEditorAnalytics = AnalyticsModule2
})((RoactRoduxModule.connect(function(p1, _)
	return {
		screenSize = p1.ScreenSize,
		topBarHeight = p1.TopBar.topBarHeight,
		globalGuiInset = p1.GlobalGuiInset
	}
end, nil)(AXTransitionContextualMenu))))))))))