local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local Parent = NotApprovedPage.Parent
local ReactModule = require(Parent.React)
local UseCallbackFunction = ReactModule.useCallback
local UseRefFunction = ReactModule.useRef
local UseStateFunction = ReactModule.useState
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local View = FoundationModule.View
local _ = require(NotApprovedPage.Components.pageItemConfigs.PageItemConfigUtils)
local ReactivationCoachmarkModule = require(NotApprovedPage.Components.cta.ReactivationCoachmark)
local UseNotApprovedPageContextFunction = require(NotApprovedPage.Contexts.NotApprovedPageContext).useNotApprovedPageContext
local FFlagEnableNapReactivationNoticeModule = require(NotApprovedPage.Flags.FFlagEnableNapReactivationNotice)

return ReactModule.memo(function(p1)
	-- upvalues: UseNotApprovedPageContextFunction (copy), UseStateFunction (copy), UseRefFunction (copy), UseCallbackFunction (copy), FFlagEnableNapReactivationNoticeModule (copy), ReactModule (copy), View (copy), Button (copy), ButtonVariant (copy), InputSize (copy), ReactivationCoachmarkModule (copy)
	local Translations = UseNotApprovedPageContextFunction().translations
	local UseStateResult, UseStateResult2 = UseStateFunction(nil)
	local UseRefResult = UseRefFunction(nil)
	local UseCallbackResult = UseCallbackFunction(function(Current)
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy)
		UseRefResult.current = Current
		UseStateResult2(Current)
	end, {})
	
	return if FFlagEnableNapReactivationNoticeModule then ReactModule.createElement(View, {
		tag = "size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder or 1,
		ref = UseCallbackResult
	}, {
		Button = ReactModule.createElement(Button, {
			testId = "continue-button",
			text = Translations.continueButton,
			onActivated = p1.goToNextPage,
			variant = ButtonVariant.Emphasis,
			size = InputSize.Medium,
			isDisabled = p1.isDisabled or false,
			width = UDim.new(1, 0)
		}),
		Coachmark = UseStateResult and ReactModule.createElement(ReactivationCoachmarkModule, {
			moderationDetail = p1.moderationDetail,
			anchorRef = UseRefResult,
			hasNavigatedForward = p1.hasNavigatedForward
		})
	}) else ReactModule.createElement(Button, {
		testId = "continue-button",
		text = Translations.continueButton,
		onActivated = p1.goToNextPage,
		variant = ButtonVariant.Emphasis,
		size = InputSize.Medium,
		isDisabled = p1.isDisabled or false,
		width = UDim.new(1, 0),
		LayoutOrder = p1.layoutOrder or 1
	})
end)