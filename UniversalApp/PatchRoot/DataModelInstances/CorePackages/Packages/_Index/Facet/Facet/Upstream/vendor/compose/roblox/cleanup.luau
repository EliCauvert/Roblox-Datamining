local CoreModule = require("../core")
local EngineModule = require("./engine")

local function cleanupWith(Callback, p1)
	-- upvalues: CoreModule (copy), EngineModule (copy)
	local CallbackResult = Callback(p1)
	
	if CallbackResult == "RBXScriptConnection" then
		return CoreModule.cleanup(function()
			-- upvalues: EngineModule (upval), p1 (copy)
			EngineModule.invoke(EngineModule.readMember, p1, "Disconnect")
		end)
	elseif type(p1) == "thread" then
		return CoreModule.cleanup(function()
			-- upvalues: EngineModule (upval), p1 (copy)
			EngineModule.cancelThread(p1)
		end)
	elseif CallbackResult == "Instance" then
		return CoreModule.cleanup(function()
			-- upvalues: EngineModule (upval), p1 (copy)
			EngineModule.invoke(EngineModule.readMember, p1, "Destroy")
		end)
	elseif CallbackResult == "table" then
		if type(EngineModule.readMember(p1, "Disconnect")) == "function" then
			return CoreModule.cleanup(function()
				-- upvalues: EngineModule (upval), p1 (copy)
				EngineModule.invoke(EngineModule.readMember, p1, "Disconnect")
			end)
		elseif type(EngineModule.readMember(p1, "disconnect")) == "function" then
			return CoreModule.cleanup(function()
				-- upvalues: EngineModule (upval), p1 (copy)
				EngineModule.invoke(EngineModule.readMember, p1, "disconnect")
			end)
		end
	end
	return CoreModule.cleanup(p1)
end

local v1 = nil

v1 = function(p1): string
	return (typeof(p1))
end

return {
	createCleanup = function(p1)
		-- upvalues: cleanupWith (copy)
		local v2 = nil
		v2 = if p1 == nil then function(p2): string
			return (typeof(p2))
		end else p1
		
		return function(p2)
			-- upvalues: cleanupWith (upval), v2 (ref)
			return cleanupWith(v2, p2)
		end
	end,
	cleanup = function(p1)
		-- upvalues: cleanupWith (copy), v1 (ref)
		return cleanupWith(v1, p1)
	end
}