local Parent = script:FindFirstAncestor("GenericChallenges").Parent
local ReactModule = require(Parent.React)
local AppLinking = require(Parent.RoactServiceTags).AppLinking
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local FoundationModule = require(Parent.Foundation)
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local View = FoundationModule.View
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local FillBehavior = FoundationModule.Enums.FillBehavior
local Loading = FoundationModule.Loading
local Text = FoundationModule.Text
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigableSurfaceWrapper = FocusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum

return function(p1) --[[ Line: 35 | Named "PersonaLivenessHosted" ]]
	-- upvalues: UseRoactServiceFunction (copy), AppLinking (copy), ReactModule (copy), UseLocalizationFunction (copy), FullscreenPageWithSafeArea (copy), FocusNavigableSurfaceWrapper (copy), FocusNavigableSurfaceIdentifierEnum (copy), Dialog (copy), DialogSize (copy), View (copy), Loading (copy), Text (copy), Button (copy), ButtonVariant (copy), InputSize (copy), FillBehavior (copy)
	local WebLink = p1.webLink
	local OnCancelFunction = p1.onCancel
	local SessionId = p1.sessionId
	local UseRoactServiceResult = UseRoactServiceFunction(AppLinking)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 44 ]]
		-- upvalues: UseStateResult2 (copy), UseRoactServiceResult (copy), WebLink (copy)
		UseStateResult2(true)
		UseRoactServiceResult:openURL(WebLink)
	end, { UseRoactServiceResult, WebLink, SessionId })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 49 ]]
		-- upvalues: OnCancelFunction (copy)
		OnCancelFunction()
	end, { OnCancelFunction, SessionId })
	local UseLocalizationResult = UseLocalizationFunction({
		title = "Feature.BiometricChallenge.Title.ConfirmHuman",
		bodyText = "Feature.BiometricChallenge.Content.LivenessHostedPrompt",
		loadingText = "Feature.BiometricChallenge.Content.Loading",
		continueButton = "Feature.BiometricChallenge.Action.Continue",
		cancelButton = "Feature.BiometricChallenge.Action.Cancel"
	})
	
	return ReactModule.createElement("ScreenGui", {
		DisplayOrder = 200,
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Overlay = ReactModule.createElement(FullscreenPageWithSafeArea, { includeStatusBar = false }, {
			FocusNavigableSurface = ReactModule.createElement(FocusNavigableSurfaceWrapper, {
				isIsolated = true,
				surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.ModerationOverlay
			}, {
				Dialog = ReactModule.createElement(Dialog.Root, { hasBackdrop = true, size = DialogSize.Medium }, {
					DialogTitle = not UseStateResult and ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = UseLocalizationResult.title }),
					DialogContent = ReactModule.createElement(Dialog.Content, nil, {
						DialogView = ReactModule.createElement(View, { tag = "col fill auto-xy items-center gap-medium" }, {
							Loading = UseStateResult and ReactModule.createElement(View, { LayoutOrder = 1, tag = "auto-xy margin-top-medium" }, { ReactModule.createElement(Loading, {}) }),
							DialogBody = UseStateResult and ReactModule.createElement(Text, {
								LayoutOrder = 2,
								tag = "text-wrap auto-y size-full-0 text-body-medium",
								Text = UseLocalizationResult.loadingText
							}) or ReactModule.createElement(Dialog.Text, { LayoutOrder = 2, Text = UseLocalizationResult.bodyText }),
							DialogFooter = ReactModule.createElement(View, {
								tag = "row size-full-0 auto-y gap-small",
								LayoutOrder = 3
							}, {
								CancelButton = ReactModule.createElement(Button, {
									LayoutOrder = 1,
									variant = ButtonVariant.Standard,
									size = InputSize.Medium,
									text = UseLocalizationResult.cancelButton,
									fillBehavior = FillBehavior.Fill,
									onActivated = UseResult1
								}),
								ContinueButton = not UseStateResult and ReactModule.createElement(Button, {
									icon = "icons/navigation/externallink_medium",
									LayoutOrder = 2,
									variant = ButtonVariant.Emphasis,
									size = InputSize.Medium,
									text = UseLocalizationResult.continueButton,
									fillBehavior = FillBehavior.Fill,
									onActivated = UseResult
								})
							})
						})
					})
				})
			})
		})
	})
end