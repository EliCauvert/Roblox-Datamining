local teleportService = game:GetService("TeleportService")
local experienceStateRecordingService = game:GetService("ExperienceStateRecordingService")
local httpService = game:GetService("HttpService")
local t = {
	SetLoadedState = function(value, p1)
		debugPrint("playResult minFrameNumber " .. tostring(p1.minFrameNumber) .. " maxFrameNumber " .. tostring(p1.maxFrameNumber) .. " minEpoch " .. tostring(p1.minEpoch) .. " - " .. tostring(DateTime.fromUnixTimestampMillis(p1.minEpoch):ToIsoDate()) .. " maxEpoch " .. tostring(p1.maxEpoch) .. " - " .. tostring(DateTime.fromUnixTimestampMillis(p1.maxEpoch):ToIsoDate()))
		value.minLoadedFrameNumber = p1.minFrameNumber
		value.maxLoadedFrameNumber = p1.maxFrameNumber
		value.minLoadedEpoch = p1.minEpoch
		value.maxLoadedEpoch = p1.maxEpoch
		
		if value.minOverallEpoch == nil then
			value.minOverallEpoch = value.minLoadedEpoch
			value.maxOverallEpoch = value.maxLoadedEpoch
		elseif value.sourceType == Enum.ExperienceStateRecordingLoadSourceType.File then
			value.minOverallEpoch = math.min(value.minLoadedEpoch, value.minOverallEpoch)
			value.maxOverallEpoch = math.max(value.maxLoadedEpoch, value.maxOverallEpoch)
		end
		value.loadedLengthSeconds = (value.maxLoadedEpoch - value.minLoadedEpoch) / 1000
		value.overallLengthSeconds = (value.maxOverallEpoch - value.minOverallEpoch) / 1000
		value.replayToLoadedStartSeconds = (value.minLoadedEpoch - value.minOverallEpoch) / 1000
		debugPrint("minOverallEpoch " .. tostring(value.minOverallEpoch) .. " maxOverallEpoch " .. tostring(value.maxOverallEpoch) .. " overallLengthSeconds " .. tostring(value.overallLengthSeconds) .. " loadedLengthSeconds " .. tostring(value.loadedLengthSeconds))
		local var1 = value.loadedLengthSeconds / value.overallLengthSeconds
		value.ScrubberLoadProgress.Size = UDim2.new(var1, 0, 1, 0)
		local var2 = value.replayToLoadedStartSeconds / value.overallLengthSeconds
		value.ScrubberLoadProgress.Position = UDim2.new(var2, 0, 0, 0)
		debugPrint("loadedPercent " .. tostring(var1) .. " loadedStartPercent " .. tostring(var2))
	end,
	loadGUIDSlices = function(_, p1, _, _)
		print(getMetadataForGuid(p1))
	end
}

function debugPrint(_) end

function _getMetadataForUser(p1)
	-- upvalues: experienceStateRecordingService (ref)
	print(experienceStateRecordingService:ListRecordingsAsync(p1, ""))
end

function getMetadataForGuid(p1, p2)
	-- upvalues: httpService (ref)
	return httpService:RequestInternal({
		Url = "https://apis.roblox.com/data-model-capture-service/v1/GetCaptureMetadataByEngineContextGuid",
		Method = "POST",
		Body = httpService:JSONEncode({ engineContextGuid = p1 }),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}):Start(function(p3, p4)
		-- upvalues: httpService (copy), p2 (ref), p1 (ref)
		if p3 then
			print(p4.Body)
			local metadata = httpService:JSONDecode(p4.Body).metadata
			p2(tonumber(metadata.placeId), tonumber(metadata.placeVersion))
			
			return nil
		end
		warn("Failed to get metadata for GUID: " .. tostring(p1) .. " Error: " .. tostring(p4.Status))
		
		for i, v in pairs(p4) do
			print(i, v)
		end
		return nil
	end)
end

function t.loadGUID(p3, p4)
	-- upvalues: experienceStateRecordingService (ref), t (ref)
	debugPrint("Loading slices for GUID: " .. tostring(p4))
	local _ = getMetadataForGuid(p4, function(p5, p6)
		-- upvalues: experienceStateRecordingService (copy), p4 (ref), p3 (ref), t (copy)
		debugPrint("Received metadata - PlaceId: " .. tostring(p5) .. " PlaceVersion: " .. tostring(p6))
		local var1 = experienceStateRecordingService:ListCaptureURLsAsync(p4, "2024-12-10T00:20:14.556Z", "2026-12-18T00:25:59.412Z")
		local var2 = experienceStateRecordingService:GetPlaceFileURLAsync(p6, p5)
		p3.LoadingOverlay.Visible = true
		p3.state.Loading = true
		p3.minLoadedFrameNumber = 0
		p3.maxLoadedFrameNumber = 0
		p3.minLoadedEpoch = 0
		p3.maxLoadedEpoch = 0
		p3.minOverallEpoch = nil
		p3.maxOverallEpoch = nil
		p3.nextSliceToLoad = nil
		p3.noncontiguousSliceToLoad = nil
		p3.recordingsToPlayback = var1.urls
		p3.placeURL = var2
		p3.sourceType = Enum.ExperienceStateRecordingLoadSourceType.S3Url
		
		for i, v in p3.recordingsToPlayback do
			debugPrint("Recording " .. tostring(i) .. " " .. v)
		end
		task.spawn(function()
			-- upvalues: experienceStateRecordingService (copy), p3 (copy), t (copy)
			local ok, status = pcall(function()
				-- upvalues: experienceStateRecordingService (copy), p3 (copy), t (copy)
				t.SetLoadedState(p3, experienceStateRecordingService:LoadPlaybackAsync(p3.recordingsToPlayback[1], p3.placeURL, Enum.ExperienceStateRecordingLoadMode.NewReplay, p3.sourceType))
				p3.nextSliceToLoad = 2
				p3.LoadingOverlay.Visible = false
				p3.state.Loading = false
				p3.ControlButtons(p3.PlayButton)
				task.spawn(t.loadSlicesAfterFirst, p3)
			end)
			
			if not ok then
				p3.LoadingLabel.Text = "Failed To Load Initial Slice, See Logs"
				warn("Failed to load initial slice because " .. tostring(status))
			end
		end)
	end)
end

function t.experienceCallback(p5)
	-- upvalues: teleportService (ref), t (ref)
	local localPlayerTeleportData = teleportService:GetLocalPlayerTeleportData()
	
	if localPlayerTeleportData then
		if localPlayerTeleportData.directGuid then
			t.loadGUID(p5, localPlayerTeleportData.directGuid)
			
			return
		end
		debugPrint("No direct GUID found in teleport data, falling back to loading slices")
		t.loadSlices(p5)
	end
end

function t.loadSlices(p5)
	-- upvalues: teleportService (ref), experienceStateRecordingService (ref), t (ref)
	p5.LoadingOverlay.Visible = true
	p5.state.Loading = true
	p5.minLoadedFrameNumber = 0
	p5.maxLoadedFrameNumber = 0
	p5.minLoadedEpoch = 0
	p5.maxLoadedEpoch = 0
	p5.minOverallEpoch = nil
	p5.maxOverallEpoch = nil
	p5.nextSliceToLoad = nil
	p5.noncontiguousSliceToLoad = nil
	local localPlayerTeleportData = teleportService:GetLocalPlayerTeleportData()
	p5.recordingsToPlayback = { "/path/to/default/file" }
	p5.sourceType = Enum.ExperienceStateRecordingLoadSourceType.File
	
	if localPlayerTeleportData then
		p5.recordingsToPlayback = localPlayerTeleportData.captureURLs
		
		if localPlayerTeleportData.startTime then
			p5.minOverallEpoch = localPlayerTeleportData.startTime.UnixTimestampMillis
		end
		if localPlayerTeleportData.endTime then
			p5.maxOverallEpoch = localPlayerTeleportData.endTime.UnixTimestampMillis
		end
		p5.sourceType = Enum.ExperienceStateRecordingLoadSourceType:FromValue(localPlayerTeleportData.sourceType)
		p5.placeURL = localPlayerTeleportData.placeURL
	end
	for i, v in p5.recordingsToPlayback do
		debugPrint("Recording " .. tostring(i) .. " " .. v)
	end
	task.spawn(function()
		-- upvalues: experienceStateRecordingService (copy), p5 (ref), t (copy)
		local ok, status = pcall(function()
			-- upvalues: experienceStateRecordingService (copy), p5 (copy), t (copy)
			t.SetLoadedState(p5, experienceStateRecordingService:LoadPlaybackAsync(p5.recordingsToPlayback[1], p5.placeURL, Enum.ExperienceStateRecordingLoadMode.NewReplay, p5.sourceType))
			p5.nextSliceToLoad = 2
			p5.LoadingOverlay.Visible = false
			p5.state.Loading = false
			p5.ControlButtons(p5.PlayButton)
			task.spawn(t.loadSlicesAfterFirst, p5)
		end)
		
		if not ok then
			p5.LoadingLabel.Text = "Failed To Load Initial Slice, See Logs"
			warn("Failed to load initial slice because " .. tostring(status))
		end
	end)
end

function t.loadSlicesAfterFirst(p6)
	-- upvalues: experienceStateRecordingService (ref), t (ref)
	local ok, status = pcall(function()
		-- upvalues: p6 (ref), experienceStateRecordingService (copy), t (copy)
		local var1 = 0
		while true do
			task.wait(1)
			if p6.noncontiguousSliceToLoad ~= nil then
				if p6.nextSliceToLoad <= #p6.recordingsToPlayback and var1 >= 4 then
					local nextSliceToLoad = p6.recordingsToPlayback[p6.nextSliceToLoad]
					debugPrint("loading contiguous " .. tostring(p6.nextSliceToLoad) .. " url " .. nextSliceToLoad)
					t.SetLoadedState(p6, experienceStateRecordingService:LoadPlaybackAsync(nextSliceToLoad, nil, Enum.ExperienceStateRecordingLoadMode.ContiguousSlice, p6.sourceType))
					p6.nextSliceToLoad += 1
					var1 = 0
				else
					var1 += 1
				end
			else
				local noncontiguousSliceToLoad = p6.recordingsToPlayback[p6.noncontiguousSliceToLoad]
				debugPrint("loading noncontiguous " .. tostring(p6.noncontiguousSliceToLoad) .. " url " .. noncontiguousSliceToLoad)
				t.SetLoadedState(p6, experienceStateRecordingService:LoadPlaybackAsync(noncontiguousSliceToLoad, nil, Enum.ExperienceStateRecordingLoadMode.NoncontiguousSlice, p6.sourceType))
				experienceStateRecordingService:SetPlaybackPercentage((p6.playbackSecondToFetch - p6.replayToLoadedStartSeconds) / p6.loadedLengthSeconds)
				p6.LoadingOverlay.Visible = false
				p6.state.Loading = false
				var1 = 0
				p6.nextSliceToLoad = p6.noncontiguousSliceToLoad + 1
				p6.noncontiguousSliceToLoad = nil
			end
		end
	end)
	
	if not ok then
		p6.LoadingLabel.Text = "Failed To Load Later Slice, See Logs"
		warn("Failed to load later slice because " .. tostring(status))
	end
end

function t.loadNoncontiguousSlice(p7, p8)
	if p7.noncontiguousSliceToLoad ~= nil then
		warn("skipping non-contiguous slice load as still waiting for last jump")
	end
	p7.LoadingOverlay.Visible = true
	p7.state.Loading = true
	local var1 = p8 * p7.overallLengthSeconds
	local floored = math.floor(var1 / 60)
	p7.noncontiguousSliceToLoad = math.min(floored + 1, #p7.recordingsToPlayback)
	p7.playbackSecondToFetch = var1
	debugPrint("percentOverallLength " .. tostring(p8) .. " playbackSecondToFetch " .. tostring(var1) .. " playbackMinuteToFetch " .. tostring(floored) .. " nextSliceToLoad " .. tostring(p7.nextSliceToLoad))
end

return t