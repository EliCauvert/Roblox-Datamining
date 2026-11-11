local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Coachmark = FoundationModule.Coachmark
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide
local _ = require(GenericAbuseReporting.BeduiV2.Utils.Translate.translate)
local UseArTranslationFunction = require(GenericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).useArTranslation

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseArTranslationFunction (copy), ReactModule (copy), Coachmark (copy), PopoverAlign (copy), PopoverSide (copy), ButtonVariant (copy)
	local TranslateIntoStringFunction = UseArTranslationFunction().translateIntoString
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		p1.onClose()
	end, { p1.onClose })
	
	return ReactModule.createElement(Coachmark, {
		title = TranslateIntoStringFunction(p1.tooltipTitle),
		text = TranslateIntoStringFunction(p1.tooltipText),
		isOpen = p1.isOpen,
		align = PopoverAlign.End,
		side = PopoverSide.Bottom,
		onClose = p1.onClose,
		actions = if p1.buttonLabel then {
			{
				text = TranslateIntoStringFunction(p1.buttonLabel),
				onActivated = UseResult,
				variant = ButtonVariant.Emphasis
			}
		} else nil,
		LayoutOrder = p1.layoutOrder,
		ref = Ref
	}, p1.children)
end))