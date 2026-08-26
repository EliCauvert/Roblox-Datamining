local dependenciesModule = require(script.Parent.Parent.Parent.dependencies)
local tutils = dependenciesModule.tutils
local llama = dependenciesModule.llama

return function(p1)
	-- upvalues: llama (ref), tutils (ref)
	if llama.isEmpty(p1) then
		return "{}"
	end
	local replaced, _ = string.gsub(" args: " .. tutils.toString(p1), "%s+", " ")
	
	return replaced
end