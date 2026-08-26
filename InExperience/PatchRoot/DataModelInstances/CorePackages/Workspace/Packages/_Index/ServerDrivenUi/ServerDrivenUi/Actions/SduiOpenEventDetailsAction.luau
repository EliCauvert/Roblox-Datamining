local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local navigateToEventDetails = require(parent.VirtualEvents).navigateToEventDetails
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local fFlagLuaAppSduiEventDetailsEnabled = require(parent.SharedFlags).FFlagLuaAppSduiEventDetailsEnabled

return function(p1, p2, p3, _)
	-- upvalues: sduiErrorType (ref), fFlagLuaAppSduiEventDetailsEnabled (ref), navigateToEventDetails (ref), appPage (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = "OpenEventDetails",
			message = "Missing actionParams"
		}, p3.appPage)
		
		return
	end
	assert(var1, "actionParams must exist")
	local eventId = var1.eventId
	
	if eventId == nil then
		p3.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = "OpenEventDetails",
			message = "Missing eventId",
			propName = "eventId"
		}, p3.appPage)
		
		return
	end
	local universeId = var1.universeId or p2 and (p2.analyticsData and p2.analyticsData.universeId)
	local navigation = p3.dependencies.getNavigation()
	
	if fFlagLuaAppSduiEventDetailsEnabled then
		navigateToEventDetails(navigation, tostring(eventId), if universeId then tostring(universeId) else nil)
		
		return
	end
	navigation.navigate(appPage.EventDetails, {
		extraProps = {
			currentTime = DateTime.now(),
			virtualEventId = tostring(eventId)
		}
	})
end