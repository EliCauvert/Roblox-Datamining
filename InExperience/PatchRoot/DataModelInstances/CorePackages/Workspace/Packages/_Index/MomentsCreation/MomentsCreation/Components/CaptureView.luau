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

local function VideoPreviewSurface(p0) --[[ line: 74 ]]
	-- upvalues: reactModule (ref), signalsModule (ref), useCreationMusicSyncModule (ref), getCaptureVideoContentModule (ref), runService (ref), view (ref), fFlagLuaAppMomentsInternalVideoUsage (ref), getFitSize (ref), getCropSize (ref)
	local preview = p0.preview
	local capture = p0.capture
	local timeLength = p0.timeLength
	local var14 = reactModule.useRef(nil)
	local var15, var16 = reactModule.useState(Vector2.new(0, 0))
	local var17, var18 = reactModule.useState(Vector2.new(0, 0))
	local var19, var20 = reactModule.useState(preview.playback.getRegion(false))
	reactModule.useEffect(function() --[[ line: 86 ]]
		-- upvalues: signalsModule (copy), var20 (ref), preview (ref)
		return signalsModule.createEffect(function(p1) --[[ line: 87 ]]
			-- upvalues: var20 (copy), preview (copy)
			var20(preview.playback.getRegion(p1))
		end)
	end, { preview })
	local var21 = useCreationMusicSyncModule(preview, if var19 ~= nil then timeLength else math.max(0, var19.endTime - var19.startTime))
	local audio = var21.audio
	local music = var21.music
	local userMuted = var21.userMuted
	local var22 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 105 ]]
		-- upvalues: var22 (ref), music (ref), audio (ref)
		function var22.current() --[[ line: 106 ]]
			-- upvalues: music (copy), audio (copy)
			if music ~= nil then
				audio.timeline.seek(0)
			end
		end
	end, { audio.timeline.seek, music })
	reactModule.useEffect(function() --[[ line: 115 ]]
		-- upvalues: var14 (ref), music (ref), userMuted (ref)
		local current = var14.current
		
		if current ~= nil then
			current.Volume = if music == nil and not userMuted then 1 else 0
		end
	end, { music, userMuted })
	reactModule.useEffect(function() --[[ line: 122 ]]
		-- upvalues: var14 (ref), capture (ref), getCaptureVideoContentModule (copy), preview (ref), timeLength (ref), runService (copy), var22 (ref)
		local current = var14.current
		
		if current == nil then return end
		if typeof(capture) == "table" then
			local var23 = getCaptureVideoContentModule(capture)
			
			if var23 ~= nil then
				current.Video = var23.Uri
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
		local var24 = false
		preview.bindEngine({
			play = function() --[[ line: 150 ]]
				-- upvalues: current (ref)
				current.Playing = true
			end,
			pause = function() --[[ line: 153 ]]
				-- upvalues: current (ref)
				current.Playing = false
			end,
			seek = function(p2) --[[ line: 156 ]]
				-- upvalues: current (ref)
				current.TimePosition = p2
			end
		})
		local list = {
			current.Loaded:Connect(function() --[[ line: 162 ]]
				-- upvalues: var24 (write), current (ref), preview (copy)
				var24 = true
				
				if current.TimeLength > 0 then
					preview.setDuration(current.TimeLength)
					preview.setTimeLength(current.TimeLength)
				end
				current.Playing = true
				preview.setIsPlaying(true)
			end),
			current.Played:Connect(function() --[[ line: 171 ]]
				-- upvalues: var24 (write), preview (copy)
				var24 = true
				preview.setIsPlaying(true)
			end),
			current.Paused:Connect(function() --[[ line: 175 ]]
				-- upvalues: var24 (write), preview (copy)
				if var24 then
					preview.setIsPlaying(false)
				end
			end),
			runService.RenderStepped:Connect(function() --[[ line: 183 ]]
				-- upvalues: preview (copy), current (ref), var22 (copy)
				preview.setPosition(current.TimePosition)
				local region = preview.playback.getRegion(false)
				
				if region == nil then return end
				local timePosition = current.TimePosition
				
				if region.endTime - 0.05 <= timePosition or timePosition < region.startTime - 0.05 then
					current.TimePosition = region.startTime
					
					if var22.current ~= nil then
						var22.current()
					end
				end
			end)
		}
		
		return function() --[[ line: 203 ]]
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
		onAbsoluteSizeChanged = function(value) --[[ line: 214 ]]
			-- upvalues: var16 (ref)
			var16(value.AbsoluteSize)
		end
	}, {
		Media = reactModule.createElement("VideoFrame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			InternalVideoUsage = if fFlagLuaAppMomentsInternalVideoUsage then Enum.InternalVideoUsage.WatchPage else nil,
			Looped = true,
			Position = UDim2.fromScale(0.5, 0.5),
			Size = if p0.scaleType == Enum.ScaleType.Fit then getFitSize(var15, var17) else getCropSize(var15, var17),
			Visible = var17.X > 0 and var17.Y > 0,
			ref = var14,
			[reactModule.Change.Resolution] = function(p3) --[[ line: 231 ]]
				-- upvalues: var18 (ref)
				var18(p3.Resolution)
			end
		}),
		Overlay = reactModule.createElement(view, { tag = "size-full", ZIndex = 2 }, p0.children)
	})
end

local function ScreenshotPreviewSurface(p4) --[[ line: 254 ]]
	-- upvalues: useCreationMusicSyncModule (ref), constantsModule (ref), reactModule (ref), view (ref), getCaptureContentModule (ref)
	useCreationMusicSyncModule(p4.preview, constantsModule.ScreenshotMusicDuration)
	
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

return function(p5) --[[ line: 272 ]]
	-- upvalues: useTokens (ref), reactModule (ref), signalsModule (ref), view (ref), icon (ref), builderIconsModule (ref), VideoPreviewSurface (ref), ScreenshotPreviewSurface (ref)
	local var27 = useTokens()
	local var28, var29 = reactModule.useState(p5.preview.getCapture(false))
	reactModule.useEffect(function() --[[ line: 278 ]]
		-- upvalues: signalsModule (copy), var29 (ref), p5 (ref)
		return signalsModule.createEffect(function(p6) --[[ line: 279 ]]
			-- upvalues: var29 (copy), p5 (copy)
			var29(p5.preview.getCapture(p6))
		end)
	end, { p5.preview })
	
	return if var28 == nil then reactModule.createElement(view, {
		tag = "size-full radius-large bg-shift-200",
		onAbsoluteSizeChanged = p5.onAbsoluteSizeChanged
	}, {
		EmptyState = reactModule.createElement(icon, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			name = builderIconsModule.Icon.Image,
			Position = UDim2.fromScale(0.5, 0.5),
			size = var27.Size.Size_1200,
			style = var27.Color.Shift.Shift_400
		})
	}) elseif var28.CaptureType == Enum.CaptureType.Video then reactModule.createElement(view, {
		tag = "size-full",
		onAbsoluteSizeChanged = p5.onAbsoluteSizeChanged
	}, {
		Preview = reactModule.createElement(VideoPreviewSurface, {
			preview = p5.preview,
			capture = var28,
			scaleType = p5.scaleType,
			timeLength = var28.TimeLength or 0
		}, p5.children)
	}) else reactModule.createElement(ScreenshotPreviewSurface, {
		preview = p5.preview,
		capture = var28,
		scaleType = p5.scaleType,
		onAbsoluteSizeChanged = p5.onAbsoluteSizeChanged
	}, p5.children)
end