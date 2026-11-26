local TeleportService = game:GetService("TeleportService")
local ExperienceStateRecordingService = game:GetService("ExperienceStateRecordingService")
local HttpService = game:GetService("HttpService")
local ContentProvider = game:GetService("ContentProvider")
local Players = game:GetService("Players")
local ExperienceStateReplayPreloadAssets = game:DefineFastFlag("ExperienceStateReplayPreloadAssets", false)
local FFlagExperienceStateReplaySourceClockPlaybackModule = require(script.Parent.Parent.Flags.FFlagExperienceStateReplaySourceClockPlayback)
local FFlagExperienceStateReplayRecordedViewportEventModule = require(script.Parent.Parent.Flags.FFlagExperienceStateReplayRecordedViewportEvent)
local ExperienceStateReplayCaptureMetadataUrl = game:DefineFastString("ExperienceStateReplayCaptureMetadataUrl", "https://apis.roblox.com/data-model-capture-service/v1/GetCaptureMetadataByEngineContextGuid")

function debugPrint(_) end

local function SetLoadedState(p1, p2)
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

function _getMetadataForUser(p1)
	-- upvalues: ExperienceStateRecordingService (copy)
	print((ExperienceStateRecordingService:ListRecordingsAsync(p1, "")))
end

local LoadSlicesModule = {
	SetLoadedState = SetLoadedState,
	decodeCaptureMetadata = function(Input)
		-- upvalues: HttpService (copy)
		local Data = HttpService:JSONDecode(Input)
		local Metadata = Data and Data.metadata
		
		if type(Metadata) ~= "table" then
			error("capture metadata response has no metadata object")
		end
		local Number: number? = tonumber(Metadata.placeId)
		local Number1: number? = tonumber(Metadata.placeVersion)
		local RecordingStartUtcTime = Metadata.recordingStartUtcTime
		local RecordingEndUtcTime = Metadata.recordingEndUtcTime
		
		if Number == nil or Number1 == nil then
			error("capture metadata is missing placeId/placeVersion")
		end
		return Number, Number1, RecordingStartUtcTime, RecordingEndUtcTime
	end
}

function getMetadataForGuid(EngineContextGuid, Callback1, Callback, p1)
	-- upvalues: ExperienceStateReplayCaptureMetadataUrl (copy), HttpService (copy), LoadSlicesModule (copy)
	local function _(p2)
		-- upvalues: Callback (copy)
		if Callback == nil then
			warn(p2)
			
			return
		else
			Callback(p2)
		end
	end
	
	return (p1 or function(Options, p2)
		-- upvalues: HttpService (upval)
		return HttpService:RequestInternal(Options):Start(p2)
	end)({
		Method = "POST",
		Url = ExperienceStateReplayCaptureMetadataUrl,
		Body = HttpService:JSONEncode({ engineContextGuid = EngineContextGuid }),
		Headers = {
			["Content-Type"] = "application/json",
			Accept = "application/json"
		}
	}, function(p2, List)
		-- upvalues: Callback (copy), HttpService (upval), Callback1 (copy), LoadSlicesModule (upval), EngineContextGuid (copy)
		if p2 then
			if Callback == nil then
				print(List.Body)
				local Metadata = HttpService:JSONDecode(List.Body).metadata
				Callback1(tonumber(Metadata.placeId), (tonumber(Metadata.placeVersion)))
				
				return nil
			end
			local Success, Result, Result3, Result4, Result5 = pcall(LoadSlicesModule.decodeCaptureMetadata, List.Body)
			
			if Success then
				local Success1, Result1 = pcall(Callback1, Result, Result3, Result4, Result5)
				
				if not Success1 then
					local Text2 = "Failed to process metadata for GUID " .. tostring(EngineContextGuid) .. ": " .. tostring(Result1)
					
					if Callback == nil then
						warn(Text2)
					else
						Callback(Text2)
					end
				end
				return nil
			else
				local Text1 = "Failed to decode metadata for GUID " .. tostring(EngineContextGuid) .. ": " .. tostring(Result)
				
				if Callback == nil then
					warn(Text1)
				else
					Callback(Text1)
				end
				return nil
			end
		else
			local Text = "Failed to get metadata for GUID: " .. tostring(EngineContextGuid) .. " Error: " .. tostring(List and List.Status)
			
			if Callback == nil then
				warn(Text)
				
				for i, value in pairs(List) do
					print(i, value)
				end
			elseif Callback == nil then
				warn(Text)
			else
				Callback(Text)
			end
			return nil
		end
	end)
end

LoadSlicesModule.getMetadataForGuid = getMetadataForGuid

local function _(p2, p3, Callback: (any) -> ())
	p2.LoadingOverlay.Visible = false
	p2.state.Loading = false
	warn(p3)
	
	if Callback ~= nil then
		Callback(p3)
	end
end

local _ = function(p2, Loading)
	p2.LoadingOverlay.Visible = Loading
	p2.state.Loading = Loading
end

local _ = function(p2)
	-- upvalues: FFlagExperienceStateReplayRecordedViewportEventModule (copy)
	p2.minLoadedFrameNumber = 0
	p2.maxLoadedFrameNumber = 0
	p2.minLoadedEpoch = 0
	p2.maxLoadedEpoch = 0
	p2.minOverallEpoch = nil
	p2.maxOverallEpoch = nil
	p2.nextSliceToLoad = nil
	p2.noncontiguousSliceToLoad = nil
	
	if FFlagExperienceStateReplayRecordedViewportEventModule and p2.resetRecordedScreenContext then
		p2.resetRecordedScreenContext()
	end
end

local _ = function(p2, RecordingsToPlayback, PlaceURL, SourceType)
	-- upvalues: FFlagExperienceStateReplayRecordedViewportEventModule (copy)
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
	
	if FFlagExperienceStateReplayRecordedViewportEventModule and p2.resetRecordedScreenContext then
		p2.resetRecordedScreenContext()
	end
	p2.recordingsToPlayback = RecordingsToPlayback
	p2.placeURL = PlaceURL
	p2.sourceType = SourceType
end

function LoadSlicesModule:loadGUIDSlices(p2, _, _)
	print((getMetadataForGuid(p2)))
end

function LoadSlicesModule.loadGUID(p2, DirectGuid, Callback1, Callback, Callback2, p3, p4)
	-- upvalues: ExperienceStateRecordingService (copy), LoadSlicesModule (copy), FFlagExperienceStateReplayRecordedViewportEventModule (copy)
	debugPrint("Loading slices for GUID: " .. tostring(DirectGuid))
	local RecordingService = if p4 and p4.recordingService then p4.recordingService else ExperienceStateRecordingService
	local Spawn = if p4 and p4.spawn then p4.spawn else task.spawn
	local SetLoadedState = if p4 and p4.setLoadedState then p4.setLoadedState else LoadSlicesModule.SetLoadedState
	local LoadSlicesAfterFirst = if p4 and p4.loadSlicesAfterFirst then p4.loadSlicesAfterFirst else LoadSlicesModule.loadSlicesAfterFirst
	local _ = (if p4 and p4.getMetadataForGuid then p4.getMetadataForGuid else getMetadataForGuid)(DirectGuid, function(p5, p6, p7, p8)
		-- upvalues: Callback1 (copy), RecordingService (copy), DirectGuid (copy), p2 (copy), FFlagExperienceStateReplayRecordedViewportEventModule (upval), Spawn (copy), SetLoadedState (copy), Callback2 (copy), LoadSlicesAfterFirst (copy), Callback (copy), p3 (copy)
		debugPrint("Received metadata - PlaceId: " .. tostring(p5) .. " PlaceVersion: " .. tostring(p6))
		
		if Callback1 ~= nil and (type(p7) ~= "string" or type(p8) ~= "string") then
			error("capture metadata is missing recording timestamps")
		end
		local PlaceFileURLAsync = RecordingService:GetPlaceFileURLAsync(p6, p5)
		local Urls = RecordingService:ListCaptureURLsAsync(DirectGuid, if Callback1 == nil or type(p7) ~= "string" then "2024-12-10T00:20:14.556Z" else p7, if Callback1 == nil or type(p8) ~= "string" then "2026-12-18T00:25:59.412Z" else p8).urls
		local S3Url = Enum.ExperienceStateRecordingLoadSourceType.S3Url
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
		
		if FFlagExperienceStateReplayRecordedViewportEventModule and p2.resetRecordedScreenContext then
			p2.resetRecordedScreenContext()
		end
		p2.recordingsToPlayback = Urls
		p2.placeURL = PlaceFileURLAsync
		p2.sourceType = S3Url
		
		for i, value in p2.recordingsToPlayback do
			debugPrint("Recording " .. tostring(i) .. " " .. value)
		end
		Spawn(function()
			-- upvalues: RecordingService (upval), p2 (upval), SetLoadedState (upval), Callback1 (upval), Callback2 (upval), Spawn (upval), LoadSlicesAfterFirst (upval), Callback (upval), p3 (upval)
			local Success, Result = pcall(function()
				-- upvalues: RecordingService (upval), p2 (upval), SetLoadedState (upval), Callback1 (upval), Callback2 (upval), Spawn (upval), LoadSlicesAfterFirst (upval), Callback (upval), p3 (upval)
				SetLoadedState(p2, (RecordingService:LoadPlaybackAsync(p2.recordingsToPlayback[1], p2.placeURL, Enum.ExperienceStateRecordingLoadMode.NewReplay, p2.sourceType)))
				p2.nextSliceToLoad = 2
				p2.LoadingOverlay.Visible = false
				p2.state.Loading = false
				
				if Callback1 == nil then
					p2.ControlButtons(p2.PlayButton)
				else
					Callback1()
				end
				if #p2.recordingsToPlayback == 1 and Callback2 ~= nil then
					Callback2()
					
					return
				else
					Spawn(function()
						-- upvalues: LoadSlicesAfterFirst (upval), p2 (upval), Callback2 (upval), Callback (upval), p3 (upval)
						LoadSlicesAfterFirst(p2, Callback2, Callback, p3)
					end)
				end
			end)
			
			if not Success then
				local Text = "Failed to load initial slice because " .. tostring(Result)
				p2.LoadingLabel.Text = "Failed To Load Initial Slice, See Logs"
				
				if Callback == nil then
					warn(Text)
				else
					p2.LoadingOverlay.Visible = false
					p2.state.Loading = false
					warn(Text)
					
					if Callback ~= nil then
						Callback(Text)
						
						return
					end
				end
			end
		end)
	end, if Callback == nil then nil else function(p9)
		-- upvalues: p2 (copy), Callback (copy)
		p2.LoadingOverlay.Visible = false
		p2.state.Loading = false
		warn(p9)
		
		if Callback ~= nil then
			Callback(p9)
		end
	end)
end

function LoadSlicesModule.preloadAssets(p5)
	-- upvalues: Players (copy), ContentProvider (copy)
	local List = {}
	local Roots = if p5 and p5.roots then p5.roots else { workspace, Players }
	local ContentProvider1 = if p5 and p5.contentProvider then p5.contentProvider else ContentProvider
	for _, root in Roots do
		for _, descendant in root:GetDescendants() do
			if descendant:IsA("MeshPart") or descendant:IsA("ImageLabel") or descendant:IsA("ImageButton") or descendant:IsA("Decal") or descendant:IsA("Texture") or descendant:IsA("SpecialMesh") or descendant:IsA("Sound") or descendant:IsA("ParticleEmitter") or descendant:IsA("Beam") then
				table.insert(List, descendant)
			end
		end
	end
	if #List > 0 then
		print("[PreloadAsync] preloading " .. tostring(#List) .. " asset instances")
		ContentProvider1:PreloadAsync(List)
		print("[PreloadAsync] completed")
	end
end

function LoadSlicesModule.loadFileForCapture(p6, Dir, Callback1, Callback: (any) -> (), SliceCount: number, p7)
	-- upvalues: ExperienceStateRecordingService (copy), LoadSlicesModule (copy), FFlagExperienceStateReplayRecordedViewportEventModule (copy), ExperienceStateReplayPreloadAssets (copy)
	local RecordingService = if p7 and p7.recordingService then p7.recordingService else ExperienceStateRecordingService
	local Spawn: (any) -> () = if p7 and p7.spawn then p7.spawn else task.spawn
	local SetLoadedState = if p7 and p7.setLoadedState then p7.setLoadedState else LoadSlicesModule.SetLoadedState
	local PreloadAssets = if p7 and p7.preloadAssets then p7.preloadAssets else LoadSlicesModule.preloadAssets
	local File = Enum.ExperienceStateRecordingLoadSourceType.File
	p6.LoadingOverlay.Visible = true
	p6.state.Loading = true
	p6.minLoadedFrameNumber = 0
	p6.maxLoadedFrameNumber = 0
	p6.minLoadedEpoch = 0
	p6.maxLoadedEpoch = 0
	p6.minOverallEpoch = nil
	p6.maxOverallEpoch = nil
	p6.nextSliceToLoad = nil
	p6.noncontiguousSliceToLoad = nil
	
	if FFlagExperienceStateReplayRecordedViewportEventModule and p6.resetRecordedScreenContext then
		p6.resetRecordedScreenContext()
	end
	p6.recordingsToPlayback = nil
	p6.placeURL = nil
	p6.sourceType = File
	
	if SliceCount == nil then
		p6.LoadingOverlay.Visible = false
		p6.state.Loading = false
		warn("FILE capture source is missing its exact slice count")
		
		if Callback ~= nil then
			Callback("FILE capture source is missing its exact slice count")
		end
		return
	elseif SliceCount > 0 then
		local function _()
			-- upvalues: ExperienceStateReplayPreloadAssets (upval), PreloadAssets (copy), p6 (copy), Callback1 (copy)
			if ExperienceStateReplayPreloadAssets then
				PreloadAssets()
			end
			p6.LoadingOverlay.Visible = false
			p6.state.Loading = false
			Callback1()
		end
		
		Spawn(function()
			-- upvalues: SliceCount (copy), Dir (copy), RecordingService (copy), p6 (copy), SetLoadedState (copy), ExperienceStateReplayPreloadAssets (upval), PreloadAssets (copy), Callback1 (copy), Callback (copy)
			local Text = "load local DMR"
			local Success, Result = pcall(function()
				-- upvalues: SliceCount (upval), Dir (upval), Text (ref), RecordingService (upval), p6 (upval), SetLoadedState (upval), ExperienceStateReplayPreloadAssets (upval), PreloadAssets (upval), Callback1 (upval)
				local Count = 0
				while Count < SliceCount do
					local Formatted = string.format("%s/slices/slice_%02d.dmct", Dir, Count)
					Text = "load DMR slice " .. Formatted
					Text = "update loaded state for " .. Formatted
					SetLoadedState(p6, (RecordingService:LoadPlaybackAsync(Formatted, nil, if Count == 0 then Enum.ExperienceStateRecordingLoadMode.NewReplay else Enum.ExperienceStateRecordingLoadMode.ContiguousSlice, p6.sourceType)))
					Count += 1
				end
				Text = "finish local DMR capture load"
				
				if ExperienceStateReplayPreloadAssets then
					PreloadAssets()
				end
				p6.LoadingOverlay.Visible = false
				p6.state.Loading = false
				Callback1()
			end)
			
			if not Success then
				local Text1 = "Failed to " .. Text .. " because " .. tostring(Result)
				p6.LoadingOverlay.Visible = false
				p6.state.Loading = false
				warn(Text1)
				
				if Callback ~= nil then
					Callback(Text1)
				end
			end
		end)
		
		return
	else
		local Text = "FILE capture source has invalid slice count " .. tostring(SliceCount) .. "; expected a positive integer"
		p6.LoadingOverlay.Visible = false
		p6.state.Loading = false
		warn(Text)
		
		if Callback ~= nil then
			Callback(Text)
		end
	end
end

function LoadSlicesModule.loadRwsForCapture(p8, Dir, Callback1, Callback: (any) -> (), p9)
	-- upvalues: ExperienceStateRecordingService (copy), LoadSlicesModule (copy), FFlagExperienceStateReplayRecordedViewportEventModule (copy), ExperienceStateReplayPreloadAssets (copy)
	local RecordingService = if p9 and p9.recordingService then p9.recordingService else ExperienceStateRecordingService
	local Spawn: (any) -> () = if p9 and p9.spawn then p9.spawn else task.spawn
	local SetLoadedState = if p9 and p9.setLoadedState then p9.setLoadedState else LoadSlicesModule.SetLoadedState
	local PreloadAssets = if p9 and p9.preloadAssets then p9.preloadAssets else LoadSlicesModule.preloadAssets
	local RwsSourceType = if p9 and p9.rwsSourceType then p9.rwsSourceType else Enum.ExperienceStateRecordingLoadSourceType.Rws
	
	if Dir == "" then
		p8.LoadingOverlay.Visible = false
		p8.state.Loading = false
		warn("RWS capture source has an empty directory")
		
		if Callback ~= nil then
			Callback("RWS capture source has an empty directory")
		end
		return
	else
		local RecordingsToPlayback = { Dir }
		p8.LoadingOverlay.Visible = true
		p8.state.Loading = true
		p8.minLoadedFrameNumber = 0
		p8.maxLoadedFrameNumber = 0
		p8.minLoadedEpoch = 0
		p8.maxLoadedEpoch = 0
		p8.minOverallEpoch = nil
		p8.maxOverallEpoch = nil
		p8.nextSliceToLoad = nil
		p8.noncontiguousSliceToLoad = nil
		
		if FFlagExperienceStateReplayRecordedViewportEventModule and p8.resetRecordedScreenContext then
			p8.resetRecordedScreenContext()
		end
		p8.recordingsToPlayback = RecordingsToPlayback
		p8.placeURL = nil
		p8.sourceType = RwsSourceType
		Spawn(function()
			-- upvalues: RecordingService (copy), Dir (copy), p8 (copy), SetLoadedState (copy), ExperienceStateReplayPreloadAssets (upval), PreloadAssets (copy), Callback1 (copy), Callback (copy)
			local Success, Result = pcall(function()
				-- upvalues: RecordingService (upval), Dir (upval), p8 (upval), SetLoadedState (upval), ExperienceStateReplayPreloadAssets (upval), PreloadAssets (upval), Callback1 (upval)
				SetLoadedState(p8, (RecordingService:LoadPlaybackAsync(Dir, nil, Enum.ExperienceStateRecordingLoadMode.NewReplay, p8.sourceType)))
				
				if ExperienceStateReplayPreloadAssets then
					PreloadAssets()
				end
				p8.LoadingOverlay.Visible = false
				p8.state.Loading = false
				Callback1()
			end)
			
			if not Success then
				local Text = "Failed to load local RWS capture because " .. tostring(Result)
				p8.LoadingOverlay.Visible = false
				p8.state.Loading = false
				warn(Text)
				
				if Callback ~= nil then
					Callback(Text)
				end
			end
		end)
	end
end

function LoadSlicesModule.loadForCapture(p8, p9, Callback2, Callback: (any) -> (), Callback1, p10)
	-- upvalues: FFlagExperienceStateReplaySourceClockPlaybackModule (copy), LoadSlicesModule (copy), ExperienceStateReplayPreloadAssets (copy)
	local ResolveResult = require(script.Parent.ResolveReplaySource).resolve(p9)
	
	if ResolveResult.kind == "rws" then
		if FFlagExperienceStateReplaySourceClockPlaybackModule then
			LoadSlicesModule.loadRwsForCapture(p8, ResolveResult.dir, function()
				-- upvalues: Callback1 (copy), Callback2 (copy)
				Callback1()
				Callback2()
			end, Callback)
			
			return
		else
			Callback("RWS capture source requires source-clock playback")
			
			return
		end
	elseif ResolveResult.kind == "file" then
		LoadSlicesModule.loadFileForCapture(p8, ResolveResult.dir, function()
			-- upvalues: Callback1 (copy), Callback2 (copy)
			Callback1()
			Callback2()
		end, Callback, ResolveResult.sliceCount)
		
		return
	else
		LoadSlicesModule.loadGUID(p8, ResolveResult.guid, function()
			-- upvalues: ExperienceStateReplayPreloadAssets (upval), LoadSlicesModule (upval), Callback2 (copy)
			if ExperienceStateReplayPreloadAssets then
				LoadSlicesModule.preloadAssets()
			end
			Callback2()
		end, Callback, function()
			-- upvalues: Callback1 (copy)
			Callback1()
		end, p10)
	end
end

function LoadSlicesModule.experienceCallback(p8)
	-- upvalues: TeleportService (copy), LoadSlicesModule (copy)
	local LocalPlayerTeleportData = TeleportService:GetLocalPlayerTeleportData()
	
	if LocalPlayerTeleportData then
		if LocalPlayerTeleportData.directGuid then
			LoadSlicesModule.loadGUID(p8, LocalPlayerTeleportData.directGuid)
			
			return
		end
		debugPrint("No direct GUID found in teleport data, falling back to loading slices")
		LoadSlicesModule.loadSlices(p8)
	end
end

function LoadSlicesModule.loadSlices(p8)
	-- upvalues: FFlagExperienceStateReplayRecordedViewportEventModule (copy), TeleportService (copy), ExperienceStateRecordingService (copy), LoadSlicesModule (copy)
	p8.LoadingOverlay.Visible = true
	p8.state.Loading = true
	p8.minLoadedFrameNumber = 0
	p8.maxLoadedFrameNumber = 0
	p8.minLoadedEpoch = 0
	p8.maxLoadedEpoch = 0
	p8.minOverallEpoch = nil
	p8.maxOverallEpoch = nil
	p8.nextSliceToLoad = nil
	p8.noncontiguousSliceToLoad = nil
	
	if FFlagExperienceStateReplayRecordedViewportEventModule and p8.resetRecordedScreenContext then
		p8.resetRecordedScreenContext()
	end
	local LocalPlayerTeleportData = TeleportService:GetLocalPlayerTeleportData()
	p8.recordingsToPlayback = { "/path/to/default/file" }
	p8.sourceType = Enum.ExperienceStateRecordingLoadSourceType.File
	
	if LocalPlayerTeleportData then
		p8.recordingsToPlayback = LocalPlayerTeleportData.captureURLs
		
		if LocalPlayerTeleportData.startTime then
			p8.minOverallEpoch = LocalPlayerTeleportData.startTime.UnixTimestampMillis
		end
		if LocalPlayerTeleportData.endTime then
			p8.maxOverallEpoch = LocalPlayerTeleportData.endTime.UnixTimestampMillis
		end
		p8.sourceType = Enum.ExperienceStateRecordingLoadSourceType:FromValue(LocalPlayerTeleportData.sourceType)
		p8.placeURL = LocalPlayerTeleportData.placeURL
	end
	for i, value in p8.recordingsToPlayback do
		debugPrint("Recording " .. tostring(i) .. " " .. value)
	end
	task.spawn(function()
		-- upvalues: ExperienceStateRecordingService (upval), p8 (copy), LoadSlicesModule (upval)
		local Success, Result = pcall(function()
			-- upvalues: ExperienceStateRecordingService (upval), p8 (upval), LoadSlicesModule (upval)
			LoadSlicesModule.SetLoadedState(p8, (ExperienceStateRecordingService:LoadPlaybackAsync(p8.recordingsToPlayback[1], p8.placeURL, Enum.ExperienceStateRecordingLoadMode.NewReplay, p8.sourceType)))
			p8.nextSliceToLoad = 2
			p8.LoadingOverlay.Visible = false
			p8.state.Loading = false
			p8.ControlButtons(p8.PlayButton)
			task.spawn(LoadSlicesModule.loadSlicesAfterFirst, p8)
		end)
		
		if not Success then
			p8.LoadingLabel.Text = "Failed To Load Initial Slice, See Logs"
			warn("Failed to load initial slice because " .. tostring(Result))
		end
	end)
end

function LoadSlicesModule.loadSlicesAfterFirst(p9, Callback2, Callback: (any) -> (), Callback1, p10)
	-- upvalues: ExperienceStateRecordingService (copy), LoadSlicesModule (copy)
	local RecordingService = if p10 and p10.recordingService then p10.recordingService else ExperienceStateRecordingService
	local Wait = if p10 and p10.wait then p10.wait else task.wait
	local SetLoadedState = if p10 and p10.setLoadedState then p10.setLoadedState else LoadSlicesModule.SetLoadedState
	local Success, Result = pcall(function()
		-- upvalues: Wait (copy), Callback2 (copy), p9 (copy), RecordingService (copy), SetLoadedState (copy), Callback1 (copy)
		local Count = 0
		while true do
			Wait(1)
			if Callback2 ~= nil and #p9.recordingsToPlayback < p9.nextSliceToLoad then
				break
			elseif p9.noncontiguousSliceToLoad == nil then
				if p9.nextSliceToLoad <= #p9.recordingsToPlayback and Count >= 4 then
					local RecordingsToPlaybackEntry = p9.recordingsToPlayback[p9.nextSliceToLoad]
					debugPrint("loading contiguous " .. tostring(p9.nextSliceToLoad) .. " url " .. RecordingsToPlaybackEntry)
					SetLoadedState(p9, (RecordingService:LoadPlaybackAsync(RecordingsToPlaybackEntry, nil, Enum.ExperienceStateRecordingLoadMode.ContiguousSlice, p9.sourceType)))
					p9.nextSliceToLoad += 1
					
					if Callback1 ~= nil then
						Callback1()
					end
					Count = 0
				else
					Count += 1
				end
				continue
			else
				local RecordingsToPlaybackEntry = p9.recordingsToPlayback[p9.noncontiguousSliceToLoad]
				debugPrint("loading noncontiguous " .. tostring(p9.noncontiguousSliceToLoad) .. " url " .. RecordingsToPlaybackEntry)
				SetLoadedState(p9, (RecordingService:LoadPlaybackAsync(RecordingsToPlaybackEntry, nil, Enum.ExperienceStateRecordingLoadMode.NoncontiguousSlice, p9.sourceType)))
				RecordingService:SetPlaybackPercentage((p9.playbackSecondToFetch - p9.replayToLoadedStartSeconds) / p9.loadedLengthSeconds)
				p9.LoadingOverlay.Visible = false
				p9.state.Loading = false
				Count = 0
				p9.nextSliceToLoad = p9.noncontiguousSliceToLoad + 1
				p9.noncontiguousSliceToLoad = nil
			end
			continue
		end
		Callback2()
	end)
	
	if not Success then
		local Text = "Failed to load later slice because " .. tostring(Result)
		p9.LoadingLabel.Text = "Failed To Load Later Slice, See Logs"
		
		if Callback == nil then
			warn(Text)
		else
			p9.LoadingOverlay.Visible = false
			p9.state.Loading = false
			warn(Text)
			
			if Callback ~= nil then
				Callback(Text)
				
				return
			end
		end
	end
end

function LoadSlicesModule.loadNoncontiguousSlice(p11, p12)
	if p11.noncontiguousSliceToLoad ~= nil then
		warn("skipping non-contiguous slice load as still waiting for last jump")
	end
	p11.LoadingOverlay.Visible = true
	p11.state.Loading = true
	local ScaledOverallLengthSeconds = p12 * p11.overallLengthSeconds
	local Floored = math.floor(ScaledOverallLengthSeconds / 60)
	p11.noncontiguousSliceToLoad = math.min(Floored + 1, #p11.recordingsToPlayback)
	p11.playbackSecondToFetch = ScaledOverallLengthSeconds
	debugPrint("percentOverallLength " .. tostring(p12) .. " playbackSecondToFetch " .. tostring(ScaledOverallLengthSeconds) .. " playbackMinuteToFetch " .. tostring(Floored) .. " nextSliceToLoad " .. tostring(p11.nextSliceToLoad))
end

return LoadSlicesModule