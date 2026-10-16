local Parent = script:FindFirstAncestor("VideoPlayer").Parent
local RunService = game:GetService("RunService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local ReactModule = require(Parent.React)
local ArgCheckModule = require(Parent.ArgCheck)
local VideoPlayerWrapperModule = require(script.Parent.VideoPlayerWrapper)
local VideoLoadingStateModule = require(script.Parent.VideoLoadingState)
local LuaAppFixStartPlaybackProgress = game:DefineFastFlag("LuaAppFixStartPlaybackProgress", false)

return function(Image) --[[ Line: 57 | Named "VideoDisplay" ]]
	-- upvalues: ReactModule (copy), VideoLoadingStateModule (copy), LuaAppFixStartPlaybackProgress (copy), UserGameSettings (copy), ArgCheckModule (copy), RunService (copy), VideoPlayerWrapperModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local VideoPlayerRef = Image.videoPlayerRef or UseRefResult1
	local UseRefResult2 = ReactModule.useRef(0)
	local UseRefResult3 = ReactModule.useRef(0)
	local UseRefResult4 = ReactModule.useRef(false)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(VideoLoadingStateModule.Idle)
	local ShouldStartPlayback = Image.shouldStartPlayback or Image.loadImmediately == true
	local UseRefResult5 = ReactModule.useRef(nil)
	UseRefResult5.current = Image.onLoadingStateChanged
	local UseRefResult6 = ReactModule.useRef(nil)
	UseRefResult6.current = Image.onVideoLoaded
	local UseRefResult7 = ReactModule.useRef(nil)
	UseRefResult7.current = Image.onAspectRatioChanged
	local UseRefResult8 = ReactModule.useRef(nil)
	UseRefResult8.current = Image.onVideoProgressChanged
	local UseRefResult9 = nil
	local UseRefResult10 = nil
	
	if LuaAppFixStartPlaybackProgress then
		UseRefResult9 = ReactModule.useRef(Image.startPlaybackProgress)
		UseRefResult9.current = Image.startPlaybackProgress
		UseRefResult10 = ReactModule.useRef(false)
	end
	local UseResult = ReactModule.useCallback(function(p1) --[[ Line: 85 ]]
		-- upvalues: UseStateResult2_1 (copy), UseRefResult5 (copy)
		UseStateResult2_1(p1)
		
		if UseRefResult5.current then
			UseRefResult5.current(p1)
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 92 ]]
		-- upvalues: UseRefResult2 (copy), Image (copy)
		UseRefResult2.current += 1
		
		if Image.onVideoLooped then
			Image.onVideoLooped()
		end
	end, { Image.onVideoLooped })
	ReactModule.useEffect(function() --[[ Line: 99 ]]
		-- upvalues: UseRefResult2 (copy), UseRefResult3 (copy), UseRefResult4 (copy)
		UseRefResult2.current = 0
		UseRefResult3.current = 0
		UseRefResult4.current = false
	end, { Image.video })
	ReactModule.useEffect(function() --[[ Line: 105 ]]
		-- upvalues: Image (copy), VideoPlayerRef (copy), UseRefResult2 (copy), UseRefResult3 (copy), UserGameSettings (upval)
		local VideoPlaybackStateRef = Image.videoPlaybackStateRef
		
		if VideoPlaybackStateRef == nil then return end
		local function Current() --[[ Line: 111 ]]
			-- upvalues: VideoPlayerRef (upval), UseRefResult2 (upval), UseRefResult3 (upval), UserGameSettings (upval)
			local Current = VideoPlayerRef.current
			
			return if Current then {
				isPlaying = Current.IsPlaying,
				playbackPositionMs = math.round(math.max(0, Current.TimePosition) * 1000),
				videoLengthMs = if Current.TimeLength > 0 then math.round(Current.TimeLength * 1000) else nil,
				loopCount = UseRefResult2.current,
				endedCount = UseRefResult3.current,
				audioLevel = math.clamp(Current.Volume * UserGameSettings.MasterVolume, 0, 1)
			} else nil
		end
		
		VideoPlaybackStateRef.current = Current
		
		return function() --[[ Line: 128 ]]
			-- upvalues: VideoPlaybackStateRef (copy), Current (copy)
			if VideoPlaybackStateRef.current == Current then
				VideoPlaybackStateRef.current = nil
			end
		end
	end, { Image.videoPlaybackStateRef })
	ReactModule.useEffect(function() --[[ Line: 137 ]]
		-- upvalues: UseStateResult2 (copy), ShouldStartPlayback (copy), UseResult (copy), VideoLoadingStateModule (upval), VideoPlayerRef (copy), ArgCheckModule (upval), LuaAppFixStartPlaybackProgress (upval), UseRefResult9 (ref), UseRefResult10 (ref), Image (copy), UseRefResult6 (copy), UseRefResult7 (copy)
		UseStateResult2(false)
		
		if not ShouldStartPlayback then
			UseResult(VideoLoadingStateModule.Idle)
			
			return
		end
		local Current = VideoPlayerRef.current
		ArgCheckModule.assert(Current ~= nil, "VideoDisplay expects videoPlayer ref to be set before loading")
		UseResult(VideoLoadingStateModule.Loading)
		local Flag = false
		task.spawn(function() --[[ Line: 147 ]]
			-- upvalues: Current (copy), Flag (ref), UseResult (upval), VideoLoadingStateModule (upval), LuaAppFixStartPlaybackProgress (upval), UseRefResult9 (upval), UseRefResult10 (upval), Image (upval), UseRefResult6 (upval), UseRefResult7 (upval), UseStateResult2 (upval)
			local CurrentTime = tick()
			local Success, Result = pcall(function() --[[ Line: 149 ]]
				-- upvalues: Current (upval)
				return Current:LoadAsync()
			end)
			
			if Flag then return end
			if not Success or Result ~= Enum.AssetFetchStatus.Success then
				UseResult(VideoLoadingStateModule.Failed)
				
				return
			end
			if LuaAppFixStartPlaybackProgress then
				local Current1: number = UseRefResult9.current
				
				if Current1 ~= nil then
					Current.TimePosition = math.clamp(Current1, 0, 1) * Current.TimeLength
					UseRefResult10.current = true
				end
			elseif Image.startPlaybackProgress ~= nil then
				Current.TimePosition = math.clamp(Image.startPlaybackProgress, 0, 1) * Current.TimeLength
			end
			if UseRefResult6.current then
				UseRefResult6.current(Current.TimeLength, tick() - CurrentTime)
			end
			local Resolution = Current.Resolution
			
			if UseRefResult7.current and Resolution and Resolution.Y > 0 then
				UseRefResult7.current(Resolution.X / Resolution.Y)
			end
			UseStateResult2(true)
			UseResult(VideoLoadingStateModule.Loaded)
		end)
		
		return function() --[[ Line: 178 ]]
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { Image.video, ShouldStartPlayback })
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 183 ]]
		-- upvalues: UseRefResult4 (copy), UseRefResult3 (copy), Image (copy)
		UseRefResult4.current = true
		UseRefResult3.current += 1
		
		if Image.onVideoEnded then
			Image.onVideoEnded()
		end
	end, { Image.onVideoEnded })
	ReactModule.useEffect(function() --[[ Line: 192 ]]
		-- upvalues: UseStateResult (copy), VideoPlayerRef (copy), ArgCheckModule (upval), LuaAppFixStartPlaybackProgress (upval), UseRefResult10 (ref), UseRefResult4 (copy), Image (copy)
		if not UseStateResult then return end
		local Current = VideoPlayerRef.current
		ArgCheckModule.assert(Current ~= nil, "VideoDisplay expects videoPlayer ref to be set before playback")
		
		if LuaAppFixStartPlaybackProgress and UseRefResult10.current then
			UseRefResult10.current = false
		elseif UseRefResult4.current and Image.shouldStartPlayback then
			Current.TimePosition = 0
			UseRefResult4.current = false
		elseif Image.shouldStartPlayback and not Image.preservePlaybackPosition then
			Current.TimePosition = 0
		end
		if Image.shouldStartPlayback then
			Current:Play()
			
			return
		else
			Current:Pause()
		end
	end, {
		UseStateResult,
		Image.preservePlaybackPosition,
		Image.shouldStartPlayback
	})
	ReactModule.useEffect(function() --[[ Line: 221 ]]
		-- upvalues: UseStateResult (copy), VideoPlayerRef (copy), ArgCheckModule (upval), RunService (upval), UseRefResult8 (copy)
		if not UseStateResult then return end
		local Current = VideoPlayerRef.current
		ArgCheckModule.assert(Current ~= nil, "VideoDisplay expects videoPlayer ref to be set before reporting progress")
		local RenderSteppedConnection = RunService.RenderStepped:Connect(function() --[[ Line: 227 ]]
			-- upvalues: UseRefResult8 (upval), Current (copy)
			local CurrentFunction: (any) -> () = UseRefResult8.current
			
			if CurrentFunction then
				CurrentFunction(if Current.TimeLength > 0 then Current.TimePosition / Current.TimeLength else 0)
			end
		end)
		
		return function() --[[ Line: 235 ]]
			-- upvalues: RenderSteppedConnection (copy)
			RenderSteppedConnection:Disconnect()
		end
	end, { UseStateResult })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Selectable = false,
		Size = Image.Size,
		ZIndex = Image.ZIndex
	}, {
		Corner = if Image.cornerRadius then ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, Image.cornerRadius) }) else nil,
		Thumbnail = if Image.thumbnail and Image.thumbnail ~= "" then ReactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 1,
			Image = Image.thumbnail,
			Size = UDim2.fromScale(1, 1),
			ScaleType = Image.ScaleType
		}, {
			Corner = if Image.cornerRadius then ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, Image.cornerRadius) }) else nil
		}) else nil,
		VideoDisplay = ReactModule.createElement("VideoDisplay", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 2,
			Size = UDim2.fromScale(1, 1),
			ScaleType = Image.ScaleType,
			Visible = UseStateResult1 ~= VideoLoadingStateModule.Failed and (Image.shouldStartPlayback or Image.showVideoWhenPaused == true),
			ref = UseRefResult
		}, {
			Corner = if Image.cornerRadius then ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, Image.cornerRadius) }) else nil,
			VideoPlayer = ReactModule.createElement(VideoPlayerWrapperModule, {
				video = Image.video,
				muted = Image.muted,
				looped = Image.looped,
				videoPlayerRef = VideoPlayerRef,
				videoDisplayRef = UseRefResult,
				onVideoLooped = UseResult1,
				onVideoEnded = UseResult2
			})
		})
	})
end