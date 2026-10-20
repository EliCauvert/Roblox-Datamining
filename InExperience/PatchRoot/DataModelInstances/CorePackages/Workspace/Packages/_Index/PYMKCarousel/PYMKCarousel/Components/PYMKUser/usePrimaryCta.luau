local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local React = require(Parent.dependencies).React
local UsePYMKCarouselUserButtonsModule = require(Parent.Components.PYMKUser.usePYMKCarouselUserButtons)
local _ = require(Parent.Common.DirectRecommendationTypes)
local FFlagLuaAppEnableSduiHomePage = require(Parent1.SharedFlags).FFlagLuaAppEnableSduiHomePage
local EntityType = require(Parent1.UserList).Enums.EntityType

return function(p1)
	-- upvalues: UsePYMKCarouselUserButtonsModule (copy), EntityType (copy), FFlagLuaAppEnableSduiHomePage (copy), React (copy)
	local UsePYMKCarouselUserButtonsModuleResult = UsePYMKCarouselUserButtonsModule({
		userId = p1.entityId,
		showToast = p1.showToast,
		fireAnalyticsEvent = p1.fireAnalyticsEvent,
		absolutePosition = p1.absolutePosition,
		contactId = if p1.entityType == EntityType.Contact then p1.entityId else nil,
		recommendation = if FFlagLuaAppEnableSduiHomePage then p1.recommendation else nil
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