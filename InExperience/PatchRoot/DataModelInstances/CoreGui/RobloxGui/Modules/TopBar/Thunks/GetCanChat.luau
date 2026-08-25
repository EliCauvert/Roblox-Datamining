local chatService = game:GetService("Chat")
local runService = game:GetService("RunService")
local playersService = game:GetService("Players")
local coreGuiService = game:GetService("CoreGui")
local parent = script.Parent.Parent
local setCanChatModule = require(parent.Actions.SetCanChat)

if require(parent.Flags.FFlagTopBarDeprecateChatRodux) then
	return nil
end
local chatSelectorModule = require(coreGuiService:WaitForChild("RobloxGui").Modules.ChatSelector)
local localPlayer = playersService.LocalPlayer
while not localPlayer do
	playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
	localPlayer = playersService.LocalPlayer
end
return function(p0)
	-- upvalues: runService (ref), chatService (ref), localPlayer (write), setCanChatModule (ref), chatSelectorModule (ref)
	coroutine.wrap(function()
		-- upvalues: runService (copy), chatService (copy), localPlayer (copy), p0 (ref), setCanChatModule (copy), chatSelectorModule (copy)
		local var6 = true
		
		if not runService:IsStudio() then
			local ok, status = pcall(function()
				-- upvalues: chatService (copy), localPlayer (copy)
				return chatService:CanUserChatAsync(localPlayer.UserId)
			end)
			var6 = ok and status
		end
		p0:dispatch(setCanChatModule(var6))
		
		if not var6 then
			chatSelectorModule:SetVisible(false)
		end
	end)()
end