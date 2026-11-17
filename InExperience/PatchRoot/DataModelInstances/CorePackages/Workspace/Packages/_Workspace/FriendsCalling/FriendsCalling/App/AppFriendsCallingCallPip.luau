local FriendsCalling = script:FindFirstAncestor("FriendsCalling")
local ReactModule = require(FriendsCalling.Parent.React)
local CallPipModule = require(FriendsCalling.Components.CallPip.CallPip)
local Host = {
	isInExperience = false,
	followsAppColorMode = true,
	displayOrder = require(FriendsCalling.CallPipDisplayOrder).InApp
}

return function()
	-- upvalues: ReactModule (copy), CallPipModule (copy), Host (copy)
	return ReactModule.createElement(CallPipModule, { host = Host })
end