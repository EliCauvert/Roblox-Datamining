local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local Common = Modules.Common
local RoactModule = require(Common.Roact)
local RoactRoduxModule = require(Common.RoactRodux)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local UseBreakpointYOrSmaller = ResponsiveModule.useBreakpointYOrSmaller
local UseBreakpointXOrSmaller = ResponsiveModule.useBreakpointXOrSmaller
local FullscreenPageWithSafeAreaModule = require(Modules.LuaApp.Components.FullscreenPageWithSafeArea)
local AuthCommonModule = require(CorePackages.Workspace.Packages.AuthCommon)
local BackgroundFill = AuthCommonModule.Components.BackgroundFill
local AuthBackgroundContainer = AuthCommonModule.Components.AuthBackgroundContainer
local AuthBackgroundGate = AuthCommonModule.Components.AuthBackgroundGate
local DEPRECATEDImageSetButtonModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetButton)
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local NavigateBackModule = require(Modules.LuaApp.Thunks.NavigateBack)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local AppPageModule = require(Modules.LuaApp.AppPage)
local GetIndexOfTopMostPageModule = require(Modules.LuaApp.getIndexOfTopMostPage)
local UseFocusedTextBox = require(CorePackages.Workspace.Packages.FocusNavigationUtils).useFocusedTextBox
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local AlignmentModule = require(Modules.LuaApp.Enum.Alignment)
local CryoModule = require(CorePackages.Packages.Cryo)
local UseDesignTokens = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local GetSafeAreaSizeFunction = require(CorePackages.Workspace.Packages.InputUi).getSafeAreaSize
local AuthAnalyticsModule = require(CorePackages.Workspace.Packages.AuthAnalytics)
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local AuthTimingUtil = AuthAnalyticsModule.authTimingUtil
local AuthPageloadFunction = AuthAnalyticsModule.Events.authPageload
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local SpringAnimatedItem = UIBloxModule.Utility.SpringAnimatedItem
local FoundationModule = require(CorePackages.Packages.Foundation)
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local FFlagEnableLuaAccountSwitchModule = require(Modules.LuaApp.Flags.FFlagEnableLuaAccountSwitch)
local FFlagLuaEnableLandingPageTTIMeasurements = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaEnableLandingPageTTIMeasurements
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local FFlagSignalsNavP3eAuth = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3eAuth
local UseSignalState = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3eAuth then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local LogoWithContentsLayout = RoactModule.PureComponent:extend("LogoWithContentsLayout")
LogoWithContentsLayout.defaultProps = {
	topButtonEnabled = true,
	LuobuLogoEnabled = false,
	VNAgeBadgeEnabled = false,
	FooterElement = nil,
	FooterHeight = 0,
	ContentAlign = AlignmentModule.Top
}
local XOffset = nil
local LogoAndBodyYPositionOffsetPercentageRatio = game:DefineFastInt("LogoAndBodyYPositionOffsetPercentage", 85) / 100
XOffset = if FFlagEnableLuaAccountSwitchModule then 16 else 0
local EnableHistoryBasedTopButtonHidingV2 = game:DefineFastFlag("EnableHistoryBasedTopButtonHidingV2", false)

local function renderTopButton(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), DEPRECATEDImageSetButtonModule (copy), XOffset (ref)
	local LayoutOrder = p1.layoutOrder or 0
	local OnActivated = p1.onActivated
	local ZIndex = p1.ZIndex
	local Close: string = if p1.showCloseIcon then "LuaApp/icons/navigation/close" else "LuaApp/icons/navigation/pushBack"
	
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), DEPRECATEDImageSetButtonModule (upval), LayoutOrder (copy), XOffset (upval), Close (ref), ZIndex (copy), OnActivated (copy)
		return RoactModule.createElement(DEPRECATEDImageSetButtonModule, {
			LayoutOrder = LayoutOrder,
			Size = UDim2.new(0, 27, 0, 27),
			Position = UDim2.new(0, XOffset, 0, 0),
			Image = Close,
			ImageColor3 = p2.Theme.TextEmphasis.Color,
			ImageTransparency = p2.Theme.TextEmphasis.Transparency,
			BackgroundTransparency = 1,
			ZIndex = ZIndex,
			[RoactModule.Event.Activated] = OnActivated
		})
	end)
end

function LogoWithContentsLayout.init(p1)
	-- upvalues: RoactModule (copy)
	p1.state = {
		onScreenKeyboardHeight = 0,
		childrenContainerPosition = Vector2.new(),
		childrenContainerSize = Vector2.new()
	}
	p1.isMounted = false
	p1.prevFocusedTextBox = nil
	p1.canvasPosition, p1.updateCanvasPosition = RoactModule.createBinding(Vector2.new())
	
	function p1.onScrollingFrameSizeChanged(ScrollFrame)
		-- upvalues: p1 (copy)
		local OnScreenKeyboardHeight = p1.state.onScreenKeyboardHeight
		local FocusedTextBox = p1.props.focusedTextBox
		
		if FocusedTextBox then
			OnScreenKeyboardHeight = math.min(FocusedTextBox.AbsolutePosition.Y + ScrollFrame.CanvasPosition.Y - 20, OnScreenKeyboardHeight)
		end
		p1.updateCanvasPosition(Vector2.new(0, OnScreenKeyboardHeight))
	end
	
	function p1.onTopButtonActivated()
		-- upvalues: p1 (copy)
		local TopButtonEnabled = p1.props.topButtonEnabled
		local NavigateBackFunction: () -> () = p1.props.navigateBack
		local TopButtonActivatedTrackingFunction: () -> () = p1.props.topButtonActivatedTracking
		
		if TopButtonActivatedTrackingFunction then
			TopButtonActivatedTrackingFunction()
		end
		if TopButtonEnabled then
			NavigateBackFunction()
		end
	end
end

function LogoWithContentsLayout.didMount(p1)
	-- upvalues: UserInputService (copy)
	p1.isMounted = true
	p1.keyboardVisibleChanged = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):connect(function()
		-- upvalues: UserInputService (upval), p1 (copy)
		local OnScreenKeyboardVisible = UserInputService.OnScreenKeyboardVisible
		local Y = OnScreenKeyboardVisible and UserInputService.OnScreenKeyboardSize.Y or 0
		local FocusedTextBox = p1.props.focusedTextBox
		local PrevFocusedTextBox = p1.prevFocusedTextBox
		local IsNotPrevFocusedTextBoxMatch: boolean = not OnScreenKeyboardVisible and (PrevFocusedTextBox ~= nil and (FocusedTextBox ~= nil and PrevFocusedTextBox ~= FocusedTextBox))
		local Flag = nil
		
		if OnScreenKeyboardVisible then
			Flag = true
		elseif IsNotPrevFocusedTextBoxMatch then
			p1._prevFocusedTextBox = FocusedTextBox
			Flag = false
		else
			Flag = true
			Y = 0
		end
		if Flag then
			p1:setState({ onScreenKeyboardHeight = Y })
		end
	end)
end

function LogoWithContentsLayout.didUpdate(p1, p2, _)
	if p2.focusedTextBox ~= p1.props.focusedTextBox then
		p1.prevFocusedTextBox = p2.focusedTextBox
	end
end

function LogoWithContentsLayout.willUnmount(p1)
	p1.isMounted = false
	
	if p1.keyboardVisibleChanged then
		p1.keyboardVisibleChanged:disconnect()
		p1.keyboardVisibleChanged = nil
	end
end

function LogoWithContentsLayout.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), FFlagSignalsNavP3eAuth (copy), FFlagUseNavigationSelectors (copy), AppPageModule (copy), GetIndexOfTopMostPageModule (copy), EnableHistoryBasedTopButtonHidingV2 (copy), GetSafeAreaSizeFunction (copy), FormFactor (copy), LogoAndBodyYPositionOffsetPercentageRatio (copy), AlignmentModule (copy), UserInputService (copy), FitChildrenModule (copy), FFlagLuaEnableLandingPageTTIMeasurements (copy), AuthTimingUtil (copy), EventStreamConstants (copy), AuthPageloadFunction (copy), HttpService (copy), FullscreenPageWithSafeAreaModule (copy), AuthBackgroundGate (copy), AuthBackgroundContainer (copy), BackgroundFill (copy), SpringAnimatedItem (copy), FoundationModule (copy), renderTopButton (copy)
	return WithStyleFunction(function(_)
		-- upvalues: p1 (copy), RoactModule (upval), FFlagSignalsNavP3eAuth (upval), FFlagUseNavigationSelectors (upval), AppPageModule (upval), GetIndexOfTopMostPageModule (upval), EnableHistoryBasedTopButtonHidingV2 (upval), GetSafeAreaSizeFunction (upval), FormFactor (upval), LogoAndBodyYPositionOffsetPercentageRatio (upval), AlignmentModule (upval), UserInputService (upval), FitChildrenModule (upval), FFlagLuaEnableLandingPageTTIMeasurements (upval), AuthTimingUtil (upval), EventStreamConstants (upval), AuthPageloadFunction (upval), HttpService (upval), FullscreenPageWithSafeAreaModule (upval), AuthBackgroundGate (upval), AuthBackgroundContainer (upval), BackgroundFill (upval), SpringAnimatedItem (upval), FoundationModule (upval), renderTopButton (upval)
		local Prop = p1.props[RoactModule.Children]
		local ContentAlign = p1.props.ContentAlign
		local StatusBarHeight = p1.props.statusBarHeight
		local ScreenSize = p1.props.screenSize
		local GlobalGuiInset = p1.props.globalGuiInset
		local History = if FFlagSignalsNavP3eAuth then p1.props.history elseif FFlagUseNavigationSelectors then p1.props.history else p1.props.navigation.history
		local HistoryEntry = History[#History]
		local Name = HistoryEntry[#HistoryEntry].name
		local Landing = AppPageModule.Landing
		local Count = #History[#History]
		local IsCountBelow = Count - (GetIndexOfTopMostPageModule(Landing, History) or 0) <= 1
		local IsCountAbove: boolean = if EnableHistoryBasedTopButtonHidingV2 then Count > 1 else Name ~= Landing
		local LuobuLogoEnabled = p1.props.LuobuLogoEnabled
		local VNAgeBadgeEnabled = p1.props.VNAgeBadgeEnabled
		local OffsetDelta = GetSafeAreaSizeFunction(ScreenSize, GlobalGuiInset).Y.Offset - StatusBarHeight
		local v1 = nil
		local YScale = nil
		
		if LuobuLogoEnabled or VNAgeBadgeEnabled then
			if p1.props.formFactor == FormFactor.COMPACT then
				v1 = 0.3
				YScale = 0.35
			else
				v1 = 0.3
				YScale = 0.4
			end
		elseif p1.props.formFactor == FormFactor.COMPACT then
			v1 = 0.15
			YScale = 0.3
		else
			v1 = 0.25
			YScale = 0.45
		end
		local Image = nil
		local AspectRatio = nil
		if LuobuLogoEnabled then
			Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/logo_white_luobu.png"
			AspectRatio = 4.0546875
		else
			Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/logo_white_1x.png"
			AspectRatio = 5.409090909090909
		end
		local YOffset = OffsetDelta * v1
		local ScaledOffsetDelta = OffsetDelta * YScale
		
		if p1.props.isShortScreen and not p1.props.isCompactScreen then
			YOffset *= LogoAndBodyYPositionOffsetPercentageRatio
			ScaledOffsetDelta *= LogoAndBodyYPositionOffsetPercentageRatio
		end
		local _UDim2 = UDim2.new(1, 0, YScale, p1.state.childrenContainerSize.Y)
		local config = {
			[AlignmentModule.Top] = {
				Position = UDim2.new(0.5, 0, 0, 0),
				AnchorPoint = Vector2.new(0.5, 0)
			},
			[AlignmentModule.Bottom] = {
				Position = UDim2.new(0.5, 0, 1, 0),
				AnchorPoint = Vector2.new(0.5, 1)
			}
		}
		local _ = UDim2.new(0, p1.state.childrenContainerPosition.X + p1.state.childrenContainerSize.X / 2, 0, p1.state.childrenContainerPosition.Y + p1.state.childrenContainerSize.Y / 2)
		local SpringOptions = {
			dampingRatio = 1,
			frequency = 1 / math.max(UserInputService.OnScreenKeyboardAnimationDuration, 0.1)
		}
		local IsDualLayout = p1.props.isDualLayout
		local XOffset: number = p1.props.tokens.LuaApps.LoginView.xOffset
		local FooterElement = p1.props.FooterElement
		local FooterHeight = p1.props.FooterHeight
		local IsCompactScreen = p1.props.isCompactScreen
		local v2: number = if IsCompactScreen then 15 else 40
		local FooterHeight1 = if FooterElement and IsCompactScreen then FooterHeight else 0
		local config1 = {
			VNAgeBadge = VNAgeBadgeEnabled and RoactModule.createElement("ImageLabel", {
				Position = UDim2.new(0.05, 0, 0, OffsetDelta * 0.05),
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0, 0),
				Size = UDim2.new(0.7, 0, 0.7, 0),
				Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/vn_agebadge.png",
				ZIndex = 1,
				[RoactModule.Children] = {
					UISizeConstraint = RoactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(460, 87.78625954198473) }),
					UIAspectRatioConstraint = RoactModule.createElement("UIAspectRatioConstraint", {
						AspectRatio = 5.24,
						AspectType = Enum.AspectType.FitWithinMaxSize
					})
				}
			}),
			Logo = RoactModule.createElement("ImageLabel", {
				Position = UDim2.new(0.5, 0, 0, YOffset),
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.new(0.7, 0, 0.7, 0),
				Image = Image,
				ZIndex = 1,
				[RoactModule.Children] = {
					UISizeConstraint = RoactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(460, 460 / AspectRatio) }),
					UIAspectRatioConstraint = RoactModule.createElement("UIAspectRatioConstraint", {
						AspectRatio = AspectRatio,
						AspectType = Enum.AspectType.FitWithinMaxSize
					})
				}
			}),
			AlignmentContainer = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Position = if IsDualLayout then UDim2.new(0, XOffset, 0, ScaledOffsetDelta) else UDim2.new(0.5, 0, 0, ScaledOffsetDelta),
				Size = if IsDualLayout then UDim2.new(1, -(2 * XOffset), 1, -ScaledOffsetDelta - FooterHeight1) else UDim2.new(1, 0, 1, -ScaledOffsetDelta - FooterHeight1),
				AnchorPoint = if IsDualLayout then Vector2.new(0, 0) else Vector2.new(0.5, 0)
			}, {
				Content = RoactModule.createElement(FitChildrenModule.FitFrame, {
					Position = config[ContentAlign].Position,
					Size = UDim2.new(1, 0, 0, 0),
					fitAxis = FitChildrenModule.FitAxis.Height,
					AnchorPoint = config[ContentAlign].AnchorPoint,
					BackgroundTransparency = 1,
					[RoactModule.Change.AbsoluteSize] = function(Frame)
						-- upvalues: p1 (upval)
						spawn(function()
							-- upvalues: p1 (upval), Frame (copy)
							if p1.isMounted then
								p1:setState({ childrenContainerSize = Frame.AbsoluteSize })
								
								return
							end
						end)
					end,
					[RoactModule.Change.AbsolutePosition] = function(Frame)
						-- upvalues: p1 (upval)
						spawn(function()
							-- upvalues: p1 (upval), Frame (copy)
							if p1.isMounted then
								p1:setState({ childrenContainerPosition = Frame.AbsolutePosition })
								
								return
							end
						end)
					end,
					[RoactModule.Children] = Prop
				})
			})
		}
		
		if FFlagLuaEnableLandingPageTTIMeasurements and Name == AppPageModule.Landing then
			local LandingPageLoadFinishResult = AuthTimingUtil.landingPageLoadFinish()
			
			if LandingPageLoadFinishResult then
				AuthPageloadFunction(EventStreamConstants.Context.LandingPageRender, HttpService:JSONEncode({
					variant = EventStreamConstants.Context.LandingScreen,
					timing = LandingPageLoadFinishResult
				}))
			end
		end
		return RoactModule.createElement(FullscreenPageWithSafeAreaModule, {
			includeStatusBar = true,
			buttonRef = p1.props.buttonRef,
			renderFullscreenBackground = function(_)
				-- upvalues: RoactModule (upval), AuthBackgroundGate (upval), AuthBackgroundContainer (upval), BackgroundFill (upval)
				return RoactModule.createElement(AuthBackgroundGate, {
					renderTreatment = function()
						-- upvalues: RoactModule (upval), AuthBackgroundContainer (upval)
						return RoactModule.createElement(AuthBackgroundContainer, {})
					end,
					renderLegacy = function()
						-- upvalues: RoactModule (upval), BackgroundFill (upval)
						return RoactModule.createElement(BackgroundFill, {
							Image = "rbxasset://textures/ui/LuaApp/graphic/Auth/GridBackground.jpg",
							AspectRatio = 1
						})
					end
				})
			end
		}, {
			ReverseVignette = nil,
			AuthScrollingFrame = RoactModule.createElement(SpringAnimatedItem.AnimatedScrollingFrame, {
				regularProps = {
					Selectable = false,
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					[RoactModule.Children] = config1,
					CanvasSize = _UDim2,
					CanvasPosition = p1.canvasPosition,
					ScrollingDirection = Enum.ScrollingDirection.Y,
					ScrollBarThickness = 0,
					ZIndex = 2,
					[RoactModule.Change.AbsoluteSize] = p1.onScrollingFrameSizeChanged
				},
				animatedValues = { onScreenKeyboardHeight = p1.state.onScreenKeyboardHeight },
				mapValuesToProps = function(p2)
					return { Size = UDim2.new(1, 0, 1, -p2.onScreenKeyboardHeight) }
				end,
				springOptions = SpringOptions
			}),
			Footer = FooterElement and RoactModule.createElement(FoundationModule.View, {
				ZIndex = 3,
				tag = "col align-x-center",
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Position = UDim2.new(0.5, 0, 1, -v2),
				AnchorPoint = Vector2.new(0.5, 1)
			}, { Content = FooterElement }),
			TopButton = IsCountAbove and RoactModule.createElement(renderTopButton, {
				ZIndex = 3,
				showCloseIcon = IsCountBelow,
				onActivated = p1.onTopButtonActivated
			}) or nil
		})
	end)
end

local v1 = if FFlagSignalsNavP3eAuth then function(p1)
	-- upvalues: GetLegacyNavigationStore (copy), UseSignalState (copy), RoactModule (copy), v1 (copy), CryoModule (copy)
	return RoactModule.createElement(v1, CryoModule.Dictionary.union(p1, {
		history = UseSignalState(GetLegacyNavigationStore(false).getHistory)
	}))
end else RoactRoduxModule.connect(function(p1, _)
	-- upvalues: FFlagSignalsNavP3eAuth (copy), FFlagUseNavigationSelectors (copy), Selectors (copy)
	return {
		formFactor = p1.FormFactor,
		statusBarHeight = p1.TopBar.statusBarHeight,
		globalGuiInset = p1.GlobalGuiInset,
		screenSize = p1.ScreenSize,
		navigation = if FFlagSignalsNavP3eAuth then nil elseif FFlagUseNavigationSelectors then nil else p1.Navigation,
		history = if FFlagSignalsNavP3eAuth then nil elseif FFlagUseNavigationSelectors then Selectors.selectLegacyHistory(p1) else nil
	}
end, function(Callback)
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackModule (copy)
	return {
		navigateBack = function()
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateBackModule (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.back() else Callback(NavigateBackModule())
		end
	}
end)(LogoWithContentsLayout)

return function(p1)
	-- upvalues: UseDesignTokens (copy), UseFocusedTextBox (copy), RoactModule (copy), v1 (copy), CryoModule (copy), UseBreakpointYOrSmaller (copy), ResponsiveModule (copy), UseBreakpointXOrSmaller (copy)
	return RoactModule.createElement(v1, CryoModule.Dictionary.join({
		tokens = UseDesignTokens(),
		isShortScreen = UseBreakpointYOrSmaller(ResponsiveModule.Keys.Medium),
		isCompactScreen = UseBreakpointXOrSmaller(ResponsiveModule.Keys.Medium),
		focusedTextBox = UseFocusedTextBox()
	}, p1))
end