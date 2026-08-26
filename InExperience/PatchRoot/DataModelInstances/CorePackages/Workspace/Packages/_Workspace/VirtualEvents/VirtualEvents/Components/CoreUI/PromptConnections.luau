local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local useRoactService = require(parent_1.RobloxAppHooks).useRoactService
local roactNetworking = require(parent_1.RoactServiceTags).RoactNetworking
local reactModule = require(parent_1.React)
local useContext = reactModule.useContext
local useEventConnection = require(parent_1.ReactUtils).useEventConnection
local fetchEventDetailsModule = require(parent.Common.fetchEventDetails)
local serviceOverrideContextModule = require(parent.Components.CoreUI.ServiceOverrideContext)

return function(p1)
	-- upvalues: useRoactService (ref), roactNetworking (ref), useContext (ref), serviceOverrideContextModule (ref), reactModule (ref), fetchEventDetailsModule (ref), useEventConnection (ref)
	local var1 = useRoactService(roactNetworking)
	local socialService = useContext(serviceOverrideContextModule).socialService
	useEventConnection(socialService.ShowPromptRsvpToEvent, reactModule.useCallback(function(p2)
		-- upvalues: fetchEventDetailsModule (copy), var1 (ref), p1 (ref), socialService (ref)
		fetchEventDetailsModule(var1, p2):andThen(function(p3)
			-- upvalues: p1 (copy), p2 (ref)
			p1.openRsvpPrompt(p2, p3)
		end, function(p3)
			-- upvalues: socialService (copy), p2 (ref), p1 (copy)
			socialService:PromptRsvpToEventCompleted(p2, false, Enum.RsvpStatus.None)
			warn("Error fetching event details: ", p3)
			p1.closePrompt()
		end)
	end, { p1.openRsvpPrompt, var1 }))
	
	return reactModule.createElement(reactModule.Fragment, {}, {})
end