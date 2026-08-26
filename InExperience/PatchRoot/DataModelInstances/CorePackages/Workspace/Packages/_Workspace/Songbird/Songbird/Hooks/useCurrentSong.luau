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
	local var1 = useAudibleSounds()
	local var2 = useMemo(function()
		-- upvalues: cryoModule (copy), var1 (ref), getAssetIdForAudioSourceModule (copy)
		return cryoModule.List.filter(var1, function(p1)
			-- upvalues: getAssetIdForAudioSourceModule (copy)
			return getAssetIdForAudioSourceModule(p1) ~= nil
		end)
	end, { var1 })
	local var3 = useMemo(function()
		-- upvalues: cryoModule (copy), var2 (ref), getAssetIdForAudioSourceModule (copy)
		return cryoModule.List.map(var2, function(p1)
			-- upvalues: getAssetIdForAudioSourceModule (copy)
			return getAssetIdForAudioSourceModule(p1)
		end)
	end, { var2 })
	local var4 = useAudioMetadataModule(var3)
	local var5 = useAssetFavoriting(var3)
	
	return useMemo(function()
		-- upvalues: loggerModule (copy), var2 (ref), getAssetIdForAudioSourceModule (copy), var4 (ref), var5 (ref), sendChromeWindowAnalyticsModule (copy), analyticActionsModule (copy)
		local byAssetId
		loggerModule:info(`determining currently playing song from {#var2} audio sources...`)
		
		for i, v in var2 do
			local var6 = getAssetIdForAudioSourceModule(v)
			
			if var6 then
				byAssetId = var4.getByAssetId(var6)
				local var7 = true
				loggerModule:info(`processing audio source: {v} (AssetId: {var6}, Path: {v:GetFullName()})`)
				
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
						var7 = false
					end
					if var7 then
						loggerModule:info(`{byAssetId.Title} meets criteria`)
					end
					return {
						sound = v,
						metadata = byAssetId,
						meetsCriteria = var7,
						isFavorited = var5.getByAssetId(var6),
						toggleFavorite = function()
							-- upvalues: var5 (copy), var6 (ref), sendChromeWindowAnalyticsModule (copy), analyticActionsModule (copy), loggerModule (copy)
							return var5.toggleFavorite(var6):andThen(function(p1)
								-- upvalues: sendChromeWindowAnalyticsModule (copy), var6 (copy), analyticActionsModule (copy)
								if p1 then
									sendChromeWindowAnalyticsModule({ assetId = var6, action = analyticActionsModule.Like })
									
									return
								end
								sendChromeWindowAnalyticsModule({ assetId = var6, action = analyticActionsModule.Unlike })
							end):catch(function(p1)
								-- upvalues: loggerModule (copy)
								loggerModule:warning(p1)
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
		var4.getByAssetId,
		var2,
		var5.getByAssetId,
		var5.toggleFavorite
	})
end