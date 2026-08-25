local reactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)

return function(p0)
	-- upvalues: reactModule (ref)
	local providers = p0.providers or {}
	local t = {
		PageWrapper = reactModule.createElement("Folder", {}, p0.children)
	}
	
	for i = #providers, 1, -1 do
		local var3 = providers[i]
		t = {
			ProviderChildren = reactModule.createElement(var3.class, var3.props, t)
		}
	end
	return reactModule.createElement("Folder", nil, t)
end