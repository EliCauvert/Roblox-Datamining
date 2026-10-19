local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local DashModule = require(Parent.Dash)
local ConstantsModule = require(MomentsCreation.Constants)
local _ = require(MomentsCreation.Types.Music)
local FFlagMomentsCreationSkipRecordingCodeFilterModule = require(MomentsCreation.Flags.FFlagMomentsCreationSkipRecordingCodeFilter)
local FFlagMomentsCreationMusicSkipMetadataFetchModule = require(MomentsCreation.Flags.FFlagMomentsCreationMusicSkipMetadataFetch)
local FFlagMomentsCreationAudioSearchV2SortTypeModule = require(MomentsCreation.Flags.FFlagMomentsCreationAudioSearchV2SortType)
local ReportMusicSearchCountsFunction = require(Parent.MomentsCommon).Analytics.reportMusicSearchCounts

local function formatMusic(AudioMetadataAsync) --[[ Line: 81 ]]
	-- upvalues: FFlagMomentsCreationSkipRecordingCodeFilterModule (copy)
	local List = {}
	
	for _, value in AudioMetadataAsync do
		local Number: number? = tonumber(value.AssetId)
		
		if Number ~= nil and (FFlagMomentsCreationSkipRecordingCodeFilterModule or value.RecordingCode ~= nil) then
			table.insert(List, {
				Artist = value.Artist,
				AssetId = Number,
				AudioType = value.AudioType,
				Duration = value.Duration,
				RecordingCode = value.RecordingCode,
				Title = value.Title
			})
		end
	end
	return List
end

local function formatSearchResults(List) --[[ Line: 116 ]]
	-- upvalues: DashModule (copy), ConstantsModule (copy)
	local List1 = {}
	local Count = 0
	
	for _, value in List do
		local Id = value.Id
		local NoId = Id == nil or DashModule.includes(ConstantsModule.SearchMusicCreatorDenylist, value.Creator.Id)
		
		if not NoId then
			Count += 1
			NoId = value.Purchasable == false
		end
		if not NoId then
			table.insert(List1, {
				Artist = value.Artist,
				AssetId = Id,
				AudioType = value.AudioType,
				Duration = value.Duration,
				Title = value.Title
			})
		end
	end
	return List1, Count
end

return function(p1) --[[ Line: 147 | Named "createMusicSource" ]]
	-- upvalues: FFlagMomentsCreationMusicSkipMetadataFetchModule (copy), FFlagMomentsCreationSkipRecordingCodeFilterModule (copy), formatSearchResults (copy), DashModule (copy), ConstantsModule (copy), formatMusic (copy), FFlagMomentsCreationAudioSearchV2SortTypeModule (copy), ReportMusicSearchCountsFunction (copy)
	local function _() --[[ Line: 150 | Named "getAssetService" ]]
		-- upvalues: p1 (copy)
		return p1 or game:GetService("AssetService")
	end
	
	local function formatPage(AssetService, CurrentPage) --[[ Line: 155 ]]
		-- upvalues: FFlagMomentsCreationMusicSkipMetadataFetchModule (upval), FFlagMomentsCreationSkipRecordingCodeFilterModule (upval), formatSearchResults (upval), DashModule (upval), ConstantsModule (upval), formatMusic (upval)
		if FFlagMomentsCreationMusicSkipMetadataFetchModule and FFlagMomentsCreationSkipRecordingCodeFilterModule then
			return formatSearchResults(CurrentPage)
		end
		local Ids = {}
		
		for _, value in CurrentPage do
			if not DashModule.includes(ConstantsModule.SearchMusicCreatorDenylist, value.Creator.Id) then
				table.insert(Ids, value.Id)
			end
		end
		local T = if #Ids == 0 then {} else AssetService:GetAudioMetadataAsync(Ids)
		
		return formatMusic(T), #T
	end
	
	return {
		searchMusic = function(SearchKeyword, MinDuration) --[[ Line: 179 ]]
			-- upvalues: p1 (copy), FFlagMomentsCreationAudioSearchV2SortTypeModule (upval), formatPage (copy), ReportMusicSearchCountsFunction (upval)
			local P2 = p1 or game:GetService("AssetService")
			local AudioSearchParams = Instance.new("AudioSearchParams")
			AudioSearchParams.SearchKeyword = SearchKeyword
			AudioSearchParams.AudioSubType = Enum.AudioSubType.Music
			AudioSearchParams.MinDuration = MinDuration
			
			if FFlagMomentsCreationAudioSearchV2SortTypeModule then
				pcall(function() --[[ Line: 198 ]]
					-- upvalues: AudioSearchParams (copy), SearchKeyword (copy)
					local AudioSortType = Enum.AudioSortType
					AudioSearchParams.SortType = if SearchKeyword == "" then AudioSortType.MostUsed else AudioSortType.Relevance
				end)
			end
			local SearchAudioResult = P2:SearchAudio(AudioSearchParams)
			local FormatPageResult, FormatPageResult2 = formatPage(P2, SearchAudioResult:GetCurrentPage())
			ReportMusicSearchCountsFunction(FormatPageResult2, #FormatPageResult, { queryPresent = SearchKeyword ~= "" })
			
			return FormatPageResult, {
				isFinished = function(): boolean --[[ Line: 213 ]]
					-- upvalues: SearchAudioResult (copy)
					return SearchAudioResult.IsFinished == true
				end,
				nextPage = function() --[[ Line: 216 ]]
					-- upvalues: SearchAudioResult (copy), formatPage (upval), P2 (copy)
					SearchAudioResult:AdvanceToNextPageAsync()
					
					return (formatPage(P2, SearchAudioResult:GetCurrentPage()))
				end
			}
		end,
		getMetadata = function(IdList) --[[ Line: 224 ]]
			-- upvalues: formatMusic (upval), p1 (copy)
			return (formatMusic((p1 or game:GetService("AssetService")):GetAudioMetadataAsync(IdList)))
		end
	}
end