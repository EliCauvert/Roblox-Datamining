local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local foundationModule = require(parent_2.Foundation)
local reactModule = require(parent_2.React)
local _ = require(parent_1.Utils.createCoachmarkImpressionCache)
local usePersistentCoachmarkViewModelModule = require(parent.usePersistentCoachmarkViewModel)
local educationalTooltip = foundationModule.EducationalTooltip

return function(p1)
	-- upvalues: usePersistentCoachmarkViewModelModule (ref), reactModule (ref), educationalTooltip (ref), foundationModule (ref)
	local var1 = usePersistentCoachmarkViewModelModule({
		impressionCache = p1.impressionCache,
		maxImpressions = p1.maxImpressions,
		autoDismissSeconds = p1.autoDismissSeconds,
		isSessionHandled = p1.isSessionHandled,
		onSessionHandled = p1.onSessionHandled,
		onImpression = p1.onImpression,
		onDismissed = p1.onDismissed
	})
	
	return reactModule.createElement(educationalTooltip, {
		LayoutOrder = p1.layoutOrder,
		isOpen = var1.isOpen,
		onClose = var1.onClose,
		side = p1.side or foundationModule.Enums.PopoverSide.Bottom,
		align = p1.align or foundationModule.Enums.PopoverAlign.End,
		title = p1.title,
		text = p1.text
	}, p1.children)
end