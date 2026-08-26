local parent = script:FindFirstAncestor("VirtualEvents").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local sduiLoadTimer = require(parent.SduiSharedUtilities).SduiLoadTimer
local fetchEventDetailsPageModule = require(script.Parent.fetchEventDetailsPage)

return function(p1, p2, p3)
	-- upvalues: sduiLoadTimer (ref), appPage (ref), fetchEventDetailsPageModule (ref)
	local var1 = sduiLoadTimer.createLoadTimer(appPage.EventDetails)
	var1.start("navigate")
	fetchEventDetailsPageModule(p2, var1)
	p1.navigate(appPage.EventDetails, {
		extraProps = { eventId = p2, pageTimer = var1, universeId = p3 }
	})
end