local ReactModule = require(script:FindFirstAncestor("InputUi").Parent.React)
local Players = game:GetService("Players")
local ThirdPartyUserService = nil
pcall(function()
	-- upvalues: ThirdPartyUserService (ref)
	ThirdPartyUserService = game:GetService("ThirdPartyUserService")
end)
local GamepadDisconnectedModalViewModule = require(script.Parent.GamepadDisconnectedModalView)

local function _()
	-- upvalues: ThirdPartyUserService (ref), Players (copy)
	local UserPlatformName = if ThirdPartyUserService then ThirdPartyUserService:GetUserPlatformName() else ""
	
	if UserPlatformName == "" or UserPlatformName == nil then
		local LocalPlayer = Players.LocalPlayer
		
		if LocalPlayer then
			UserPlatformName = LocalPlayer.DisplayName or LocalPlayer.Name
		end
	end
	return UserPlatformName or ""
end

return function(_)
	-- upvalues: ThirdPartyUserService (ref), Players (copy), ReactModule (copy), GamepadDisconnectedModalViewModule (copy)
	local UserPlatformName = if ThirdPartyUserService then ThirdPartyUserService:GetUserPlatformName() else ""
	
	if UserPlatformName == "" or UserPlatformName == nil then
		local LocalPlayer = Players.LocalPlayer
		
		if LocalPlayer then
			UserPlatformName = LocalPlayer.DisplayName or LocalPlayer.Name
		end
	end
	return ReactModule.createElement(GamepadDisconnectedModalViewModule, { username = UserPlatformName or "" })
end