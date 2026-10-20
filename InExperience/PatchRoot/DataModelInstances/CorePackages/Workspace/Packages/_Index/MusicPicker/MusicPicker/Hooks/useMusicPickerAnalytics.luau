local MusicPicker = script:FindFirstAncestor("MusicPicker")
local Parent = MusicPicker.Parent
local ReactModule = require(Parent.React)
local SongbirdModule = require(Parent.Songbird)
local SendAudioPlayerAnalyticsFunction = SongbirdModule.Analytics.sendAudioPlayerAnalytics
local AnalyticActions = SongbirdModule.Analytics.AnalyticActions
local _ = require(MusicPicker.Types.MusicPickerTypes)

local function _(p1, p2): string
	local v1 = p1[p2]
	
	return if v1 == nil then "-1" else tostring(v1.thumbnailAssetId)
end

return function(p1)
	-- upvalues: ReactModule (copy), SendAudioPlayerAnalyticsFunction (copy), AnalyticActions (copy)
	local Source = p1.source
	local PreviewingId = p1.previewingId
	local SavedIds = p1.savedIds
	local ItemsById = p1.itemsById
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), PreviewingId (copy), SendAudioPlayerAnalyticsFunction (upval), AnalyticActions (upval), Source (copy), ItemsById (copy)
		local Current = UseRefResult.current
		local Text = if PreviewingId == nil then nil else tostring(PreviewingId)
		
		if (if Current == nil then nil else Current.songId) == Text then return end
		if Current ~= nil then
			SendAudioPlayerAnalyticsFunction({
				action = AnalyticActions.AudioStopped,
				songId = Current.songId,
				thumbnailId = Current.thumbnailId,
				source = Source
			})
		end
		if PreviewingId == nil then
			UseRefResult.current = nil
			
			return
		else
			local ItemsByIdEntry = ItemsById[PreviewingId]
			local Text1: string = if ItemsByIdEntry == nil then "-1" else tostring(ItemsByIdEntry.thumbnailAssetId)
			SendAudioPlayerAnalyticsFunction({
				action = AnalyticActions.AudioPlay,
				songId = Text,
				thumbnailId = Text1,
				source = Source
			})
			UseRefResult.current = { songId = Text, thumbnailId = Text1 }
		end
	end, { PreviewingId, Source, ItemsById })
	local UseRefResult1 = ReactModule.useRef(Source)
	UseRefResult1.current = Source
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), SendAudioPlayerAnalyticsFunction (upval), AnalyticActions (upval), UseRefResult1 (copy)
		return function()
			-- upvalues: UseRefResult (upval), SendAudioPlayerAnalyticsFunction (upval), AnalyticActions (upval), UseRefResult1 (upval)
			local Current = UseRefResult.current
			
			if Current ~= nil then
				SendAudioPlayerAnalyticsFunction({
					action = AnalyticActions.AudioStopped,
					songId = Current.songId,
					thumbnailId = Current.thumbnailId,
					source = UseRefResult1.current
				})
				UseRefResult.current = nil
			end
		end
	end, {})
	local UseRefResult2 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult2 (copy), SavedIds (copy), SendAudioPlayerAnalyticsFunction (upval), AnalyticActions (upval), ItemsById (copy), Source (copy)
		local Current = UseRefResult2.current
		UseRefResult2.current = SavedIds
		
		if Current == nil then return end
		for i, savedId in SavedIds do
			if savedId and not Current[i] then
				local ItemsByIdEntry = ItemsById[i]
				SendAudioPlayerAnalyticsFunction({
					action = AnalyticActions.Like,
					songId = tostring(i),
					thumbnailId = if ItemsByIdEntry == nil then "-1" else tostring(ItemsByIdEntry.thumbnailAssetId),
					source = Source
				})
			end
		end
		for i1, value in Current do
			if value and not SavedIds[i1] then
				local ItemsByIdEntry = ItemsById[i1]
				SendAudioPlayerAnalyticsFunction({
					action = AnalyticActions.Unlike,
					songId = tostring(i1),
					thumbnailId = if ItemsByIdEntry == nil then "-1" else tostring(ItemsByIdEntry.thumbnailAssetId),
					source = Source
				})
			end
		end
	end, { SavedIds, Source, ItemsById })
	
	return ReactModule.useCallback(function(p2)
		-- upvalues: SendAudioPlayerAnalyticsFunction (upval), AnalyticActions (upval), ItemsById (copy), Source (copy)
		local ItemsByIdEntry = ItemsById[p2]
		SendAudioPlayerAnalyticsFunction({
			action = AnalyticActions.AudioPause,
			songId = tostring(p2),
			thumbnailId = if ItemsByIdEntry == nil then "-1" else tostring(ItemsByIdEntry.thumbnailAssetId),
			source = Source
		})
	end, { Source, ItemsById })
end