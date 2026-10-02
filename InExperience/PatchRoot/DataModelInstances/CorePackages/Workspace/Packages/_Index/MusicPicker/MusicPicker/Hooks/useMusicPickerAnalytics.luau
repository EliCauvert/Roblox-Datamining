local musicPicker = script:FindFirstAncestor("MusicPicker")
local parent = musicPicker.Parent
local reactModule = require(parent.React)
local songbirdModule = require(parent.Songbird)
local sendAudioPlayerAnalytics = songbirdModule.Analytics.sendAudioPlayerAnalytics
local analyticActions = songbirdModule.Analytics.AnalyticActions
local _ = require(musicPicker.Types.MusicPickerTypes)

local function _(p1, p2)
	local var1 = p1[p2]
	
	return if var1 == nil then "-1" else tostring(var1.thumbnailAssetId)
end

return function(p1)
	-- upvalues: reactModule (ref), sendAudioPlayerAnalytics (ref), analyticActions (ref)
	local source = p1.source
	local previewingId = p1.previewingId
	local savedIds = p1.savedIds
	local itemsById = p1.itemsById
	local var1 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), previewingId (ref), sendAudioPlayerAnalytics (copy), analyticActions (copy), source (ref), itemsById (ref)
		local current = var1.current
		local var2 = if previewingId ~= nil then nil else tostring(previewingId)
		
		if (if current ~= nil then nil else current.songId) == var2 then return end
		if current ~= nil then
			sendAudioPlayerAnalytics({
				action = analyticActions.AudioStopped,
				songId = current.songId,
				thumbnailId = current.thumbnailId,
				source = source
			})
		end
		if previewingId == nil then
			var1.current = nil
			
			return
		end
		local var3 = itemsById[previewingId]
		local var4 = if var3 ~= nil then "-1" else tostring(var3.thumbnailAssetId)
		sendAudioPlayerAnalytics({
			action = analyticActions.AudioPlay,
			songId = var2,
			thumbnailId = var4,
			source = source
		})
		var1.current = { songId = var2, thumbnailId = var4 }
	end, { previewingId, source, itemsById })
	local var2 = reactModule.useRef(source)
	var2.current = source
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), sendAudioPlayerAnalytics (copy), analyticActions (copy), var2 (ref)
		return function()
			-- upvalues: var1 (copy), sendAudioPlayerAnalytics (copy), analyticActions (copy), var2 (copy)
			local current = var1.current
			
			if current ~= nil then
				sendAudioPlayerAnalytics({
					action = analyticActions.AudioStopped,
					songId = current.songId,
					thumbnailId = current.thumbnailId,
					source = var2.current
				})
				var1.current = nil
			end
		end
	end, {})
	local var3 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), savedIds (ref), sendAudioPlayerAnalytics (copy), analyticActions (copy), itemsById (ref), source (ref)
		local current = var3.current
		var3.current = savedIds
		
		if current == nil then return end
		for i, v in savedIds do
			if v and not current[i] then
				local var4 = sendAudioPlayerAnalytics
				local t = { action = analyticActions.Like, songId = tostring(i) }
				local var5 = itemsById[i]
				t.thumbnailId = if var5 ~= nil then "-1" else tostring(var5.thumbnailAssetId)
				t.source = source
				var4(t)
			end
		end
		for i_1, v_1 in current do
			if v_1 and not savedIds[i_1] then
				local var6 = sendAudioPlayerAnalytics
				local t = { action = analyticActions.Unlike, songId = tostring(i_1) }
				local var7 = itemsById[i_1]
				t.thumbnailId = if var7 ~= nil then "-1" else tostring(var7.thumbnailAssetId)
				t.source = source
				var6(t)
			end
		end
	end, { savedIds, source, itemsById })
	
	return reactModule.useCallback(function(p2)
		-- upvalues: sendAudioPlayerAnalytics (copy), analyticActions (copy), itemsById (ref), source (ref)
		local t = {
			action = analyticActions.AudioPause,
			songId = tostring(p2)
		}
		local var8 = itemsById[p2]
		t.thumbnailId = if var8 ~= nil then "-1" else tostring(var8.thumbnailAssetId)
		t.source = source
		sendAudioPlayerAnalytics(t)
	end, { source, itemsById })
end