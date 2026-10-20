local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local RunService = game:GetService("RunService")
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local Icon = FoundationModule.Icon
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local MomentsCommonModule = require(Parent.MomentsCommon)
local GetCropSizeFunction = MomentsCommonModule.Utils.getCropSize
local GetFitSizeFunction = MomentsCommonModule.Utils.getFitSize
local ConstantsModule = require(MomentsCreation.Constants)
local GetCaptureContentModule = require(MomentsCreation.Capture.getCaptureContent)
local GetCaptureVideoContentModule = require(MomentsCreation.Capture.getCaptureVideoContent)
local UseCreationMusicSyncModule = require(MomentsCreation.Hooks.useCreationMusicSync)
local GetFFlagMomentsTTSAudioOverlayModule = require(MomentsCreation.Flags.GetFFlagMomentsTTSAudioOverlay)
local GetTtsDuckScalarModule = require(MomentsCreation.Audio.getTtsDuckScalar)
local FadeVolumeModule = require(MomentsCreation.Audio.fadeVolume)
local _ = require(MomentsCreation.Types.CreationFlowTypes)

local function VideoPreviewSurface(p1)
	-- upvalues: ReactModule (copy), SignalsModule (copy), UseCreationMusicSyncModule (copy), GetFFlagMomentsTTSAudioOverlayModule (copy), FadeVolumeModule (copy), GetTtsDuckScalarModule (copy), GetCaptureVideoContentModule (copy), RunService (copy), View (copy), GetFitSizeFunction (copy), GetCropSizeFunction (copy)
	local Preview = p1.preview
	local Capture = p1.capture
	local TimeLength = p1.timeLength
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(0, 0))
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Vector2.new(0, 0))
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(Preview.playback.getRegion(false))
	ReactModule.useEffect(function()
		-- upvalues: SignalsModule (upval), UseStateResult2_2 (copy), Preview (copy)
		return SignalsModule.createEffect(function(p2)
			-- upvalues: UseStateResult2_2 (upval), Preview (upval)
			UseStateResult2_2(Preview.playback.getRegion(p2))
		end)
	end, { Preview })
	local UseCreationMusicSyncModuleResult = UseCreationMusicSyncModule(Preview, if UseStateResult3 == nil then TimeLength else math.max(0, UseStateResult3.endTime - UseStateResult3.startTime), p1.ttsAudio)
	local Audio = UseCreationMusicSyncModuleResult.audio
	local Music = UseCreationMusicSyncModuleResult.music
	local UserMuted = UseCreationMusicSyncModuleResult.userMuted
	local IsDucking = UseCreationMusicSyncModuleResult.isDucking
	local UseRefResult1 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), Music (copy), Audio (copy)
		function UseRefResult1.current()
			-- upvalues: Music (upval), Audio (upval)
			if Music ~= nil then
				Audio.timeline.seek(0)
			end
		end
	end, { Audio.timeline.seek, Music })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), GetFFlagMomentsTTSAudioOverlayModule (upval), Music (copy), UserMuted (copy), FadeVolumeModule (upval), IsDucking (copy), GetTtsDuckScalarModule (upval)
		local Current = UseRefResult.current
		
		if Current == nil then return end
		if not GetFFlagMomentsTTSAudioOverlayModule then
			Current.Volume = if Music == nil and not UserMuted then 1 else 0
			
			return
		end
		if Music == nil and not UserMuted then
			FadeVolumeModule(Current, if IsDucking then 1 * GetTtsDuckScalarModule() else 1)
			
			return
		else
			FadeVolumeModule(Current, 0, true)
		end
	end, { Music, UserMuted, IsDucking })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), Capture (copy), GetCaptureVideoContentModule (upval), Preview (copy), TimeLength (copy), RunService (upval), UseRefResult1 (copy)
		local Current = UseRefResult.current
		
		if Current == nil then return end
		if typeof(Capture) == "table" then
			local CaptureVideoContentModule = GetCaptureVideoContentModule(Capture)
			
			if CaptureVideoContentModule ~= nil then
				Current.Video = CaptureVideoContentModule.Uri
			end
		else
			local Success, Result = pcall(Content.fromObject, Capture)
			
			if Success and Result then
				Current.VideoContent = Result
			end
		end
		Current.Looped = true
		Preview.setDuration(TimeLength)
		Preview.setTimeLength(TimeLength)
		Preview.setReadiness("Ready")
		local Flag = false
		Preview.bindEngine({
			play = function()
				-- upvalues: Current (copy)
				Current.Playing = true
			end,
			pause = function()
				-- upvalues: Current (copy)
				Current.Playing = false
			end,
			seek = function(TimePosition)
				-- upvalues: Current (copy)
				Current.TimePosition = TimePosition
			end
		})
		local Connections = {
			Current.Loaded:Connect(function()
				-- upvalues: Flag (ref), Current (copy), Preview (upval)
				Flag = true
				
				if Current.TimeLength > 0 then
					Preview.setDuration(Current.TimeLength)
					Preview.setTimeLength(Current.TimeLength)
				end
				Current.Playing = true
				Preview.setIsPlaying(true)
			end),
			Current.Played:Connect(function()
				-- upvalues: Flag (ref), Preview (upval)
				Flag = true
				Preview.setIsPlaying(true)
			end),
			Current.Paused:Connect(function()
				-- upvalues: Flag (ref), Preview (upval)
				if Flag then
					Preview.setIsPlaying(false)
				end
			end),
			RunService.RenderStepped:Connect(function()
				-- upvalues: Preview (upval), Current (copy), UseRefResult1 (upval)
				Preview.setPosition(Current.TimePosition)
				local Region = Preview.playback.getRegion(false)
				
				if Region == nil then return end
				local TimePosition = Current.TimePosition
				
				if Region.endTime - 0.05 <= TimePosition or TimePosition < Region.startTime - 0.05 then
					Current.TimePosition = Region.startTime
					
					if UseRefResult1.current ~= nil then
						UseRefResult1.current()
					end
				end
			end)
		}
		
		return function()
			-- upvalues: Connections (copy), Preview (upval)
			for _, connection in Connections do
				connection:Disconnect()
			end
			Preview.bindEngine(nil)
		end
	end, { Preview, Capture, TimeLength })
	
	return ReactModule.createElement(View, {
		tag = "size-full",
		ClipsDescendants = true,
		onAbsoluteSizeChanged = function(Frame)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(Frame.AbsoluteSize)
		end
	}, {
		Media = ReactModule.createElement("VideoFrame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			InternalVideoUsage = Enum.InternalVideoUsage.WatchPage,
			Looped = true,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = if p1.scaleType == Enum.ScaleType.Fit then GetFitSizeFunction(UseStateResult, UseStateResult1) else GetCropSizeFunction(UseStateResult, UseStateResult1),
			Visible = UseStateResult1.X > 0 and UseStateResult1.Y > 0,
			ref = UseRefResult,
			[ReactModule.Change.Resolution] = function(p2)
				-- upvalues: UseStateResult2_1 (copy), p1 (copy)
				UseStateResult2_1(p2.Resolution)
				
				if p1.onResolutionChanged ~= nil then
					p1.onResolutionChanged(p2.Resolution)
				end
			end
		}),
		Overlay = ReactModule.createElement(View, { tag = "size-full", ZIndex = 2 }, p1.children)
	})
end

local function ScreenshotPreviewSurface(p2)
	-- upvalues: UseCreationMusicSyncModule (copy), ConstantsModule (copy), ReactModule (copy), View (copy), GetCaptureContentModule (copy)
	local Preview = p2.preview
	local Capture = p2.capture
	local UseCreationMusicSyncModuleResult = UseCreationMusicSyncModule(Preview, ConstantsModule.ScreenshotMusicDuration, p2.ttsAudio)
	local Music = UseCreationMusicSyncModuleResult.music
	local Elapsed = UseCreationMusicSyncModuleResult.audio.timeline.elapsed
	ReactModule.useEffect(function()
		-- upvalues: Preview (copy), ConstantsModule (upval)
		Preview.bindEngine(nil)
		Preview.setDuration(ConstantsModule.ScreenshotMusicDuration)
		Preview.setTimeLength(ConstantsModule.ScreenshotMusicDuration)
		Preview.setPosition(0)
		Preview.setReadiness("Ready")
	end, { Preview, Capture })
	ReactModule.useEffect(function()
		-- upvalues: Preview (copy), Music (copy), Elapsed (copy), ConstantsModule (upval)
		Preview.setPosition(if Music == nil then 0 else math.clamp(Elapsed, 0, ConstantsModule.ScreenshotMusicDuration))
	end, { Preview, Music, Elapsed })
	
	return ReactModule.createElement(View, {
		tag = "size-full",
		onAbsoluteSizeChanged = p2.onAbsoluteSizeChanged
	}, {
		Overlay = ReactModule.createElement(ReactModule.Fragment, {}, p2.children),
		Media = ReactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			ImageContent = GetCaptureContentModule(p2.capture),
			ScaleType = p2.scaleType,
			Size = UDim2.fromScale(1, 1)
		})
	})
end

return function(p2)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), SignalsModule (copy), View (copy), Icon (copy), BuilderIconsModule (copy), VideoPreviewSurface (copy), ScreenshotPreviewSurface (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(p2.preview.getCapture(false))
	ReactModule.useEffect(function()
		-- upvalues: p2 (copy), UseStateResult2 (copy), SignalsModule (upval)
		local Preview = p2.preview
		local DelayedThread = nil
		local v1 = nil
		local Flag = false
		
		local function onWindowElapsed()
			-- upvalues: Flag (ref), v1 (ref), UseStateResult2 (upval), DelayedThread (ref), onWindowElapsed (copy)
			if Flag then
				Flag = false
				local v2 = v1
				v1 = nil
				UseStateResult2(v2)
				DelayedThread = task.delay(0.2, onWindowElapsed)
				
				return
			else
				DelayedThread = nil
			end
		end
		
		local Effect = SignalsModule.createEffect(function(p3)
			-- upvalues: Preview (copy), DelayedThread (ref), UseStateResult2 (upval), onWindowElapsed (copy), v1 (ref), Flag (ref)
			local Capture = Preview.getCapture(p3)
			
			if DelayedThread == nil then
				UseStateResult2(Capture)
				DelayedThread = task.delay(0.2, onWindowElapsed)
				
				return
			else
				v1 = Capture
				Flag = true
			end
		end)
		
		return function()
			-- upvalues: DelayedThread (ref), Effect (copy)
			if DelayedThread ~= nil then
				task.cancel(DelayedThread)
				DelayedThread = nil
			end
			Effect()
		end
	end, { p2.preview })
	
	return if UseStateResult == nil then ReactModule.createElement(View, {
		tag = "size-full radius-large bg-shift-200",
		onAbsoluteSizeChanged = p2.onAbsoluteSizeChanged
	}, {
		EmptyState = ReactModule.createElement(Icon, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			name = BuilderIconsModule.Icon.Image,
			Position = UDim2.fromScale(0.5, 0.5),
			size = UseTokensResult.Size.Size_1200,
			style = UseTokensResult.Color.Shift.Shift_400
		})
	}) elseif UseStateResult.CaptureType == Enum.CaptureType.Video then ReactModule.createElement(View, {
		tag = "size-full",
		onAbsoluteSizeChanged = p2.onAbsoluteSizeChanged
	}, {
		Preview = ReactModule.createElement(VideoPreviewSurface, {
			preview = p2.preview,
			capture = UseStateResult,
			scaleType = p2.scaleType,
			timeLength = UseStateResult.TimeLength or 0,
			onResolutionChanged = p2.onResolutionChanged,
			ttsAudio = p2.ttsAudio
		}, p2.children)
	}) else ReactModule.createElement(ScreenshotPreviewSurface, {
		preview = p2.preview,
		capture = UseStateResult,
		scaleType = p2.scaleType,
		onAbsoluteSizeChanged = p2.onAbsoluteSizeChanged,
		ttsAudio = p2.ttsAudio
	}, p2.children)
end