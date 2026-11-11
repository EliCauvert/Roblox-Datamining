local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local TModule = require(CorePackages.Packages.t)
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local Focusable = RoactGamepadModule.Focusable
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local CryoModule = require(CorePackages.Packages.Cryo)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local WithStackVisibilityWrapperModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local ConstantsModule = require(Modules.AvatarExperience.AvatarRefinement.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local AnalyticsModule = require(Modules.AvatarExperience.Common.Services.Analytics)
local AccessoryAdjustmentUtilsModule = require(Modules.AvatarExperience.AccessoryAdjustment.AccessoryAdjustmentUtils)
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local SceneInteractionFrameModule = require(Modules.AvatarExperience.Common.Components.Scene.SceneInteractionFrame)
local SetFullViewModule = require(Modules.AvatarExperience.Common.Thunks.SetFullView)
local SelectIsFullViewModule = require(Modules.AvatarExperience.Common.Selectors.selectIsFullView)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseAppliedDescriptionValueContextModule = require(Modules.AvatarExperience.Common.Context.AppliedDescription.useAppliedDescriptionValueContext)
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local RefinementNavBarModule = require(Modules.AvatarExperience.AvatarRefinement.Components.RefinementNavBar)
local VerticalDrawerModule = require(Modules.AvatarExperience.AccessoryAdjustment.Components.VerticalDrawer)
local GamepadFocusHandlerForPageModule = require(Modules.AvatarExperience.Common.Components.GamepadFocusHandlerForPage)
local FullView = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.FullView
local RefinementControlBarModule = require(Modules.AvatarExperience.AvatarRefinement.Components.RefinementControlBar)
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagAXMigrateAdjustAccessoryViewToFocusNavigation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAdjustAccessoryViewToFocusNavigation
local IconsMenuAboutLarge = UIBloxModule.App.ImageSet.Images["icons/menu/about_large"]
local AccessoryAdjustmentPage = RoactModule.PureComponent:extend("AccessoryAdjustmentPage")
AccessoryAdjustmentPage.validateProps = TModule.strictInterface({
	tokens = if FFlagAXMigrateAdjustAccessoryViewToFocusNavigation then TModule.table else nil,
	fullView = TModule.userdata,
	isPortrait = TModule.boolean,
	setFullView = TModule.callback,
	noAccessoriesEquipped = TModule.boolean,
	avatarExperienceAnalytics = TModule.table,
	avatarRoute = TModule.table,
	navigation = TModule.table
})

function AccessoryAdjustmentPage.init(p1)
	-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (copy), RoactGamepadModule (copy), RoactModule (copy), FullView (copy), TopBarModule (copy)
	p1.focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactGamepadModule.createFocusController()
	p1.verticalDrawerRef = RoactModule.createRef()
	p1.topBarRef = RoactModule.createRef()
	p1.adjustmentButtonRef = RoactModule.createRef()
	p1.refinementNavBarRef = RoactModule.createRef()
	p1.props.setFullView(p1.props.avatarExperienceAnalytics, FullView.SceneFullView)
	p1.backButtonComponent = TopBarModule.makeBackButton(function()
		-- upvalues: p1 (copy)
		p1.props.navigation.pop()
	end)
end

function AccessoryAdjustmentPage.renderTopBar(p1)
	-- upvalues: WithLocalizationFunction (copy), RoactModule (copy), TopBarModule (copy)
	local IsPortrait = p1.props.isPortrait
	
	return WithLocalizationFunction({
		titleText = "Feature.Avatar.Heading.AccessoryAdjustmentTitle"
	})(function(p2)
		-- upvalues: RoactModule (upval), TopBarModule (upval), p1 (copy), IsPortrait (copy)
		return RoactModule.createElement(TopBarModule.Container, {
			transparentBackground = true,
			titleText = p2.titleText,
			NextSelectionDown = p1.adjustmentButtonRef,
			hideSiteMessageBanner = IsPortrait,
			leftItem = p1.backButtonComponent,
			ref = p1.topBarRef
		})
	end)
end

function AccessoryAdjustmentPage.renderWithProviders(p1, p2, p3)
	-- upvalues: RoactModule (copy), SceneInteractionFrameModule (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), RefinementControlBarModule (copy), RefinementNavBarModule (copy), VerticalDrawerModule (copy), ConstantsModule (copy), FFlagAXMigrateAdjustAccessoryViewToFocusNavigation (copy), ImageSetLabel (copy), IconsMenuAboutLarge (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), GamepadFocusHandlerForPageModule (copy), Focusable (copy)
	local _Font = p2.Font
	local Theme = p2.Theme
	
	return RoactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		ZIndex = 2,
		Size = UDim2.fromScale(1, 1),
		focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.focusController,
		defaultChild = p1.verticalDrawerRef
	}, {
		SceneInteractionFrame = RoactModule.createElement(SceneInteractionFrameModule),
		TopBar = p1:renderTopBar(),
		RefinementNavBar = RoactModule.createElement(if GetFFlagAXEnableSlotBasedEditorModule() then RefinementControlBarModule else RefinementNavBarModule, {
			NextSelectionRight = p1.verticalDrawerRef,
			NextSelectionUp = p1.topBarRef,
			ref = p1.refinementNavBarRef
		}),
		VerticalDrawer = if p1.props.noAccessoriesEquipped then nil else RoactModule.createElement(VerticalDrawerModule, {
			ref = p1.verticalDrawerRef,
			NextSelectionLeft = p1.refinementNavBarRef
		}),
		NoAccessoriesWarning = if p1.props.noAccessoriesEquipped then RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 0, 1, ConstantsModule.NoItem.BottomPadding),
			Size = UDim2.new(1, 0, 0, 100)
		}, {
			Label = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				AutomaticSize = Enum.AutomaticSize.XY,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromScale(0, 0),
				Text = p3.noAccessoriesText,
				Font = _Font.CaptionHeader.Font,
				TextSize = if FFlagAXMigrateAdjustAccessoryViewToFocusNavigation then p1.props.tokens.Typography.BodyMedium.FontSize else ConstantsModule.NoItem.TextSize,
				TextColor3 = Theme.IconEmphasis.Color,
				TextXAlignment = Enum.TextXAlignment.Left
			}, {
				Icon = RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Image = IconsMenuAboutLarge,
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.new(0, -2, 0.5, 0),
					Size = UDim2.fromOffset(ConstantsModule.NoItem.IconSize, ConstantsModule.NoItem.IconSize),
					ImageColor3 = Theme.IconEmphasis.Color
				})
			})
		}) else nil,
		GamepadFocusHandlerForPage = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactModule.createElement(GamepadFocusHandlerForPageModule, {
			captureFocusOnMount = true,
			focusController = p1.focusController
		})
	})
end

function AccessoryAdjustmentPage.render(p1)
	-- upvalues: WithStyleFunction (copy), WithLocalizationFunction (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: WithLocalizationFunction (upval), p1 (copy)
		return WithLocalizationFunction({
			noAccessoriesText = "Feature.Avatar.Message.NoAccessoriesEquipped"
		})(function(p3)
			-- upvalues: p1 (upval), p2 (copy)
			return p1:renderWithProviders(p2, p3)
		end)
	end)
end

local WithStackVisibilityWrapperModuleResult = WithStackVisibilityWrapperModule((RoactServices.connect({ avatarExperienceAnalytics = AnalyticsModule })((RoactRoduxModule.connect(function(p1, _)
	-- upvalues: DeviceOrientationMode (copy), SelectIsFullViewModule (copy), AvatarScreen (copy)
	return {
		isPortrait = p1.DeviceOrientation == DeviceOrientationMode.Portrait,
		fullView = SelectIsFullViewModule(p1, AvatarScreen.AccessoryAdjustment)
	}
end, function(Callback)
	-- upvalues: SetFullViewModule (copy), AvatarScreen (copy)
	return {
		setFullView = function(p1, p2)
			-- upvalues: Callback (copy), SetFullViewModule (upval), AvatarScreen (upval)
			Callback(SetFullViewModule(p1, AvatarScreen.AccessoryAdjustment, p2))
		end
	}
end)(AccessoryAdjustmentPage)))))

local function selectAllowedAATypes(p1)
	-- upvalues: ConstantsModule1 (copy)
	return p1.AvatarExperience.AvatarEditor.AvatarSettings[ConstantsModule1.AvatarSettings.accessoryRefinementTypes]
end

return function(JoinResult)
	-- upvalues: UseAppliedDescriptionValueContextModule (copy), FFlagAXMigrateAdjustAccessoryViewToFocusNavigation (copy), UseTokensFunction (copy), CryoModule (copy), UseSelectorFunction (copy), selectAllowedAATypes (copy), AccessoryAdjustmentUtilsModule (copy), ReactModule (copy), WithStackVisibilityWrapperModuleResult (ref)
	local Value = UseAppliedDescriptionValueContextModule().appliedDescriptionBinding:getValue()
	
	if FFlagAXMigrateAdjustAccessoryViewToFocusNavigation then
		JoinResult = CryoModule.Dictionary.join(JoinResult, { tokens = UseTokensFunction() })
	end
	if Value then
		JoinResult = CryoModule.Dictionary.join(JoinResult, {
			noAccessoriesEquipped = CryoModule.isEmpty((AccessoryAdjustmentUtilsModule.getAdjustableAccessories(Value, (UseSelectorFunction(selectAllowedAATypes)))))
		})
	end
	return ReactModule.createElement(WithStackVisibilityWrapperModuleResult, JoinResult)
end