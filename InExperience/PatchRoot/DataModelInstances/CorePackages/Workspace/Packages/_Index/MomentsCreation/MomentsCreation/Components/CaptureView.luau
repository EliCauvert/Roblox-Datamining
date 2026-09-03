local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local runService = game:GetService("RunService")
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local icon = foundationModule.Icon
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local momentsCommonModule = require(parent.MomentsCommon)
local getCropSize = momentsCommonModule.Utils.getCropSize
local getFitSize = momentsCommonModule.Utils.getFitSize
local constantsModule = require(momentsCreation.Constants)
local getCaptureContentModule = require(momentsCreation.Capture.getCaptureContent)
local getCaptureVideoContentModule = require(momentsCreation.Capture.getCaptureVideoContent)
local useCreationMusicSyncModule = require(momentsCreation.Hooks.useCreationMusicSync)
local getFFlagMomentsScreenshotMusicScrubberModule = require(momentsCreation.Flags.GetFFlagMomentsScreenshotMusicScrubber)
local getFFlagMomentsCreationGalleryPreviewSwapFixModule = require(momentsCreation.Flags.GetFFlagMomentsCreationGalleryPreviewSwapFix)
local getFFlagMomentsTTSAudioOverlayModule = require(momentsCreation.Flags.GetFFlagMomentsTTSAudioOverlay)
local getTtsDuckScalarModule = require(momentsCreation.Audio.getTtsDuckScalar)
local fadeVolumeModule = require(momentsCreation.Audio.fadeVolume)
local _ = require(momentsCreation.Types.CreationFlowTypes)

local function VideoPreviewSurface(p1)
	-- upvalues: reactModule (ref), signalsModule (ref), useCreationMusicSyncModule (ref), getFFlagMomentsTTSAudioOverlayModule (ref), fadeVolumeModule (ref), getTtsDuckScalarModule (ref), getCaptureVideoContentModule (ref), runService (ref), view (ref), getFitSize (ref), getCropSize (ref)
	local preview = p1.preview
	local capture = p1.capture
	local timeLength = p1.timeLength
	local var1 = reactModule.useRef(nil)
	local var2, var3 = reactModule.useState(Vector2.new(0, 0))
	local var4, var5 = reactModule.useState(Vector2.new(0, 0))
	local var6, var7 = reactModule.useState(preview.playback.getRegion(false))
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), var7 (ref), preview (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: var7 (copy), preview (copy)
			var7(preview.playback.getRegion(p2))
		end)
	end, { preview })
	local var8 = useCreationMusicSyncModule(preview, if var6 ~= nil then timeLength else math.max(0, var6.endTime - var6.startTime), p1.ttsAudio)
	local audio = var8.audio
	local music = var8.music
	local userMuted = var8.userMuted
	local isDucking = var8.isDucking
	local var9 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), music (ref), audio (ref)
		function var26.current()
			-- upvalues: music (copy), audio (copy)
			if music ~= nil then
				audio.timeline.seek(0)
			end
		end
	end, { audio.timeline.seek, music })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), getFFlagMomentsTTSAudioOverlayModule (copy), music (ref), userMuted (ref), fadeVolumeModule (copy), isDucking (ref), getTtsDuckScalarModule (copy)
		local current = var1.current
		
		if current == nil then return end
		if getFFlagMomentsTTSAudioOverlayModule then
			if music == nil and not userMuted then
				fadeVolumeModule(current, if isDucking then 1 * getTtsDuckScalarModule() else 1)
				
				return
			end
			fadeVolumeModule(current, 0, true)
			
			return
		else
			current.Volume = if music == nil and not userMuted then 1 else 0
		end
	end, { music, userMuted, isDucking })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), capture (ref), getCaptureVideoContentModule (copy), preview (ref), timeLength (ref), runService (copy), var9 (ref)
		local current = var1.current
		
		if current == nil then return end
		if typeof(capture) == "table" then
			local var10 = getCaptureVideoContentModule(capture)
			
			if var10 ~= nil then
				current.Video = var10.Uri
			end
		else
			local ok, status = pcall(Content.fromObject, capture)
			
			if ok and status then
				current.VideoContent = status
			end
		end
		current.Looped = true
		preview.setDuration(timeLength)
		preview.setTimeLength(timeLength)
		preview.setReadiness("Ready")
		local var11 = false
		preview.bindEngine({
			play = function()
				-- upvalues: current (ref)
				current.Playing = true
			end,
			pause = function()
				-- upvalues: current (ref)
				current.Playing = false
			end,
			seek = function(p2)
				-- upvalues: current (ref)
				current.TimePosition = p2
			end
		})
		local list = {
			current.Loaded:Connect(function()
				-- upvalues: var11 (write), current (ref), preview (copy)
				var11 = true
				
				if current.TimeLength > 0 then
					preview.setDuration(current.TimeLength)
					preview.setTimeLength(current.TimeLength)
				end
				current.Playing = true
				preview.setIsPlaying(true)
			end),
			current.Played:Connect(function()
				-- upvalues: var11 (write), preview (copy)
				var11 = true
				preview.setIsPlaying(true)
			end),
			current.Paused:Connect(function()
				-- upvalues: var11 (write), preview (copy)
				if var11 then
					preview.setIsPlaying(false)
				end
			end),
			runService.RenderStepped:Connect(function()
				-- upvalues: preview (copy), current (ref), var9 (copy)
				preview.setPosition(current.TimePosition)
				local region = preview.playback.getRegion(false)
				
				if region == nil then return end
				local timePosition = current.TimePosition
				
				if region.endTime - 0.05 <= timePosition or timePosition < region.startTime - 0.05 then
					current.TimePosition = region.startTime
					
					if var9.current ~= nil then
						var9.current()
					end
				end
			end)
		}
		
		return function()
			-- upvalues: list (ref), preview (copy)
			for i, v in list do
				v:Disconnect()
			end
			preview.bindEngine(nil)
		end
	end, { preview, capture, timeLength })
	
	return reactModule.createElement(view, {
		tag = "size-full",
		ClipsDescendants = true,
		onAbsoluteSizeChanged = function(value)
			-- upvalues: var3 (ref)
			var3(value.AbsoluteSize)
		end
	}, {
		Media = reactModule.createElement("VideoFrame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			InternalVideoUsage = Enum.InternalVideoUsage.WatchPage,
			Looped = true,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = if p1.scaleType == Enum.ScaleType.Fit then getFitSize(var2, var4) else getCropSize(var2, var4),
			Visible = var4.X > 0 and var4.Y > 0,
			ref = var1,
			[reactModule.Change.Resolution] = function(p2)
				-- upvalues: var5 (ref), p1 (ref)
				var5(p2.Resolution)
				
				if p1.onResolutionChanged ~= nil then
					p1.onResolutionChanged(p2.Resolution)
				end
			end
		}),
		Overlay = reactModule.createElement(view, { tag = "size-full", ZIndex = 2 }, p1.children)
	})
end

local function ScreenshotPreviewSurface(p2)
	-- upvalues: useCreationMusicSyncModule (ref), constantsModule (ref), reactModule (ref), getFFlagMomentsScreenshotMusicScrubberModule (ref), view (ref), getCaptureContentModule (ref)
	local preview = p2.preview
	local capture = p2.capture
	local var10 = useCreationMusicSyncModule(preview, constantsModule.ScreenshotMusicDuration, p2.ttsAudio)
	local music = var10.music
	local elapsed = var10.audio.timeline.elapsed
	reactModule.useEffect(function()
		-- upvalues: preview (ref), constantsModule (copy)
		preview.bindEngine(nil)
		preview.setDuration(constantsModule.ScreenshotMusicDuration)
		preview.setTimeLength(constantsModule.ScreenshotMusicDuration)
		preview.setPosition(0)
		preview.setReadiness("Ready")
	end, { preview, capture })
	reactModule.useEffect(function()
		-- upvalues: getFFlagMomentsScreenshotMusicScrubberModule (copy), preview (ref), music (ref), elapsed (ref), constantsModule (copy)
		if getFFlagMomentsScreenshotMusicScrubberModule() then
			preview.setPosition(if music ~= nil then 0 else math.clamp(elapsed, 0, constantsModule.ScreenshotMusicDuration))
			
			return
		end
	end, { preview, music, elapsed })
	
	return reactModule.createElement(view, {
		tag = "size-full",
		onAbsoluteSizeChanged = p2.onAbsoluteSizeChanged
	}, {
		Overlay = reactModule.createElement(reactModule.Fragment, {}, p2.children),
		Media = reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			ImageContent = getCaptureContentModule(p2.capture),
			ScaleType = p2.scaleType,
			Size = UDim2.fromScale(1, 1)
		})
	})
end

return function(p2)
	-- upvalues: useTokens (ref), reactModule (ref), getFFlagMomentsCreationGalleryPreviewSwapFixModule (ref), signalsModule (ref), view (ref), icon (ref), builderIconsModule (ref), VideoPreviewSurface (ref), ScreenshotPreviewSurface (ref)
	local var10 = useTokens()
	local var11, var12 = reactModule.useState(p2.preview.getCapture(false))
	reactModule.useEffect(function()
		-- upvalues: p2 (ref), getFFlagMomentsCreationGalleryPreviewSwapFixModule (copy), signalsModule (copy), var12 (ref)
		local preview = p2.preview
		
		if getFFlagMomentsCreationGalleryPreviewSwapFixModule() then
			local var13 = nil
			local var14 = nil
			local var15 = false
			
			local function onWindowElapsed()
				-- upvalues: var15 (write), var14 (write), var12 (copy), var13 (write), onWindowElapsed (ref)
				if var15 then
					var15 = false
					local var16 = var14
					var14 = nil
					var12(var16)
					var13 = task.delay(0.2, onWindowElapsed)
					
					return
				end
				var13 = nil
			end
			
			local var16 = signalsModule.createEffect(function(p3)
				-- upvalues: preview (ref), var13 (write), var12 (copy), onWindowElapsed (ref), var14 (write), var15 (write)
				local capture = preview.getCapture(p3)
				
				if var13 == nil then
					var12(capture)
					var13 = task.delay(0.2, onWindowElapsed)
					
					return
				end
				var14 = capture
				var15 = true
			end)
			
			return function()
				-- upvalues: var13 (write), var16 (ref)
				if var13 ~= nil then
					task.cancel(var13)
					var13 = nil
				end
				var16()
			end
		end
		return signalsModule.createEffect(function(p3)
			-- upvalues: var12 (copy), preview (ref)
			var12(preview.getCapture(p3))
		end)
	end, { p2.preview })
	
	return if var11 == nil then reactModule.createElement(view, {
		tag = "size-full radius-large bg-shift-200",
		onAbsoluteSizeChanged = p2.onAbsoluteSizeChanged
	}, {
		EmptyState = reactModule.createElement(icon, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			name = builderIconsModule.Icon.Image,
			Position = UDim2.fromScale(0.5, 0.5),
			size = var10.Size.Size_1200,
			style = var10.Color.Shift.Shift_400
		})
	}) elseif var11.CaptureType == Enum.CaptureType.Video then reactModule.createElement(view, {
		tag = "size-full",
		onAbsoluteSizeChanged = p2.onAbsoluteSizeChanged
	}, {
		Preview = reactModule.createElement(VideoPreviewSurface, {
			preview = p2.preview,
			capture = var11,
			scaleType = p2.scaleType,
			timeLength = var11.TimeLength or 0,
			onResolutionChanged = p2.onResolutionChanged,
			ttsAudio = p2.ttsAudio
		}, p2.children)
	}) else reactModule.createElement(ScreenshotPreviewSurface, {
		preview = p2.preview,
		capture = var11,
		scaleType = p2.scaleType,
		onAbsoluteSizeChanged = p2.onAbsoluteSizeChanged,
		ttsAudio = p2.ttsAudio
	}, p2.children)
end