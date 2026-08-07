local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local runService = game:GetService("RunService")
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local icon = foundationModule.Icon
local view = foundationModule.View
local fFlagLuaAppMomentsInternalVideoUsage = sharedFlagsModule.FFlagLuaAppMomentsInternalVideoUsage
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

local function VideoPreviewSurface(p0) --[[ line: 85 ]]
	-- upvalues: reactModule (ref), signalsModule (ref), useCreationMusicSyncModule (ref), getCaptureVideoContentModule (ref), runService (ref), view (ref), fFlagLuaAppMomentsInternalVideoUsage (ref), getFitSize (ref), getCropSize (ref)
	local preview = p0.preview
	local capture = p0.capture
	local timeLength = p0.timeLength
	local var16 = reactModule.useRef(nil)
	local var17, var18 = reactModule.useState(Vector2.new(0, 0))
	local var19, var20 = reactModule.useState(Vector2.new(0, 0))
	local var21, var22 = reactModule.useState(preview.playback.getRegion(false))
	reactModule.useEffect(function() --[[ line: 97 ]]
		-- upvalues: signalsModule (copy), var22 (ref), preview (ref)
		return signalsModule.createEffect(function(p1) --[[ line: 98 ]]
			-- upvalues: var22 (copy), preview (copy)
			var22(preview.playback.getRegion(p1))
		end)
	end, { preview })
	local var23 = useCreationMusicSyncModule(preview, if var21 ~= nil then timeLength else math.max(0, var21.endTime - var21.startTime))
	local audio = var23.audio
	local music = var23.music
	local userMuted = var23.userMuted
	local var24 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 116 ]]
		-- upvalues: var24 (ref), music (ref), audio (ref)
		function var24.current() --[[ line: 117 ]]
			-- upvalues: music (copy), audio (copy)
			if music ~= nil then
				audio.timeline.seek(0)
			end
		end
	end, { audio.timeline.seek, music })
	reactModule.useEffect(function() --[[ line: 126 ]]
		-- upvalues: var16 (ref), music (ref), userMuted (ref)
		local current = var16.current
		
		if current ~= nil then
			current.Volume = if music == nil and not userMuted then 1 else 0
		end
	end, { music, userMuted })
	reactModule.useEffect(function() --[[ line: 133 ]]
		-- upvalues: var16 (ref), capture (ref), getCaptureVideoContentModule (copy), preview (ref), timeLength (ref), runService (copy), var24 (ref)
		local current = var16.current
		
		if current == nil then return end
		if typeof(capture) == "table" then
			local var25 = getCaptureVideoContentModule(capture)
			
			if var25 ~= nil then
				current.Video = var25.Uri
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
		local var26 = false
		preview.bindEngine({
			play = function() --[[ line: 161 ]]
				-- upvalues: current (ref)
				current.Playing = true
			end,
			pause = function() --[[ line: 164 ]]
				-- upvalues: current (ref)
				current.Playing = false
			end,
			seek = function(p2) --[[ line: 167 ]]
				-- upvalues: current (ref)
				current.TimePosition = p2
			end
		})
		local list = {
			current.Loaded:Connect(function() --[[ line: 173 ]]
				-- upvalues: var26 (write), current (ref), preview (copy)
				var26 = true
				
				if current.TimeLength > 0 then
					preview.setDuration(current.TimeLength)
					preview.setTimeLength(current.TimeLength)
				end
				current.Playing = true
				preview.setIsPlaying(true)
			end),
			current.Played:Connect(function() --[[ line: 182 ]]
				-- upvalues: var26 (write), preview (copy)
				var26 = true
				preview.setIsPlaying(true)
			end),
			current.Paused:Connect(function() --[[ line: 186 ]]
				-- upvalues: var26 (write), preview (copy)
				if var26 then
					preview.setIsPlaying(false)
				end
			end),
			runService.RenderStepped:Connect(function() --[[ line: 194 ]]
				-- upvalues: preview (copy), current (ref), var24 (copy)
				preview.setPosition(current.TimePosition)
				local region = preview.playback.getRegion(false)
				
				if region == nil then return end
				local timePosition = current.TimePosition
				
				if region.endTime - 0.05 <= timePosition or timePosition < region.startTime - 0.05 then
					current.TimePosition = region.startTime
					
					if var24.current ~= nil then
						var24.current()
					end
				end
			end)
		}
		
		return function() --[[ line: 214 ]]
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
		onAbsoluteSizeChanged = function(value) --[[ line: 225 ]]
			-- upvalues: var18 (ref)
			var18(value.AbsoluteSize)
		end
	}, {
		Media = reactModule.createElement("VideoFrame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			InternalVideoUsage = if fFlagLuaAppMomentsInternalVideoUsage then Enum.InternalVideoUsage.WatchPage else nil,
			Looped = true,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = if p0.scaleType == Enum.ScaleType.Fit then getFitSize(var17, var19) else getCropSize(var17, var19),
			Visible = var19.X > 0 and var19.Y > 0,
			ref = var16,
			[reactModule.Change.Resolution] = function(p3) --[[ line: 242 ]]
				-- upvalues: var20 (ref), p0 (ref)
				var20(p3.Resolution)
				
				if p0.onResolutionChanged ~= nil then
					p0.onResolutionChanged(p3.Resolution)
				end
			end
		}),
		Overlay = reactModule.createElement(view, { tag = "size-full", ZIndex = 2 }, p0.children)
	})
end

local function ScreenshotPreviewSurface(p4) --[[ line: 268 ]]
	-- upvalues: useCreationMusicSyncModule (ref), constantsModule (ref), reactModule (ref), getFFlagMomentsScreenshotMusicScrubberModule (ref), view (ref), getCaptureContentModule (ref)
	local preview = p4.preview
	local capture = p4.capture
	local var29 = useCreationMusicSyncModule(preview, constantsModule.ScreenshotMusicDuration)
	local music = var29.music
	local elapsed = var29.audio.timeline.elapsed
	reactModule.useEffect(function() --[[ line: 281 ]]
		-- upvalues: preview (ref), constantsModule (copy)
		preview.bindEngine(nil)
		preview.setDuration(constantsModule.ScreenshotMusicDuration)
		preview.setTimeLength(constantsModule.ScreenshotMusicDuration)
		preview.setPosition(0)
		preview.setReadiness("Ready")
	end, { preview, capture })
	reactModule.useEffect(function() --[[ line: 293 ]]
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

return function(p5) --[[ line: 315 ]]
	-- upvalues: useTokens (ref), reactModule (ref), getFFlagMomentsCreationGalleryPreviewSwapFixModule (ref), signalsModule (ref), view (ref), icon (ref), builderIconsModule (ref), VideoPreviewSurface (ref), ScreenshotPreviewSurface (ref)
	local var30 = useTokens()
	local var31, var32 = reactModule.useState(p5.preview.getCapture(false))
	reactModule.useEffect(function() --[[ line: 321 ]]
		-- upvalues: p5 (ref), getFFlagMomentsCreationGalleryPreviewSwapFixModule (copy), signalsModule (copy), var32 (ref)
		local preview = p5.preview
		
		if getFFlagMomentsCreationGalleryPreviewSwapFixModule() then
			local var33 = nil
			local var34 = nil
			local var35 = false
			
			local function onWindowElapsed() --[[ line: 339 ]]
				-- upvalues: var35 (write), var34 (write), var32 (copy), var33 (write), onWindowElapsed (ref)
				if var35 then
					var35 = false
					local var38 = var34
					var34 = nil
					var32(var38)
					var33 = task.delay(0.2, onWindowElapsed)
					
					return
				end
				var33 = nil
			end
			
			local var37 = signalsModule.createEffect(function(p6) --[[ line: 351 ]]
				-- upvalues: preview (ref), var33 (write), var32 (copy), onWindowElapsed (ref), var34 (write), var35 (write)
				local capture = preview.getCapture(p6)
				
				if var33 == nil then
					var32(capture)
					var33 = task.delay(0.2, onWindowElapsed)
					
					return
				end
				var34 = capture
				var35 = true
			end)
			
			return function() --[[ line: 362 ]]
				-- upvalues: var33 (write), var37 (ref)
				if var33 ~= nil then
					task.cancel(var33)
					var33 = nil
				end
				var37()
			end
		end
		return signalsModule.createEffect(function(p7) --[[ line: 325 ]]
			-- upvalues: var32 (copy), preview (ref)
			var32(preview.getCapture(p7))
		end)
	end, { p5.preview })
	
	return if var31 == nil then reactModule.createElement(view, {
		tag = "size-full radius-large bg-shift-200",
		onAbsoluteSizeChanged = p5.onAbsoluteSizeChanged
	}, {
		EmptyState = reactModule.createElement(icon, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			name = builderIconsModule.Icon.Image,
			Position = UDim2.fromScale(0.5, 0.5),
			size = var30.Size.Size_1200,
			style = var30.Color.Shift.Shift_400
		})
	}) elseif var31.CaptureType == Enum.CaptureType.Video then reactModule.createElement(view, {
		tag = "size-full",
		onAbsoluteSizeChanged = p5.onAbsoluteSizeChanged
	}, {
		Preview = reactModule.createElement(VideoPreviewSurface, {
			preview = p5.preview,
			capture = var31,
			scaleType = p5.scaleType,
			timeLength = var31.TimeLength or 0,
			onResolutionChanged = p5.onResolutionChanged
		}, p5.children)
	}) else reactModule.createElement(ScreenshotPreviewSurface, {
		preview = p5.preview,
		capture = var31,
		scaleType = p5.scaleType,
		onAbsoluteSizeChanged = p5.onAbsoluteSizeChanged
	}, p5.children)
end