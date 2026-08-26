local reactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)

return function(p1)
	-- upvalues: reactModule (ref)
	local providers = p1.providers or {}
	local t = {
		PageWrapper = reactModule.createElement("Folder", {}, p1.children)
	}
	
	for i = #providers, 1, -1 do
		local var1 = providers[i]
		t = {
			ProviderChildren = reactModule.createElement(var1.class, var1.props, t)
		}
	end
	return reactModule.createElement("Folder", nil, t)
end