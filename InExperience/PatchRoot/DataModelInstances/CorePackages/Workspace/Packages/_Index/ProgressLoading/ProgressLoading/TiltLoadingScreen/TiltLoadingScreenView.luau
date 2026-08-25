local parent = script:FindFirstAncestor("ProgressLoading").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local progress = foundationModule.Progress
local progressShape = foundationModule.Enums.ProgressShape
local badge = foundationModule.Badge
local icon = foundationModule.Icon
local iconButton = foundationModule.IconButton
local text = foundationModule.Text
local enums = foundationModule.Enums
local iconSize = enums.IconSize
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = require(parent.Localization).Hooks.useLocalization
local fFlagDebugEnablePioneerUX = require(parent.SharedFlags).FFlagDebugEnablePioneerUX
local tiltLockupModule = require(script.Parent.Components.TiltLockup)
local tiltLoadingScreenStatusPanelModule = require(script.Parent.Components.TiltLoadingScreenStatusPanel)
local fFlagTiltLoadingScreenConsoleHints = require(parent.SharedFlags).FFlagTiltLoadingScreenConsoleHints
local _ = require(script.Parent.Types)

return reactModule.memo(function(p0)
	-- upvalues: useTokens (ref), useLocalization (ref), fFlagTiltLoadingScreenConsoleHints (ref), reactModule (ref), view (ref), fFlagDebugEnablePioneerUX (ref), iconButton (ref), enums (ref), icon (ref), iconSize (ref), text (ref), tiltLockupModule (ref), badge (ref), tiltLoadingScreenStatusPanelModule (ref), progress (ref), progressShape (ref)
	local var8
	local var4 = useTokens()
	local var5 = useLocalization({
		autoTranslate = "CoreScripts.TopBar.LoadingScreen.AutoTranslate",
		back = if fFlagTiltLoadingScreenConsoleHints then "CoreScripts.TopBar.Back" else nil
	})
	local createElement = reactModule.createElement
	local t = {
		tag = "size-full bg-surface-0",
		testId = "tilt-loading-screen-root",
		GroupTransparency = p0.chromeReveal:map(function(p1)
			return 1 - p1
		end)
	}
	local t_1 = {
		Overlay = reactModule.createElement(view, {
			tag = "size-full",
			ZIndex = 0,
			backgroundStyle = var4.Color.Extended.Black.Black_50
		})
	}
	
	if p0.showContent then
		var8 = reactModule.createElement
		var8 = var8(view, {
			tag = "size-full",
			ZIndex = 1,
			testId = "tilt-loading-screen-safe-area",
			padding = {
				left = UDim.new(0, p0.safeAreaInsets.left),
				top = UDim.new(0, p0.safeAreaInsets.top),
				right = UDim.new(0, p0.safeAreaInsets.right),
				bottom = UDim.new(0, p0.safeAreaInsets.bottom)
			}
		}, {
			CancelButton = if fFlagDebugEnablePioneerUX or p0.isDirectionalInput then nil else reactModule.createElement(view, {
				tag = "col align-x-left align-y-top size-full padding-xlarge",
				ZIndex = 2
			}, {
				Button = reactModule.createElement(iconButton, {
					isCircular = true,
					testId = "tilt-loading-screen-cancel-button",
					icon = enums.IconName.X,
					variant = enums.ButtonVariant.Standard,
					size = enums.InputSize.Large,
					onActivated = p0.onCancel
				})
			}),
			GamepadCancelHint = if fFlagDebugEnablePioneerUX or not p0.isDirectionalInput then nil else reactModule.createElement(view, {
				tag = "col align-x-left align-y-bottom size-full padding-xlarge",
				ZIndex = 2,
				testId = "tilt-loading-screen-gamepad-cancel-hint"
			}, {
				Hint = reactModule.createElement(view, {
					tag = "row align-y-center gap-small auto-xy padding-x-medium"
				}, {
					ButtonIcon = reactModule.createElement(icon, {
						LayoutOrder = 1,
						name = p0.gamepadCancelIcon,
						size = iconSize.Medium,
						style = var4.Color.System.Contrast
					}),
					Label = reactModule.createElement(text, {
						LayoutOrder = 2,
						tag = "auto-xy text-title-large content-system-contrast",
						Text = var5.back
					})
				})
			}),
			Layout = reactModule.createElement(view, { tag = "col size-full", ZIndex = 1 }, {
				Content = reactModule.createElement(view, {
					LayoutOrder = 1,
					tag = "col align-x-center align-y-center grow gap-large size-full-0 padding-x-xxlarge",
					testId = "tilt-loading-screen-lockup-slot"
				}, {
					Lockup = reactModule.createElement(tiltLockupModule, {
						LayoutOrder = 1,
						gameName = if p0.gameData then p0.gameData.name else nil,
						creatorName = if p0.gameData then p0.gameData.creator else nil,
						isCreatorVerified = if p0.gameData then p0.gameData.verified else nil,
						thumbnailUrl = p0.thumbnailUrl,
						animation = p0.animation
					}),
					AutoTranslate = if p0.isAutoTranslated then reactModule.createElement(view, {
						LayoutOrder = 2,
						tag = "auto-xy",
						GroupTransparency = p0.animation.creator.reveal:map(function(p2)
							return 1 - p2
						end)
					}, {
						Badge = reactModule.createElement(badge, {
							text = var5.autoTranslate,
							variant = enums.BadgeVariant.Neutral,
							shape = enums.BadgeShape.Box,
							icon = {
								name = enums.IconName.LanguageCharacters,
								size = enums.IconSize.XSmall,
								position = enums.IconPosition.Left
							}
						})
					}) else nil
				}),
				StatusPanel = reactModule.createElement(tiltLoadingScreenStatusPanelModule, {
					LayoutOrder = 3,
					status = p0.statusPanel.status,
					statusText = p0.statusPanel.statusText,
					queuePosition = p0.statusPanel.queuePosition,
					queueTreatment = p0.statusPanel.queueTreatment,
					followUserId = p0.statusPanel.followUserId,
					isSubjectToChinaPolicies = p0.statusPanel.isSubjectToChinaPolicies,
					onAutoJoinNewServer = p0.statusPanel.onAutoJoinNewServer,
					onJoinNewServer = p0.statusPanel.onJoinNewServer,
					onJoinTheLine = p0.statusPanel.onJoinTheLine,
					onShowConnectionHealth = p0.statusPanel.onShowConnectionHealth
				}),
				ProgressBar = if p0.statusPanel.queueTreatment == nil then reactModule.createElement(view, {
					LayoutOrder = 4,
					testId = "tilt-loading-screen-progress-slot",
					tag = {
						["size-full-0 auto-y padding-x-medium padding-bottom-xlarge"] = p0.isMobile,
						["size-full-0 auto-y"] = not p0.isMobile
					}
				}, {
					Bar = reactModule.createElement(progress, {
						testId = "loading-screen-progress-bar",
						shape = progressShape.Bar
					})
				}) else nil
			})
		})
	else
		var8 = nil
	end
	t_1.SafeArea = var8
	
	return createElement(view, t, t_1)
end)