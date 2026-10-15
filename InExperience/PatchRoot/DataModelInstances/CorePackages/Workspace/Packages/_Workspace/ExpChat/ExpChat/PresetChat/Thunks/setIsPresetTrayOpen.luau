local httpService = game:GetService("HttpService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local expChatSharedModule = require(parent.ExpChatShared)
local engineFeaturePresetChatUseExpressionTrayOptionsEndpoint = require(parent.SharedFlags).EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint
local constantsModule = require(expChat.PresetChat.Constants)
local _ = require(expChat.Stores.GetPresetChatStore.createPresetChatStore)
local fFlagExpChatPresetTrayDismissAnalyticsModule = require(expChat.Flags.FFlagExpChatPresetTrayDismissAnalytics)
local emojiUnicodeToIdModule = require(expChat.PresetChat.emojiUnicodeToId)

local function buildPresetTrayItems(value, p1, p2)
	-- upvalues: fFlagExpChatPresetTrayDismissAnalyticsModule (ref), engineFeaturePresetChatUseExpressionTrayOptionsEndpoint (ref), emojiUnicodeToIdModule (ref)
	local t = {}
	
	for i, v in value do
		if not fFlagExpChatPresetTrayDismissAnalyticsModule or p2[v.categoryGroupId] then
			for i_1, v_1 in v.categories do
				local name = v_1.name or v_1.categoryId
				
				for i_2, v_2 in if engineFeaturePresetChatUseExpressionTrayOptionsEndpoint then v_1.contents else v_1.messages do
					if fFlagExpChatPresetTrayDismissAnalyticsModule then
						local var1 = if engineFeaturePresetChatUseExpressionTrayOptionsEndpoint and v_2.kind == "Emoji" then emojiUnicodeToIdModule(v_2.unicode) else v_2.presetId
						table.insert(t, {
							category = name,
							tab = v.name or v.categoryGroupId,
							preset_id = var1,
							index = i_2 - 1,
							click = math.min(p1[var1] or 0, 1)
						})
					elseif engineFeaturePresetChatUseExpressionTrayOptionsEndpoint and v_2.kind == "Emoji" then
						table.insert(t, {
							category = name,
							emote_id = v_2.emoteId,
							index = i_2 - 1,
							click = p1[v_2.emoteId] or 0
						})
					else
						table.insert(t, {
							category = name,
							preset_id = v_2.presetId,
							index = i_2 - 1,
							click = p1[v_2.presetId] or 0
						})
					end
				end
			end
		end
	end
	return t
end

return function(value, p3)
	-- upvalues: fFlagExpChatPresetTrayDismissAnalyticsModule (ref), expChatSharedModule (ref), constantsModule (ref), httpService (ref), buildPresetTrayItems (ref)
	if p3 == value.getIsTrayOpen(false) then return end
	if fFlagExpChatPresetTrayDismissAnalyticsModule and p3 then
		value.setPresetClickCounts({})
		value.setViewedGroupIds({})
	end
	value.setIsTrayOpen(p3)
	
	if p3 then
		expChatSharedModule.Analytics:TelemetryLogEvent(expChatSharedModule.Analytics.ExpChatPresetActionConfig, {
			event_type = constantsModule.Analytics.EventTypes.Show,
			component = constantsModule.Analytics.Components.PresetTray
		}, expChatSharedModule.Analytics.DefaultStandardizedFields)
		
		return
	end
	expChatSharedModule.Analytics:TelemetryLogEvent(expChatSharedModule.Analytics.ExpChatPresetActionConfig, {
		event_type = constantsModule.Analytics.EventTypes.Dismiss,
		component = constantsModule.Analytics.Components.PresetTray,
		preset_items = httpService:JSONEncode(buildPresetTrayItems(value.getCategoryGroups(false), value.getPresetClickCounts(false), value.getViewedGroupIds(false)))
	}, expChatSharedModule.Analytics.DefaultStandardizedFields)
end