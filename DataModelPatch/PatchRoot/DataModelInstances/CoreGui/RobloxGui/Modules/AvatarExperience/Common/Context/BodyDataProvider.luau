local ReactModule = require(game:GetService("CorePackages").Packages.React)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local MakeEventsModule = require(Modules.AvatarExperience.Common.Util.makeEvents)
local BodyDataCallbacksContextModule = require(script.Parent.BodyDataCallbacksContext)
local BodyDataEventsContextModule = require(script.Parent.BodyDataEventsContext)
local List = { "setBodyColors" }

if require(Modules.AvatarExperience.Flags.FFlagAXFixBodyScaleReduxUpdates) then
	table.insert(List, "setAvatarScales")
end
return function(p1)
	-- upvalues: ReactModule (copy), MakeEventsModule (copy), List (copy), BodyDataCallbacksContextModule (copy), BodyDataEventsContextModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState({})
	ReactModule.useEffect(function()
		-- upvalues: MakeEventsModule (upval), List (upval), UseStateResult2 (copy), UseStateResult2_1 (copy)
		local EventsModule, EventsModule2, EventsModule3 = MakeEventsModule(List)
		UseStateResult2(EventsModule)
		UseStateResult2_1(EventsModule2)
		
		return function()
			-- upvalues: EventsModule3 (copy)
			for _, value in EventsModule3 do
				value()
			end
		end
	end, {})
	
	return ReactModule.createElement(BodyDataCallbacksContextModule.Provider, { value = UseStateResult1 }, {
		BodyDataEventsContextProvider = ReactModule.createElement(BodyDataEventsContextModule.Provider, { value = UseStateResult }, p1.children)
	})
end