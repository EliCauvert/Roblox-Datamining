local nilDependency = require(script:FindFirstAncestor("RoactUtils").Parent.AppCommonLib).Symbol.named("NilDependency")

return function(...)
	-- upvalues: nilDependency (ref)
	local t = {}
	
	for i = 1, select("#", ...) do
		local var2 = select(i, ...)
		
		if var2 == nil then
			var2 = nilDependency
		end
		t[i] = var2
	end
	return t
end