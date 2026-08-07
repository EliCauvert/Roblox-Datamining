local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local fFlagExpChatUseGuacForCrossAgeChat = require(parent.SharedFlags).FFlagExpChatUseGuacForCrossAgeChat
local var1 = if fFlagExpChatUseGuacForCrossAgeChat then require(parent.UniversalAppPolicy) else nil
local IXPServiceWrapperModule = require(expChat.IXPServiceWrapper)
local expChatCrossAgeChatActivityIXPLayerName = game:DefineFastString("ExpChatCrossAgeChatActivityIXPLayerName", "User.Communication.AgeCheckedUser")
local expChatCrossAgeChatActivityIXPLayerValue = game:DefineFastString("ExpChatCrossAgeChatActivityIXPLayerValue", "CrossAgeChatActivityEnabled")
local var5 = nil
local var6 = nil

local function fetchIXPData() --[[ line: 21 ]]
	-- upvalues: var5 (write), var6 (write), IXPServiceWrapperModule (ref), expChatCrossAgeChatActivityIXPLayerName (ref), expChatCrossAgeChatActivityIXPLayerValue (ref)
	local ok, status = pcall(function() --[[ line: 22 ]]
		-- upvalues: IXPServiceWrapperModule (copy), expChatCrossAgeChatActivityIXPLayerName (copy)
		return IXPServiceWrapperModule:GetLayerData(expChatCrossAgeChatActivityIXPLayerName)
	end)
	var5 = ok
	var6 = status
	
	if var5 and var6 and var6[expChatCrossAgeChatActivityIXPLayerValue] ~= nil then
		IXPServiceWrapperModule:LogUserLayerExposure(expChatCrossAgeChatActivityIXPLayerName)
		
		return var6[expChatCrossAgeChatActivityIXPLayerValue]
	end
	return false
end

return function() --[[ line: 35 ]]
	-- upvalues: fFlagExpChatUseGuacForCrossAgeChat (ref), var1 (write), var5 (write), var6 (write), expChatCrossAgeChatActivityIXPLayerValue (ref), fetchIXPData (ref)
	return if fFlagExpChatUseGuacForCrossAgeChat then if var1.getAppFeaturePolicies().getShowCrossAgeChat() then if var5 and var6 then var6[expChatCrossAgeChatActivityIXPLayerValue] else fetchIXPData() else false else false
end