local ExpChat = script:FindFirstAncestor("ExpChat")
local Players = game:GetService("Players")
local IXPServiceWrapper = require(ExpChat.Parent.IxpServiceWrapper).IXPServiceWrapper
local IsUserChatEnabledModule = require(ExpChat.isUserChatEnabled)
local ExpChatStickyTabsIxpLayer = game:DefineFastString("ExpChatStickyTabsIxpLayer", "User.Communication.SwitchChatTab.HasChatAccess.UserId")
local Flag = false

return function(p1, p2)
	-- upvalues: Flag (ref), Players (copy), IsUserChatEnabledModule (copy), IXPServiceWrapper (copy), ExpChatStickyTabsIxpLayer (copy)
	if Flag then return end
	if p1 == p2 then return end
	local LocalPlayer = Players.LocalPlayer
	
	if LocalPlayer ~= nil and IsUserChatEnabledModule(LocalPlayer.ChatAvailabilityStatus) then
		Flag = true
		IXPServiceWrapper:LogFlagLinkedUserLayerExposure(ExpChatStickyTabsIxpLayer)
		
		return
	end
end