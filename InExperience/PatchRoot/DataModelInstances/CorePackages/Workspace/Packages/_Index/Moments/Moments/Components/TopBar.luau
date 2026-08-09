local playersService = game:GetService("Players")
local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local plusLarge = builderIconsModule.Icon.PlusLarge
local threeBarsHorizontal = builderIconsModule.Icon.ThreeBarsHorizontal
local coachmark = foundationModule.Coachmark
local foundationProvider = foundationModule.FoundationProvider
local iconButton = foundationModule.IconButton
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local theme = foundationModule.Enums.Theme
local gradientBackdrop = momentsCommonModule.Components.GradientBackdrop
local navigationMenuModule = require(moments.Components.NavigationMenu)
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useLocalization = localizationModule.Hooks.useLocalization
local useTokens = foundationModule.Hooks.useTokens
local useIsTvRemoteDevice = require(parent.RoactUtils).Hooks.useIsTvRemoteDevice
local useSetDrawerVisible = require(parent.Drawer).Hooks.useSetDrawerVisible
local constantsModule = require(moments.Constants)
local getFFlagMomentsImmersiveChromeModule = require(moments.Flags.GetFFlagMomentsImmersiveChrome)
local useChromeRatioModule = require(moments.Hooks.useChromeRatio)
local analytics = momentsCommonModule.Analytics
local eventNames = analytics.EventNames
local fireAnalyticsEvent = analytics.fireAnalyticsEvent
local momentsAndroidTvEnabled = game:DefineFastFlag("MomentsAndroidTvEnabled", false)
local t = {
	defaultTitle = "Feature.Moments.Label.MomentsExperienceName"
}

local function ImmersiveHeaderChrome(p0) --[[ line: 77 ]]
	-- upvalues: useChromeRatioModule (ref), reactModule (ref), constantsModule (ref), view (ref)
	local var14 = useChromeRatioModule()
	local var15, var16 = reactModule.useBinding(0)
	
	return reactModule.createElement("CanvasGroup", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = p0.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = reactModule.joinBindings({ ratio = var14, height = var15 }):map(function(p1) --[[ line: 87 ]]
			return UDim2.new(0, 0, 0, (p1.ratio - 1) * p1.height)
		end),
		GroupTransparency = var14:map(function(p2) --[[ line: 90 ]]
			return 1 - p2
		end),
		Interactable = var14:map(function(p3) --[[ line: 105 ]]
			return p3 > 0.01
		end),
		ZIndex = constantsModule.DisplayOrder.FeedTopBar,
		[reactModule.Change.AbsoluteSize] = reactModule.useCallback(function(p4) --[[ line: 80 ]]
			-- upvalues: var16 (ref)
			var16(p4.AbsoluteSize.Y)
		end, {})
	}, {
		Header = reactModule.createElement(view, { tag = "size-full-0 auto-y" }, p0.children)
	})
end

return function(p5) --[[ line: 117 | named "TopBar" ]]
	-- upvalues: useLocalization (ref), t (ref), useTokens (ref), useDeviceInsets (ref), useSetDrawerVisible (ref), useIsTvRemoteDevice (ref), getFFlagMomentsImmersiveChromeModule (ref), reactModule (ref), playersService (ref), fireAnalyticsEvent (ref), eventNames (ref), momentsAndroidTvEnabled (ref), iconButton (ref), plusLarge (ref), buttonVariant (ref), inputSize (ref), coachmark (ref), foundationModule (ref), threeBarsHorizontal (ref), text (ref), navigationMenuModule (ref), view (ref), gradientBackdrop (ref), foundationProvider (ref), theme (ref), constantsModule (ref), ImmersiveHeaderChrome (ref)
	local var17 = useLocalization(t)
	local var18 = useTokens()
	local var19 = useDeviceInsets()
	local var20 = useSetDrawerVisible()
	local var21 = useIsTvRemoteDevice()
	local var22 = getFFlagMomentsImmersiveChromeModule()
	reactModule.useEffect(function() --[[ line: 134 ]]
		-- upvalues: p5 (ref), playersService (copy), fireAnalyticsEvent (copy), eventNames (copy)
		if p5.showFtuxTooltip then
			fireAnalyticsEvent(eventNames.FTUXTooltipImpression, {
				userId = tostring(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0),
				timestamp = tostring(os.time())
			})
		end
	end, { p5.showFtuxTooltip })
	local var23 = reactModule.useCallback(function() --[[ line: 144 ]]
		-- upvalues: p5 (ref), fireAnalyticsEvent (copy), eventNames (copy), playersService (copy)
		if p5.showFtuxTooltip then
			fireAnalyticsEvent(eventNames.FTUXTooltipDismissed, {
				userId = tostring(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0),
				timestamp = tostring(os.time())
			})
			p5.onFtuxTooltipDismissed()
		end
		p5.onCreatePressed()
	end, {
		p5.showFtuxTooltip,
		p5.onFtuxTooltipDismissed,
		p5.onCreatePressed
	})
	local var24 = reactModule.useCallback(function() --[[ line: 157 ]]
		-- upvalues: var20 (ref)
		var20(true)
	end, { var20 })
	local var25 = not (momentsAndroidTvEnabled and var21)
	local var26 = reactModule.createElement(iconButton, {
		LayoutOrder = 1,
		isCircular = true,
		Selectable = true,
		testId = "--moments-top-bar-create",
		icon = plusLarge,
		onActivated = var23,
		variant = buttonVariant.OverMedia,
		size = inputSize.Medium
	})
	local t_1 = {
		GradientScrim = if p5.showTopScrim then reactModule.createElement(gradientBackdrop, {
			startingTransparency = 0.4,
			endingTransparency = 1,
			rotation = 90,
			zIndex = 1,
			color3 = Color3.new(0, 0, 0),
			position = UDim2.fromScale(0, 0),
			size = UDim2.new(1, 0, 0, var19.top + var18.Size.Size_2000 + var18.Size.Size_1600)
		}) else nil,
		HeaderContent = reactModule.createElement(view, {
			tag = "size-full-0 auto-y",
			ZIndex = 2,
			padding = {
				left = UDim.new(0, var19.left),
				right = UDim.new(0, var19.right),
				top = UDim.new(0, var19.top)
			}
		}, {
			OverMediaTheme = reactModule.createElement(foundationProvider, { theme = theme.Light }, {
				HeaderRow = reactModule.createElement(view, {
					tag = "row align-y-center size-full-0 auto-y padding-x-large padding-top-medium"
				}, if p5.isBaseScreen then {
					LeftCluster = reactModule.createElement(view, {
						LayoutOrder = 1,
						tag = "row align-x-left align-y-center grow gap-small auto-y"
					}, {
						Hamburger = if var25 then reactModule.createElement(iconButton, {
							LayoutOrder = 1,
							isCircular = true,
							Selectable = true,
							testId = "--moments-top-bar-hamburger",
							icon = threeBarsHorizontal,
							onActivated = var24,
							variant = buttonVariant.OverMedia,
							size = inputSize.Medium
						}) else nil,
						MomentsTitle = reactModule.createElement(text, {
							LayoutOrder = 2,
							tag = "shrink auto-xy text-heading-large text-truncate-end",
							Text = p5.title or var17.defaultTitle,
							textStyle = var18.Color.Content.Emphasis
						})
					}),
					RightCluster = reactModule.createElement(view, {
						LayoutOrder = 2,
						tag = "row align-x-right align-y-center gap-medium auto-xy"
					}, if var25 then {
						CreateMomentButton = if p5.showFtuxTooltip then reactModule.createElement(coachmark, {
							LayoutOrder = 1,
							title = "Share Your First Moment",
							text = "Tap + to share a moment from your captures",
							isOpen = p5.showFtuxTooltip,
							onClose = function() --[[ line: 179 ]]
								-- upvalues: fireAnalyticsEvent (copy), eventNames (copy), playersService (copy), p5 (ref)
								fireAnalyticsEvent(eventNames.FTUXTooltipDismissed, {
									userId = tostring(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0),
									timestamp = tostring(os.time())
								})
								p5.onFtuxTooltipDismissed()
							end,
							side = foundationModule.Enums.PopoverSide.Bottom,
							align = foundationModule.Enums.PopoverAlign.End
						}, var26) else var26,
						NavigationMenu = reactModule.createElement(navigationMenuModule, {
							layoutOrder = 2,
							onNavigateToTrending = p5.onNavigateToTrending,
							onNavigateToMyMoments = p5.onNavigateToMyMoments
						})
					} else nil)
				} else {
					Spacer = reactModule.createElement(view, { LayoutOrder = 1, tag = "grow auto-y" }),
					CloseButton = reactModule.createElement(iconButton, {
						LayoutOrder = 2,
						icon = "icons/navigation/close_small",
						isCircular = true,
						Selectable = true,
						testId = "--moments-top-bar-close",
						onActivated = function() --[[ line: 251 ]]
							-- upvalues: p5 (ref)
							if p5.onClose then
								p5.onClose()
							end
						end,
						variant = buttonVariant.OverMedia,
						size = inputSize.Medium
					})
				})
			})
		})
	}
	
	return if var22 then reactModule.createElement(ImmersiveHeaderChrome, { layoutOrder = p5.layoutOrder }, t_1) else reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		LayoutOrder = p5.layoutOrder,
		ZIndex = constantsModule.DisplayOrder.FeedTopBar
	}, t_1)
end