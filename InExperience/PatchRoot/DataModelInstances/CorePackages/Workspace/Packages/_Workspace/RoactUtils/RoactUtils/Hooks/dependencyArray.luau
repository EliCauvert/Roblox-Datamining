local NilDependency = require(script:FindFirstAncestor("RoactUtils").Parent.AppCommonLib).Symbol.named("NilDependency")

return function(...) --[[ Line: 22 | Named "dependencyArray" ]]
	-- upvalues: NilDependency (copy)
	local t = {}
	
	for i = 1, select("#", ...) do
		local Selected = select(i, ...)
		
		if Selected == nil then
			Selected = NilDependency
		end
		t[i] = Selected
	end
	return t
end