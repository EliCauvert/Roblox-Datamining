local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local NavigateToEventDetailsFunction = require(Parent.VirtualEvents).navigateToEventDetails
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiErrorType = require(Parent.SduiCoreSystem).SduiErrors.SduiErrorType
local FFlagLuaAppSduiEventDetailsEnabled = require(Parent.SharedFlags).FFlagLuaAppSduiEventDetailsEnabled

return function(p1, p2, p3, _) --[[ Line: 16 ]]
	-- upvalues: SduiErrorType (copy), FFlagLuaAppSduiEventDetailsEnabled (copy), NavigateToEventDetailsFunction (copy), AppPage (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = "OpenEventDetails",
			message = "Missing actionParams"
		}, p3.appPage)
		
		return
	end
	assert(ActionParams, "actionParams must exist")
	local EventId = ActionParams.eventId
	
	if EventId == nil then
		p3.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			name = "OpenEventDetails",
			message = "Missing eventId",
			propName = "eventId"
		}, p3.appPage)
		
		return
	end
	local UniverseId = ActionParams.universeId or p2 and (p2.analyticsData and p2.analyticsData.universeId)
	local Navigation = p3.dependencies.getNavigation()
	
	if FFlagLuaAppSduiEventDetailsEnabled then
		NavigateToEventDetailsFunction(Navigation, tostring(EventId), if UniverseId then tostring(UniverseId) else nil)
		
		return
	else
		Navigation.navigate(AppPage.EventDetails, {
			extraProps = {
				currentTime = DateTime.now(),
				virtualEventId = tostring(EventId)
			}
		})
	end
end