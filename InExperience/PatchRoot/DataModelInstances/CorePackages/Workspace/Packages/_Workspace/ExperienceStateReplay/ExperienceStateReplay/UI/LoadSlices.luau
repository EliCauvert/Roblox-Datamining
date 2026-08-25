local teleportService = game:GetService("TeleportService")
local experienceStateRecordingService = game:GetService("ExperienceStateRecordingService")
local httpService = game:GetService("HttpService")
local t = {
	SetLoadedState = function(value, p0)
		debugPrint("playResult minFrameNumber " .. tostring(p0.minFrameNumber) .. " maxFrameNumber " .. tostring(p0.maxFrameNumber) .. " minEpoch " .. tostring(p0.minEpoch) .. " - " .. tostring(DateTime.fromUnixTimestampMillis(p0.minEpoch):ToIsoDate()) .. " maxEpoch " .. tostring(p0.maxEpoch) .. " - " .. tostring(DateTime.fromUnixTimestampMillis(p0.maxEpoch):ToIsoDate()))
		value.minLoadedFrameNumber = p0.minFrameNumber
		value.maxLoadedFrameNumber = p0.maxFrameNumber
		value.minLoadedEpoch = p0.minEpoch
		value.maxLoadedEpoch = p0.maxEpoch
		
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
		local var4 = value.loadedLengthSeconds / value.overallLengthSeconds
		value.ScrubberLoadProgress.Size = UDim2.new(var4, 0, 1, 0)
		local var5 = value.replayToLoadedStartSeconds / value.overallLengthSeconds
		value.ScrubberLoadProgress.Position = UDim2.new(var5, 0, 0, 0)
		debugPrint("loadedPercent " .. tostring(var4) .. " loadedStartPercent " .. tostring(var5))
	end,
	loadGUIDSlices = function(_, p1, _, _)
		print(getMetadataForGuid(p1))
	end
}

function debugPrint(_) end

function _getMetadataForUser(p2)
	-- upvalues: experienceStateRecordingService (ref)
	print(experienceStateRecordingService:ListRecordingsAsync(p2, ""))
end

function getMetadataForGuid(p3, p4)
	-- upvalues: httpService (ref)
	return httpService:RequestInternal({
		Url = "https://apis.roblox.com/data-model-capture-service/v1/GetCaptureMetadataByEngineContextGuid",
		Method = "POST",
		Body = httpService:JSONEncode({ engineContextGuid = p3 }),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}):Start(function(p5, p6)
		-- upvalues: httpService (copy), p4 (ref), p3 (ref)
		if p5 then
			print(p6.Body)
			local metadata = httpService:JSONDecode(p6.Body).metadata
			p4(tonumber(metadata.placeId), tonumber(metadata.placeVersion))
			
			return nil
		end
		warn("Failed to get metadata for GUID: " .. tostring(p3) .. " Error: " .. tostring(p6.Status))
		
		for i, v in pairs(p6) do
			print(i, v)
		end
		return nil
	end)
end

function t.loadGUID(p7, p8)
	-- upvalues: experienceStateRecordingService (ref), t (ref)
	debugPrint("Loading slices for GUID: " .. tostring(p8))
	local _ = getMetadataForGuid(p8, function(p9, p10)
		-- upvalues: experienceStateRecordingService (copy), p8 (ref), p7 (ref), t (copy)
		debugPrint("Received metadata - PlaceId: " .. tostring(p9) .. " PlaceVersion: " .. tostring(p10))
		local var6 = experienceStateRecordingService:ListCaptureURLsAsync(p8, "2024-12-10T00:20:14.556Z", "2026-12-18T00:25:59.412Z")
		local var7 = experienceStateRecordingService:GetPlaceFileURLAsync(p10, p9)
		p7.LoadingOverlay.Visible = true
		p7.state.Loading = true
		p7.minLoadedFrameNumber = 0
		p7.maxLoadedFrameNumber = 0
		p7.minLoadedEpoch = 0
		p7.maxLoadedEpoch = 0
		p7.minOverallEpoch = nil
		p7.maxOverallEpoch = nil
		p7.nextSliceToLoad = nil
		p7.noncontiguousSliceToLoad = nil
		p7.recordingsToPlayback = var6.urls
		p7.placeURL = var7
		p7.sourceType = Enum.ExperienceStateRecordingLoadSourceType.S3Url
		
		for i, v in p7.recordingsToPlayback do
			debugPrint("Recording " .. tostring(i) .. " " .. v)
		end
		task.spawn(function()
			-- upvalues: experienceStateRecordingService (copy), p7 (copy), t (copy)
			local ok, status = pcall(function()
				-- upvalues: experienceStateRecordingService (copy), p7 (copy), t (copy)
				t.SetLoadedState(p7, experienceStateRecordingService:LoadPlaybackAsync(p7.recordingsToPlayback[1], p7.placeURL, Enum.ExperienceStateRecordingLoadMode.NewReplay, p7.sourceType))
				p7.nextSliceToLoad = 2
				p7.LoadingOverlay.Visible = false
				p7.state.Loading = false
				p7.ControlButtons(p7.PlayButton)
				task.spawn(t.loadSlicesAfterFirst, p7)
			end)
			
			if not ok then
				p7.LoadingLabel.Text = "Failed To Load Initial Slice, See Logs"
				warn("Failed to load initial slice because " .. tostring(status))
			end
		end)
	end)
end

function t.experienceCallback(p11)
	-- upvalues: teleportService (ref), t (ref)
	local localPlayerTeleportData = teleportService:GetLocalPlayerTeleportData()
	
	if localPlayerTeleportData then
		if localPlayerTeleportData.directGuid then
			t.loadGUID(p11, localPlayerTeleportData.directGuid)
			
			return
		end
		debugPrint("No direct GUID found in teleport data, falling back to loading slices")
		t.loadSlices(p11)
	end
end

function t.loadSlices(p12)
	-- upvalues: teleportService (ref), experienceStateRecordingService (ref), t (ref)
	p12.LoadingOverlay.Visible = true
	p12.state.Loading = true
	p12.minLoadedFrameNumber = 0
	p12.maxLoadedFrameNumber = 0
	p12.minLoadedEpoch = 0
	p12.maxLoadedEpoch = 0
	p12.minOverallEpoch = nil
	p12.maxOverallEpoch = nil
	p12.nextSliceToLoad = nil
	p12.noncontiguousSliceToLoad = nil
	local localPlayerTeleportData = teleportService:GetLocalPlayerTeleportData()
	p12.recordingsToPlayback = { "/path/to/default/file" }
	p12.sourceType = Enum.ExperienceStateRecordingLoadSourceType.File
	
	if localPlayerTeleportData then
		p12.recordingsToPlayback = localPlayerTeleportData.captureURLs
		
		if localPlayerTeleportData.startTime then
			p12.minOverallEpoch = localPlayerTeleportData.startTime.UnixTimestampMillis
		end
		if localPlayerTeleportData.endTime then
			p12.maxOverallEpoch = localPlayerTeleportData.endTime.UnixTimestampMillis
		end
		p12.sourceType = Enum.ExperienceStateRecordingLoadSourceType:FromValue(localPlayerTeleportData.sourceType)
		p12.placeURL = localPlayerTeleportData.placeURL
	end
	for i, v in p12.recordingsToPlayback do
		debugPrint("Recording " .. tostring(i) .. " " .. v)
	end
	task.spawn(function()
		-- upvalues: experienceStateRecordingService (copy), p12 (ref), t (copy)
		local ok, status = pcall(function()
			-- upvalues: experienceStateRecordingService (copy), p12 (copy), t (copy)
			t.SetLoadedState(p12, experienceStateRecordingService:LoadPlaybackAsync(p12.recordingsToPlayback[1], p12.placeURL, Enum.ExperienceStateRecordingLoadMode.NewReplay, p12.sourceType))
			p12.nextSliceToLoad = 2
			p12.LoadingOverlay.Visible = false
			p12.state.Loading = false
			p12.ControlButtons(p12.PlayButton)
			task.spawn(t.loadSlicesAfterFirst, p12)
		end)
		
		if not ok then
			p12.LoadingLabel.Text = "Failed To Load Initial Slice, See Logs"
			warn("Failed to load initial slice because " .. tostring(status))
		end
	end)
end

function t.loadSlicesAfterFirst(p13)
	-- upvalues: experienceStateRecordingService (ref), t (ref)
	local ok, status = pcall(function()
		-- upvalues: p13 (ref), experienceStateRecordingService (copy), t (copy)
		local var10 = 0
		while true do
			task.wait(1)
			if p13.noncontiguousSliceToLoad ~= nil then
				if p13.nextSliceToLoad <= #p13.recordingsToPlayback and var10 >= 4 then
					local nextSliceToLoad = p13.recordingsToPlayback[p13.nextSliceToLoad]
					debugPrint("loading contiguous " .. tostring(p13.nextSliceToLoad) .. " url " .. nextSliceToLoad)
					t.SetLoadedState(p13, experienceStateRecordingService:LoadPlaybackAsync(nextSliceToLoad, nil, Enum.ExperienceStateRecordingLoadMode.ContiguousSlice, p13.sourceType))
					p13.nextSliceToLoad += 1
					var10 = 0
				else
					var10 += 1
				end
			else
				local noncontiguousSliceToLoad = p13.recordingsToPlayback[p13.noncontiguousSliceToLoad]
				debugPrint("loading noncontiguous " .. tostring(p13.noncontiguousSliceToLoad) .. " url " .. noncontiguousSliceToLoad)
				t.SetLoadedState(p13, experienceStateRecordingService:LoadPlaybackAsync(noncontiguousSliceToLoad, nil, Enum.ExperienceStateRecordingLoadMode.NoncontiguousSlice, p13.sourceType))
				experienceStateRecordingService:SetPlaybackPercentage((p13.playbackSecondToFetch - p13.replayToLoadedStartSeconds) / p13.loadedLengthSeconds)
				p13.LoadingOverlay.Visible = false
				p13.state.Loading = false
				var10 = 0
				p13.nextSliceToLoad = p13.noncontiguousSliceToLoad + 1
				p13.noncontiguousSliceToLoad = nil
			end
		end
	end)
	
	if not ok then
		p13.LoadingLabel.Text = "Failed To Load Later Slice, See Logs"
		warn("Failed to load later slice because " .. tostring(status))
	end
end

function t.loadNoncontiguousSlice(p14, p15)
	if p14.noncontiguousSliceToLoad ~= nil then
		warn("skipping non-contiguous slice load as still waiting for last jump")
	end
	p14.LoadingOverlay.Visible = true
	p14.state.Loading = true
	local var11 = p15 * p14.overallLengthSeconds
	local floored = math.floor(var11 / 60)
	p14.noncontiguousSliceToLoad = math.min(floored + 1, #p14.recordingsToPlayback)
	p14.playbackSecondToFetch = var11
	debugPrint("percentOverallLength " .. tostring(p15) .. " playbackSecondToFetch " .. tostring(var11) .. " playbackMinuteToFetch " .. tostring(floored) .. " nextSliceToLoad " .. tostring(p14.nextSliceToLoad))
end

return t