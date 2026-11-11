local Players = game:GetService("Players")
local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local PlusLarge = BuilderIconsModule.Icon.PlusLarge
local ThreeBarsHorizontal = BuilderIconsModule.Icon.ThreeBarsHorizontal
local Coachmark = FoundationModule.Coachmark
local FoundationProvider = FoundationModule.FoundationProvider
local IconButton = FoundationModule.IconButton
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local Theme = FoundationModule.Enums.Theme
local GradientBackdrop = MomentsCommonModule.Components.GradientBackdrop
local NavigationMenuModule = require(Moments.Components.NavigationMenu)
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseIsTvRemoteDeviceFunction = require(Parent.RoactUtils).Hooks.useIsTvRemoteDevice
local UseSetDrawerVisibleFunction = require(Parent.Drawer).Hooks.useSetDrawerVisible
local ConstantsModule = require(Moments.Constants)
local GetFFlagMomentsImmersiveChromeModule = require(Moments.Flags.GetFFlagMomentsImmersiveChrome)
local UseChromeRatioModule = require(Moments.Hooks.useChromeRatio)
local Analytics = MomentsCommonModule.Analytics
local EventNames = Analytics.EventNames
local FireAnalyticsEventFunction = Analytics.fireAnalyticsEvent
local MomentsAndroidTvEnabled = game:DefineFastFlag("MomentsAndroidTvEnabled", false)
local config = {
	defaultTitle = "Feature.Moments.Label.MomentsExperienceName"
}

local function ImmersiveHeaderChrome(p1)
	-- upvalues: UseChromeRatioModule (copy), ReactModule (copy), ConstantsModule (copy), View (copy)
	local UseChromeRatioModuleResult = UseChromeRatioModule()
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	
	return ReactModule.createElement("CanvasGroup", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = ReactModule.joinBindings({
			ratio = UseChromeRatioModuleResult,
			height = UseBindingResult
		}):map(function(p2): UDim2
			return UDim2.new(0, 0, 0, (p2.ratio - 1) * p2.height)
		end),
		GroupTransparency = UseChromeRatioModuleResult:map(function(p2: number): number
			return 1 - p2
		end),
		Interactable = UseChromeRatioModuleResult:map(function(p2: number): boolean
			return p2 > 0.01
		end),
		ZIndex = ConstantsModule.DisplayOrder.FeedTopBar,
		[ReactModule.Change.AbsoluteSize] = ReactModule.useCallback(function(Frame)
			-- upvalues: UseBindingResult2 (copy)
			UseBindingResult2(Frame.AbsoluteSize.Y)
		end, {})
	}, {
		Header = ReactModule.createElement(View, { tag = "size-full-0 auto-y" }, p1.children)
	})
end

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), config (copy), UseTokensFunction (copy), UseDeviceInsetsFunction (copy), UseSetDrawerVisibleFunction (copy), UseIsTvRemoteDeviceFunction (copy), GetFFlagMomentsImmersiveChromeModule (copy), ReactModule (copy), Players (copy), FireAnalyticsEventFunction (copy), EventNames (copy), MomentsAndroidTvEnabled (copy), IconButton (copy), PlusLarge (copy), ButtonVariant (copy), InputSize (copy), Coachmark (copy), FoundationModule (copy), ThreeBarsHorizontal (copy), Text (copy), NavigationMenuModule (copy), View (copy), GradientBackdrop (copy), FoundationProvider (copy), Theme (copy), ConstantsModule (copy), ImmersiveHeaderChrome (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseTokensResult = UseTokensFunction()
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseSetDrawerVisibleResult = UseSetDrawerVisibleFunction()
	local UseIsTvRemoteDeviceResult = UseIsTvRemoteDeviceFunction()
	local FFlagMomentsImmersiveChromeModule = GetFFlagMomentsImmersiveChromeModule()
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), Players (upval), FireAnalyticsEventFunction (upval), EventNames (upval)
		if p1.showFtuxTooltip then
			FireAnalyticsEventFunction(EventNames.FTUXTooltipImpression, {
				userId = tostring(if Players.LocalPlayer then Players.LocalPlayer.UserId else 0),
				timestamp = tostring(os.time())
			})
		end
	end, { p1.showFtuxTooltip })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseSetDrawerVisibleResult (copy)
		UseSetDrawerVisibleResult(true)
	end, { UseSetDrawerVisibleResult })
	local Inverted = not (MomentsAndroidTvEnabled and UseIsTvRemoteDeviceResult)
	local Element = ReactModule.createElement(IconButton, {
		LayoutOrder = 1,
		isCircular = true,
		Selectable = true,
		testId = "--moments-top-bar-create",
		icon = PlusLarge,
		onActivated = ReactModule.useCallback(function()
			-- upvalues: p1 (copy), FireAnalyticsEventFunction (upval), EventNames (upval), Players (upval)
			if p1.showFtuxTooltip then
				FireAnalyticsEventFunction(EventNames.FTUXTooltipDismissed, {
					userId = tostring(if Players.LocalPlayer then Players.LocalPlayer.UserId else 0),
					timestamp = tostring(os.time())
				})
				p1.onFtuxTooltipDismissed()
			end
			p1.onCreatePressed()
		end, {
			p1.showFtuxTooltip,
			p1.onFtuxTooltipDismissed,
			p1.onCreatePressed
		}),
		variant = ButtonVariant.OverMedia,
		size = InputSize.Medium
	})
	local Element1 = ReactModule.createElement(Coachmark, {
		LayoutOrder = 1,
		title = "Share Your First Moment",
		text = "Tap + to share a moment from your captures",
		isOpen = p1.showFtuxTooltip,
		onClose = function()
			-- upvalues: FireAnalyticsEventFunction (upval), EventNames (upval), Players (upval), p1 (copy)
			FireAnalyticsEventFunction(EventNames.FTUXTooltipDismissed, {
				userId = tostring(if Players.LocalPlayer then Players.LocalPlayer.UserId else 0),
				timestamp = tostring(os.time())
			})
			p1.onFtuxTooltipDismissed()
		end,
		side = FoundationModule.Enums.PopoverSide.Bottom,
		align = FoundationModule.Enums.PopoverAlign.End
	}, Element)
	local config1 = {
		LeftCluster = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row align-x-left align-y-center grow gap-small auto-y"
		}, {
			Hamburger = if Inverted then ReactModule.createElement(IconButton, {
				LayoutOrder = 1,
				isCircular = true,
				Selectable = true,
				testId = "--moments-top-bar-hamburger",
				icon = ThreeBarsHorizontal,
				onActivated = UseResult,
				variant = ButtonVariant.OverMedia,
				size = InputSize.Medium
			}) else nil,
			MomentsTitle = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "shrink auto-xy text-heading-large text-truncate-end",
				Text = p1.title or UseLocalizationResult.defaultTitle,
				textStyle = UseTokensResult.Color.Content.Emphasis
			})
		}),
		RightCluster = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row align-x-right align-y-center gap-medium auto-xy"
		}, if Inverted then {
			CreateMomentButton = if p1.showFtuxTooltip then Element1 else Element,
			NavigationMenu = ReactModule.createElement(NavigationMenuModule, {
				layoutOrder = 2,
				onNavigateToTrending = p1.onNavigateToTrending,
				onNavigateToMyMoments = p1.onNavigateToMyMoments
			})
		} else nil)
	}
	local config2 = {
		Spacer = ReactModule.createElement(View, { LayoutOrder = 1, tag = "grow auto-y" }),
		CloseButton = ReactModule.createElement(IconButton, {
			LayoutOrder = 2,
			icon = "icons/navigation/close_small",
			isCircular = true,
			Selectable = true,
			testId = "--moments-top-bar-close",
			onActivated = function()
				-- upvalues: p1 (copy)
				if p1.onClose then
					p1.onClose()
				end
			end,
			variant = ButtonVariant.OverMedia,
			size = InputSize.Medium
		})
	}
	local config3 = {
		GradientScrim = if p1.showTopScrim then ReactModule.createElement(GradientBackdrop, {
			startingTransparency = 0.4,
			endingTransparency = 1,
			rotation = 90,
			zIndex = 1,
			color3 = Color3.new(0, 0, 0),
			position = UDim2.fromScale(0, 0),
			size = UDim2.new(1, 0, 0, UseDeviceInsetsResult.top + UseTokensResult.Size.Size_2000 + UseTokensResult.Size.Size_1600)
		}) else nil,
		HeaderContent = ReactModule.createElement(View, {
			tag = "size-full-0 auto-y",
			ZIndex = 2,
			padding = {
				left = UDim.new(0, UseDeviceInsetsResult.left),
				right = UDim.new(0, UseDeviceInsetsResult.right),
				top = UDim.new(0, UseDeviceInsetsResult.top)
			}
		}, {
			OverMediaTheme = ReactModule.createElement(FoundationProvider, { theme = Theme.Light }, {
				HeaderRow = ReactModule.createElement(View, {
					tag = "row align-y-center size-full-0 auto-y padding-x-large padding-top-medium"
				}, if p1.isBaseScreen then config1 else config2)
			})
		})
	}
	
	return if FFlagMomentsImmersiveChromeModule then ReactModule.createElement(ImmersiveHeaderChrome, { layoutOrder = p1.layoutOrder }, config3) else ReactModule.createElement(View, {
		tag = "size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		ZIndex = ConstantsModule.DisplayOrder.FeedTopBar
	}, config3)
end