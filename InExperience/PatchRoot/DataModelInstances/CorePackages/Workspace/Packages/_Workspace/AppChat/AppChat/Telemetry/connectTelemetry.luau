local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local useTelemetryModule = require(appChat.Telemetry.useTelemetry)

return function(p0)
	-- upvalues: useTelemetryModule (ref), reactModule (ref), cryoModule (ref)
	return function(p1)
		-- upvalues: useTelemetryModule (copy), p0 (ref), reactModule (copy), cryoModule (copy)
		return function(p2)
			-- upvalues: useTelemetryModule (copy), p0 (copy), reactModule (copy), p1 (ref), cryoModule (copy)
			return reactModule.createElement(p1, cryoModule.Dictionary.union(p2, { telemetry = useTelemetryModule(p0) }))
		end
	end
end