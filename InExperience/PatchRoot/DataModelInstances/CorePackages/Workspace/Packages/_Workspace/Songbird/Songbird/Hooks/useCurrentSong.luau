local songbird = script:FindFirstAncestor("Songbird")
local assetFavoritesModule = require(songbird.Parent.AssetFavorites)
local cryoModule = require(songbird.Parent.Cryo)
local reactModule = require(songbird.Parent.React)
local reactSceneUnderstandingModule = require(songbird.Parent.ReactSceneUnderstanding)
local useAudioMetadataModule = require(songbird.Hooks.useAudioMetadata)
local getAssetIdForAudioSourceModule = require(songbird.Common.getAssetIdForAudioSource)
local _ = require(songbird.types)
local loggerModule = require(songbird.logger)
local analyticActionsModule = require(songbird.Analytics.AnalyticActions)
local sendChromeWindowAnalyticsModule = require(songbird.Analytics.sendChromeWindowAnalytics)
local useMemo = reactModule.useMemo
local useAudibleSounds = reactSceneUnderstandingModule.useAudibleSounds
local useAssetFavoriting = assetFavoritesModule.useAssetFavoriting

return function()
	-- upvalues: useAudibleSounds (ref), useMemo (ref), cryoModule (ref), getAssetIdForAudioSourceModule (ref), useAudioMetadataModule (ref), useAssetFavoriting (ref), loggerModule (ref), sendChromeWindowAnalyticsModule (ref), analyticActionsModule (ref)
	local var10 = useAudibleSounds()
	local var11 = useMemo(function()
		-- upvalues: cryoModule (copy), var10 (ref), getAssetIdForAudioSourceModule (copy)
		return cryoModule.List.filter(var10, function(p0)
			-- upvalues: getAssetIdForAudioSourceModule (copy)
			return getAssetIdForAudioSourceModule(p0) ~= nil
		end)
	end, { var10 })
	local var12 = useMemo(function()
		-- upvalues: cryoModule (copy), var11 (ref), getAssetIdForAudioSourceModule (copy)
		return cryoModule.List.map(var11, function(p1)
			-- upvalues: getAssetIdForAudioSourceModule (copy)
			return getAssetIdForAudioSourceModule(p1)
		end)
	end, { var11 })
	local var13 = useAudioMetadataModule(var12)
	local var14 = useAssetFavoriting(var12)
	
	return useMemo(function()
		-- upvalues: loggerModule (copy), var11 (ref), getAssetIdForAudioSourceModule (copy), var13 (ref), var14 (ref), sendChromeWindowAnalyticsModule (copy), analyticActionsModule (copy)
		local byAssetId
		loggerModule:info(`determining currently playing song from {#var11} audio sources...`)
		
		for i, v in var11 do
			local var15 = getAssetIdForAudioSourceModule(v)
			
			if var15 then
				byAssetId = var13.getByAssetId(var15)
				local var17 = true
				loggerModule:info(`processing audio source: {v} (AssetId: {var15}, Path: {v:GetFullName()})`)
				
				if not byAssetId then
					loggerModule:warning("no metadata found. skipping...")
				elseif byAssetId.AudioType then
					if byAssetId.AudioType ~= Enum.AudioSubType.Music then
						loggerModule:debug(`{byAssetId.Title} is not classified as music. instead classified as: {byAssetId.AudioType.Name}. skipping...`)
						continue
					end
					loggerModule:debug(`{byAssetId.Title} is classified as music. checking if it meets criteria...`)
					
					if not byAssetId.RecordingCode or byAssetId.RecordingCode == "" then
						loggerModule:debug(`{byAssetId.Title} does not meet criteria (no recording code found)`)
						var17 = false
					end
					if var17 then
						loggerModule:info(`{byAssetId.Title} meets criteria`)
					end
					return {
						sound = v,
						metadata = byAssetId,
						meetsCriteria = var17,
						isFavorited = var14.getByAssetId(var15),
						toggleFavorite = function()
							-- upvalues: var14 (copy), var15 (ref), sendChromeWindowAnalyticsModule (copy), analyticActionsModule (copy), loggerModule (copy)
							return var14.toggleFavorite(var15):andThen(function(p3)
								-- upvalues: sendChromeWindowAnalyticsModule (copy), var15 (copy), analyticActionsModule (copy)
								if p3 then
									sendChromeWindowAnalyticsModule({ assetId = var15, action = analyticActionsModule.Like })
									
									return
								end
								sendChromeWindowAnalyticsModule({ assetId = var15, action = analyticActionsModule.Unlike })
							end):catch(function(p2)
								-- upvalues: loggerModule (copy)
								loggerModule:warning(p2)
							end)
						end
					}
				else
					loggerModule:debug(`{byAssetId.Title} has no AudioSubType classification. skipping...`)
				end
			end
		end
		return nil
	end, {
		var13.getByAssetId,
		var11,
		var14.getByAssetId,
		var14.toggleFavorite
	})
end