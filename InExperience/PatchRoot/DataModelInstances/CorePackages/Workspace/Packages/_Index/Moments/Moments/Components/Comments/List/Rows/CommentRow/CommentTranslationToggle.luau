local Parent = script:FindFirstAncestor("Moments").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local config = {
	seeTranslation = "Feature.Moments.Action.CommentSeeTranslation",
	seeOriginal = "Feature.Moments.Action.CommentSeeOriginal"
}

local function _(p1)
	return if p1 == nil or p1 == "" then nil else p1
end

return ReactModule.memo(function(Frame)
	-- upvalues: UseLocalizationFunction (copy), config (copy), ReactModule (copy), FoundationModule (copy), InputSize (copy), ButtonVariant (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local SeeOriginal1 = nil
	
	if Frame.isShowingTranslation then
		local SeeOriginal = UseLocalizationResult.seeOriginal
		SeeOriginal1 = (if SeeOriginal == nil or SeeOriginal == "" then nil else SeeOriginal) or "See original"
	else
		local SeeTranslation = UseLocalizationResult.seeTranslation
		SeeOriginal1 = (if SeeTranslation == nil or SeeTranslation == "" then nil else SeeTranslation) or "See translation"
	end
	local OnToggleFunction = Frame.onToggle
	local CommentId = Frame.commentId
	
	return ReactModule.createElement(FoundationModule.Button, {
		text = SeeOriginal1,
		size = InputSize.XSmall,
		variant = ButtonVariant.Utility,
		onActivated = ReactModule.useCallback(function()
			-- upvalues: OnToggleFunction (copy), CommentId (copy)
			OnToggleFunction(CommentId)
		end, { OnToggleFunction, CommentId }),
		LayoutOrder = Frame.LayoutOrder,
		testId = `moments-comment-translation-toggle-{CommentId}`
	})
end)