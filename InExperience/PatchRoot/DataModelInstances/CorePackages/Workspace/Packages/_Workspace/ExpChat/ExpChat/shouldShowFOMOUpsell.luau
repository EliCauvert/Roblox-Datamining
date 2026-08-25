local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local fFlagExpChatUseGuacForFOMOUpsell = require(parent.SharedFlags).FFlagExpChatUseGuacForFOMOUpsell
local var1 = if fFlagExpChatUseGuacForFOMOUpsell then require(parent.UniversalAppPolicy) else nil
local IXPServiceWrapperModule = require(expChat.IXPServiceWrapper)
local expChatFOMOUpsellIXPLayerName = game:DefineFastString("ExpChatFOMOUpsellIXPLayerName", "User.Communication.NonAgeCheckedUser")
local expChatFOMOUpsellIXPLayerValue = game:DefineFastString("ExpChatFOMOUpsellIXPLayerValue", "FOMOUpsellEnabled")
local var5 = nil
local var6 = nil

local function fetchIXPData()
	-- upvalues: var5 (write), var6 (write), IXPServiceWrapperModule (ref), expChatFOMOUpsellIXPLayerName (ref), expChatFOMOUpsellIXPLayerValue (ref)
	local ok, status = pcall(function()
		-- upvalues: IXPServiceWrapperModule (copy), expChatFOMOUpsellIXPLayerName (copy)
		return IXPServiceWrapperModule:GetLayerData(expChatFOMOUpsellIXPLayerName)
	end)
	var5 = ok
	var6 = status
	
	if var5 and var6 and var6[expChatFOMOUpsellIXPLayerValue] ~= nil then
		IXPServiceWrapperModule:LogUserLayerExposure(expChatFOMOUpsellIXPLayerName)
		
		return var6[expChatFOMOUpsellIXPLayerValue]
	end
	return false
end

return function()
	-- upvalues: fFlagExpChatUseGuacForFOMOUpsell (ref), var1 (write), var5 (write), var6 (write), expChatFOMOUpsellIXPLayerValue (ref), fetchIXPData (ref)
	return if fFlagExpChatUseGuacForFOMOUpsell then if var1.getAppFeaturePolicies().getShowFOMOUpsell() then if var5 and var6 then var6[expChatFOMOUpsellIXPLayerValue] else fetchIXPData() else false else false
end