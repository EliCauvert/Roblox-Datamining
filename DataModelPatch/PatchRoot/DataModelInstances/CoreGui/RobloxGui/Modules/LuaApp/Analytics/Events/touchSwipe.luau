local ArgCheckModule = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck)
local config = {
	[Enum.SwipeDirection.Up] = "up",
	[Enum.SwipeDirection.Right] = "right",
	[Enum.SwipeDirection.Down] = "down",
	[Enum.SwipeDirection.Left] = "left"
}

return function(p1, p2, Elt, p3, Cstm)
	-- upvalues: ArgCheckModule (copy), config (copy)
	ArgCheckModule.isType(p2, "string", "eventContext")
	ArgCheckModule.isType(Elt, "string", "elementName")
	local config1 = { elt = Elt, dir = config[p3] }
	
	if Cstm ~= nil then
		ArgCheckModule.isType(Cstm, "string", "extraData")
		config1.cstm = Cstm
	end
	p1:setRBXEventStream(p2, "touchSwipe", config1)
end