local InterstitialAdPlayer = script:FindFirstAncestor("InterstitialAdPlayer")
local Parent = InterstitialAdPlayer.Parent
local VideoPlayerModule = require(Parent.VideoPlayer)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FoundationModule = require(Parent.Foundation)
local LocalizationModule = require(Parent.Localization)
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local _ = require(InterstitialAdPlayer.AdSession)
local OverMediaControlsModule = require(InterstitialAdPlayer.Components.OverMediaControls)
local PlaybackToggleIndicatorModule = require(InterstitialAdPlayer.Components.PlaybackToggleIndicator)
local ReportAdDialogModule = require(InterstitialAdPlayer.Components.ReportAdDialog)
local ReportAdErrorBoundaryModule = require(InterstitialAdPlayer.Components.ReportAdErrorBoundary)
local WhyThisAdDialogModule = require(InterstitialAdPlayer.Components.WhyThisAdDialog)
local Badge = FoundationModule.Badge
local IconButton = FoundationModule.IconButton
local Menu = FoundationModule.Menu
local Progress = FoundationModule.Progress
local View = FoundationModule.View
local BadgeShape = FoundationModule.Enums.BadgeShape
local BadgeVariant = FoundationModule.Enums.BadgeVariant
local InputSize = FoundationModule.Enums.InputSize
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide
local ProgressShape = FoundationModule.Enums.ProgressShape
local ProgressSize = FoundationModule.Enums.ProgressSize
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local UseMostRecentOrDefaultFocusBehaviorFunction = ReactFocusNavigationModule.useMostRecentOrDefaultFocusBehavior
local FFlagLuaAppInterstitialAdVideoUsage = VideoPlayerModule.FFlagLuaAppInterstitialAdVideoUsage
local _Vector2 = Vector2.new(320, 320)
local BackgroundStyle = { Transparency = 0, Color3 = Color3.new(0, 0, 0) }
local InterstitialAd = if FFlagLuaAppInterstitialAdVideoUsage then Enum.InternalVideoUsage:FromName("InterstitialAd") else nil
local Ease = { duration = 0.4, easingStyle = Enum.EasingStyle.Sine }
local Ease1 = { duration = 0.18, easingStyle = Enum.EasingStyle.Sine }
local SelectionGroup = {
	SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
	SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
	SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
	SelectionBehaviorRight = Enum.SelectionBehavior.Stop
}

local function InfoPanel(p1)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), ReactModule (copy), View (copy), Badge (copy), BadgeVariant (copy), BadgeShape (copy), IconButton (copy), InputSize (copy), Menu (copy), SelectionGroup (copy), PopoverSide (copy), PopoverAlign (copy), Progress (copy), ProgressShape (copy), ProgressSize (copy), OverMediaControlsModule (copy)
	local UseTokensResult = UseTokensFunction()
	local View1 = p1.view
	local UseLocalizationResult = UseLocalizationFunction({
		Ad = "Feature.NativeAds.Label.Ad",
		WhyThisAd = "CoreScripts.Ads.Label.WhyThisAd",
		ReportAd = "CoreScripts.Ads.Label.ReportAd",
		SkipAd = "CoreScripts.Ads.Label.SkipAd",
		SkipIn = {
			"CoreScripts.Ads.Label.SkipIn",
			RBX_NUMBER = View1.secondsUntilSkip
		}
	})
	
	return ReactModule.createElement(View, {
		tag = "position-bottom-left anchor-bottom-left size-full-0 auto-y",
		ZIndex = 2,
		backgroundStyle = UseTokensResult.Color.Surface.Surface_0,
		padding = {
			top = UDim.new(0, 48),
			bottom = UDim.new(0, UseTokensResult.Padding.XLarge),
			left = UDim.new(0, UseTokensResult.Padding.XLarge),
			right = UDim.new(0, UseTokensResult.Padding.XLarge)
		},
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, UseTokensResult.Gap.Small)
		}
	}, {
		Scrim = ReactModule.createElement("UIGradient", { Rotation = 90, Transparency = NumberSequence.new(1, 0.1) }),
		Top = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row align-y-bottom gap-large size-full-0 auto-y"
		}, {
			Information = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "row align-y-center grow gap-small auto-y"
			}, {
				Ad = ReactModule.createElement(Badge, {
					text = UseLocalizationResult.Ad,
					variant = BadgeVariant.Standard,
					shape = BadgeShape.Box
				})
			}),
			ActionRail = ReactModule.createElement(View, { LayoutOrder = 2, tag = "col auto-xy" }, {
				Mute = ReactModule.createElement(IconButton, {
					LayoutOrder = 1,
					testId = "interstitial-ad-player--mute",
					icon = if View1.muted then "speaker-slash" else "speaker",
					size = InputSize.Large,
					onActivated = p1.onToggleMute
				}),
				More = ReactModule.createElement(Menu, {
					LayoutOrder = 2,
					ref = UseFocusRootFunction({
						isAutoFocusRoot = true,
						surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.ContextualMenu,
						isFocusable = View1.overlay == "Menu"
					}),
					selectionGroup = SelectionGroup,
					isOpen = View1.overlay == "Menu",
					items = {
						{
							id = "WhyThisAd",
							icon = "circle-i",
							text = UseLocalizationResult.WhyThisAd
						},
						{
							id = "ReportAd",
							icon = "flag",
							text = UseLocalizationResult.ReportAd
						}
					},
					size = InputSize.Large,
					side = PopoverSide.Left,
					align = PopoverAlign.End,
					onPressedOutside = p1.onCloseOverlay,
					onActivated = function(p2)
						-- upvalues: p1 (copy)
						if p2 == "WhyThisAd" or p2 == "ReportAd" then
							p1.onOpenOverlay(p2)
						end
					end
				}, {
					Button = ReactModule.createElement(IconButton, {
						testId = "interstitial-ad-player--more",
						icon = "three-dots-vertical",
						size = InputSize.Large,
						onActivated = p1.onToggleMenu
					})
				})
			})
		}),
		ProgressRow = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row align-y-center size-full-400"
		}, {
			Progress = ReactModule.createElement(Progress, {
				shape = ProgressShape.Bar,
				size = ProgressSize.Small,
				width = UDim.new(1, 0),
				value = p1.progress:map(function(p2: number): number
					return p2 * 100
				end)
			})
		}),
		Actions = ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = {
				["row flex-x-between align-y-center size-full-0 auto-y"] = View1.hasClickThrough,
				["row align-x-right align-y-center size-full-0 auto-y"] = not View1.hasClickThrough
			}
		}, {
			ClickOut = if View1.hasClickThrough then ReactModule.createElement(OverMediaControlsModule.ClickOutButton, {
				logo = p1.advertiserLogo,
				ctaButtonType = p1.ctaButtonType,
				onActivated = p1.onClickOut
			}) else nil,
			Skip = if View1.isSkippable then ReactModule.createElement(OverMediaControlsModule.SkipButton, {
				text = if View1.canSkip then UseLocalizationResult.SkipAd else UseLocalizationResult.SkipIn,
				isDisabled = not View1.canSkip,
				onActivated = p1.onSkip
			}) else nil
		})
	})
end

local function ReportAdFocusRoot(p1)
	-- upvalues: UseTokensFunction (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), ReactModule (copy), View (copy), StateLayerAffordance (copy)
	return ReactModule.createElement(View, {
		testId = "interstitial-ad-player--report-ad",
		tag = "size-full",
		ZIndex = 5,
		backgroundStyle = UseTokensFunction().Color.Common.Backdrop,
		onActivated = function() end,
		stateLayer = { affordance = StateLayerAffordance.None },
		selection = { Selectable = false },
		ref = UseFocusRootFunction({
			isAutoFocusRoot = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp
		})
	}, p1.children)
end

return function(p1)
	-- upvalues: UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), UseMostRecentOrDefaultFocusBehaviorFunction (copy), ReactModule (copy), View (copy), SelectionGroup (copy), StateLayerAffordance (copy), PlaybackToggleIndicatorModule (copy), OverMediaControlsModule (copy), Ease (copy), Ease1 (copy), InfoPanel (copy), _Vector2 (copy), BackgroundStyle (copy), InterstitialAd (copy), WhyThisAdDialogModule (copy), ReportAdErrorBoundaryModule (copy), ReportAdFocusRoot (copy), ReportAdDialogModule (copy)
	local View1 = p1.view
	local Video = p1.video
	local UseMostRecentOrDefaultFocusBehaviorResult, UseMostRecentOrDefaultFocusBehaviorResult2 = UseMostRecentOrDefaultFocusBehaviorFunction((UseFocusRootFunction({
		isAutoFocusRoot = true,
		shouldRestoreFocus = false,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay,
		isFocusable = View1.overlay == nil or View1.overlay == "Browser"
	})))
	local Element = ReactModule.createElement(View, {
		tag = "size-full",
		ZIndex = 2,
		Visible = p1.controlsVisible,
		ref = UseMostRecentOrDefaultFocusBehaviorResult2,
		selectionGroup = SelectionGroup
	}, {
		TapToPause = ReactModule.createElement(View, {
			testId = "interstitial-ad-player--tap",
			tag = "size-full",
			ZIndex = 1,
			ref = UseMostRecentOrDefaultFocusBehaviorResult,
			onActivated = p1.onTogglePause,
			stateLayer = { affordance = StateLayerAffordance.None }
		}),
		PlaybackToggle = ReactModule.createElement(PlaybackToggleIndicatorModule, {
			isPlaying = not View1.userPaused,
			toggleCount = View1.toggleCount
		}),
		JoiningServer = ReactModule.createElement(OverMediaControlsModule.Fade, {
			tag = "position-top-center anchor-top-center size-full-0 auto-y",
			visible = View1.showsJoiningServer,
			ease = Ease
		}, {
			JoiningServer = ReactModule.createElement(OverMediaControlsModule.JoiningServer)
		}),
		TopLeft = ReactModule.createElement(OverMediaControlsModule.Fade, {
			tag = "position-top-left anchor-top-left auto-xy padding-xlarge",
			visible = View1.userPaused and View1.isActive,
			ease = Ease1
		}, {
			Back = ReactModule.createElement(OverMediaControlsModule.BackButton, { onActivated = p1.onBack })
		}),
		Info = if View1.isActive then ReactModule.createElement(InfoPanel, p1) else nil,
		MenuBackdrop = if View1.overlay == "Menu" then ReactModule.createElement(View, {
			testId = "interstitial-ad-player--menu-backdrop",
			tag = "size-full",
			ZIndex = 4,
			onActivated = p1.onCloseOverlay,
			stateLayer = { affordance = StateLayerAffordance.None },
			selection = { Selectable = false }
		}) else nil
	})
	local VideoSize = p1.videoSize
	local IsYBelow: boolean = VideoSize ~= nil and (_Vector2.X <= VideoSize.X and _Vector2.Y <= VideoSize.Y)
	
	return ReactModule.createElement(View, {
		tag = "size-full",
		onAbsoluteSizeChanged = p1.onScreenSize
	}, {
		Screen = ReactModule.createElement(View, { tag = "size-full", backgroundStyle = BackgroundStyle }, {
			VideoBounds = ReactModule.createElement(View, {
				tag = "position-center-center anchor-center-center size-full",
				aspectRatio = {
					AspectRatio = p1.videoAspect,
					AspectType = Enum.AspectType.FitWithinMaxSize
				},
				onAbsoluteSizeChanged = p1.onVideoSize
			}, {
				Video = ReactModule.createElement(Video.Component, {
					loadImmediately = true,
					preservePlaybackPosition = true,
					showVideoWhenPaused = true,
					looped = false,
					video = Video.content,
					shouldStartPlayback = Video.shouldPlay,
					muted = Video.muted,
					internalVideoUsage = InterstitialAd,
					videoPlaybackStateRef = Video.playbackStateRef,
					Size = UDim2.fromScale(1, 1),
					ScaleType = Enum.ScaleType.Fit,
					onLoadingStateChanged = Video.onLoadingStateChanged,
					onVideoEnded = Video.onVideoEnded,
					onAspectRatioChanged = Video.onAspectRatioChanged
				})
			}),
			Controls = ReactModule.createElement(View, {
				tag = "position-center-center anchor-center-center",
				ZIndex = 2,
				Size = if IsYBelow and VideoSize then UDim2.fromOffset(VideoSize.X, VideoSize.Y) else UDim2.fromScale(1, 1)
			}, { Controls = Element })
		}),
		WhyThisAd = if View1.overlay == "WhyThisAd" then ReactModule.createElement(WhyThisAdDialogModule, {
			advertiserName = p1.advertiserName,
			payerName = p1.payerName,
			learnMoreUrl = p1.learnMoreUrl,
			onLearnMore = p1.onOpenExternally,
			onClose = p1.onCloseOverlay
		}) else nil,
		ReportAd = if View1.overlay == "ReportAd" then ReactModule.createElement(ReportAdErrorBoundaryModule, { onError = p1.onCloseOverlay }, {
			Root = ReactModule.createElement(ReportAdFocusRoot, nil, {
				Dialog = ReactModule.createElement(ReportAdDialogModule, {
					illegalContentReportingUrl = p1.illegalContentReportingUrl,
					reportAbuse = p1.reportAbuse,
					onOpenExternally = p1.onOpenExternally,
					onClose = p1.onCloseOverlay
				})
			})
		}) else nil,
		EnterFade = ReactModule.createElement(View, {
			tag = "size-full",
			ZIndex = 10,
			backgroundStyle = p1.enterFade:map(function(p2: number)
				-- upvalues: BackgroundStyle (upval)
				return { Color3 = BackgroundStyle.Color3, Transparency = 1 - p2 }
			end)
		})
	})
end