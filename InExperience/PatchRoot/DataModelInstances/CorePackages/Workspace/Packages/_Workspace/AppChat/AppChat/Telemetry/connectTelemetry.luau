local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UseTelemetryModule = require(AppChat.Telemetry.useTelemetry)

return function(p1) --[[ Line: 8 | Named "connectTelemetry" ]]
	-- upvalues: UseTelemetryModule (copy), ReactModule (copy), CryoModule (copy)
	return function(p2) --[[ Line: 9 ]]
		-- upvalues: UseTelemetryModule (upval), p1 (copy), ReactModule (upval), CryoModule (upval)
		return function(p3) --[[ Line: 10 ]]
			-- upvalues: UseTelemetryModule (upval), p1 (upval), ReactModule (upval), p2 (copy), CryoModule (upval)
			return ReactModule.createElement(p2, CryoModule.Dictionary.union(p3, { telemetry = UseTelemetryModule(p1) }))
		end
	end
end