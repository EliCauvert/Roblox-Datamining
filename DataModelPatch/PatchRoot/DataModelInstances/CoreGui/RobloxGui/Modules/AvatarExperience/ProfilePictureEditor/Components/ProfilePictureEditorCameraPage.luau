local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local TextService = game:GetService("TextService")
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local UseFocusGuiObjectFunction = ReactFocusNavigationModule.useFocusGuiObject
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local PeekabooWidgetModule = require(Modules.AvatarExperience.ProfilePictureEditor.Components.PeekabooWidget)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local GetSafeAreaSizeFunction = require(CorePackages.Workspace.Packages.InputUi).getSafeAreaSize
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local InsetBackground = require(CorePackages.Workspace.Packages.AppBlox).InsetBackground
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local WithMappedNavigationParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local UseTableWrappedCallbackRefFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef
local WithStackVisibilityWrapperModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)
local SliderWithLabelAndIconsModule = require(Modules.AvatarExperience.Common.Components.SliderWithLabelAndIcons)
local ProfilePictureEditorBottomBarModule = require(Modules.AvatarExperience.ProfilePictureEditor.Components.ProfilePictureEditorBottomBar)
local SetCameraSliderZoomModule = require(Modules.AvatarExperience.ProfilePictureEditor.Actions.SetCameraSliderZoom)
local SetCameraSliderRotateModule = require(Modules.AvatarExperience.ProfilePictureEditor.Actions.SetCameraSliderRotate)
local SetFinalPageViewModeModule = require(Modules.AvatarExperience.ProfilePictureEditor.Actions.SetFinalPageViewMode)
local ConstantsModule = require(Modules.AvatarExperience.ProfilePictureEditor.Constants)
local PPEThumbnailTypeModule = require(Modules.AvatarExperience.ProfilePictureEditor.PPEThumbnailType)
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local AnalyticsModule = require(Modules.AvatarExperience.ProfilePictureEditor.Services.Analytics)
local BottomInsetBackgroundModule = require(Modules.AvatarExperience.Common.Components.BottomInsetBackground)
local FFlagAXF10ftFixPeekabooWidgetModule = require(Modules.AvatarExperience.Flags.FFlagAXF10ftFixPeekabooWidget)
local AXMigrateProfilePictureEditorCameraPageToFocusNavigation = game:DefineFastFlag("AXMigrateProfilePictureEditorCameraPageToFocusNavigation", false)
local FFlagEnableLeftNavOnConsole = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local ButtonStack = UIBloxModule.App.Button.ButtonStack
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local ProfilePictureEditorCameraPage = RoactModule.PureComponent:extend("ProfilePictureEditorCameraPage")
local IconsActionsZoomIn = Images["icons/actions/zoomIn"]
local IconsActionsZoomOut = Images["icons/actions/zoomOut"]
local IconsActionsCycleLeft = Images["icons/actions/cycleLeft"]
local IconsActionsCycleRight = Images["icons/actions/cycleRight"]
local config = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

local function useFocusNavigationBindings(p1, Callback)
	-- upvalues: ReactFocusNavigationModule (copy), config (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
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
	end, { Callback }), (ReactFocusNavigationModule.useEventMap(config, p1)))
end

ProfilePictureEditorCameraPage.validateProps = TModule.strictInterface({
	avatarRoute = TModule.table,
	resolvedFocusNavigationRef = if AXMigrateProfilePictureEditorCameraPageToFocusNavigation then TModule.table else nil,
	topBarRef = if AXMigrateProfilePictureEditorCameraPageToFocusNavigation then TModule.table else nil,
	navigation = TModule.table,
	profilePictureEditorAnalytics = TModule.table,
	zoomSliderValue = TModule.number,
	rotateSliderValue = TModule.number,
	globalGuiInset = TModule.strictInterface({
		left = TModule.integer,
		top = TModule.integer,
		right = TModule.integer,
		bottom = TModule.integer
	}),
	screenSize = if FFlagAXF10ftFixPeekabooWidgetModule then nil else TModule.Vector2,
	isPortrait = TModule.boolean,
	setCameraSliderZoom = TModule.callback,
	setCameraSliderRotate = TModule.callback,
	setFinalPageViewMode = TModule.callback
})

function ProfilePictureEditorCameraPage.init(p1)
	-- upvalues: AXMigrateProfilePictureEditorCameraPageToFocusNavigation (copy), RoactModule (copy), AvatarScreen (copy), ConstantsModule (copy)
	if not AXMigrateProfilePictureEditorCameraPageToFocusNavigation then
		p1.topBarRef = RoactModule.createRef()
	end
	p1.bottomBarRef = RoactModule.createRef()
	p1.defaultPositionRef = RoactModule.createRef()
	p1.zoomSliderRef = RoactModule.createRef()
	p1.rotateSliderRef = RoactModule.createRef()
	
	function p1.goBack()
		-- upvalues: p1 (copy)
		p1.props.navigation.goBack()
	end
	
	function p1.onNext()
		-- upvalues: p1 (copy), AvatarScreen (upval)
		p1.props.profilePictureEditorAnalytics.clickNextFromCameraPage(p1.props.zoomSliderValue ~= 0, p1.props.rotateSliderValue ~= 0)
		p1.props.setFinalPageViewMode()
		p1.props.navigation.navigate(AvatarScreen.ProfilePictureEditorFinal, {})
	end
	
	function p1.onDefaultPosition()
		-- upvalues: p1 (copy)
		p1.props.profilePictureEditorAnalytics.clickDefaultPositionsFromCameraPage()
		p1.props.setCameraSliderZoom(0)
		p1.props.setCameraSliderRotate(0)
	end
	
	function p1.onZoomChanged(p2)
		-- upvalues: p1 (copy)
		p1.props.setCameraSliderZoom(p2)
	end
	
	function p1.onRotateChanged(p2)
		-- upvalues: p1 (copy)
		p1.props.setCameraSliderRotate(p2)
	end
	
	function p1.zoomToPoint(p2: number, _)
		-- upvalues: p1 (copy), ConstantsModule (upval)
		p1.props.setCameraSliderZoom((math.clamp(p1.props.zoomSliderValue + p2 * 2, -ConstantsModule.SliderMax, ConstantsModule.SliderMax)))
	end
	
	function p1.rotateByPixels(p2: number)
		-- upvalues: p1 (copy), ConstantsModule (upval)
		p1.props.setCameraSliderRotate((math.clamp(p1.props.rotateSliderValue + p2 * 1, -ConstantsModule.SliderMax, ConstantsModule.SliderMax)))
	end
end

function ProfilePictureEditorCameraPage:renderMiddleContents(p1)
	-- upvalues: RoactModule (copy), ImageSetLabel (copy), ConstantsModule (copy)
	return RoactModule.createElement(ImageSetLabel, {
		BackgroundTransparency = 1,
		ZIndex = 4,
		Size = UDim2.fromScale(1, 1),
		Position = UDim2.fromOffset(0, 0),
		Image = ConstantsModule.CircleCutoutAsset,
		ImageColor3 = p1.Theme.BackgroundDefault.Color
	})
end

function ProfilePictureEditorCameraPage.renderBottomContents(p1, p2, p3)
	-- upvalues: TextService (copy), RoactModule (copy), Focusable (copy), AXMigrateProfilePictureEditorCameraPageToFocusNavigation (copy), ButtonStack (copy), ButtonType (copy), SliderWithLabelAndIconsModule (copy), IconsActionsZoomOut (copy), IconsActionsZoomIn (copy), ConstantsModule (copy), IconsActionsCycleLeft (copy), IconsActionsCycleRight (copy)
	local _Font = p3.Font
	local ZoomSliderValue = p1.props.zoomSliderValue
	local RotateSliderValue = p1.props.rotateSliderValue
	
	return RoactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		NextSelectionUp = if AXMigrateProfilePictureEditorCameraPageToFocusNavigation then p1.props.topBarRef else p1.topBarRef,
		NextSelectionDown = p1.bottomBarRef
	}, {
		ListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center
		}),
		ButtonTopPadding = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.fromScale(1, 0.05)
		}, {
			uiSizeConstraint = RoactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(1e999, 50) })
		}),
		ButtonFrame = RoactModule.createElement(Focusable.Frame, {
			Size = UDim2.new(0, TextService:GetTextSize(p2.defaultPosition, _Font.Header2.RelativeSize * _Font.BaseSize, _Font.Header2.Font, Vector2.new(10000, 10000)).X + 20, 0, 36),
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			[RoactModule.Ref] = p1.defaultPositionRef,
			NextSelectionUp = if AXMigrateProfilePictureEditorCameraPageToFocusNavigation then p1.props.topBarRef else p1.topBarRef,
			NextSelectionDown = p1.zoomSliderRef
		}, {
			ButtonStack = RoactModule.createElement(ButtonStack, {
				buttons = {
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							onActivated = p1.onDefaultPosition,
							text = p2.defaultPosition,
							isDisabled = ZoomSliderValue == 0 and RotateSliderValue == 0
						}
					}
				}
			})
		}),
		AboveSliderPadding = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			Size = UDim2.new(1, 0, 0, 10)
		}),
		ZoomSlider = RoactModule.createElement(SliderWithLabelAndIconsModule, {
			layoutOrder = 4,
			text = p2.zoom,
			onSliderChanged = p1.onZoomChanged,
			value = ZoomSliderValue,
			leftIcon = IconsActionsZoomOut,
			rightIcon = IconsActionsZoomIn,
			min = -ConstantsModule.SliderMax,
			max = ConstantsModule.SliderMax,
			baseRef = p1.zoomSliderRef,
			NextSelectionUp = p1.defaultPositionRef,
			NextSelectionDown = p1.rotateSliderRef
		}),
		BetweenSliderPadding = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			LayoutOrder = 5,
			Size = UDim2.new(1, 0, 0, 10)
		}),
		RotateSlider = RoactModule.createElement(SliderWithLabelAndIconsModule, {
			layoutOrder = 6,
			text = p2.rotate,
			onSliderChanged = p1.onRotateChanged,
			value = RotateSliderValue,
			leftIcon = IconsActionsCycleLeft,
			rightIcon = IconsActionsCycleRight,
			min = -ConstantsModule.SliderMax,
			max = ConstantsModule.SliderMax,
			baseRef = p1.rotateSliderRef,
			NextSelectionUp = p1.zoomSliderRef,
			NextSelectionDown = p1.bottomBarRef
		})
	})
end

function ProfilePictureEditorCameraPage.renderWithProviders(p1, p2, p3)
	-- upvalues: RoactModule (copy), Focusable (copy), FFlagAXF10ftFixPeekabooWidgetModule (copy), GetSafeAreaSizeFunction (copy), AXMigrateProfilePictureEditorCameraPageToFocusNavigation (copy), TopBarModule (copy), FFlagEnableLeftNavOnConsole (copy), PeekabooWidgetModule (copy), ProfilePictureEditorBottomBarModule (copy), BottomInsetBackgroundModule (copy), InsetBackground (copy)
	local ScreenSize = p1.props.screenSize
	local GlobalGuiInset = p1.props.globalGuiInset
	local IsBottomAbove = GlobalGuiInset.bottom > 0
	
	return RoactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = if FFlagAXF10ftFixPeekabooWidgetModule then UDim2.fromScale(1, 1) else GetSafeAreaSizeFunction(ScreenSize, GlobalGuiInset),
		Position = UDim2.new(0, 0, 0, 0),
		Active = true,
		defaultChild = p1.zoomSliderRef,
		[RoactModule.Ref] = if AXMigrateProfilePictureEditorCameraPageToFocusNavigation then p1.props.resolvedFocusNavigationRef else p1.props[RoactModule.Ref]
	}, {
		SimpleTopBar = RoactModule.createElement(TopBarModule.Container, {
			titleText = p2.title,
			[RoactModule.Ref] = if AXMigrateProfilePictureEditorCameraPageToFocusNavigation then p1.props.topBarRef else p1.topBarRef,
			NextSelectionDown = p1.defaultPositionRef,
			transparentBackground = not FFlagEnableLeftNavOnConsole,
			hideSiteMessageBanner = p1.props.isPortrait,
			leftItem = TopBarModule.BackButton
		}),
		PeekabooWidget = RoactModule.createElement(PeekabooWidgetModule, {
			viewportYScale = 0.375,
			viewportXScale = 0.6666666666666666,
			topMarginYScale = 0.125,
			renderBottomContents = function()
				-- upvalues: p1 (copy), p2 (copy), p3 (copy)
				return p1:renderBottomContents(p2, p3)
			end,
			renderMiddleContents = function()
				-- upvalues: p1 (copy), p3 (copy)
				return p1:renderMiddleContents(p3)
			end,
			zoomToPoint = p1.zoomToPoint,
			rotateByPixels = p1.rotateByPixels
		}),
		BottomBar = RoactModule.createElement(ProfilePictureEditorBottomBarModule, {
			baseRef = p1.bottomBarRef,
			NextSelectionUp = p1.rotateSliderRef,
			button1 = {
				textKey = "Authentication.CrossDevice.Action.GoBack",
				onActivated = p1.goBack
			},
			button2 = {
				textKey = "Authentication.CrossDevice.Action.Next",
				onActivated = p1.onNext
			}
		}),
		BottomInsetBackground = if FFlagEnableLeftNavOnConsole then nil elseif IsBottomAbove then RoactModule.createElement(BottomInsetBackgroundModule, { globalGuiInset = GlobalGuiInset }) else nil,
		InsetBackground = if FFlagEnableLeftNavOnConsole then RoactModule.createElement(InsetBackground, {
			directions = { left = true, top = true, right = true, bottom = true }
		}) else nil
	})
end

function ProfilePictureEditorCameraPage.render(p1)
	-- upvalues: WithLocalizationFunction (copy), WithStyleFunction (copy)
	return WithLocalizationFunction({
		title = "Feature.Avatar.Label.PPEPositionCameraHeader",
		defaultPosition = "Feature.Avatar.Action.Reset",
		zoom = "Feature.Avatar.Action.Zoom",
		rotate = "Feature.Avatar.Action.Rotate"
	})(function(p2)
		-- upvalues: WithStyleFunction (upval), p1 (copy)
		return WithStyleFunction(function(p3)
			-- upvalues: p1 (upval), p2 (copy)
			return p1:renderWithProviders(p2, p3)
		end)
	end)
end

local v1 = RoactServices.connect({ profilePictureEditorAnalytics = AnalyticsModule })((WithMappedNavigationParamsModule((WithStackVisibilityWrapperModule((RoactRoduxModule.connect(function(p1, _)
	-- upvalues: DeviceOrientationMode (copy), FFlagAXF10ftFixPeekabooWidgetModule (copy)
	return {
		isPortrait = p1.DeviceOrientation == DeviceOrientationMode.Portrait,
		globalGuiInset = p1.GlobalGuiInset,
		screenSize = if FFlagAXF10ftFixPeekabooWidgetModule then nil else p1.ScreenSize,
		zoomSliderValue = p1.AvatarExperience.ProfilePictureEditor.CameraSliders.zoomSliderValue,
		rotateSliderValue = p1.AvatarExperience.ProfilePictureEditor.CameraSliders.rotateSliderValue
	}
end, function(Callback)
	-- upvalues: SetCameraSliderZoomModule (copy), SetCameraSliderRotateModule (copy), SetFinalPageViewModeModule (copy), PPEThumbnailTypeModule (copy)
	return {
		setCameraSliderZoom = function(p1)
			-- upvalues: Callback (copy), SetCameraSliderZoomModule (upval)
			return Callback(SetCameraSliderZoomModule(p1))
		end,
		setCameraSliderRotate = function(p1)
			-- upvalues: Callback (copy), SetCameraSliderRotateModule (upval)
			return Callback(SetCameraSliderRotateModule(p1))
		end,
		setFinalPageViewMode = function()
			-- upvalues: Callback (copy), SetFinalPageViewModeModule (upval), PPEThumbnailTypeModule (upval)
			return Callback(SetFinalPageViewModeModule(PPEThumbnailTypeModule.Closeup))
		end
	}
end)(ProfilePictureEditorCameraPage)))))))

return if AXMigrateProfilePictureEditorCameraPageToFocusNavigation then function(p1)
	-- upvalues: ReactModule (copy), UseFocusGuiObjectFunction (copy), useFocusNavigationBindings (copy), UseTableWrappedCallbackRefFunction (copy), v1 (ref), CryoModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	
	return ReactModule.createElement(v1, CryoModule.Dictionary.join(p1, {
		topBarRef = UseRefResult,
		resolvedFocusNavigationRef = UseTableWrappedCallbackRefFunction((useFocusNavigationBindings(nil, (ReactModule.useCallback(function()
			-- upvalues: UseFocusGuiObjectResult (copy), UseRefResult (copy)
			if UseFocusGuiObjectResult and UseRefResult and UseRefResult.current then
				UseFocusGuiObjectResult(UseRefResult.current)
			end
		end, { UseFocusGuiObjectResult })))))
	}))
end else v1