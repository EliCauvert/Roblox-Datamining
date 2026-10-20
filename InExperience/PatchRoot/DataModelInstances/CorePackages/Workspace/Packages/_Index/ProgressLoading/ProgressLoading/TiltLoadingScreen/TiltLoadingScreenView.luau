local Parent = script:FindFirstAncestor("ProgressLoading").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Progress = FoundationModule.Progress
local ProgressShape = FoundationModule.Enums.ProgressShape
local Badge = FoundationModule.Badge
local Icon = FoundationModule.Icon
local IconButton = FoundationModule.IconButton
local Text = FoundationModule.Text
local Enums = FoundationModule.Enums
local IconSize = Enums.IconSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local IsPioneerLaunchFunction = require(Parent.PioneerUtils).isPioneerLaunch
local TiltLockupModule = require(script.Parent.Components.TiltLockup)
local TiltLoadingScreenStatusPanelModule = require(script.Parent.Components.TiltLoadingScreenStatusPanel)
local FFlagTiltLoadingScreenConsoleHints = require(Parent.SharedFlags).FFlagTiltLoadingScreenConsoleHints
local _ = require(script.Parent.Types)

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), FFlagTiltLoadingScreenConsoleHints (copy), ReactModule (copy), View (copy), IsPioneerLaunchFunction (copy), IconButton (copy), Enums (copy), Icon (copy), IconSize (copy), Text (copy), TiltLockupModule (copy), Badge (copy), TiltLoadingScreenStatusPanelModule (copy), Progress (copy), ProgressShape (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		autoTranslate = "CoreScripts.TopBar.LoadingScreen.AutoTranslate",
		back = if FFlagTiltLoadingScreenConsoleHints then "CoreScripts.TopBar.Back" else nil
	})
	
	return ReactModule.createElement(View, {
		tag = "size-full bg-surface-0",
		testId = "tilt-loading-screen-root",
		GroupTransparency = p1.chromeReveal:map(function(p2: number): number
			return 1 - p2
		end)
	}, {
		Overlay = ReactModule.createElement(View, {
			tag = "size-full",
			ZIndex = 0,
			backgroundStyle = UseTokensResult.Color.Extended.Black.Black_50
		}),
		SafeArea = if p1.showContent then ReactModule.createElement(View, {
			tag = "size-full",
			ZIndex = 1,
			testId = "tilt-loading-screen-safe-area",
			padding = {
				left = UDim.new(0, p1.safeAreaInsets.left),
				top = UDim.new(0, p1.safeAreaInsets.top),
				right = UDim.new(0, p1.safeAreaInsets.right),
				bottom = UDim.new(0, p1.safeAreaInsets.bottom)
			}
		}, {
			CancelButton = if IsPioneerLaunchFunction() or p1.isDirectionalInput then nil else ReactModule.createElement(View, {
				tag = "col align-x-left align-y-top size-full padding-xlarge",
				ZIndex = 2
			}, {
				Button = ReactModule.createElement(IconButton, {
					isCircular = true,
					testId = "tilt-loading-screen-cancel-button",
					icon = Enums.IconName.X,
					variant = Enums.ButtonVariant.Standard,
					size = Enums.InputSize.Large,
					onActivated = p1.onCancel
				})
			}),
			GamepadCancelHint = if IsPioneerLaunchFunction() or not p1.isDirectionalInput then nil else ReactModule.createElement(View, {
				tag = "col align-x-left align-y-bottom size-full padding-xlarge",
				ZIndex = 2,
				testId = "tilt-loading-screen-gamepad-cancel-hint"
			}, {
				Hint = ReactModule.createElement(View, {
					tag = "row align-y-center gap-small auto-xy padding-x-medium"
				}, {
					ButtonIcon = ReactModule.createElement(Icon, {
						LayoutOrder = 1,
						name = p1.gamepadCancelIcon,
						size = IconSize.Medium,
						style = UseTokensResult.Color.System.Contrast
					}),
					Label = ReactModule.createElement(Text, {
						LayoutOrder = 2,
						tag = "auto-xy text-title-large content-system-contrast",
						Text = UseLocalizationResult.back
					})
				})
			}),
			Layout = ReactModule.createElement(View, { tag = "col size-full", ZIndex = 1 }, {
				Content = ReactModule.createElement(View, {
					LayoutOrder = 1,
					tag = "col align-x-center align-y-center grow gap-large size-full-0 padding-x-xxlarge",
					testId = "tilt-loading-screen-lockup-slot"
				}, {
					Lockup = ReactModule.createElement(TiltLockupModule, {
						LayoutOrder = 1,
						gameName = if p1.gameData then p1.gameData.name else nil,
						creatorName = if p1.gameData then p1.gameData.creator else nil,
						isCreatorVerified = if p1.gameData then p1.gameData.verified else nil,
						thumbnailUrl = p1.thumbnailUrl,
						onThumbnailLoaded = p1.onThumbnailLoaded,
						animation = p1.animation
					}),
					AutoTranslate = if p1.isAutoTranslated then ReactModule.createElement(View, {
						LayoutOrder = 2,
						tag = "auto-xy",
						GroupTransparency = p1.animation.creator.reveal:map(function(p2: number): number
							return 1 - p2
						end)
					}, {
						Badge = ReactModule.createElement(Badge, {
							text = UseLocalizationResult.autoTranslate,
							variant = Enums.BadgeVariant.Neutral,
							shape = Enums.BadgeShape.Box,
							icon = {
								name = Enums.IconName.LanguageCharacters,
								size = Enums.IconSize.XSmall,
								position = Enums.IconPosition.Left
							}
						})
					}) else nil
				}),
				StatusPanel = ReactModule.createElement(TiltLoadingScreenStatusPanelModule, {
					LayoutOrder = 3,
					status = p1.statusPanel.status,
					statusText = p1.statusPanel.statusText,
					queuePosition = p1.statusPanel.queuePosition,
					queueTreatment = p1.statusPanel.queueTreatment,
					followUserId = p1.statusPanel.followUserId,
					isSubjectToChinaPolicies = p1.statusPanel.isSubjectToChinaPolicies,
					onAutoJoinNewServer = p1.statusPanel.onAutoJoinNewServer,
					onJoinNewServer = p1.statusPanel.onJoinNewServer,
					onJoinTheLine = p1.statusPanel.onJoinTheLine,
					onShowConnectionHealth = p1.statusPanel.onShowConnectionHealth
				}),
				ProgressBar = if p1.statusPanel.queueTreatment == nil then ReactModule.createElement(View, {
					LayoutOrder = 4,
					testId = "tilt-loading-screen-progress-slot",
					tag = {
						["size-full-0 auto-y padding-x-medium padding-bottom-xlarge"] = p1.isMobile,
						["size-full-0 auto-y"] = not p1.isMobile
					}
				}, {
					Bar = ReactModule.createElement(Progress, {
						testId = "loading-screen-progress-bar",
						shape = ProgressShape.Bar
					})
				}) else nil
			})
		}) else nil
	})
end)