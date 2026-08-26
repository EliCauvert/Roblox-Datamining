local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local fFlagExpChatUseGuacForFOMOUpsell = require(parent.SharedFlags).FFlagExpChatUseGuacForFOMOUpsell
local var1 = if fFlagExpChatUseGuacForFOMOUpsell then require(parent.UniversalAppPolicy) else nil
local IXPServiceWrapperModule = require(expChat.IXPServiceWrapper)
local expChatFOMOUpsellIXPLayerName = game:DefineFastString("ExpChatFOMOUpsellIXPLayerName", "User.Communication.NonAgeCheckedUser")
local expChatFOMOUpsellIXPLayerValue = game:DefineFastString("ExpChatFOMOUpsellIXPLayerValue", "FOMOUpsellEnabled")
local var2 = nil
local var3 = nil

local function fetchIXPData()
	-- upvalues: var2 (write), var3 (write), IXPServiceWrapperModule (ref), expChatFOMOUpsellIXPLayerName (ref), expChatFOMOUpsellIXPLayerValue (ref)
	local ok, status = pcall(function()
		-- upvalues: IXPServiceWrapperModule (copy), expChatFOMOUpsellIXPLayerName (copy)
		return IXPServiceWrapperModule:GetLayerData(expChatFOMOUpsellIXPLayerName)
	end)
	var2 = ok
	var3 = status
	
	if var2 and var3 and var3[expChatFOMOUpsellIXPLayerValue] ~= nil then
		IXPServiceWrapperModule:LogUserLayerExposure(expChatFOMOUpsellIXPLayerName)
		
		return var3[expChatFOMOUpsellIXPLayerValue]
	end
	return false
end

return function()
	-- upvalues: fFlagExpChatUseGuacForFOMOUpsell (ref), var1 (write), var2 (write), var3 (write), expChatFOMOUpsellIXPLayerValue (ref), fetchIXPData (ref)
	return if fFlagExpChatUseGuacForFOMOUpsell then if var1.getAppFeaturePolicies().getShowFOMOUpsell() then if var2 and var3 then var3[expChatFOMOUpsellIXPLayerValue] else fetchIXPData() else false else false
end