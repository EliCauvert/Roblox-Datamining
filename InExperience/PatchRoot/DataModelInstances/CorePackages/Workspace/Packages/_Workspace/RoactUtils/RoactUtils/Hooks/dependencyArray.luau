local nilDependency = require(script:FindFirstAncestor("RoactUtils").Parent.AppCommonLib).Symbol.named("NilDependency")

return function(...)
	-- upvalues: nilDependency (ref)
	local t = {}
	
	for i = 1, select("#", ...) do
		local var1 = select(i, ...)
		
		if var1 == nil then
			var1 = nilDependency
		end
		t[i] = var1
	end
	return t
end