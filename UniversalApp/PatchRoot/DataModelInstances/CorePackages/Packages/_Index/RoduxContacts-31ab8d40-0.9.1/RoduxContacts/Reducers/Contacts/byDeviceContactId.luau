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

return function(_) --[[ line: 14 ]]
	-- upvalues: roduxModule (ref), t (ref), deviceContactsReceived (ref), dashModule (ref), deviceContactModule (ref)
	return roduxModule.createReducer(t, {
		[deviceContactsReceived.name] = function(_, p0) --[[ line: 16 ]]
			-- upvalues: dashModule (copy), deviceContactModule (copy)
			local t = {}
			dashModule.forEach(p0.payload, function(p1) --[[ line: 22 ]]
				-- upvalues: deviceContactModule (copy), t (ref)
				local var5 = deviceContactModule.formatFromDevice(p1)
				t[var5.id] = var5
			end)
			
			return t
		end
	})
end