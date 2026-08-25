local sessionService = game:GetService("SessionService")
local avatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local parent = avatarExperienceAnalytics.Parent
local cryoModule = require(parent.Cryo)
local unifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)
local unifiedEventLoggingUtilsModule = require(avatarExperienceAnalytics.Utils.UnifiedEventLoggingUtils)
local sendUnifiedEventLogModule = require(script.Parent.sendUnifiedEventLog)
local isRunningInStudio = require(parent.AppCommonLib).isRunningInStudio
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXMISEnableMultiShoppingUnifiedEvents = avatarExperienceFlagsModule.FFlagAXMISEnableMultiShoppingUnifiedEvents
local fFlagAXSendUnifiedEventLogWithInstance = avatarExperienceFlagsModule.FFlagAXSendUnifiedEventLogWithInstance
local fFlagAllowCustomUnifiedEventFilterModule = require(script.Parent.FFlagAllowCustomUnifiedEventFilter)
local AXUnifiedEventFilterModule = require(script.Parent.AXUnifiedEventFilter)

return function(p0, p1, p2)
	-- upvalues: sessionService (ref), unifiedEventLogConstantsModule (ref), isRunningInStudio (ref), fFlagAXMISEnableMultiShoppingUnifiedEvents (ref), unifiedEventLoggingUtilsModule (ref), cryoModule (ref), fFlagAllowCustomUnifiedEventFilterModule (ref), AXUnifiedEventFilterModule (ref), sendUnifiedEventLogModule (ref), fFlagAXSendUnifiedEventLogWithInstance (ref)
	if sessionService:GetSessionTag("level2a") ~= p0:GetAttribute(unifiedEventLogConstantsModule.SESSION_TAG_NAME) and not isRunningInStudio() then return end
	p2 = p2 or {}
	local t = {}
	local attributes = p0:GetAttributes()
	
	if fFlagAXMISEnableMultiShoppingUnifiedEvents then
		t = unifiedEventLoggingUtilsModule.getFieldsToSendFromInstanceAttributes(attributes)
	else
		for i, v in attributes do
			if unifiedEventLoggingUtilsModule.isUnifiedLoggingAttribute(i) then
				t[unifiedEventLoggingUtilsModule.getUnifiedLoggingFieldName(i)] = v
			end
		end
	end
	if p2.includeScreenSize then
		t = cryoModule.Dictionary.join(t, unifiedEventLoggingUtilsModule.getScreenSize(p0))
	end
	if p2.includeElementSizeAndPosition then
		t = cryoModule.Dictionary.join(t, unifiedEventLoggingUtilsModule.getElementSizeAndPosition(p0))
	end
	local var12 = cryoModule.Dictionary.join(t, p1);
	(if fFlagAllowCustomUnifiedEventFilterModule and p2.filter then p2.filter else AXUnifiedEventFilterModule.filter)(var12)
	sendUnifiedEventLogModule(var12, if fFlagAXSendUnifiedEventLogWithInstance then p0 else nil)
end