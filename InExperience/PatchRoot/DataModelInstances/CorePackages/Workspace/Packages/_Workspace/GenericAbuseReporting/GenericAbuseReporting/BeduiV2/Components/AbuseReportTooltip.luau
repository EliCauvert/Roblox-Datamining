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

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: useArTranslation (ref), reactModule (ref), coachmark (ref), popoverAlign (ref), popoverSide (ref), buttonVariant (ref)
	local translateIntoString = useArTranslation().translateIntoString
	
	return reactModule.createElement(coachmark, {
		title = translateIntoString(p0.tooltipTitle),
		text = translateIntoString(p0.tooltipText),
		isOpen = p0.isOpen,
		align = popoverAlign.End,
		side = popoverSide.Bottom,
		onClose = p0.onClose,
		actions = if p0.buttonLabel then {
			{
				text = translateIntoString(p0.buttonLabel),
				onActivated = reactModule.useCallback(function()
					-- upvalues: p0 (ref)
					p0.onClose()
				end, { p0.onClose }),
				variant = buttonVariant.Emphasis
			}
		} else nil,
		LayoutOrder = p0.layoutOrder,
		ref = p1
	}, p0.children)
end))