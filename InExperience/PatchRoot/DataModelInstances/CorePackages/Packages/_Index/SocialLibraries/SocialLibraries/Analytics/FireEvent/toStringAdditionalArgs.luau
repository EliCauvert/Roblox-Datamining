local DependenciesModule = require(script.Parent.Parent.Parent.dependencies)
local Tutils = DependenciesModule.tutils
local Llama = DependenciesModule.llama

return function(p1)
	-- upvalues: Llama (copy), Tutils (copy)
	if Llama.isEmpty(p1) then
		return "{}"
	else
		local Replaced, _ = string.gsub(" args: " .. Tutils.toString(p1), "%s+", " ")
		
		return Replaced
	end
end