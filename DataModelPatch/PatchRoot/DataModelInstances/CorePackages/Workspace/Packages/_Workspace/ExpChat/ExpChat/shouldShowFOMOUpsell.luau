local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local FFlagExpChatUseGuacForFOMOUpsell = require(Parent.SharedFlags).FFlagExpChatUseGuacForFOMOUpsell
local UniversalAppPolicyModule = if FFlagExpChatUseGuacForFOMOUpsell then require(Parent.UniversalAppPolicy) else nil
local IXPServiceWrapperModule = require(ExpChat.IXPServiceWrapper)
local ExpChatFOMOUpsellIXPLayerName = game:DefineFastString("ExpChatFOMOUpsellIXPLayerName", "User.Communication.NonAgeCheckedUser")
local ExpChatFOMOUpsellIXPLayerValue = game:DefineFastString("ExpChatFOMOUpsellIXPLayerValue", "FOMOUpsellEnabled")
local v1 = nil
local v2 = nil

local function fetchIXPData()
	-- upvalues: v1 (ref), v2 (ref), IXPServiceWrapperModule (copy), ExpChatFOMOUpsellIXPLayerName (copy), ExpChatFOMOUpsellIXPLayerValue (copy)
	v1, v8 = pcall(function()
		-- upvalues: IXPServiceWrapperModule (upval), ExpChatFOMOUpsellIXPLayerName (upval)
		return IXPServiceWrapperModule:GetLayerData(ExpChatFOMOUpsellIXPLayerName)
	end)
	
	if v1 and v2 and v2[ExpChatFOMOUpsellIXPLayerValue] ~= nil then
		IXPServiceWrapperModule:LogUserLayerExposure(ExpChatFOMOUpsellIXPLayerName)
		
		return v2[ExpChatFOMOUpsellIXPLayerValue]
	else
		return false
	end
end

return function()
	-- upvalues: FFlagExpChatUseGuacForFOMOUpsell (copy), UniversalAppPolicyModule (ref), v1 (ref), v2 (ref), ExpChatFOMOUpsellIXPLayerValue (copy), fetchIXPData (copy)
	return if FFlagExpChatUseGuacForFOMOUpsell and UniversalAppPolicyModule.getAppFeaturePolicies().getShowFOMOUpsell() then if v1 and v2 then v2[ExpChatFOMOUpsellIXPLayerValue] else fetchIXPData() else false
end