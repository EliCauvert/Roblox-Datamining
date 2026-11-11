local HttpService = game:GetService("HttpService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local ExpChatSharedModule = require(ExpChat.Parent.ExpChatShared)
local ConstantsModule = require(ExpChat.PresetChat.Constants)
local _ = require(ExpChat.Stores.GetPresetChatStore.createPresetChatStore)

local function buildPresetTrayItems(CategoryGroups, PresetClickCounts)
	local List = {}
	
	for _, categoryGroup in CategoryGroups do
		for _, category in categoryGroup.categories do
			local Name = category.name or category.categoryId
			for i, message in category.messages do
				table.insert(List, {
					category = Name,
					preset_id = message.presetId,
					index = i - 1,
					click = PresetClickCounts[message.presetId] or 0
				})
			end
		end
	end
	return List
end

return function(p1, IsTrayOpen)
	-- upvalues: ExpChatSharedModule (copy), ConstantsModule (copy), HttpService (copy), buildPresetTrayItems (copy)
	if IsTrayOpen == p1.getIsTrayOpen(false) then return end
	p1.setIsTrayOpen(IsTrayOpen)
	
	if IsTrayOpen then
		ExpChatSharedModule.Analytics:TelemetryLogEvent(ExpChatSharedModule.Analytics.ExpChatPresetActionConfig, {
			event_type = ConstantsModule.Analytics.EventTypes.Show,
			component = ConstantsModule.Analytics.Components.PresetTray
		}, ExpChatSharedModule.Analytics.DefaultStandardizedFields)
		
		return
	else
		ExpChatSharedModule.Analytics:TelemetryLogEvent(ExpChatSharedModule.Analytics.ExpChatPresetActionConfig, {
			event_type = ConstantsModule.Analytics.EventTypes.Dismiss,
			component = ConstantsModule.Analytics.Components.PresetTray,
			preset_items = HttpService:JSONEncode((buildPresetTrayItems(p1.getCategoryGroups(false), p1.getPresetClickCounts(false))))
		}, ExpChatSharedModule.Analytics.DefaultStandardizedFields)
	end
end