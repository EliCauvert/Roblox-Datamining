local reactModule = require(script:FindFirstAncestor("InputUi").Parent.React)
local playersService = game:GetService("Players")
local var2 = nil
pcall(function()
	-- upvalues: var2 (write)
	var2 = game:GetService("ThirdPartyUserService")
end)
local gamepadDisconnectedModalViewModule = require(script.Parent.GamepadDisconnectedModalView)

local function _()
	-- upvalues: var2 (write), playersService (ref)
	local var4 = if var2 then var2:GetUserPlatformName() else ""
	
	if var4 == "" or var4 == nil then
		local localPlayer = playersService.LocalPlayer
		
		if localPlayer then
			var4 = localPlayer.DisplayName or localPlayer.Name
		end
	end
	return var4 or ""
end

return function(_)
	-- upvalues: var2 (write), playersService (ref), reactModule (ref), gamepadDisconnectedModalViewModule (ref)
	local var5 = if var2 then var2:GetUserPlatformName() else ""
	
	if var5 == "" or var5 == nil then
		local localPlayer = playersService.LocalPlayer
		
		if localPlayer then
			var5 = localPlayer.DisplayName or localPlayer.Name
		end
	end
	return reactModule.createElement(gamepadDisconnectedModalViewModule, { username = var5 or "" })
end