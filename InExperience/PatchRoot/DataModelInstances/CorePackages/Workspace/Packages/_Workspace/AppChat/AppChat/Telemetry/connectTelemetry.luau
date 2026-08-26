local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local useTelemetryModule = require(appChat.Telemetry.useTelemetry)

return function(p1)
	-- upvalues: useTelemetryModule (ref), reactModule (ref), cryoModule (ref)
	return function(p2)
		-- upvalues: useTelemetryModule (copy), p1 (ref), reactModule (copy), cryoModule (copy)
		return function(p3)
			-- upvalues: useTelemetryModule (copy), p1 (copy), reactModule (copy), p2 (ref), cryoModule (copy)
			return reactModule.createElement(p2, cryoModule.Dictionary.union(p3, { telemetry = useTelemetryModule(p1) }))
		end
	end
end