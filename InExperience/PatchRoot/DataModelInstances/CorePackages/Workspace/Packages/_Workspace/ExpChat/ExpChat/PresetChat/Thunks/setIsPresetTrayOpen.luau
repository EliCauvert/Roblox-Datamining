local httpService = game:GetService("HttpService")
local expChat = script:FindFirstAncestor("ExpChat")
local expChatSharedModule = require(expChat.Parent.ExpChatShared)
local constantsModule = require(expChat.PresetChat.Constants)
local _ = require(expChat.Stores.GetPresetChatStore.createPresetChatStore)

local function buildPresetTrayItems(value, p0)
	local t = {}
	
	for i, v in value do
		for i_1, v_1 in v.categories do
			local name = v_1.name or v_1.categoryId
			
			for i_2, v_2 in v_1.messages do
				table.insert(t, {
					category = name,
					preset_id = v_2.presetId,
					index = i_2 - 1,
					click = p0[v_2.presetId] or 0
				})
			end
		end
	end
	return t
end

return function(value, p1)
	-- upvalues: expChatSharedModule (ref), constantsModule (ref), httpService (ref), buildPresetTrayItems (ref)
	if p1 == value.getIsTrayOpen(false) then return end
	value.setIsTrayOpen(p1)
	
	if p1 then
		expChatSharedModule.Analytics:TelemetryLogEvent(expChatSharedModule.Analytics.ExpChatPresetActionConfig, {
			event_type = constantsModule.Analytics.EventTypes.Show,
			component = constantsModule.Analytics.Components.PresetTray
		}, expChatSharedModule.Analytics.DefaultStandardizedFields)
		
		return
	end
	expChatSharedModule.Analytics:TelemetryLogEvent(expChatSharedModule.Analytics.ExpChatPresetActionConfig, {
		event_type = constantsModule.Analytics.EventTypes.Dismiss,
		component = constantsModule.Analytics.Components.PresetTray,
		preset_items = httpService:JSONEncode(buildPresetTrayItems(value.getCategoryGroups(false), value.getPresetClickCounts(false)))
	}, expChatSharedModule.Analytics.DefaultStandardizedFields)
end