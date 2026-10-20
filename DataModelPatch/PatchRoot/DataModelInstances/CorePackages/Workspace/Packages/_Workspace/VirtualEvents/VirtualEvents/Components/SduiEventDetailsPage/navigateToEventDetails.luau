local Parent = script:FindFirstAncestor("VirtualEvents").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiLoadTimer = require(Parent.SduiSharedUtilities).SduiLoadTimer
local FetchEventDetailsPageModule = require(script.Parent.fetchEventDetailsPage)

return function(p1, EventId, UniverseId)
	-- upvalues: SduiLoadTimer (copy), AppPage (copy), FetchEventDetailsPageModule (copy)
	local LoadTimer = SduiLoadTimer.createLoadTimer(AppPage.EventDetails)
	LoadTimer.start("navigate")
	FetchEventDetailsPageModule(EventId, LoadTimer)
	p1.navigate(AppPage.EventDetails, {
		extraProps = {
			eventId = EventId,
			pageTimer = LoadTimer,
			universeId = UniverseId
		}
	})
end