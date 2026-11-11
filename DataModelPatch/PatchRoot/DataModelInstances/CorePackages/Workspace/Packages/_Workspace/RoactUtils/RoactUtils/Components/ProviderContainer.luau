local ReactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)

return function(p1)
	-- upvalues: ReactModule (copy)
	local Providers = p1.providers or {}
	local config = {
		PageWrapper = ReactModule.createElement("Folder", {}, p1.children)
	}
	
	for i = #Providers, 1, -1 do
		local Provider = Providers[i]
		config = {
			ProviderChildren = ReactModule.createElement(Provider.class, Provider.props, config)
		}
	end
	return ReactModule.createElement("Folder", nil, config)
end