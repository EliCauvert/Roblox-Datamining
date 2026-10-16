local MomentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local Parent = MomentsCreationFlow.Parent
local AssetService = game:GetService("AssetService")
local DashModule = require(Parent.Dash)
local _ = require(Parent.MomentsCommon)
local CreationFlowMusicInfoRetrievedModule = require(MomentsCreationFlow.Actions.CreationFlowMusicInfoRetrieved)
local MusicSearchRetrievedModule = require(MomentsCreationFlow.Actions.MusicSearchRetrieved)
local ConstantsModule = require(MomentsCreationFlow.Constants)

local function filterCreator(p1): boolean --[[ Line: 18 ]]
	-- upvalues: DashModule (copy), ConstantsModule (copy)
	return not DashModule.includes(ConstantsModule.SearchMusicCreatorFilter, p1.Creator.Id)
end

local function filterRecordingCode(p1): boolean --[[ Line: 22 ]]
	return p1.RecordingCode ~= nil
end

local function formatMusic(FilterResult) --[[ Line: 26 ]]
	local t = {}
	
	for _, value in ipairs(FilterResult) do
		if value.Id ~= nil then
			t[value.Id] = {
				Artist = value.Artist,
				AssetId = value.Id,
				AudioType = value.AudioType,
				Duration = value.Duration,
				RecordingCode = value.RecordingCode,
				Title = value.Title
			}
		end
	end
	return t
end

return function(SearchKeyword, p1) --[[ Line: 45 | Named "SearchMusic" ]]
	-- upvalues: AssetService (copy), DashModule (copy), filterCreator (copy), filterRecordingCode (copy), CreationFlowMusicInfoRetrievedModule (copy), formatMusic (copy), MusicSearchRetrievedModule (copy)
	return function(p2) --[[ Line: 46 ]]
		-- upvalues: SearchKeyword (copy), p1 (copy), AssetService (upval), DashModule (upval), filterCreator (upval), filterRecordingCode (upval), CreationFlowMusicInfoRetrievedModule (upval), formatMusic (upval), MusicSearchRetrievedModule (upval)
		local AudioSearchParams = Instance.new("AudioSearchParams")
		AudioSearchParams.SearchKeyword = SearchKeyword
		AudioSearchParams.AudioSubType = Enum.AudioSubType.Music
		AudioSearchParams.MinDuration = p1 or 30
		task.spawn(function() --[[ Line: 52 ]]
			-- upvalues: AssetService (upval), AudioSearchParams (copy), DashModule (upval), filterCreator (upval), filterRecordingCode (upval), p2 (copy), CreationFlowMusicInfoRetrievedModule (upval), formatMusic (upval), MusicSearchRetrievedModule (upval)
			local Success, Result = pcall(function() --[[ Line: 53 ]]
				-- upvalues: AssetService (upval), AudioSearchParams (upval)
				return AssetService:SearchAudio(AudioSearchParams)
			end)
			
			if Success then
				local FilterResult = DashModule.filter(AssetService:GetAudioMetadataAsync((DashModule.map(DashModule.filter(Result:GetCurrentPage(), filterCreator), function(p3) --[[ Line: 65 ]]
					return p3.Id
				end))), filterRecordingCode)
				p2:dispatch(CreationFlowMusicInfoRetrievedModule((formatMusic(FilterResult))))
				p2:dispatch(MusicSearchRetrievedModule(DashModule.map(FilterResult, function(p3): number --[[ Line: 72 ]]
					return (tonumber(p3.AssetId))
				end)))
				
				return
			else
				warn("Failed to retrieve musics: " .. Result)
			end
		end)
	end
end