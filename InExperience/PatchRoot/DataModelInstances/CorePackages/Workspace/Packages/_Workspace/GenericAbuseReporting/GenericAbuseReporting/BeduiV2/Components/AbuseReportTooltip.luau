local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local buttonVariant = foundationModule.Enums.ButtonVariant
local coachmark = foundationModule.Coachmark
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide
local _ = require(genericAbuseReporting.BeduiV2.Utils.Translate.translate)
local useArTranslation = require(genericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).useArTranslation

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: useArTranslation (ref), reactModule (ref), coachmark (ref), popoverAlign (ref), popoverSide (ref), buttonVariant (ref)
	local translateIntoString = useArTranslation().translateIntoString
	
	return reactModule.createElement(coachmark, {
		title = translateIntoString(p1.tooltipTitle),
		text = translateIntoString(p1.tooltipText),
		isOpen = p1.isOpen,
		align = popoverAlign.End,
		side = popoverSide.Bottom,
		onClose = p1.onClose,
		actions = if p1.buttonLabel then {
			{
				text = translateIntoString(p1.buttonLabel),
				onActivated = reactModule.useCallback(function()
					-- upvalues: p1 (ref)
					p1.onClose()
				end, { p1.onClose }),
				variant = buttonVariant.Emphasis
			}
		} else nil,
		LayoutOrder = p1.layoutOrder,
		ref = p2
	}, p1.children)
end))