local Parent = script.Parent.Parent.Parent
local React = require(Parent.dependencies).React
local UsePYMKCarouselUserButtonsModule = require(Parent.Components.PYMKCarouselUserTile.usePYMKCarouselUserButtons)
local EntityType = require(Parent.Parent.UserList).Enums.EntityType

return function(p1)
	-- upvalues: UsePYMKCarouselUserButtonsModule (copy), EntityType (copy), React (copy)
	local UsePYMKCarouselUserButtonsModuleResult = UsePYMKCarouselUserButtonsModule({
		userId = p1.entityId,
		showToast = p1.showToast,
		fireAnalyticsEvent = p1.fireAnalyticsEvent,
		absolutePosition = p1.absolutePosition,
		contactId = if p1.entityType == EntityType.Contact then p1.entityId else nil
	})
	
	return React.useMemo(function()
		-- upvalues: UsePYMKCarouselUserButtonsModuleResult (copy)
		local UsePYMKCarouselUserButtonsModuleResultResultEntry = UsePYMKCarouselUserButtonsModuleResult()[1]
		
		return if UsePYMKCarouselUserButtonsModuleResultResultEntry then {
			icon = nil,
			disabledReason = nil,
			type = UsePYMKCarouselUserButtonsModuleResultResultEntry.buttonType,
			onActivated = UsePYMKCarouselUserButtonsModuleResultResultEntry.onActivated,
			isDisabled = UsePYMKCarouselUserButtonsModuleResultResultEntry.isDisabled,
			isLoading = UsePYMKCarouselUserButtonsModuleResultResultEntry.isLoading,
			focusEventName = UsePYMKCarouselUserButtonsModuleResultResultEntry.focusEvent
		} else nil
	end, { UsePYMKCarouselUserButtonsModuleResult })
end