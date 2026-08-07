game:DefineFastFlag("LoggingRethrowUsingError", false)

local function _() --[[ line: 8 | named "GetFFlagLoggingRethrowUsingError" ]]
	return game:GetFastFlag("LoggingRethrowUsingError")
end

local var0 = true
local t = {}

local function createLogInfo() --[[ line: 15 ]]
	local t = { warnings = {} }
	setmetatable(t, {
		__tostring = function(p0) --[[ line: 21 ]]
			return ("LogInfo\n\tWarnings (%d):\n\t\t%s"):format(#p0.warnings, table.concat(p0.warnings, "\n\t\t"))
		end
	})
	
	return t
end

return {
	capture = function(p1) --[[ line: 31 ]]
		-- upvalues: createLogInfo (ref), var0 (write), t (ref)
		local var4 = createLogInfo()
		var0 = false
		t[var4] = true
		local ok, status = pcall(p1)
		t[var4] = nil
		var0 = var0
		
		if game:GetFastFlag("LoggingRethrowUsingError") then
			if ok then
				return var4
			else
				error(status)
				
				return var4
			end
		else
			assert(ok, status)
		end
	end,
	warn = function(p2) --[[ line: 54 ]]
		-- upvalues: t (ref), var0 (write)
		for i in pairs(t) do
			table.insert(i.warnings, p2)
		end
		if var0 then
			warn(p2)
		end
	end
}