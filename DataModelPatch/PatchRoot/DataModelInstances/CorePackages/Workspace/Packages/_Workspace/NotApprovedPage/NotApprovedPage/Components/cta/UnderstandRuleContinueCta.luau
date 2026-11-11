local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local Parent = NotApprovedPage.Parent
local ReactModule = require(Parent.React)
local Fragment = ReactModule.Fragment
local UseStateFunction = ReactModule.useState
local UseCallbackFunction = ReactModule.useCallback
local FoundationModule = require(Parent.Foundation)
local Checkbox = FoundationModule.Checkbox
local InputSize = FoundationModule.Enums.InputSize
local ContinueButtonCtaModule = require(NotApprovedPage.Components.cta.ContinueButtonCta)
local _ = require(NotApprovedPage.Components.pageItemConfigs.PageItemConfigUtils)
local UseNotApprovedPageContextFunction = require(NotApprovedPage.Contexts.NotApprovedPageContext).useNotApprovedPageContext

return ReactModule.memo(function(p1)
	-- upvalues: UseNotApprovedPageContextFunction (copy), UseStateFunction (copy), UseCallbackFunction (copy), ReactModule (copy), Fragment (copy), Checkbox (copy), InputSize (copy), ContinueButtonCtaModule (copy)
	local Translations = UseNotApprovedPageContextFunction().translations
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	
	return ReactModule.createElement(Fragment, nil, {
		AcknowledgementCheckbox = ReactModule.createElement(Checkbox, {
			LayoutOrder = 1,
			isChecked = UseStateResult,
			size = InputSize.Small,
			onActivated = UseCallbackFunction(function(p2)
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(p2)
			end, {}),
			label = Translations.acknowledgementCheckboxLabel
		}),
		ContinueButton = ReactModule.createElement(ContinueButtonCtaModule, {
			layoutOrder = 2,
			moderationDetail = p1.moderationDetail,
			dispatch = p1.dispatch,
			isDisabled = not UseStateResult,
			LogoutThunk = p1.LogoutThunk,
			goToNextPage = p1.goToNextPage,
			hasNavigatedForward = p1.hasNavigatedForward
		})
	})
end)