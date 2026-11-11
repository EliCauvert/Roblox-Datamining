local RoactModule = require(game:GetService("CorePackages").Packages.Roact)

return function(p1)
	-- upvalues: RoactModule (copy)
	local Elements = {}
	
	for i, receiverComponent in ipairs(p1.receiverComponents) do
		Elements[i] = RoactModule.createElement(receiverComponent, {})
	end
	return RoactModule.createElement("Folder", {}, Elements)
end