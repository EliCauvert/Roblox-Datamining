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
return function(p1)
	-- upvalues: runService (ref), chatService (ref), localPlayer (write), setCanChatModule (ref), chatSelectorModule (ref)
	coroutine.wrap(function()
		-- upvalues: runService (copy), chatService (copy), localPlayer (copy), p1 (ref), setCanChatModule (copy), chatSelectorModule (copy)
		local var1 = true
		
		if not runService:IsStudio() then
			local ok, status = pcall(function()
				-- upvalues: chatService (copy), localPlayer (copy)
				return chatService:CanUserChatAsync(localPlayer.UserId)
			end)
			var1 = ok and status
		end
		p1:dispatch(setCanChatModule(var1))
		
		if not var1 then
			chatSelectorModule:SetVisible(false)
		end
	end)()
end