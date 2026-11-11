game:DefineFastFlag("LoggingRethrowUsingError", false)

local function _()
	return game:GetFastFlag("LoggingRethrowUsingError")
end

local Flag = true
local t = {}

local function createLogInfo()
	local config = { warnings = {} }
	setmetatable(config, {
		__tostring = function(p1): string
			return ("LogInfo\n\tWarnings (%d):\n\t\t%s"):format(#p1.warnings, table.concat(p1.warnings, "\n\t\t"))
		end
	})
	
	return config
end

return {
	capture = function(p1)
		-- upvalues: createLogInfo (copy), Flag (ref), t (copy)
		local LogInfo = createLogInfo()
		local Flag1: boolean = Flag
		Flag = false
		t[LogInfo] = true
		local Success, Result = pcall(p1)
		t[LogInfo] = nil
		Flag = Flag1
		
		if not game:GetFastFlag("LoggingRethrowUsingError") then
			assert(Success, Result)
		elseif not Success then
			error(Result)
			
			return LogInfo
		end
		return LogInfo
	end,
	warn = function(p1)
		-- upvalues: t (copy), Flag (ref)
		for i in pairs(t) do
			table.insert(i.warnings, p1)
		end
		if Flag then
			warn(p1)
		end
	end
}