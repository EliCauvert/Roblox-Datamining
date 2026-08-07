-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:51 2026 Pacific Standard Time.

local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local parent = momentsCreationFlow.Parent
local assetService = game:GetService("AssetService")
local dashModule = require(parent.Dash)
local _ = require(parent.MomentsCommon)
local creationFlowMusicInfoRetrievedModule = require(momentsCreationFlow.Actions.CreationFlowMusicInfoRetrieved)
local musicSearchRetrievedModule = require(momentsCreationFlow.Actions.MusicSearchRetrieved)
local constantsModule = require(momentsCreationFlow.Constants)

local function filterCreator(p0) --[[ line: 18 ]]
	-- upvalues: dashModule (ref), constantsModule (ref)
	return not dashModule.includes(constantsModule.SearchMusicCreatorFilter, p0.Creator.Id)
end

local function filterRecordingCode(p1) --[[ line: 22 ]]
	return p1.RecordingCode ~= nil
end

local function formatMusic(p2) --[[ line: 26 ]]
	local t = {}
	
	for i, v in ipairs(p2) do
		if v.Id ~= nil then
			t[v.Id] = {
				Artist = v.Artist,
				AssetId = v.Id,
				AudioType = v.AudioType,
				Duration = v.Duration,
				RecordingCode = v.RecordingCode,
				Title = v.Title
			}
		end
	end
	return t
end

return function(p3, p4) --[[ line: 45 | named "SearchMusic" ]]
	-- upvalues: assetService (ref), dashModule (ref), filterCreator (ref), filterRecordingCode (ref), creationFlowMusicInfoRetrievedModule (ref), formatMusic (ref), musicSearchRetrievedModule (ref)
	return function(p5) --[[ line: 46 ]]
		-- upvalues: p3 (ref), p4 (ref), assetService (copy), dashModule (copy), filterCreator (copy), filterRecordingCode (copy), creationFlowMusicInfoRetrievedModule (copy), formatMusic (copy), musicSearchRetrievedModule (copy)
		local audioSearchParams = Instance.new("AudioSearchParams")
		audioSearchParams.SearchKeyword = p3
		audioSearchParams.AudioSubType = Enum.AudioSubType.Music
		audioSearchParams.MinDuration = p4 or 30
		task.spawn(function() --[[ line: 52 ]]
			-- upvalues: assetService (copy), audioSearchParams (ref), dashModule (copy), filterCreator (copy), filterRecordingCode (copy), p5 (ref), creationFlowMusicInfoRetrievedModule (copy), formatMusic (copy), musicSearchRetrievedModule (copy)
			local ok, status = pcall(function() --[[ line: 53 ]]
				-- upvalues: assetService (copy), audioSearchParams (copy)
				return assetService:SearchAudio(audioSearchParams)
			end)
			
			if ok then
				local var11 = dashModule.filter(assetService:GetAudioMetadataAsync(dashModule.map(dashModule.filter(status:GetCurrentPage(), filterCreator), function(p6) --[[ line: 65 ]]
					return p6.Id
				end)), filterRecordingCode)
				p5:dispatch(creationFlowMusicInfoRetrievedModule(formatMusic(var11)))
				p5:dispatch(musicSearchRetrievedModule(dashModule.map(var11, function(p7) --[[ line: 72 ]]
					return tonumber(p7.AssetId)
				end)))
				
				return
			end
			warn("Failed to retrieve musics: " .. status)
		end)
	end
end