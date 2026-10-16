local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local dashModule = require(parent.Dash)
local momentsCommonModule = require(parent.MomentsCommon)
local constantsModule = require(momentsCreation.Constants)
local _ = require(momentsCreation.Types.Music)
local fFlagMomentsCreationSkipRecordingCodeFilterModule = require(momentsCreation.Flags.FFlagMomentsCreationSkipRecordingCodeFilter)
local fFlagMomentsCreationMusicSkipMetadataFetchModule = require(momentsCreation.Flags.FFlagMomentsCreationMusicSkipMetadataFetch)
local reportMusicSearchCounts = momentsCommonModule.Analytics.reportMusicSearchCounts

local function formatMusic(p1)
	-- upvalues: fFlagMomentsCreationSkipRecordingCodeFilterModule (ref)
	local t = {}
	
	for i, v in p1 do
		local var1 = tonumber(v.AssetId)
		
		if var1 ~= nil and (fFlagMomentsCreationSkipRecordingCodeFilterModule or v.RecordingCode ~= nil) then
			table.insert(t, {
				Artist = v.Artist,
				AssetId = var1,
				AudioType = v.AudioType,
				Duration = v.Duration,
				RecordingCode = v.RecordingCode,
				Title = v.Title
			})
		end
	end
	return t
end

local function formatSearchResults(p2)
	-- upvalues: dashModule (ref), constantsModule (ref)
	local t = {}
	local var2 = 0
	
	for i, v in p2 do
		local id = v.Id
		
		if id ~= nil and not dashModule.includes(constantsModule.SearchMusicCreatorDenylist, v.Creator.Id) then
			var2 += 1
			
			if v.Purchasable ~= false then
				table.insert(t, {
					Artist = v.Artist,
					AssetId = id,
					AudioType = v.AudioType,
					Duration = v.Duration,
					Title = v.Title
				})
			end
		end
	end
	return t, var2
end

return function(p3)
	-- upvalues: fFlagMomentsCreationMusicSkipMetadataFetchModule (ref), fFlagMomentsCreationSkipRecordingCodeFilterModule (ref), formatSearchResults (ref), reportMusicSearchCounts (ref), dashModule (ref), constantsModule (ref), formatMusic (ref)
	local function _()
		-- upvalues: p3 (ref)
		return p3 or game:GetService("AssetService")
	end
	
	return {
		searchMusic = function(p4, p5)
			-- upvalues: p3 (ref), fFlagMomentsCreationMusicSkipMetadataFetchModule (copy), fFlagMomentsCreationSkipRecordingCodeFilterModule (copy), formatSearchResults (copy), reportMusicSearchCounts (copy), dashModule (copy), constantsModule (copy), formatMusic (copy)
			local p6 = p3 or game:GetService("AssetService")
			local audioSearchParams = Instance.new("AudioSearchParams")
			audioSearchParams.SearchKeyword = p4
			audioSearchParams.AudioSubType = Enum.AudioSubType.Music
			audioSearchParams.MinDuration = p5
			local currentPage = p6:SearchAudio(audioSearchParams):GetCurrentPage()
			
			if fFlagMomentsCreationMusicSkipMetadataFetchModule and fFlagMomentsCreationSkipRecordingCodeFilterModule then
				local var3, var4 = formatSearchResults(currentPage)
				reportMusicSearchCounts(var4, #var3, { queryPresent = p4 ~= "" })
				
				return var3
			end
			local t = {}
			
			for i, v in currentPage do
				if not dashModule.includes(constantsModule.SearchMusicCreatorDenylist, v.Creator.Id) then
					table.insert(t, v.Id)
				end
			end
			local var5 = if #t == 0 then {} else p6:GetAudioMetadataAsync(t)
			local var6 = formatMusic(var5)
			reportMusicSearchCounts(#var5, #var6, { queryPresent = p4 ~= "" })
			
			return var6
		end,
		getMetadata = function(p7)
			-- upvalues: formatMusic (copy), p3 (ref)
			return formatMusic((p3 or game:GetService("AssetService")):GetAudioMetadataAsync(p7))
		end
	}
end