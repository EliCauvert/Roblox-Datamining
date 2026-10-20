local ToolsModule = require(script.tools)
local UAMCPModule = {}

for i, value in pairs(ToolsModule) do
	UAMCPModule[i] = function(p1)
		-- upvalues: value (copy)
		return value.call(p1 or {})
	end
end
function UAMCPModule.call(p1, p2)
	-- upvalues: ToolsModule (copy)
	local ToolsModuleEntry = ToolsModule[p1]
	
	return if ToolsModuleEntry then ToolsModuleEntry.call(p2 or {}) else "ERROR: unknown tool \"" .. tostring(p1) .. "\". Use help() to list tools."
end

return UAMCPModule