local parent = script:FindFirstAncestor("VirtualEvents").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiLoadTimer = require(parent.SduiSharedUtilities).SduiLoadTimer
local fetchEventDetailsPageModule = require(script.Parent.fetchEventDetailsPage)

return function(p0, p1, p2) --[[ line: 15 | named "navigateToEventDetails" ]]
	-- upvalues: sduiLoadTimer (ref), appPage (ref), fetchEventDetailsPageModule (ref)
	local var1 = sduiLoadTimer.createLoadTimer(appPage.EventDetails)
	var1.start("navigate")
	fetchEventDetailsPageModule(p1, var1)
	p0.navigate(appPage.EventDetails, {
		extraProps = { eventId = p1, pageTimer = var1, universeId = p2 }
	})
end