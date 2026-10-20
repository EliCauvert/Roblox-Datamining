local Chat = game:GetService("Chat")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local Parent = script.Parent.Parent
local SetCanChatModule = require(Parent.Actions.SetCanChat)

if require(Parent.Flags.FFlagTopBarDeprecateChatRodux) then
	return nil
end
local ChatSelectorModule = require(CoreGui:WaitForChild("RobloxGui").Modules.ChatSelector)
local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
	Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
	LocalPlayer = Players.LocalPlayer
end
return function(p1)
	-- upvalues: RunService (copy), Chat (copy), LocalPlayer (ref), SetCanChatModule (copy), ChatSelectorModule (copy)
	coroutine.wrap(function()
		-- upvalues: RunService (upval), Chat (upval), LocalPlayer (upval), p1 (copy), SetCanChatModule (upval), ChatSelectorModule (upval)
		local v1 = true
		
		if not RunService:IsStudio() then
			local Success, Result = pcall(function()
				-- upvalues: Chat (upval), LocalPlayer (upval)
				return Chat:CanUserChatAsync(LocalPlayer.UserId)
			end)
			v1 = Success and Result
		end
		p1:dispatch(SetCanChatModule(v1))
		
		if not v1 then
			ChatSelectorModule:SetVisible(false)
		end
	end)()
end