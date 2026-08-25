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

local function VideoPreviewSurface(p0)
	-- upvalues: reactModule (ref), signalsModule (ref), useCreationMusicSyncModule (ref), getCaptureVideoContentModule (ref), runService (ref), view (ref), getFitSize (ref), getCropSize (ref)
	local preview = p0.preview
	local capture = p0.capture
	local timeLength = p0.timeLength
	local var15 = reactModule.useRef(nil)
	local var16, var17 = reactModule.useState(Vector2.new(0, 0))
	local var18, var19 = reactModule.useState(Vector2.new(0, 0))
	local var20, var21 = reactModule.useState(preview.playback.getRegion(false))
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), var21 (ref), preview (ref)
		return signalsModule.createEffect(function(p1)
			-- upvalues: var21 (copy), preview (copy)
			var21(preview.playback.getRegion(p1))
		end)
	end, { preview })
	local var22 = useCreationMusicSyncModule(preview, if var20 ~= nil then timeLength else math.max(0, var20.endTime - var20.startTime))
	local audio = var22.audio
	local music = var22.music
	local userMuted = var22.userMuted
	local var23 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var23 (ref), music (ref), audio (ref)
		function var23.current()
			-- upvalues: music (copy), audio (copy)
			if music ~= nil then
				audio.timeline.seek(0)
			end
		end
	end, { audio.timeline.seek, music })
	reactModule.useEffect(function()
		-- upvalues: var15 (ref), music (ref), userMuted (ref)
		local current = var15.current
		
		if current ~= nil then
			current.Volume = if music == nil and not userMuted then 1 else 0
		end
	end, { music, userMuted })
	reactModule.useEffect(function()
		-- upvalues: var15 (ref), capture (ref), getCaptureVideoContentModule (copy), preview (ref), timeLength (ref), runService (copy), var23 (ref)
		local current = var15.current
		
		if current == nil then return end
		if typeof(capture) == "table" then
			local var24 = getCaptureVideoContentModule(capture)
			
			if var24 ~= nil then
				current.Video = var24.Uri
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
		local var25 = false
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
				-- upvalues: var25 (write), current (ref), preview (copy)
				var25 = true
				
				if current.TimeLength > 0 then
					preview.setDuration(current.TimeLength)
					preview.setTimeLength(current.TimeLength)
				end
				current.Playing = true
				preview.setIsPlaying(true)
			end),
			current.Played:Connect(function()
				-- upvalues: var25 (write), preview (copy)
				var25 = true
				preview.setIsPlaying(true)
			end),
			current.Paused:Connect(function()
				-- upvalues: var25 (write), preview (copy)
				if var25 then
					preview.setIsPlaying(false)
				end
			end),
			runService.RenderStepped:Connect(function()
				-- upvalues: preview (copy), current (ref), var23 (copy)
				preview.setPosition(current.TimePosition)
				local region = preview.playback.getRegion(false)
				
				if region == nil then return end
				local timePosition = current.TimePosition
				
				if region.endTime - 0.05 <= timePosition or timePosition < region.startTime - 0.05 then
					current.TimePosition = region.startTime
					
					if var23.current ~= nil then
						var23.current()
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
			-- upvalues: var17 (ref)
			var17(value.AbsoluteSize)
		end
	}, {
		Media = reactModule.createElement("VideoFrame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			InternalVideoUsage = Enum.InternalVideoUsage.WatchPage,
			Looped = true,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = if p0.scaleType == Enum.ScaleType.Fit then getFitSize(var16, var18) else getCropSize(var16, var18),
			Visible = var18.X > 0 and var18.Y > 0,
			ref = var15,
			[reactModule.Change.Resolution] = function(p3)
				-- upvalues: var19 (ref), p0 (ref)
				var19(p3.Resolution)
				
				if p0.onResolutionChanged ~= nil then
					p0.onResolutionChanged(p3.Resolution)
				end
			end
		}),
		Overlay = reactModule.createElement(view, { tag = "size-full", ZIndex = 2 }, p0.children)
	})
end

local function ScreenshotPreviewSurface(p4)
	-- upvalues: useCreationMusicSyncModule (ref), constantsModule (ref), reactModule (ref), getFFlagMomentsScreenshotMusicScrubberModule (ref), view (ref), getCaptureContentModule (ref)
	local preview = p4.preview
	local capture = p4.capture
	local var28 = useCreationMusicSyncModule(preview, constantsModule.ScreenshotMusicDuration)
	local music = var28.music
	local elapsed = var28.audio.timeline.elapsed
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
		onAbsoluteSizeChanged = p4.onAbsoluteSizeChanged
	}, {
		Overlay = reactModule.createElement(reactModule.Fragment, {}, p4.children),
		Media = reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			ImageContent = getCaptureContentModule(p4.capture),
			ScaleType = p4.scaleType,
			Size = UDim2.fromScale(1, 1)
		})
	})
end

return function(p5)
	-- upvalues: useTokens (ref), reactModule (ref), getFFlagMomentsCreationGalleryPreviewSwapFixModule (ref), signalsModule (ref), view (ref), icon (ref), builderIconsModule (ref), VideoPreviewSurface (ref), ScreenshotPreviewSurface (ref)
	local var29 = useTokens()
	local var30, var31 = reactModule.useState(p5.preview.getCapture(false))
	reactModule.useEffect(function()
		-- upvalues: p5 (ref), getFFlagMomentsCreationGalleryPreviewSwapFixModule (copy), signalsModule (copy), var31 (ref)
		local preview = p5.preview
		
		if getFFlagMomentsCreationGalleryPreviewSwapFixModule() then
			local var32 = nil
			local var33 = nil
			local var34 = false
			
			local function onWindowElapsed()
				-- upvalues: var34 (write), var33 (write), var31 (copy), var32 (write), onWindowElapsed (ref)
				if var34 then
					var34 = false
					local var37 = var33
					var33 = nil
					var31(var37)
					var32 = task.delay(0.2, onWindowElapsed)
					
					return
				end
				var32 = nil
			end
			
			local var36 = signalsModule.createEffect(function(p6)
				-- upvalues: preview (ref), var32 (write), var31 (copy), onWindowElapsed (ref), var33 (write), var34 (write)
				local capture = preview.getCapture(p6)
				
				if var32 == nil then
					var31(capture)
					var32 = task.delay(0.2, onWindowElapsed)
					
					return
				end
				var33 = capture
				var34 = true
			end)
			
			return function()
				-- upvalues: var32 (write), var36 (ref)
				if var32 ~= nil then
					task.cancel(var32)
					var32 = nil
				end
				var36()
			end
		end
		return signalsModule.createEffect(function(p7)
			-- upvalues: var31 (copy), preview (ref)
			var31(preview.getCapture(p7))
		end)
	end, { p5.preview })
	
	return if var30 == nil then reactModule.createElement(view, {
		tag = "size-full radius-large bg-shift-200",
		onAbsoluteSizeChanged = p5.onAbsoluteSizeChanged
	}, {
		EmptyState = reactModule.createElement(icon, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			name = builderIconsModule.Icon.Image,
			Position = UDim2.fromScale(0.5, 0.5),
			size = var29.Size.Size_1200,
			style = var29.Color.Shift.Shift_400
		})
	}) elseif var30.CaptureType == Enum.CaptureType.Video then reactModule.createElement(view, {
		tag = "size-full",
		onAbsoluteSizeChanged = p5.onAbsoluteSizeChanged
	}, {
		Preview = reactModule.createElement(VideoPreviewSurface, {
			preview = p5.preview,
			capture = var30,
			scaleType = p5.scaleType,
			timeLength = var30.TimeLength or 0,
			onResolutionChanged = p5.onResolutionChanged
		}, p5.children)
	}) else reactModule.createElement(ScreenshotPreviewSurface, {
		preview = p5.preview,
		capture = var30,
		scaleType = p5.scaleType,
		onAbsoluteSizeChanged = p5.onAbsoluteSizeChanged
	}, p5.children)
end