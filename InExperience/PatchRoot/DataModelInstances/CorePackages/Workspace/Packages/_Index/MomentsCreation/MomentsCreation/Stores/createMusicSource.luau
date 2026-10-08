local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local dashModule = require(parent.Dash)
local momentsCommonModule = require(parent.MomentsCommon)
local constantsModule = require(momentsCreation.Constants)
local _ = require(momentsCreation.Types.Music)
local fFlagMomentsCreationSkipRecordingCodeFilterModule = require(momentsCreation.Flags.FFlagMomentsCreationSkipRecordingCodeFilter)
local fFlagMomentsCreationMusicSkipMetadataFetchModule = require(momentsCreation.Flags.FFlagMomentsCreationMusicSkipMetadataFetch)
local fFlagMomentsCreationAudioSearchV2SortTypeModule = require(momentsCreation.Flags.FFlagMomentsCreationAudioSearchV2SortType)
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
	-- upvalues: fFlagMomentsCreationMusicSkipMetadataFetchModule (ref), fFlagMomentsCreationSkipRecordingCodeFilterModule (ref), formatSearchResults (ref), dashModule (ref), constantsModule (ref), formatMusic (ref), fFlagMomentsCreationAudioSearchV2SortTypeModule (ref), reportMusicSearchCounts (ref)
	local function _()
		-- upvalues: p3 (ref)
		return p3 or game:GetService("AssetService")
	end
	
	local function formatPage(p4, p5)
		-- upvalues: fFlagMomentsCreationMusicSkipMetadataFetchModule (copy), fFlagMomentsCreationSkipRecordingCodeFilterModule (copy), formatSearchResults (copy), dashModule (copy), constantsModule (copy), formatMusic (copy)
		if fFlagMomentsCreationMusicSkipMetadataFetchModule and fFlagMomentsCreationSkipRecordingCodeFilterModule then
			return formatSearchResults(p5)
		end
		local t = {}
		
		for i, v in p5 do
			if not dashModule.includes(constantsModule.SearchMusicCreatorDenylist, v.Creator.Id) then
				table.insert(t, v.Id)
			end
		end
		local var3 = if #t == 0 then {} else p4:GetAudioMetadataAsync(t)
		
		return formatMusic(var3), #var3
	end
	
	return {
		searchMusic = function(p6, p7)
			-- upvalues: p3 (ref), fFlagMomentsCreationAudioSearchV2SortTypeModule (copy), formatPage (ref), reportMusicSearchCounts (copy)
			local p8 = p3 or game:GetService("AssetService")
			local audioSearchParams = Instance.new("AudioSearchParams")
			audioSearchParams.SearchKeyword = p6
			audioSearchParams.AudioSubType = Enum.AudioSubType.Music
			audioSearchParams.MinDuration = p7
			
			if fFlagMomentsCreationAudioSearchV2SortTypeModule then
				pcall(function()
					-- upvalues: audioSearchParams (ref), p6 (ref)
					local audioSortType = Enum.AudioSortType
					audioSearchParams.SortType = if p6 == "" then audioSortType.Top else audioSortType.Relevance
				end)
			end
			local var4 = p8:SearchAudio(audioSearchParams)
			local var5, var6 = formatPage(p8, var4:GetCurrentPage())
			reportMusicSearchCounts(var6, #var5, { queryPresent = p6 ~= "" })
			
			return var5, {
				isFinished = function()
					-- upvalues: var4 (ref)
					return var4.IsFinished == true
				end,
				nextPage = function()
					-- upvalues: var4 (ref), formatPage (copy), p8 (ref)
					var4:AdvanceToNextPageAsync()
					
					return formatPage(p8, var4:GetCurrentPage())
				end
			}
		end,
		getMetadata = function(p6)
			-- upvalues: formatMusic (copy), p3 (ref)
			return formatMusic((p3 or game:GetService("AssetService")):GetAudioMetadataAsync(p6))
		end
	}
end