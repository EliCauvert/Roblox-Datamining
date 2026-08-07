local parent = script:FindFirstAncestor("GenericChallenges").Parent
local reactModule = require(parent.React)
local appLinking = require(parent.RoactServiceTags).AppLinking
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local useLocalization = require(parent.Localization).Hooks.useLocalization
local fullscreenPageWithSafeArea = require(parent.AppBlox).FullscreenPageWithSafeArea
local foundationModule = require(parent.Foundation)
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local view = foundationModule.View
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local fillBehavior = foundationModule.Enums.FillBehavior
local loading = foundationModule.Loading
local text = foundationModule.Text
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceWrapper = focusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum

return function(p0) --[[ line: 35 | named "PersonaLivenessHosted" ]]
	-- upvalues: useRoactService (ref), appLinking (ref), reactModule (ref), useLocalization (ref), fullscreenPageWithSafeArea (ref), focusNavigableSurfaceWrapper (ref), focusNavigableSurfaceIdentifierEnum (ref), dialog (ref), dialogSize (ref), view (ref), loading (ref), text (ref), button (ref), buttonVariant (ref), inputSize (ref), fillBehavior (ref)
	local webLink = p0.webLink
	local onCancel = p0.onCancel
	local sessionId = p0.sessionId
	local var3 = useRoactService(appLinking)
	local var4, var5 = reactModule.useState(false)
	local var6 = useLocalization({
		title = "Feature.BiometricChallenge.Title.ConfirmHuman",
		bodyText = "Feature.BiometricChallenge.Content.LivenessHostedPrompt",
		loadingText = "Feature.BiometricChallenge.Content.Loading",
		continueButton = "Feature.BiometricChallenge.Action.Continue",
		cancelButton = "Feature.BiometricChallenge.Action.Cancel"
	})
	
	return reactModule.createElement("ScreenGui", {
		DisplayOrder = 200,
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Overlay = reactModule.createElement(fullscreenPageWithSafeArea, { includeStatusBar = false }, {
			FocusNavigableSurface = reactModule.createElement(focusNavigableSurfaceWrapper, {
				isIsolated = true,
				surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.ModerationOverlay
			}, {
				Dialog = reactModule.createElement(dialog.Root, { hasBackdrop = true, size = dialogSize.Medium }, {
					DialogTitle = not var4 and reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var6.title }),
					DialogContent = reactModule.createElement(dialog.Content, nil, {
						DialogView = reactModule.createElement(view, { tag = "col fill auto-xy items-center gap-medium" }, {
							Loading = var4 and reactModule.createElement(view, { LayoutOrder = 1, tag = "auto-xy margin-top-medium" }, { reactModule.createElement(loading, {}) }),
							DialogBody = var4 and reactModule.createElement(text, {
								LayoutOrder = 2,
								tag = "text-wrap auto-y size-full-0 text-body-medium",
								Text = var6.loadingText
							}) or reactModule.createElement(dialog.Text, { LayoutOrder = 2, Text = var6.bodyText }),
							DialogFooter = reactModule.createElement(view, {
								tag = "row size-full-0 auto-y gap-small",
								LayoutOrder = 3
							}, {
								CancelButton = reactModule.createElement(button, {
									LayoutOrder = 1,
									variant = buttonVariant.Standard,
									size = inputSize.Medium,
									text = var6.cancelButton,
									fillBehavior = fillBehavior.Fill,
									onActivated = reactModule.useCallback(function() --[[ line: 49 ]]
										-- upvalues: onCancel (ref)
										onCancel()
									end, { onCancel, sessionId })
								}),
								ContinueButton = not var4 and reactModule.createElement(button, {
									icon = "icons/navigation/externallink_medium",
									LayoutOrder = 2,
									variant = buttonVariant.Emphasis,
									size = inputSize.Medium,
									text = var6.continueButton,
									fillBehavior = fillBehavior.Fill,
									onActivated = reactModule.useCallback(function() --[[ line: 44 ]]
										-- upvalues: var5 (ref), var3 (ref), webLink (ref)
										var5(true)
										var3:openURL(webLink)
									end, { var3, webLink, sessionId })
								})
							})
						})
					})
				})
			})
		})
	})
end