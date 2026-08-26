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

return function(p1, p2, p3)
	-- upvalues: sessionService (ref), unifiedEventLogConstantsModule (ref), isRunningInStudio (ref), fFlagAXMISEnableMultiShoppingUnifiedEvents (ref), unifiedEventLoggingUtilsModule (ref), cryoModule (ref), fFlagAllowCustomUnifiedEventFilterModule (ref), AXUnifiedEventFilterModule (ref), sendUnifiedEventLogModule (ref), fFlagAXSendUnifiedEventLogWithInstance (ref)
	if sessionService:GetSessionTag("level2a") ~= p1:GetAttribute(unifiedEventLogConstantsModule.SESSION_TAG_NAME) and not isRunningInStudio() then return end
	p3 = p3 or {}
	local t = {}
	local attributes = p1:GetAttributes()
	
	if fFlagAXMISEnableMultiShoppingUnifiedEvents then
		t = unifiedEventLoggingUtilsModule.getFieldsToSendFromInstanceAttributes(attributes)
	else
		for i, v in attributes do
			if unifiedEventLoggingUtilsModule.isUnifiedLoggingAttribute(i) then
				t[unifiedEventLoggingUtilsModule.getUnifiedLoggingFieldName(i)] = v
			end
		end
	end
	if p3.includeScreenSize then
		t = cryoModule.Dictionary.join(t, unifiedEventLoggingUtilsModule.getScreenSize(p1))
	end
	if p3.includeElementSizeAndPosition then
		t = cryoModule.Dictionary.join(t, unifiedEventLoggingUtilsModule.getElementSizeAndPosition(p1))
	end
	local var1 = cryoModule.Dictionary.join(t, p2);
	(if fFlagAllowCustomUnifiedEventFilterModule and p3.filter then p3.filter else AXUnifiedEventFilterModule.filter)(var1)
	sendUnifiedEventLogModule(var1, if fFlagAXSendUnifiedEventLogWithInstance then p1 else nil)
end