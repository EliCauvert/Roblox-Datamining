local FriendsCalling = script:FindFirstAncestor("FriendsCalling")
local ReactModule = require(FriendsCalling.Parent.React)
local CallPipModule = require(FriendsCalling.Components.CallPip.CallPip)
local Host = {
	exposesTopSafeArea = false,
	followsAppColorMode = true,
	displayOrder = require(FriendsCalling.CallPipDisplayOrder).InApp,
	screenInsets = Enum.ScreenInsets.None
}

return function() --[[ Line: 17 | Named "AppFriendsCallingCallPip" ]]
	-- upvalues: ReactModule (copy), CallPipModule (copy), Host (copy)
	return ReactModule.createElement(CallPipModule, { host = Host })
end