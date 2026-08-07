local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local navigateToEventDetails = require(parent.VirtualEvents).navigateToEventDetails
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local fFlagLuaAppSduiEventDetailsEnabled = require(parent.SharedFlags).FFlagLuaAppSduiEventDetailsEnabled

return function(p0, p1, p2, _) --[[ line: 16 ]]
	-- upvalues: sduiErrorType (ref), fFlagLuaAppSduiEventDetailsEnabled (ref), navigateToEventDetails (ref), appPage (ref)
	local var1 = if p0 then p0.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = "OpenEventDetails",
			message = "Missing actionParams"
		}, p2.appPage)
		
		return
	end
	assert(var1, "actionParams must exist")
	local eventId = var1.eventId
	
	if eventId == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			name = "OpenEventDetails",
			message = "Missing eventId",
			propName = "eventId"
		}, p2.appPage)
		
		return
	end
	local universeId = var1.universeId or p1 and (p1.analyticsData and p1.analyticsData.universeId)
	local navigation = p2.dependencies.getNavigation()
	
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