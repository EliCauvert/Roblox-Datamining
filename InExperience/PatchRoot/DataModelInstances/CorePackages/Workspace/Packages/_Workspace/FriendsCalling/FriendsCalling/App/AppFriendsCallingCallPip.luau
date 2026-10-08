local friendsCalling = script:FindFirstAncestor("FriendsCalling")
local reactModule = require(friendsCalling.Parent.React)
local callPipModule = require(friendsCalling.Components.CallPip.CallPip)
local t = {
	exposesTopSafeArea = false,
	followsAppColorMode = true,
	displayOrder = require(friendsCalling.CallPipDisplayOrder).InApp,
	screenInsets = Enum.ScreenInsets.None
}

return function()
	-- upvalues: reactModule (ref), callPipModule (ref), t (ref)
	return reactModule.createElement(callPipModule, { host = t })
end