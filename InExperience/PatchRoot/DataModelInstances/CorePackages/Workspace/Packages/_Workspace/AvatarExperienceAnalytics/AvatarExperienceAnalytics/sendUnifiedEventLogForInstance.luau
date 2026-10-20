local SessionService = game:GetService("SessionService")
local AvatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local Parent = AvatarExperienceAnalytics.Parent
local CryoModule = require(Parent.Cryo)
local UnifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)
local UnifiedEventLoggingUtilsModule = require(AvatarExperienceAnalytics.Utils.UnifiedEventLoggingUtils)
local SendUnifiedEventLogModule = require(script.Parent.sendUnifiedEventLog)
local UnifiedEventPageStoreModule = require(script.Parent.Store.UnifiedEventPageStore)
local IsRunningInStudioFunction = require(Parent.AppCommonLib).isRunningInStudio
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXMISEnableMultiShoppingUnifiedEvents = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShoppingUnifiedEvents
local FFlagAXSendUnifiedEventLogWithInstance = AvatarExperienceFlagsModule.FFlagAXSendUnifiedEventLogWithInstance
local FFlagAXUnifiedEventPageContext = AvatarExperienceFlagsModule.FFlagAXUnifiedEventPageContext
local FFlagAXUnifiedEventCounters = AvatarExperienceFlagsModule.FFlagAXUnifiedEventCounters
local FFlagAllowCustomUnifiedEventFilterModule = require(script.Parent.FFlagAllowCustomUnifiedEventFilter)
local AXUnifiedEventFilterModule = require(script.Parent.AXUnifiedEventFilter)

return function(Object, p1, p2)
	-- upvalues: SessionService (copy), UnifiedEventLogConstantsModule (copy), FFlagAXUnifiedEventPageContext (copy), IsRunningInStudioFunction (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), UnifiedEventLoggingUtilsModule (copy), CryoModule (copy), UnifiedEventPageStoreModule (copy), FFlagAllowCustomUnifiedEventFilterModule (copy), AXUnifiedEventFilterModule (copy), SendUnifiedEventLogModule (copy), FFlagAXSendUnifiedEventLogWithInstance (copy), FFlagAXUnifiedEventCounters (copy)
	local Level2aSessionTag = SessionService:GetSessionTag("level2a")
	local Attribute = Object:GetAttribute(UnifiedEventLogConstantsModule.SESSION_TAG_NAME)
	
	if not FFlagAXUnifiedEventPageContext and Level2aSessionTag ~= Attribute and not IsRunningInStudioFunction() then return end
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
	
	if FFlagAXUnifiedEventPageContext then
		JoinResult1 = CryoModule.Dictionary.join(JoinResult1, {
			elementSessionTag = if Attribute == nil or Attribute == "" then UnifiedEventPageStoreModule.UNKNOWN else Attribute
		})
	end
	local FilterPassed = (if FFlagAllowCustomUnifiedEventFilterModule and P2.filter then P2.filter else AXUnifiedEventFilterModule.filter)(JoinResult1)
	SendUnifiedEventLogModule(JoinResult1, if FFlagAXSendUnifiedEventLogWithInstance then Object else nil, if FFlagAXUnifiedEventCounters then { filterPassed = FilterPassed } else nil)
end