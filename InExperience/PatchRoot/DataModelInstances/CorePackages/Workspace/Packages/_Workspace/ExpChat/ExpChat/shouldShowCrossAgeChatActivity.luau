local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local fFlagExpChatUseGuacForCrossAgeChat = require(parent.SharedFlags).FFlagExpChatUseGuacForCrossAgeChat
local var1 = if fFlagExpChatUseGuacForCrossAgeChat then require(parent.UniversalAppPolicy) else nil
local IXPServiceWrapperModule = require(expChat.IXPServiceWrapper)
local expChatCrossAgeChatActivityIXPLayerName = game:DefineFastString("ExpChatCrossAgeChatActivityIXPLayerName", "User.Communication.AgeCheckedUser")
local expChatCrossAgeChatActivityIXPLayerValue = game:DefineFastString("ExpChatCrossAgeChatActivityIXPLayerValue", "CrossAgeChatActivityEnabled")
local var2 = nil
local var3 = nil

local function fetchIXPData()
	-- upvalues: var2 (write), var3 (write), IXPServiceWrapperModule (ref), expChatCrossAgeChatActivityIXPLayerName (ref), expChatCrossAgeChatActivityIXPLayerValue (ref)
	local ok, status = pcall(function()
		-- upvalues: IXPServiceWrapperModule (copy), expChatCrossAgeChatActivityIXPLayerName (copy)
		return IXPServiceWrapperModule:GetLayerData(expChatCrossAgeChatActivityIXPLayerName)
	end)
	var2 = ok
	var3 = status
	
	if var2 and var3 and var3[expChatCrossAgeChatActivityIXPLayerValue] ~= nil then
		IXPServiceWrapperModule:LogUserLayerExposure(expChatCrossAgeChatActivityIXPLayerName)
		
		return var3[expChatCrossAgeChatActivityIXPLayerValue]
	end
	return false
end

return function()
	-- upvalues: fFlagExpChatUseGuacForCrossAgeChat (ref), var1 (write), var2 (write), var3 (write), expChatCrossAgeChatActivityIXPLayerValue (ref), fetchIXPData (ref)
	return if fFlagExpChatUseGuacForCrossAgeChat then if var1.getAppFeaturePolicies().getShowCrossAgeChat() then if var2 and var3 then var3[expChatCrossAgeChatActivityIXPLayerValue] else fetchIXPData() else false else false
end