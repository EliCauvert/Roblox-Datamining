local avatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local cryoModule = require(avatarExperienceAnalytics.Parent.Cryo)
local unifiedEventLogConstantsModule = require(script.Parent.UnifiedEventLogConstants)
local unifiedEventLoggingUtilsModule = require(avatarExperienceAnalytics.Utils.UnifiedEventLoggingUtils)
local sendUnifiedEventLogModule = require(script.Parent.sendUnifiedEventLog)
local unifiedSelectionListStoreModule = require(script.Parent.Store.UnifiedSelectionListStore)

return function(p0, p1) --[[ line: 10 ]]
	-- upvalues: unifiedSelectionListStoreModule (ref), unifiedEventLogConstantsModule (ref), unifiedEventLoggingUtilsModule (ref), cryoModule (ref), sendUnifiedEventLogModule (ref)
	local var9
	local selectionList = unifiedSelectionListStoreModule.getSelectionList()
	local text = unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemId"
	local text_1 = unifiedEventLogConstantsModule.ATTRIBUTE_PREFIX .. "itemType"
	
	for i, v in p0 do
		var9 = nil
		
		for i_1, v_1 in selectionList do
			if tostring(v_1[text]) == tostring(v.itemId) and tostring(v_1[text_1]) == tostring(v.itemType) then
				var9 = v_1
				break
			end
		end
		sendUnifiedEventLogModule(cryoModule.Dictionary.join(cryoModule.Dictionary.join(unifiedEventLoggingUtilsModule.getFieldsToSendFromInstanceAttributes(var9), v), { surface = p1 }))
	end
end