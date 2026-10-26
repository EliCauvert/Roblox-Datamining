local HttpService = game:GetService("HttpService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ExpChatSharedModule = require(Parent.ExpChatShared)
local EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint = require(Parent.SharedFlags).EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint
local ExpChatOpenExpressionTrayExperimentation = require(Parent.SocialExperiments).ExpChatOpenExpressionTrayExperimentation
local ConstantsModule = require(ExpChat.PresetChat.Constants)
local _ = require(ExpChat.Stores.GetPresetChatStore.createPresetChatStore)
local FFlagExpChatOpenExpressionTrayExposureModule = require(ExpChat.Flags.FFlagExpChatOpenExpressionTrayExposure)
local FFlagExpChatPresetTrayDismissAnalyticsModule = require(ExpChat.Flags.FFlagExpChatPresetTrayDismissAnalytics)
local EmojiUnicodeToIdModule = require(ExpChat.PresetChat.emojiUnicodeToId)

local function buildPresetTrayItems(CategoryGroups, PresetClickCounts, ViewedGroupIds)
	-- upvalues: FFlagExpChatPresetTrayDismissAnalyticsModule (copy), EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint (copy), EmojiUnicodeToIdModule (copy)
	local List = {}
	
	for _, categoryGroup in CategoryGroups do
		if not FFlagExpChatPresetTrayDismissAnalyticsModule or ViewedGroupIds[categoryGroup.categoryGroupId] then
			for _, category in categoryGroup.categories do
				local Name = category.name or category.categoryId
				local Contents = if EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint then category.contents else category.messages
				for i, content in Contents do
					if FFlagExpChatPresetTrayDismissAnalyticsModule then
						local IsEmoji: boolean = EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint and content.kind == "Emoji"
						local EmojiUnicodeToIdModuleResult = if IsEmoji then EmojiUnicodeToIdModule(content.unicode) else content.presetId
						table.insert(List, {
							category = Name,
							tab = categoryGroup.name or categoryGroup.categoryGroupId,
							preset_id = EmojiUnicodeToIdModuleResult,
							index = i - 1,
							click = math.min(PresetClickCounts[EmojiUnicodeToIdModuleResult] or 0, 1)
						})
					elseif EngineFeaturePresetChatUseExpressionTrayOptionsEndpoint and content.kind == "Emoji" then
						table.insert(List, {
							category = Name,
							emote_id = content.emoteId,
							index = i - 1,
							click = PresetClickCounts[content.emoteId] or 0
						})
					else
						table.insert(List, {
							category = Name,
							preset_id = content.presetId,
							index = i - 1,
							click = PresetClickCounts[content.presetId] or 0
						})
					end
				end
			end
		end
	end
	return List
end

return function(p1, IsTrayOpen)
	-- upvalues: FFlagExpChatPresetTrayDismissAnalyticsModule (copy), FFlagExpChatOpenExpressionTrayExposureModule (copy), ExpChatOpenExpressionTrayExperimentation (copy), ExpChatSharedModule (copy), ConstantsModule (copy), HttpService (copy), buildPresetTrayItems (copy)
	if IsTrayOpen == p1.getIsTrayOpen(false) then return end
	if FFlagExpChatPresetTrayDismissAnalyticsModule and IsTrayOpen then
		p1.setPresetClickCounts({})
		p1.setViewedGroupIds({})
	end
	p1.setIsTrayOpen(IsTrayOpen)
	
	if FFlagExpChatOpenExpressionTrayExposureModule and IsTrayOpen then
		ExpChatOpenExpressionTrayExperimentation.logExposure()
	end
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
			preset_items = HttpService:JSONEncode((buildPresetTrayItems(p1.getCategoryGroups(false), p1.getPresetClickCounts(false), p1.getViewedGroupIds(false))))
		}, ExpChatSharedModule.Analytics.DefaultStandardizedFields)
	end
end