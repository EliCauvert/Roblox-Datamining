local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local TModule = require(CorePackages.Packages.t)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local WithAvatarRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute)
local WithOverlayFocusHandlingModule = require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local RoactFitComponents = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents
local FitFrameOnAxis = RoactFitComponents.FitFrameOnAxis
local FitTextLabel = RoactFitComponents.FitTextLabel
local Images = UIBloxModule.App.ImageSet.Images
local BaseMenu = UIBloxModule.App.Menu.BaseMenu
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local WithStyleFunction = UIBloxModule.Style.withStyle
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local WithTopBarSearchSignalModule = require(Modules.LuaApp.Context.withTopBarSearchSignal)
local FullView = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.FullView
local AnalyticsModule = require(Modules.AvatarExperience.Common.Services.Analytics)
local SetEntryPageModule = require(Modules.AvatarExperience.LayeredClothingSort.Actions.SetEntryPage)
local AppPageModule = require(Modules.LuaApp.AppPage)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local ComponentAssetsCircle17 = Images["component_assets/circle_17"]
local IconsMenuCustomize = Images["icons/menu/customize"]
local IconsMenuShop = Images["icons/menu/shop"]
local IconsMenuProfilepicture = Images["icons/menu/profilepicture"]
local IconsCommonSettings = Images["icons/common/settings"]
local IconsCommonSearch = Images["icons/common/search"]
local IconsActionsAdjust = Images["icons/actions/adjust"]
local IconsCommonGoldrobux = Images["icons/common/goldrobux"]
local IconsNavigationClose = Images["icons/navigation/close"]
local AvatarExperienceQuickMenu = RoactModule.PureComponent:extend("AvatarExperienceQuickMenu")
AvatarExperienceQuickMenu.validateProps = TModule.strictInterface({
	onOverlayClosed = TModule.optional(TModule.callback),
	defaultChildRef = TModule.optional(TModule.table),
	focusController = TModule.optional(TModule.table),
	manageOutfitsEnabled = TModule.boolean,
	isAvatarEditorSceneFullView = TModule.boolean,
	isCatalogSceneFullView = TModule.boolean,
	isProfilePictureEditorEmotesSceneFullView = TModule.boolean,
	isMySharedAvatarSceneFullView = TModule.boolean,
	purchaseRobux = TModule.callback,
	setEntryPage = TModule.callback,
	avatarExperienceAnalytics = TModule.table,
	navigation = TModule.table,
	avatarRoute = AvatarExperienceNavigationModule.AvatarRoute.AvatarRoute.Interface
})

function AvatarExperienceQuickMenu.init(p1)
	-- upvalues: NavigationUtilsModule (copy), AvatarScreen (copy), RoactModule (copy)
	function p1.onActivatedShop()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy), AvatarScreen (upval)
		NavigationUtilsModule.navigateFromOverlay(p1.props.navigation, AvatarScreen.Catalog)
	end
	
	function p1.onActivatedEditProfilePicture()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy), AvatarScreen (upval)
		NavigationUtilsModule.navigateFromOverlay(p1.props.navigation, AvatarScreen.ProfilePictureEditorEmotes, { prevNavPage = p1.props.avatarRoute.opaque.name })
	end
	
	function p1.onActivatedManage()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy), AvatarScreen (upval)
		NavigationUtilsModule.navigateFromOverlay(p1.props.navigation, AvatarScreen.ManageOutfitPage)
	end
	
	function p1.onActivatedCustomizeAvatar()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy), AvatarScreen (upval)
		NavigationUtilsModule.navigateFromOverlay(p1.props.navigation, AvatarScreen.AvatarEditor)
	end
	
	function p1.onActivatedRefinement()
		-- upvalues: p1 (copy), NavigationUtilsModule (upval), AvatarScreen (upval)
		p1.props.setEntryPage(p1.props.avatarRoute.opaque.name)
		NavigationUtilsModule.navigateFromOverlay(p1.props.navigation, AvatarScreen.LayeredClothingSort)
	end
	
	function p1.onActivatedBuyRobux()
		-- upvalues: p1 (copy)
		p1.closePrompt()
		p1.props.purchaseRobux()
	end
	
	function p1.closePrompt()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy)
		NavigationUtilsModule.closeOverlay(p1.props.navigation)
	end
	
	p1.sizeBinding, p1.updateSizeBinding = RoactModule.createBinding(UDim2.fromScale(0.35, 0.5))
	
	function p1.onContentSizeChanged(p2)
		-- upvalues: p1 (copy)
		p1.updateSizeBinding(UDim2.new(0.35, 0, 0, p2.AbsoluteContentSize.Y))
	end
end

function AvatarExperienceQuickMenu.gatherElements(p1, p2, p3)
	-- upvalues: AvatarScreen (copy), IconsMenuCustomize (copy), IconsMenuShop (copy), IconsMenuProfilepicture (copy), IconsCommonSettings (copy), IconsCommonSearch (copy), IconsActionsAdjust (copy), IconsCommonGoldrobux (copy), IconsNavigationClose (copy)
	local List = {}
	local Name = p1.props.avatarRoute.opaque.name
	
	if Name == AvatarScreen.AvatarExperienceLandingPage or Name == AvatarScreen.Catalog or Name == AvatarScreen.ProfilePictureEditorEmotes then
		table.insert(List, {
			icon = IconsMenuCustomize,
			text = p2.customizeAvatar,
			onActivated = p1.onActivatedCustomizeAvatar
		})
	end
	if Name == AvatarScreen.AvatarExperienceLandingPage or Name == AvatarScreen.AvatarEditor or Name == AvatarScreen.MySharedAvatars or Name == AvatarScreen.ProfilePictureEditorEmotes then
		table.insert(List, {
			icon = IconsMenuShop,
			text = p2.shop,
			onActivated = p1.onActivatedShop
		})
	end
	if Name == AvatarScreen.AvatarExperienceLandingPage or Name == AvatarScreen.AvatarEditor or Name == AvatarScreen.Catalog then
		table.insert(List, {
			icon = IconsMenuProfilepicture,
			text = p2.editProfilePicture,
			onActivated = p1.onActivatedEditProfilePicture
		})
	end
	if p1.props.manageOutfitsEnabled and Name == AvatarScreen.AvatarEditor then
		table.insert(List, {
			icon = IconsCommonSettings,
			text = p2.manage,
			onActivated = p1.onActivatedManage
		})
	end
	local IsAvatarEditorSceneFullView = p1.props.isAvatarEditorSceneFullView or (p1.props.isMySharedAvatarSceneFullView or (p1.props.isCatalogSceneFullView or p1.props.isProfilePictureEditorEmotesSceneFullView))
	
	if Name == AvatarScreen.Catalog and not IsAvatarEditorSceneFullView then
		table.insert(List, {
			icon = IconsCommonSearch,
			text = p2.search,
			onActivated = function()
				-- upvalues: p1 (copy), p3 (copy), Name (copy)
				p1.closePrompt()
				p3:fire(Name)
			end
		})
	end
	table.insert(List, {
		icon = IconsActionsAdjust,
		text = p2.avatarAdjustment,
		onActivated = p1.onActivatedRefinement
	})
	table.insert(List, {
		icon = IconsCommonGoldrobux,
		text = p2.buyRobux,
		onActivated = p1.onActivatedBuyRobux
	})
	table.insert(List, {
		icon = IconsNavigationClose,
		text = p2.cancel,
		onActivated = p1.closePrompt
	})
	
	return List
end

function AvatarExperienceQuickMenu.renderWithProviders(p1, p2, p3, p4)
	-- upvalues: AvatarScreen (copy), RoactModule (copy), Focusable (copy), ImageSetLabel (copy), ComponentAssetsCircle17 (copy), FitFrameOnAxis (copy), FitTextLabel (copy), BaseMenu (copy)
	local _Font = p3.Font
	local Theme = p3.Theme
	local Name = p1.props.avatarRoute.current.name
	
	return RoactModule.createElement(Focusable[ImageSetLabel], {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = p1.sizeBinding,
		Position = UDim2.fromScale(0.5, 0.5),
		BackgroundTransparency = 1,
		Image = ComponentAssetsCircle17,
		ImageColor3 = Theme.BackgroundUIDefault.Color,
		ImageTransparency = Theme.BackgroundUIDefault.Transparency,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(8, 8, 9, 9),
		[RoactModule.Ref] = p1.props.defaultChildRef
	}, {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 20),
			[RoactModule.Change.AbsoluteContentSize] = p1.onContentSizeChanged
		}),
		UIPadding = RoactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 20) }),
		TextContainer = RoactModule.createElement(FitFrameOnAxis, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			axis = FitFrameOnAxis.Axis.Both,
			margin = { top = 0, bottom = 0, left = 20, right = 0 }
		}, {
			TitleText = RoactModule.createElement(FitTextLabel, {
				BackgroundTransparency = 1,
				width = FitTextLabel.Width.FitToText,
				Text = if Name == AvatarScreen.AvatarExperienceLandingPage then p2.avatarOptions elseif Name == AvatarScreen.AvatarEditor then p2.customizeOptions else p2.shopOptions,
				Font = _Font.Header1.Font,
				TextSize = _Font.BaseSize * _Font.Header1.RelativeSize,
				TextColor3 = Theme.TextEmphasis.Color,
				TextTransparency = Theme.TextEmphasis.Transparency
			})
		}),
		BaseMenu = RoactModule.createElement(BaseMenu, {
			layoutOrder = 2,
			topElementRounded = false,
			buttonProps = p1:gatherElements(p2, p4)
		})
	})
end

function AvatarExperienceQuickMenu.render(p1)
	-- upvalues: WithLocalizationFunction (copy), WithStyleFunction (copy), WithTopBarSearchSignalModule (copy)
	return WithLocalizationFunction({
		avatarOptions = "Feature.Avatar.Label.QuickMenuLandingPageTitle",
		shopOptions = "Feature.Catalog.Label.QuickMenuMarketplaceTitle",
		customizeOptions = "Feature.Avatar.Label.QuickMenuCustomizeTitle",
		shop = "Feature.Avatar.Action.Marketplace",
		manage = "Feature.Avatar.Label.ManageItems",
		customizeAvatar = "Feature.Catalog.Label.CustomizeAvatar",
		editProfilePicture = "Feature.Avatar.Action.EditProfilePicture",
		search = "Feature.Catalog.Label.Search",
		buyRobux = "Feature.Catalog.Label.BuyRobux",
		cancel = "Feature.Catalog.Action.Cancel",
		avatarAdjustment = "Feature.Avatar.Label.AvatarAdjustment"
	})(function(p2)
		-- upvalues: WithStyleFunction (upval), WithTopBarSearchSignalModule (upval), p1 (copy)
		return WithStyleFunction(function(p3)
			-- upvalues: WithTopBarSearchSignalModule (upval), p1 (upval), p2 (copy)
			return WithTopBarSearchSignalModule(function(p4)
				-- upvalues: p1 (upval), p2 (upval), p3 (copy)
				return p1:renderWithProviders(p2, p3, p4)
			end)
		end)
	end)
end

return (WithAvatarRouteModule((WithOverlayFocusHandlingModule((RoactServices.connect({ avatarExperienceAnalytics = AnalyticsModule })((RoactRoduxModule.connect(function(p1, _)
	-- upvalues: UtilsModule (copy), AvatarScreen (copy), FullView (copy)
	return {
		manageOutfitsEnabled = UtilsModule.getAvatarEditorCategoryInfoFromState(p1).ManageOutfitsEnabled == true,
		isAvatarEditorSceneFullView = p1.AvatarExperience.Common.FullView[AvatarScreen.AvatarEditor] == FullView.SceneFullView,
		isCatalogSceneFullView = p1.AvatarExperience.Common.FullView[AvatarScreen.Catalog] == FullView.SceneFullView,
		isProfilePictureEditorEmotesSceneFullView = p1.AvatarExperience.Common.FullView[AvatarScreen.ProfilePictureEditorEmotes] == FullView.SceneFullView,
		isMySharedAvatarSceneFullView = p1.AvatarExperience.Common.FullView[AvatarScreen.MySharedAvatars] == FullView.SceneFullView
	}
end, function(Callback)
	-- upvalues: AppPageModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy), SetEntryPageModule (copy)
	return {
		purchaseRobux = function()
			-- upvalues: AppPageModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
			local config = { name = AppPageModule.PurchaseRobux }
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			else
				Callback(NavigateDownModule(config))
			end
		end,
		setEntryPage = function(p1)
			-- upvalues: Callback (copy), SetEntryPageModule (upval)
			Callback(SetEntryPageModule(p1))
		end
	}
end)(AvatarExperienceQuickMenu))))))))