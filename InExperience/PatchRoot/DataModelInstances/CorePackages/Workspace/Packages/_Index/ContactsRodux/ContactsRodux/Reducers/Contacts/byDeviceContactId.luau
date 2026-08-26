local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local types = parent.Types
local roduxModule = require(parent_1.Rodux)
local _ = require(types.ReducerTypes)
local _ = require(types.ActionTypes)
local deviceContactsReceived = require(parent.Actions).DeviceContactsReceived
local dashModule = require(parent_1.Dash)
local deviceContactModule = require(parent.Models.DeviceContact)
local t = {}

return function(_)
	-- upvalues: roduxModule (ref), t (ref), deviceContactsReceived (ref), dashModule (ref), deviceContactModule (ref)
	return roduxModule.createReducer(t, {
		[deviceContactsReceived.name] = function(_, p1)
			-- upvalues: dashModule (copy), deviceContactModule (copy)
			local t = {}
			dashModule.forEach(p1.payload, function(p2)
				-- upvalues: deviceContactModule (copy), t (ref)
				local var1 = deviceContactModule.formatFromDevice(p2)
				t[var1.id] = var1
			end)
			
			return t
		end
	})
end