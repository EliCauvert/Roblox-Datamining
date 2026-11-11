local SessionService = game:GetService("SessionService")
local AvatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local Parent = AvatarExperienceAnalytics.Parent
local CryoModule = require(Parent.Cryo)
local UnifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)
local UnifiedEventLoggingUtilsModule = require(AvatarExperienceAnalytics.Utils.UnifiedEventLoggingUtils)
local SendUnifiedEventLogModule = require(script.Parent.sendUnifiedEventLog)
local IsRunningInStudioFunction = require(Parent.AppCommonLib).isRunningInStudio
local FFlagAXMISEnableMultiShoppingUnifiedEvents = require(Parent.AvatarExperienceFlags).FFlagAXMISEnableMultiShoppingUnifiedEvents
local AXUnifiedEventFilterModule = require(script.Parent.AXUnifiedEventFilter)

return function(Object, p1, p2)
	-- upvalues: SessionService (copy), UnifiedEventLogConstantsModule (copy), IsRunningInStudioFunction (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), UnifiedEventLoggingUtilsModule (copy), CryoModule (copy), AXUnifiedEventFilterModule (copy), SendUnifiedEventLogModule (copy)
	if SessionService:GetSessionTag("level2a") ~= Object:GetAttribute(UnifiedEventLogConstantsModule.SESSION_TAG_NAME) and not IsRunningInStudioFunction() then return end
	local P2 = p2 or {}
	local JoinResult = {}
	local Attributes = Object:GetAttributes()
	
	if FFlagAXMISEnableMultiShoppingUnifiedEvents then
		JoinResult = UnifiedEventLoggingUtilsModule.getFieldsToSendFromInstanceAttributes(Attributes)
	else
		for i, attribute in Attributes do
			if UnifiedEventLoggingUtilsModule.isUnifiedLoggingAttribute(i) then
				JoinResult[UnifiedEventLoggingUtilsModule.getUnifiedLoggingFieldName(i)] = attribute
			end
		end
	end
	if P2.includeScreenSize then
		JoinResult = CryoModule.Dictionary.join(JoinResult, UnifiedEventLoggingUtilsModule.getScreenSize(Object))
	end
	if P2.includeElementSizeAndPosition then
		JoinResult = CryoModule.Dictionary.join(JoinResult, UnifiedEventLoggingUtilsModule.getElementSizeAndPosition(Object))
	end
	local JoinResult1 = CryoModule.Dictionary.join(JoinResult, p1)
	AXUnifiedEventFilterModule.filter(JoinResult1)
	SendUnifiedEventLogModule(JoinResult1)
end