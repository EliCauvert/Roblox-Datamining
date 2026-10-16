local TeleportService = game:GetService("TeleportService")
local ExperienceStateRecordingService = game:GetService("ExperienceStateRecordingService")
local HttpService = game:GetService("HttpService")

function debugPrint(_) --[[ Line: 10 ]] end

local function SetLoadedState(p1, p2) --[[ Line: 16 ]]
	debugPrint("playResult minFrameNumber " .. tostring(p2.minFrameNumber) .. " maxFrameNumber " .. tostring(p2.maxFrameNumber) .. " minEpoch " .. tostring(p2.minEpoch) .. " - " .. tostring(DateTime.fromUnixTimestampMillis(p2.minEpoch):ToIsoDate()) .. " maxEpoch " .. tostring(p2.maxEpoch) .. " - " .. tostring(DateTime.fromUnixTimestampMillis(p2.maxEpoch):ToIsoDate()))
	p1.minLoadedFrameNumber = p2.minFrameNumber
	p1.maxLoadedFrameNumber = p2.maxFrameNumber
	p1.minLoadedEpoch = p2.minEpoch
	p1.maxLoadedEpoch = p2.maxEpoch
	
	if p1.minOverallEpoch == nil then
		p1.minOverallEpoch = p1.minLoadedEpoch
		p1.maxOverallEpoch = p1.maxLoadedEpoch
	elseif p1.sourceType == Enum.ExperienceStateRecordingLoadSourceType.File then
		p1.minOverallEpoch = math.min(p1.minLoadedEpoch, p1.minOverallEpoch)
		p1.maxOverallEpoch = math.max(p1.maxLoadedEpoch, p1.maxOverallEpoch)
	end
	p1.loadedLengthSeconds = (p1.maxLoadedEpoch - p1.minLoadedEpoch) / 1000
	p1.overallLengthSeconds = (p1.maxOverallEpoch - p1.minOverallEpoch) / 1000
	p1.replayToLoadedStartSeconds = (p1.minLoadedEpoch - p1.minOverallEpoch) / 1000
	debugPrint("minOverallEpoch " .. tostring(p1.minOverallEpoch) .. " maxOverallEpoch " .. tostring(p1.maxOverallEpoch) .. " overallLengthSeconds " .. tostring(p1.overallLengthSeconds) .. " loadedLengthSeconds " .. tostring(p1.loadedLengthSeconds))
	local LoadedLengthSecondsRatio = p1.loadedLengthSeconds / p1.overallLengthSeconds
	p1.ScrubberLoadProgress.Size = UDim2.new(LoadedLengthSecondsRatio, 0, 1, 0)
	local ReplayToLoadedStartSecondsRatio = p1.replayToLoadedStartSeconds / p1.overallLengthSeconds
	p1.ScrubberLoadProgress.Position = UDim2.new(ReplayToLoadedStartSecondsRatio, 0, 0, 0)
	debugPrint("loadedPercent " .. tostring(LoadedLengthSecondsRatio) .. " loadedStartPercent " .. tostring(ReplayToLoadedStartSecondsRatio))
end

function _getMetadataForUser(p1) --[[ Line: 74 ]]
	-- upvalues: ExperienceStateRecordingService (copy)
	print((ExperienceStateRecordingService:ListRecordingsAsync(p1, "")))
end

function getMetadataForGuid(EngineContextGuid, Callback) --[[ Line: 81 ]]
	-- upvalues: HttpService (copy)
	return HttpService:RequestInternal({
		Url = "https://apis.roblox.com/data-model-capture-service/v1/GetCaptureMetadataByEngineContextGuid",
		Method = "POST",
		Body = HttpService:JSONEncode({ engineContextGuid = EngineContextGuid }),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}):Start(function(p1, List) --[[ Line: 94 ]]
		-- upvalues: HttpService (upval), Callback (copy), EngineContextGuid (copy)
		if p1 then
			print(List.Body)
			local Metadata = HttpService:JSONDecode(List.Body).metadata
			Callback(tonumber(Metadata.placeId), (tonumber(Metadata.placeVersion)))
			
			return nil
		end
		warn("Failed to get metadata for GUID: " .. tostring(EngineContextGuid) .. " Error: " .. tostring(List.Status))
		
		for i, value in pairs(List) do
			print(i, value)
		end
		return nil
	end)
end

local LoadSlicesModule = {
	SetLoadedState = SetLoadedState,
	loadGUIDSlices = function(_, p1, _, _) --[[ Line: 116 ]]
		print((getMetadataForGuid(p1)))
	end
}

function LoadSlicesModule.loadGUID(p1, DirectGuid) --[[ Line: 121 ]]
	-- upvalues: ExperienceStateRecordingService (copy), LoadSlicesModule (copy)
	debugPrint("Loading slices for GUID: " .. tostring(DirectGuid))
	local _ = getMetadataForGuid(DirectGuid, function(p2, p3) --[[ Line: 125 ]]
		-- upvalues: ExperienceStateRecordingService (upval), DirectGuid (copy), p1 (copy), LoadSlicesModule (upval)
		debugPrint("Received metadata - PlaceId: " .. tostring(p2) .. " PlaceVersion: " .. tostring(p3))
		local PlaceFileURLAsync = ExperienceStateRecordingService:GetPlaceFileURLAsync(p3, p2)
		p1.LoadingOverlay.Visible = true
		p1.state.Loading = true
		p1.minLoadedFrameNumber = 0
		p1.maxLoadedFrameNumber = 0
		p1.minLoadedEpoch = 0
		p1.maxLoadedEpoch = 0
		p1.minOverallEpoch = nil
		p1.maxOverallEpoch = nil
		p1.nextSliceToLoad = nil
		p1.noncontiguousSliceToLoad = nil
		p1.recordingsToPlayback = ExperienceStateRecordingService:ListCaptureURLsAsync(DirectGuid, "2024-12-10T00:20:14.556Z", "2026-12-18T00:25:59.412Z").urls
		p1.placeURL = PlaceFileURLAsync
		p1.sourceType = Enum.ExperienceStateRecordingLoadSourceType.S3Url
		
		for i, value in p1.recordingsToPlayback do
			debugPrint("Recording " .. tostring(i) .. " " .. value)
		end
		task.spawn(function() --[[ Line: 155 ]]
			-- upvalues: ExperienceStateRecordingService (upval), p1 (upval), LoadSlicesModule (upval)
			local Success, Result = pcall(function() --[[ Line: 156 ]]
				-- upvalues: ExperienceStateRecordingService (upval), p1 (upval), LoadSlicesModule (upval)
				LoadSlicesModule.SetLoadedState(p1, (ExperienceStateRecordingService:LoadPlaybackAsync(p1.recordingsToPlayback[1], p1.placeURL, Enum.ExperienceStateRecordingLoadMode.NewReplay, p1.sourceType)))
				p1.nextSliceToLoad = 2
				p1.LoadingOverlay.Visible = false
				p1.state.Loading = false
				p1.ControlButtons(p1.PlayButton)
				task.spawn(LoadSlicesModule.loadSlicesAfterFirst, p1)
			end)
			
			if not Success then
				p1.LoadingLabel.Text = "Failed To Load Initial Slice, See Logs"
				warn("Failed to load initial slice because " .. tostring(Result))
			end
		end)
	end)
end

function LoadSlicesModule.experienceCallback(p2) --[[ Line: 182 ]]
	-- upvalues: TeleportService (copy), LoadSlicesModule (copy)
	local LocalPlayerTeleportData = TeleportService:GetLocalPlayerTeleportData()
	
	if LocalPlayerTeleportData then
		if LocalPlayerTeleportData.directGuid then
			LoadSlicesModule.loadGUID(p2, LocalPlayerTeleportData.directGuid)
			
			return
		end
		debugPrint("No direct GUID found in teleport data, falling back to loading slices")
		LoadSlicesModule.loadSlices(p2)
	end
end

function LoadSlicesModule.loadSlices(p2) --[[ Line: 196 ]]
	-- upvalues: TeleportService (copy), ExperienceStateRecordingService (copy), LoadSlicesModule (copy)
	p2.LoadingOverlay.Visible = true
	p2.state.Loading = true
	p2.minLoadedFrameNumber = 0
	p2.maxLoadedFrameNumber = 0
	p2.minLoadedEpoch = 0
	p2.maxLoadedEpoch = 0
	p2.minOverallEpoch = nil
	p2.maxOverallEpoch = nil
	p2.nextSliceToLoad = nil
	p2.noncontiguousSliceToLoad = nil
	local LocalPlayerTeleportData = TeleportService:GetLocalPlayerTeleportData()
	p2.recordingsToPlayback = { "/path/to/default/file" }
	p2.sourceType = Enum.ExperienceStateRecordingLoadSourceType.File
	
	if LocalPlayerTeleportData then
		p2.recordingsToPlayback = LocalPlayerTeleportData.captureURLs
		
		if LocalPlayerTeleportData.startTime then
			p2.minOverallEpoch = LocalPlayerTeleportData.startTime.UnixTimestampMillis
		end
		if LocalPlayerTeleportData.endTime then
			p2.maxOverallEpoch = LocalPlayerTeleportData.endTime.UnixTimestampMillis
		end
		p2.sourceType = Enum.ExperienceStateRecordingLoadSourceType:FromValue(LocalPlayerTeleportData.sourceType)
		p2.placeURL = LocalPlayerTeleportData.placeURL
	end
	for i, value in p2.recordingsToPlayback do
		debugPrint("Recording " .. tostring(i) .. " " .. value)
	end
	task.spawn(function() --[[ Line: 238 ]]
		-- upvalues: ExperienceStateRecordingService (upval), p2 (copy), LoadSlicesModule (upval)
		local Success, Result = pcall(function() --[[ Line: 239 ]]
			-- upvalues: ExperienceStateRecordingService (upval), p2 (upval), LoadSlicesModule (upval)
			LoadSlicesModule.SetLoadedState(p2, (ExperienceStateRecordingService:LoadPlaybackAsync(p2.recordingsToPlayback[1], p2.placeURL, Enum.ExperienceStateRecordingLoadMode.NewReplay, p2.sourceType)))
			p2.nextSliceToLoad = 2
			p2.LoadingOverlay.Visible = false
			p2.state.Loading = false
			p2.ControlButtons(p2.PlayButton)
			task.spawn(LoadSlicesModule.loadSlicesAfterFirst, p2)
		end)
		
		if not Success then
			p2.LoadingLabel.Text = "Failed To Load Initial Slice, See Logs"
			warn("Failed to load initial slice because " .. tostring(Result))
		end
	end)
end

function LoadSlicesModule.loadSlicesAfterFirst(p3) --[[ Line: 262 ]]
	-- upvalues: ExperienceStateRecordingService (copy), LoadSlicesModule (copy)
	local Success, Result = pcall(function() --[[ Line: 263 ]]
		-- upvalues: p3 (copy), ExperienceStateRecordingService (upval), LoadSlicesModule (upval)
		local Count = 0
		while true do
			task.wait(1)
			if p3.noncontiguousSliceToLoad == nil then
				if p3.nextSliceToLoad <= #p3.recordingsToPlayback and Count >= 4 then
					local RecordingsToPlaybackEntry = p3.recordingsToPlayback[p3.nextSliceToLoad]
					debugPrint("loading contiguous " .. tostring(p3.nextSliceToLoad) .. " url " .. RecordingsToPlaybackEntry)
					LoadSlicesModule.SetLoadedState(p3, (ExperienceStateRecordingService:LoadPlaybackAsync(RecordingsToPlaybackEntry, nil, Enum.ExperienceStateRecordingLoadMode.ContiguousSlice, p3.sourceType)))
					p3.nextSliceToLoad += 1
					Count = 0
				else
					Count += 1
				end
			else
				local RecordingsToPlaybackEntry = p3.recordingsToPlayback[p3.noncontiguousSliceToLoad]
				debugPrint("loading noncontiguous " .. tostring(p3.noncontiguousSliceToLoad) .. " url " .. RecordingsToPlaybackEntry)
				LoadSlicesModule.SetLoadedState(p3, (ExperienceStateRecordingService:LoadPlaybackAsync(RecordingsToPlaybackEntry, nil, Enum.ExperienceStateRecordingLoadMode.NoncontiguousSlice, p3.sourceType)))
				ExperienceStateRecordingService:SetPlaybackPercentage((p3.playbackSecondToFetch - p3.replayToLoadedStartSeconds) / p3.loadedLengthSeconds)
				p3.LoadingOverlay.Visible = false
				p3.state.Loading = false
				Count = 0
				p3.nextSliceToLoad = p3.noncontiguousSliceToLoad + 1
				p3.noncontiguousSliceToLoad = nil
			end
		end
	end)
	
	if not Success then
		p3.LoadingLabel.Text = "Failed To Load Later Slice, See Logs"
		warn("Failed to load later slice because " .. tostring(Result))
	end
end

function LoadSlicesModule.loadNoncontiguousSlice(p4, p5) --[[ Line: 335 ]]
	if p4.noncontiguousSliceToLoad ~= nil then
		warn("skipping non-contiguous slice load as still waiting for last jump")
	end
	p4.LoadingOverlay.Visible = true
	p4.state.Loading = true
	local ScaledOverallLengthSeconds = p5 * p4.overallLengthSeconds
	local Floored = math.floor(ScaledOverallLengthSeconds / 60)
	p4.noncontiguousSliceToLoad = math.min(Floored + 1, #p4.recordingsToPlayback)
	p4.playbackSecondToFetch = ScaledOverallLengthSeconds
	debugPrint("percentOverallLength " .. tostring(p5) .. " playbackSecondToFetch " .. tostring(ScaledOverallLengthSeconds) .. " playbackMinuteToFetch " .. tostring(Floored) .. " nextSliceToLoad " .. tostring(p4.nextSliceToLoad))
end

return LoadSlicesModule