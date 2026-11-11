local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local UseRoactServiceFunction = require(Parent1.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent1.RoactServiceTags).RoactNetworking
local ReactModule = require(Parent1.React)
local UseContextFunction = ReactModule.useContext
local UseEventConnectionFunction = require(Parent1.ReactUtils).useEventConnection
local FetchEventDetailsModule = require(Parent.Common.fetchEventDetails)
local ServiceOverrideContextModule = require(Parent.Components.CoreUI.ServiceOverrideContext)

return function(p1)
	-- upvalues: UseRoactServiceFunction (copy), RoactNetworking (copy), UseContextFunction (copy), ServiceOverrideContextModule (copy), ReactModule (copy), FetchEventDetailsModule (copy), UseEventConnectionFunction (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local SocialService = UseContextFunction(ServiceOverrideContextModule).socialService
	UseEventConnectionFunction(SocialService.ShowPromptRsvpToEvent, (ReactModule.useCallback(function(EventId)
		-- upvalues: FetchEventDetailsModule (upval), UseRoactServiceResult (copy), p1 (copy), SocialService (copy)
		FetchEventDetailsModule(UseRoactServiceResult, EventId):andThen(function(Result)
			-- upvalues: p1 (upval), EventId (copy)
			p1.openRsvpPrompt(EventId, Result)
		end, function(p2)
			-- upvalues: SocialService (upval), EventId (copy), p1 (upval)
			SocialService:PromptRsvpToEventCompleted(EventId, false, Enum.RsvpStatus.None)
			warn("Error fetching event details: ", p2)
			p1.closePrompt()
		end)
	end, { p1.openRsvpPrompt, UseRoactServiceResult })))
	
	return ReactModule.createElement(ReactModule.Fragment, {}, {})
end