local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local useRoactService = require(parent_1.RobloxAppHooks).useRoactService
local roactNetworking = require(parent_1.RoactServiceTags).RoactNetworking
local reactModule = require(parent_1.React)
local useContext = reactModule.useContext
local useEventConnection = require(parent_1.ReactUtils).useEventConnection
local fetchEventDetailsModule = require(parent.Common.fetchEventDetails)
local serviceOverrideContextModule = require(parent.Components.CoreUI.ServiceOverrideContext)

return function(p0)
	-- upvalues: useRoactService (ref), roactNetworking (ref), useContext (ref), serviceOverrideContextModule (ref), reactModule (ref), fetchEventDetailsModule (ref), useEventConnection (ref)
	local var3 = useRoactService(roactNetworking)
	local socialService = useContext(serviceOverrideContextModule).socialService
	useEventConnection(socialService.ShowPromptRsvpToEvent, reactModule.useCallback(function(p1)
		-- upvalues: fetchEventDetailsModule (copy), var3 (ref), p0 (ref), socialService (ref)
		fetchEventDetailsModule(var3, p1):andThen(function(p2)
			-- upvalues: p0 (copy), p1 (ref)
			p0.openRsvpPrompt(p1, p2)
		end, function(p3)
			-- upvalues: socialService (copy), p1 (ref), p0 (copy)
			socialService:PromptRsvpToEventCompleted(p1, false, Enum.RsvpStatus.None)
			warn("Error fetching event details: ", p3)
			p0.closePrompt()
		end)
	end, { p0.openRsvpPrompt, var3 }))
	
	return reactModule.createElement(reactModule.Fragment, {}, {})
end