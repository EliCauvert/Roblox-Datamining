local reactModule = require(script:FindFirstAncestor("InputUi").Parent.React)
local playersService = game:GetService("Players")
local var1 = nil
pcall(function()
	-- upvalues: var1 (write)
	var1 = game:GetService("ThirdPartyUserService")
end)
local gamepadDisconnectedModalViewModule = require(script.Parent.GamepadDisconnectedModalView)

local function _()
	-- upvalues: var1 (write), playersService (ref)
	local var2 = if var1 then var1:GetUserPlatformName() else ""
	
	if var2 == "" or var2 == nil then
		local localPlayer = playersService.LocalPlayer
		
		if localPlayer then
			var2 = localPlayer.DisplayName or localPlayer.Name
		end
	end
	return var2 or ""
end

return function(_)
	-- upvalues: var1 (write), playersService (ref), reactModule (ref), gamepadDisconnectedModalViewModule (ref)
	local var2 = if var1 then var1:GetUserPlatformName() else ""
	
	if var2 == "" or var2 == nil then
		local localPlayer = playersService.LocalPlayer
		
		if localPlayer then
			var2 = localPlayer.DisplayName or localPlayer.Name
		end
	end
	return reactModule.createElement(gamepadDisconnectedModalViewModule, { username = var2 or "" })
end