local AvatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local CryoModule = require(AvatarExperienceAnalytics.Parent.Cryo)
local UnifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)
local UnifiedEventLoggingUtilsModule = require(AvatarExperienceAnalytics.Utils.UnifiedEventLoggingUtils)
local SendUnifiedEventLogModule = require(script.Parent.sendUnifiedEventLog)
local UnifiedSelectionListStoreModule = require(script.Parent.Store.UnifiedSelectionListStore)

return function(List, Surface)
	-- upvalues: UnifiedSelectionListStoreModule (copy), UnifiedEventLogConstantsModule (copy), UnifiedEventLoggingUtilsModule (copy), CryoModule (copy), SendUnifiedEventLogModule (copy)
	local SelectionList = UnifiedSelectionListStoreModule.getSelectionList()
	local Text = UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemId"
	local Text1 = UnifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemType"
	local v1 = nil
	
	for _, value in List do
		v1 = nil
		
		for _, value1 in SelectionList do
			if tostring(value1[Text]) == tostring(value.itemId) and tostring(value1[Text1]) == tostring(value.itemType) then
				v1 = value1
				break
			end
		end
		SendUnifiedEventLogModule((CryoModule.Dictionary.join(CryoModule.Dictionary.join(UnifiedEventLoggingUtilsModule.getFieldsToSendFromInstanceAttributes(v1), value), { surface = Surface })))
	end
end