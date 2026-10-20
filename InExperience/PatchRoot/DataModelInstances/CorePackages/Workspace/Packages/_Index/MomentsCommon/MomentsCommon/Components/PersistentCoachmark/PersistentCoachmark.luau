local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local FoundationModule = require(Parent2.Foundation)
local ReactModule = require(Parent2.React)
local _ = require(Parent1.Utils.createCoachmarkImpressionCache)
local UsePersistentCoachmarkViewModelModule = require(Parent.usePersistentCoachmarkViewModel)
local EducationalTooltip = FoundationModule.EducationalTooltip

return function(p1) --[[ Line: 42 | Named "PersistentCoachmark" ]]
	-- upvalues: UsePersistentCoachmarkViewModelModule (copy), ReactModule (copy), EducationalTooltip (copy), FoundationModule (copy)
	local UsePersistentCoachmarkViewModelModuleResult = UsePersistentCoachmarkViewModelModule({
		impressionCache = p1.impressionCache,
		maxImpressions = p1.maxImpressions,
		autoDismissSeconds = p1.autoDismissSeconds,
		isSessionHandled = p1.isSessionHandled,
		onSessionHandled = p1.onSessionHandled,
		onImpression = p1.onImpression,
		onDismissed = p1.onDismissed
	})
	
	return ReactModule.createElement(EducationalTooltip, {
		LayoutOrder = p1.layoutOrder,
		isOpen = UsePersistentCoachmarkViewModelModuleResult.isOpen and not p1.hidden,
		onClose = UsePersistentCoachmarkViewModelModuleResult.onClose,
		side = p1.side or FoundationModule.Enums.PopoverSide.Bottom,
		align = p1.align or FoundationModule.Enums.PopoverAlign.End,
		title = p1.title,
		text = p1.text
	}, p1.children)
end