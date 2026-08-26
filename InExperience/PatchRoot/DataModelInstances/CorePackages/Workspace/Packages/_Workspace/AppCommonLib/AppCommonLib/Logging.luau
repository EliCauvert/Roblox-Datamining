game:DefineFastFlag("LoggingRethrowUsingError", false)

local function _()
	return game:GetFastFlag("LoggingRethrowUsingError")
end

local var1 = true
local t = {}

local function createLogInfo()
	local t = { warnings = {} }
	setmetatable(t, {
		__tostring = function(p1)
			return ("LogInfo\n\tWarnings (%d):\n\t\t%s"):format(#p1.warnings, table.concat(p1.warnings, "\n\t\t"))
		end
	})
	
	return t
end

return {
	capture = function(p1)
		-- upvalues: createLogInfo (ref), var1 (write), t (ref)
		local var2 = createLogInfo()
		var1 = false
		t[var2] = true
		local ok, status = pcall(p1)
		t[var2] = nil
		var1 = var1
		
		if game:GetFastFlag("LoggingRethrowUsingError") then
			if ok then
				return var2
			else
				error(status)
				
				return var2
			end
		else
			assert(ok, status)
		end
	end,
	warn = function(p1)
		-- upvalues: t (ref), var1 (write)
		for i in pairs(t) do
			table.insert(i.warnings, p1)
		end
		if var1 then
			warn(p1)
		end
	end
}