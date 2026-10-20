local RoactModule = require(game:GetService("CorePackages").Packages.Roact)

return function(p1)
	-- upvalues: RoactModule (copy)
	local RobloxEventReceiver = p1.RobloxEventReceiver
	local Elements = {}
	
	for i, receiverComponent in p1.receiverComponents do
		Elements[i] = RoactModule.createElement(receiverComponent, { RobloxEventReceiver = RobloxEventReceiver })
	end
	return RoactModule.createElement("Folder", {}, Elements)
end