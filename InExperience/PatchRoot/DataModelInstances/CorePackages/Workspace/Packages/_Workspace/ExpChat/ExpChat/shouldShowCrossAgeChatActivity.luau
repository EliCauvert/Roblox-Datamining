local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local FFlagExpChatUseGuacForCrossAgeChat = require(Parent.SharedFlags).FFlagExpChatUseGuacForCrossAgeChat
local UniversalAppPolicyModule = if FFlagExpChatUseGuacForCrossAgeChat then require(Parent.UniversalAppPolicy) else nil
local IXPServiceWrapperModule = require(ExpChat.IXPServiceWrapper)
local ExpChatCrossAgeChatActivityIXPLayerName = game:DefineFastString("ExpChatCrossAgeChatActivityIXPLayerName", "User.Communication.AgeCheckedUser")
local ExpChatCrossAgeChatActivityIXPLayerValue = game:DefineFastString("ExpChatCrossAgeChatActivityIXPLayerValue", "CrossAgeChatActivityEnabled")
local v1 = nil
local v2 = nil

local function fetchIXPData() --[[ Line: 21 ]]
	-- upvalues: v1 (ref), v2 (ref), IXPServiceWrapperModule (copy), ExpChatCrossAgeChatActivityIXPLayerName (copy), ExpChatCrossAgeChatActivityIXPLayerValue (copy)
	v1, v8 = pcall(function() --[[ Line: 22 ]]
		-- upvalues: IXPServiceWrapperModule (upval), ExpChatCrossAgeChatActivityIXPLayerName (upval)
		return IXPServiceWrapperModule:GetLayerData(ExpChatCrossAgeChatActivityIXPLayerName)
	end)
	
	if v1 and v2 and v2[ExpChatCrossAgeChatActivityIXPLayerValue] ~= nil then
		IXPServiceWrapperModule:LogUserLayerExposure(ExpChatCrossAgeChatActivityIXPLayerName)
		
		return v2[ExpChatCrossAgeChatActivityIXPLayerValue]
	else
		return false
	end
end

return function() --[[ Line: 35 ]]
	-- upvalues: FFlagExpChatUseGuacForCrossAgeChat (copy), UniversalAppPolicyModule (ref), v1 (ref), v2 (ref), ExpChatCrossAgeChatActivityIXPLayerValue (copy), fetchIXPData (copy)
	return if FFlagExpChatUseGuacForCrossAgeChat and UniversalAppPolicyModule.getAppFeaturePolicies().getShowCrossAgeChat() then if v1 and v2 then v2[ExpChatCrossAgeChatActivityIXPLayerValue] else fetchIXPData() else false
end