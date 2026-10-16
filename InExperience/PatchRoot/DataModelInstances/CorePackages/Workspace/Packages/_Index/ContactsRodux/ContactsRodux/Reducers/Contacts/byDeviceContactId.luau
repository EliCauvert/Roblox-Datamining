local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local Types = Parent.Types
local RoduxModule = require(Parent1.Rodux)
local _ = require(Types.ReducerTypes)
local _ = require(Types.ActionTypes)
local DeviceContactsReceived = require(Parent.Actions).DeviceContactsReceived
local DashModule = require(Parent1.Dash)
local DeviceContactModule = require(Parent.Models.DeviceContact)
local t = {}

return function(_) --[[ Line: 14 ]]
	-- upvalues: RoduxModule (copy), t (copy), DeviceContactsReceived (copy), DashModule (copy), DeviceContactModule (copy)
	return RoduxModule.createReducer(t, {
		[DeviceContactsReceived.name] = function(_, p1) --[[ Line: 16 ]]
			-- upvalues: DashModule (upval), DeviceContactModule (upval)
			local FormatFromDeviceResults = {}
			DashModule.forEach(p1.payload, function(p2) --[[ Line: 22 ]]
				-- upvalues: DeviceContactModule (upval), FormatFromDeviceResults (copy)
				local FormatFromDeviceResult = DeviceContactModule.formatFromDevice(p2)
				FormatFromDeviceResults[FormatFromDeviceResult.id] = FormatFromDeviceResult
			end)
			
			return FormatFromDeviceResults
		end
	})
end