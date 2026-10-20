local ReactModule = require(game:GetService("CorePackages").Packages.React)
local MakeEventsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Util.makeEvents)
local AdjustmentDataCallbacksContextModule = require(script.Parent.AdjustmentDataCallbacksContext)
local AdjustmentDataEventsContextModule = require(script.Parent.AdjustmentDataEventsContext)

return function(p1)
	-- upvalues: ReactModule (copy), MakeEventsModule (copy), AdjustmentDataCallbacksContextModule (copy), AdjustmentDataEventsContextModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState({})
	ReactModule.useEffect(function()
		-- upvalues: MakeEventsModule (upval), UseStateResult2 (copy), UseStateResult2_1 (copy)
		local EventsModule, EventsModule2, EventsModule3 = MakeEventsModule({ "setAdjustments" })
		UseStateResult2(EventsModule)
		UseStateResult2_1(EventsModule2)
		
		return function()
			-- upvalues: EventsModule3 (copy)
			for _, value in EventsModule3 do
				value()
			end
		end
	end, {})
	
	return ReactModule.createElement(AdjustmentDataCallbacksContextModule.Provider, { value = UseStateResult1 }, {
		AdjustmentDataEventsContextProvider = ReactModule.createElement(AdjustmentDataEventsContextModule.Provider, { value = UseStateResult }, p1.children)
	})
end