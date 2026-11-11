local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local TextService = game:GetService("TextService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local ReactModule = require(CorePackages.Packages.React)
local TModule = require(CorePackages.Packages.t)
local OtterModule = require(CorePackages.Packages.Otter)
local CameraUtility = require(CorePackages.Packages.Thumbnailing).CameraUtility
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local UseFocusGuiObjectFunction = ReactFocusNavigationModule.useFocusGuiObject
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local GetSafeAreaSizeFunction = require(CorePackages.Workspace.Packages.InputUi).getSafeAreaSize
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local WithMappedNavigationParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local PeekabooWidgetModule = require(Modules.AvatarExperience.ProfilePictureEditor.Components.PeekabooWidget)
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local UseTableWrappedCallbackRefFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef
local WithStackVisibilityWrapperModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local ProfilePictureEditorBottomBarModule = require(Modules.AvatarExperience.ProfilePictureEditor.Components.ProfilePictureEditorBottomBar)
local ConstantsModule = require(Modules.AvatarExperience.ProfilePictureEditor.Constants)
local PPEThumbnailTypeModule = require(Modules.AvatarExperience.ProfilePictureEditor.PPEThumbnailType)
local UtilsModule = require(Modules.AvatarExperience.ProfilePictureEditor.Utils)
local WritePPEConfigModule = require(Modules.AvatarExperience.ProfilePictureEditor.Thunks.WritePPEConfig)
local SetFinalPageViewModeModule = require(Modules.AvatarExperience.ProfilePictureEditor.Actions.SetFinalPageViewMode)
local AnalyticsModule = require(Modules.AvatarExperience.ProfilePictureEditor.Services.Analytics)
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local BottomInsetBackgroundModule = require(Modules.AvatarExperience.Common.Components.BottomInsetBackground)
local UseUiModeInfoFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local InsetBackground = require(CorePackages.Workspace.Packages.AppBlox).InsetBackground
local FFlagAXF10ftFixPeekabooWidgetModule = require(Modules.AvatarExperience.Flags.FFlagAXF10ftFixPeekabooWidget)
local AXMigrateProfilePictureEditorFinalPageToFocusNavigation = game:DefineFastFlag("AXMigrateProfilePictureEditorFinalPageToFocusNavigation", false)
local FFlagAXOpaqueMarketplaceTopbar = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXOpaqueMarketplaceTopbar
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local ButtonStack = UIBloxModule.App.Button.ButtonStack
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local WithStyleFunction = UIBloxModule.Style.withStyle
local config = {
	dampingRatio = 1,
	frequency = 1 / ConstantsModule.FullscreenTweenTimeSeconds
}
local config1 = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

local function useFocusNavigationBindings(p1, Callback)
	-- upvalues: ReactFocusNavigationModule (copy), config1 (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), Callback (copy)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p2)
					-- upvalues: Callback (upval)
					p2.cancelled = true
					Callback()
				end)
			}
		}
	end, { Callback }), (ReactFocusNavigationModule.useEventMap(config1, p1)))
end

local ProfilePictureEditorFinalPage = RoactModule.PureComponent:extend("ProfilePictureEditorFinalPage")
ProfilePictureEditorFinalPage.validateProps = TModule.strictInterface({
	avatarRoute = TModule.table,
	resolvedFocusNavigationRef = if AXMigrateProfilePictureEditorFinalPageToFocusNavigation then TModule.table else nil,
	topBarRef = if AXMigrateProfilePictureEditorFinalPageToFocusNavigation then TModule.table else nil,
	globalGuiInset = TModule.strictInterface({
		left = TModule.integer,
		top = TModule.integer,
		right = TModule.integer,
		bottom = TModule.integer
	}),
	screenSize = TModule.Vector2,
	fieldOfViewDeg = TModule.optional(TModule.number),
	zoomSliderValue = TModule.number,
	rotateSliderValue = TModule.number,
	emoteAssetId = TModule.optional(TModule.string),
	finalPageViewMode = TModule.userdata,
	currentCharacter = TModule.optional(TModule.instanceIsA("Model", nil)),
	equippedAssets = TModule.optional(TModule.table),
	isPortrait = TModule.boolean,
	writePPEConfig = TModule.callback,
	setFinalPageViewMode = TModule.callback,
	navigation = TModule.table,
	networking = TModule.callback,
	profilePictureEditorAnalytics = TModule.table,
	is10ftUI = TModule.boolean
})

function ProfilePictureEditorFinalPage.init(p1)
	-- upvalues: AXMigrateProfilePictureEditorFinalPageToFocusNavigation (copy), RoactModule (copy), AvatarScreen (copy), PPEThumbnailTypeModule (copy), OtterModule (copy)
	if not AXMigrateProfilePictureEditorFinalPageToFocusNavigation then
		p1.topBarRef = RoactModule.createRef()
	end
	p1.bottomBarRef = RoactModule.createRef()
	p1.toggleFullViewButtonRef = RoactModule.createRef()
	
	function p1.goBack()
		-- upvalues: p1 (copy)
		p1.props.navigation.goBack()
	end
	
	function p1.onSave()
		-- upvalues: p1 (copy), AvatarScreen (upval)
		p1:writePPEConfig()
		p1.props.navigation.navigate(if p1.props.is10ftUI then AvatarScreen.AvatarExperienceLandingPage else AvatarScreen.Catalog)
	end
	
	function p1.toggleFinalPageViewMode()
		-- upvalues: p1 (copy), PPEThumbnailTypeModule (upval)
		p1.props.setFinalPageViewMode(if p1.props.finalPageViewMode == PPEThumbnailTypeModule.Closeup then PPEThumbnailTypeModule.FullBody else PPEThumbnailTypeModule.Closeup)
	end
	
	p1:setState({ isAnimating = false })
	p1.animationBinding, p1.animationBindingUpdate = RoactModule.createBinding(0)
	p1.sizeBinding = p1.animationBinding:map(function(p2: number): UDim2
		return UDim2.fromScale(1 + p2, 1 + p2)
	end)
	p1.motor = OtterModule.createSingleMotor(0)
	p1.motor:onStep(p1.animationBindingUpdate)
	p1.motor:onComplete(function()
		-- upvalues: p1 (copy)
		p1:setState({ isAnimating = false })
	end)
end

function ProfilePictureEditorFinalPage.writePPEConfig(p1)
	-- upvalues: UtilsModule (copy)
	p1.props.writePPEConfig(p1.props.networking, p1.props.profilePictureEditorAnalytics, p1.props.emoteAssetId, UtilsModule.getCameraDistanceScaleFromSliderValue(p1.props.zoomSliderValue), UtilsModule.getYRotDegFromSliderValue(p1.props.rotateSliderValue), p1.props.fieldOfViewDeg)
end

function ProfilePictureEditorFinalPage.renderBottomContents(p1, p2, p3)
	-- upvalues: GetSafeAreaSizeFunction (copy), TextService (copy), PPEThumbnailTypeModule (copy), RoactModule (copy), Focusable (copy), AXMigrateProfilePictureEditorFinalPageToFocusNavigation (copy), ButtonStack (copy), ButtonType (copy)
	local Theme = p3.Theme
	local _Font = p3.Font
	local BaseSize = _Font.BaseSize
	local ScaledRelativeSize = _Font.Header1.RelativeSize * BaseSize
	local HeaderFont = _Font.Header1.Font
	local SafeAreaSize = GetSafeAreaSizeFunction(p1.props.screenSize, p1.props.globalGuiInset)
	local ScaledRelativeSize1 = _Font.Header2.RelativeSize * BaseSize
	local HeaderFont1 = _Font.Header2.Font
	local SwitchToFullBody = if p1.props.finalPageViewMode == PPEThumbnailTypeModule.Closeup then p2.switchToFullBody else p2.switchToCloseup
	local TextSize = TextService:GetTextSize(SwitchToFullBody, ScaledRelativeSize1, HeaderFont1, Vector2.new(SafeAreaSize.X.Offset - 20 - 20, 10000))
	
	return RoactModule.createFragment({
		ListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0.0625, 0)
		}),
		ContentTopPadding = RoactModule.createElement("UIPadding", { PaddingTop = UDim.new(0.0625, 0) }),
		ButtonFrame = RoactModule.createElement(Focusable.Frame, {
			Size = UDim2.new(0, TextSize.X + 20, 0, TextSize.Y + 17),
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			[RoactModule.Ref] = p1.toggleFullViewButtonRef,
			NextSelectionUp = if AXMigrateProfilePictureEditorFinalPageToFocusNavigation then p1.props.topBarRef else p1.topBarRef,
			NextSelectionDown = p1.bottomBarRef
		}, {
			ButtonStack = RoactModule.createElement(ButtonStack, {
				buttonHeight = TextSize.Y + 17,
				buttons = {
					{
						buttonType = ButtonType.Secondary,
						props = {
							onActivated = p1.toggleFinalPageViewMode,
							text = SwitchToFullBody
						}
					}
				}
			})
		}),
		Header1TextLabel = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, ScaledRelativeSize),
			Font = HeaderFont,
			TextColor3 = Theme.TextEmphasis.Color,
			Text = p2.finalHeader,
			TextSize = ScaledRelativeSize,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		}),
		Header2TextLabel = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			RichText = true,
			TextWrapped = true,
			LayoutOrder = 3,
			Size = UDim2.new(0.9, 0, 0, TextService:GetTextSize(p2.finalContent, ScaledRelativeSize1, HeaderFont1, Vector2.new(SafeAreaSize.X.Offset * 0.9, 10000)).Y),
			Font = HeaderFont1,
			TextColor3 = Theme.TextEmphasis.Color,
			Text = p2.finalContent,
			TextSize = ScaledRelativeSize1,
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		})
	})
end

function ProfilePictureEditorFinalPage.renderMiddleContents(p1, p2)
	-- upvalues: PPEThumbnailTypeModule (copy), RoactModule (copy), ImageSetLabel (copy), ConstantsModule (copy)
	local Theme = p2.Theme
	
	return if p1.props.finalPageViewMode == PPEThumbnailTypeModule.Closeup or p1.state.isAnimating then RoactModule.createElement(ImageSetLabel, {
		BackgroundTransparency = 1,
		ZIndex = 4,
		Size = p1.sizeBinding,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Image = ConstantsModule.CircleCutoutAsset,
		ImageColor3 = Theme.BackgroundDefault.Color
	}) else nil
end

function ProfilePictureEditorFinalPage.renderWithProviders(p1, p2, p3)
	-- upvalues: GetSafeAreaSizeFunction (copy), RoactModule (copy), Focusable (copy), FFlagAXF10ftFixPeekabooWidgetModule (copy), AXMigrateProfilePictureEditorFinalPageToFocusNavigation (copy), TopBarModule (copy), FFlagAXOpaqueMarketplaceTopbar (copy), FFlagEnableLeftNavOnConsole (copy), PeekabooWidgetModule (copy), ProfilePictureEditorBottomBarModule (copy), BottomInsetBackgroundModule (copy), InsetBackground (copy)
	local GlobalGuiInset = p1.props.globalGuiInset
	local SafeAreaSize = GetSafeAreaSizeFunction(p1.props.screenSize, GlobalGuiInset)
	local IsPortrait = p1.props.isPortrait
	local IsBottomAbove = GlobalGuiInset.bottom > 0
	
	return RoactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = if FFlagAXF10ftFixPeekabooWidgetModule then UDim2.fromScale(1, 1) else SafeAreaSize,
		Position = UDim2.new(0, 0, 0, 0),
		Active = true,
		defaultChild = p1.bottomBarRef,
		[RoactModule.Ref] = if AXMigrateProfilePictureEditorFinalPageToFocusNavigation then p1.props.resolvedFocusNavigationRef else p1.props[RoactModule.Ref]
	}, {
		SimpleTopBar = RoactModule.createElement(TopBarModule.Container, {
			titleText = p2.title,
			[RoactModule.Ref] = if AXMigrateProfilePictureEditorFinalPageToFocusNavigation then p1.props.topBarRef else p1.topBarRef,
			NextSelectionDown = p1.toggleFullViewButtonRef,
			transparentBackground = not FFlagAXOpaqueMarketplaceTopbar and not FFlagEnableLeftNavOnConsole or (if IsPortrait then true else false),
			hideSiteMessageBanner = IsPortrait,
			leftItem = TopBarModule.BackButton
		}),
		PeekabooWidget = RoactModule.createElement(PeekabooWidgetModule, {
			viewportYScale = 0.375,
			viewportXScale = 0.8,
			topMarginYScale = 0.2,
			renderBottomContents = function()
				-- upvalues: p1 (copy), p2 (copy), p3 (copy)
				return p1:renderBottomContents(p2, p3)
			end,
			renderMiddleContents = function()
				-- upvalues: p1 (copy), p3 (copy)
				return p1:renderMiddleContents(p3)
			end
		}),
		BottomBar = RoactModule.createElement(ProfilePictureEditorBottomBarModule, {
			baseRef = p1.bottomBarRef,
			NextSelectionUp = p1.toggleFullViewButtonRef,
			button1 = {
				textKey = "Authentication.CrossDevice.Action.GoBack",
				onActivated = p1.goBack
			},
			button2 = {
				textKey = "Feature.Avatar.Action.Save",
				isDisabled = p1.props.fieldOfViewDeg == nil,
				onActivated = p1.onSave
			}
		}),
		BottomInsetBackground = if FFlagEnableLeftNavOnConsole then nil elseif IsBottomAbove then RoactModule.createElement(BottomInsetBackgroundModule, { globalGuiInset = GlobalGuiInset }) else nil,
		InsetBackground = if FFlagEnableLeftNavOnConsole then RoactModule.createElement(InsetBackground, {
			directions = { left = true, top = true, right = true, bottom = true }
		}) else nil
	})
end

function ProfilePictureEditorFinalPage.render(p1)
	-- upvalues: WithLocalizationFunction (copy), WithStyleFunction (copy)
	return WithLocalizationFunction({
		title = "Feature.Avatar.Label.PPEFinalHeader",
		finalHeader = "Feature.Avatar.Label.PPEFinalSubheader",
		finalContent = "Feature.Avatar.Label.PPEFinalBody",
		switchToFullBody = "Feature.Avatar.Label.PPEViewFullButton",
		switchToCloseup = "Feature.Avatar.Label.PPEViewCloseupButton"
	})(function(p2)
		-- upvalues: WithStyleFunction (upval), p1 (copy)
		return WithStyleFunction(function(p3)
			-- upvalues: p1 (upval), p2 (copy)
			return p1:renderWithProviders(p2, p3)
		end)
	end)
end

function ProfilePictureEditorFinalPage.didUpdate(p1, p2, _)
	-- upvalues: PPEThumbnailTypeModule (copy), OtterModule (copy), config (copy)
	local v1: number? = nil
	
	if p2.finalPageViewMode == PPEThumbnailTypeModule.Closeup and p1.props.finalPageViewMode == PPEThumbnailTypeModule.FullBody then
		v1 = 1
	elseif p2.finalPageViewMode == PPEThumbnailTypeModule.FullBody and p1.props.finalPageViewMode == PPEThumbnailTypeModule.Closeup then
		v1 = 0
	end
	if v1 then
		p1.motor:stop()
		p1.motor:setGoal(OtterModule.spring(v1, config))
		p1.motor:start()
		p1:setState({ isAnimating = true })
	end
end

function ProfilePictureEditorFinalPage.willUnmount(p1)
	if p1.motor then
		p1.motor:destroy()
		p1.motor = nil
	end
end

local WithMappedNavigationParamsModuleResult = WithMappedNavigationParamsModule((WithStackVisibilityWrapperModule((RoactServices.connect({
	profilePictureEditorAnalytics = AnalyticsModule,
	networking = RoactNetworkingModule
})((RoactRoduxModule.connect(function(p1, _)
	-- upvalues: DeviceOrientationMode (copy)
	return {
		isPortrait = p1.DeviceOrientation == DeviceOrientationMode.Portrait,
		globalGuiInset = p1.GlobalGuiInset,
		screenSize = p1.ScreenSize,
		fieldOfViewDeg = p1.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.fieldOfViewDeg,
		zoomSliderValue = p1.AvatarExperience.ProfilePictureEditor.CameraSliders.zoomSliderValue,
		rotateSliderValue = p1.AvatarExperience.ProfilePictureEditor.CameraSliders.rotateSliderValue,
		emoteAssetId = p1.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.emoteAssetId,
		finalPageViewMode = p1.AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode,
		currentCharacter = p1.AvatarExperience.AvatarScene.Character.CurrentCharacter,
		equippedAssets = p1.AvatarExperience.AvatarEditor.Character.EquippedAssets
	}
end, function(Callback)
	-- upvalues: WritePPEConfigModule (copy), PPEThumbnailTypeModule (copy), CameraUtility (copy), SetFinalPageViewModeModule (copy)
	return {
		writePPEConfig = function(_, p1, p2, p3, p4, p5)
			-- upvalues: Callback (copy), WritePPEConfigModule (upval), PPEThumbnailTypeModule (upval), CameraUtility (upval)
			Callback(WritePPEConfigModule(p1, PPEThumbnailTypeModule.Closeup, p2, p3, p4, p5))
			Callback(WritePPEConfigModule(p1, PPEThumbnailTypeModule.FullBody, p2, CameraUtility.DistanceScaleForFullBody, p4, p5))
		end,
		setFinalPageViewMode = function(p1)
			-- upvalues: Callback (copy), SetFinalPageViewModeModule (upval)
			return Callback(SetFinalPageViewModeModule(p1))
		end
	}
end)(ProfilePictureEditorFinalPage)))))))

return function(p1)
	-- upvalues: AXMigrateProfilePictureEditorFinalPageToFocusNavigation (copy), UseFocusGuiObjectFunction (copy), ReactModule (copy), useFocusNavigationBindings (copy), UseTableWrappedCallbackRefFunction (copy), CryoModule (copy), UseUiModeInfoFunction (copy), UiMode (copy), FFlagEnableLeftNavOnConsole (copy), WithMappedNavigationParamsModuleResult (ref)
	local JoinResult = nil
	if AXMigrateProfilePictureEditorFinalPageToFocusNavigation then
		local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
		local UseRefResult = ReactModule.useRef(nil)
		JoinResult = CryoModule.Dictionary.join(p1, {
			is10ftUI = UseUiModeInfoFunction().uiMode == UiMode.TenFoot and not FFlagEnableLeftNavOnConsole,
			topBarRef = UseRefResult,
			resolvedFocusNavigationRef = UseTableWrappedCallbackRefFunction((useFocusNavigationBindings(nil, (ReactModule.useCallback(function()
				-- upvalues: UseFocusGuiObjectResult (copy), UseRefResult (copy)
				if UseFocusGuiObjectResult and UseRefResult and UseRefResult.current then
					UseFocusGuiObjectResult(UseRefResult.current)
				end
			end, { UseFocusGuiObjectResult })))))
		})
	else
		JoinResult = CryoModule.Dictionary.join(p1, {
			is10ftUI = UseUiModeInfoFunction().uiMode == UiMode.TenFoot and not FFlagEnableLeftNavOnConsole
		})
	end
	return ReactModule.createElement(WithMappedNavigationParamsModuleResult, JoinResult)
end