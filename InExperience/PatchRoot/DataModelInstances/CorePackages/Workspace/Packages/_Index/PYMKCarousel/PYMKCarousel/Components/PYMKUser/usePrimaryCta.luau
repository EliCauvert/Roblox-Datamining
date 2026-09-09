local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local react = require(parent.dependencies).React
local usePYMKCarouselUserButtonsModule = require(parent.Components.PYMKUser.usePYMKCarouselUserButtons)
local _ = require(parent.Common.DirectRecommendationTypes)
local fFlagLuaAppEnableSduiHomePage = require(parent_1.SharedFlags).FFlagLuaAppEnableSduiHomePage
local entityType = require(parent_1.UserList).Enums.EntityType

return function(p1)
	-- upvalues: usePYMKCarouselUserButtonsModule (ref), entityType (ref), fFlagLuaAppEnableSduiHomePage (ref), react (ref)
	local var1 = usePYMKCarouselUserButtonsModule({
		userId = p1.entityId,
		showToast = p1.showToast,
		fireAnalyticsEvent = p1.fireAnalyticsEvent,
		absolutePosition = p1.absolutePosition,
		contactId = if p1.entityType == entityType.Contact then p1.entityId else nil,
		recommendation = if fFlagLuaAppEnableSduiHomePage then p1.recommendation else nil
	})
	
	return react.useMemo(function()
		-- upvalues: var1 (ref)
		local var2 = var1()[1]
		
		return if var2 then {
			icon = nil,
			disabledReason = nil,
			type = var2.buttonType,
			onActivated = var2.onActivated,
			isDisabled = var2.isDisabled,
			isLoading = var2.isLoading,
			focusEventName = var2.focusEvent
		} else nil
	end, { var1 })
end