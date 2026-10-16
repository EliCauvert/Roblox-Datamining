local RunService = game:GetService("RunService")
local Parent = script:FindFirstAncestor("VideoUtils").Parent
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local _ = require(Parent.AppCommonLib)
local LoadableVideoFrameModule = require(script.Parent.LoadableVideoFrame)
local RoundIconButtonModule = require(script.Parent.RoundIconButton)
local VideoActions = require(script.Parent.Analytics.Enums).VideoActions
local _ = require(script.Parent.Analytics.VideoAnalyticsTypes)
local VideoLoggerModule = require(script.Parent.Analytics.VideoLogger)
local VideoPlayerBottomOverlayModule = require(script.Parent.VideoPlayerBottomOverlay)
local ReportWarningFunction = require(Parent.DiscoveryAnalytics).Points.reportWarning
local FFlagLuaAppEdpMediaGalleryAutoAdvance = require(Parent.SharedFlags).FFlagLuaAppEdpMediaGalleryAutoAdvance
local FFlagLuaAppEdpMediaGalleryFullScreen = require(Parent.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen
local FFlagLuaAppVideoTileDisableActivation = require(Parent.SharedFlags).FFlagLuaAppVideoTileDisableActivation
local FFlagLuaAppVideoTileHideCenterPlayButton = require(Parent.SharedFlags).FFlagLuaAppVideoTileHideCenterPlayButton
local FFlagLuaAppEdpConsoleMediaGalleryVideo = require(Parent.SharedFlags).FFlagLuaAppEdpConsoleMediaGalleryVideo
local FFlagLuaAppMediaGalleryGamepadSupport = require(Parent.SharedFlags).FFlagLuaAppMediaGalleryGamepadSupport
local FFlagLuaAppEnableHomepageOneByTwoTile = require(Parent.SharedFlags).FFlagLuaAppEnableHomepageOneByTwoTile
local FFlagLuaAppSduiVideoThumbnail = require(Parent.SharedFlags).FFlagLuaAppSduiVideoThumbnail
local FFlagLuaAppHomeMomentVideoFallback = require(Parent.SharedFlags).FFlagLuaAppHomeMomentVideoFallback
local VideoPlayerPlaybackEndThresholdInMsRatio = game:DefineFastInt("VideoPlayerPlaybackEndThresholdInMs", 100) / 1000

return function(Image) --[[ Line: 89 | Named "VideoPlayer" ]]
	-- upvalues: FFlagLuaAppEdpMediaGalleryFullScreen (copy), ReactModule (copy), FFlagLuaAppEdpMediaGalleryAutoAdvance (copy), FFlagLuaAppEdpConsoleMediaGalleryVideo (copy), FFlagLuaAppEnableHomepageOneByTwoTile (copy), RunService (copy), ReportWarningFunction (copy), LoggingProtocolModule (copy), VideoLoggerModule (copy), VideoPlayerPlaybackEndThresholdInMsRatio (copy), ResponsiveModule (copy), VideoActions (copy), FFlagLuaAppMediaGalleryGamepadSupport (copy), FFlagLuaAppVideoTileDisableActivation (copy), LoadableVideoFrameModule (copy), FFlagLuaAppHomeMomentVideoFallback (copy), FFlagLuaAppSduiVideoThumbnail (copy), FFlagLuaAppVideoTileHideCenterPlayButton (copy), RoundIconButtonModule (copy), VideoPlayerBottomOverlayModule (copy)
	local ShowMuteButton = Image.showMuteButton or FFlagLuaAppEdpMediaGalleryFullScreen and (Image.showPlayButton or Image.showProgressBar)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Image.muted)
	local UseResult = ReactModule.useCallback(function(p1, p2) --[[ Line: 97 ]]
		-- upvalues: UseStateResult2 (copy), Image (copy)
		UseStateResult2(true)
		
		if Image.onVideoLoaded then
			Image.onVideoLoaded(p1, p2)
		end
	end, { Image.onVideoLoaded })
	ReactModule.useEffect(function() --[[ Line: 105 ]]
		-- upvalues: Image (copy), UseStateResult1 (copy)
		if Image.onMutedChanged then
			Image.onMutedChanged(UseStateResult1)
		end
	end, { Image.onMutedChanged, UseStateResult1 })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 111 ]]
		-- upvalues: UseStateResult2_1 (copy), Image (copy)
		UseStateResult2_1(function(p1): boolean --[[ Line: 112 ]]
			-- upvalues: Image (upval)
			if Image.onMuteButtonActivated then
				Image.onMuteButtonActivated(p1)
			end
			return not p1
		end)
	end, { Image.onMuteButtonActivated })
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 120 ]]
		-- upvalues: Image (copy), UseStateResult1 (copy), UseResult1 (copy)
		return if Image.showMuteButton then {
			muted = UseStateResult1,
			onMuteButtonActivated = UseResult1
		} else nil
	end, { Image.showMuteButton, UseStateResult1, UseResult1 })
	local UseRefResult = if FFlagLuaAppEdpMediaGalleryAutoAdvance or FFlagLuaAppEdpMediaGalleryFullScreen or FFlagLuaAppEdpConsoleMediaGalleryVideo or FFlagLuaAppEnableHomepageOneByTwoTile then ReactModule.useRef(nil) else nil
	local ProgressBinding = nil
	local Callback = nil
	
	if FFlagLuaAppEdpMediaGalleryFullScreen then
		ProgressBinding, Callback = ReactModule.useBinding(0)
	end
	if FFlagLuaAppEdpMediaGalleryAutoAdvance or FFlagLuaAppEdpMediaGalleryFullScreen then
		ReactModule.useEffect(function() --[[ Line: 147 ]]
			-- upvalues: UseRefResult (ref), Image (copy), FFlagLuaAppEdpMediaGalleryAutoAdvance (upval), FFlagLuaAppEdpMediaGalleryFullScreen (upval), RunService (upval), Callback (ref)
			local Current = UseRefResult.current
			
			if Image.shouldStartPlayback and (FFlagLuaAppEdpMediaGalleryAutoAdvance and Image.onVideoProgressChanged or FFlagLuaAppEdpMediaGalleryFullScreen and Image.showProgressBar) and Current then
				local RenderSteppedConnection = RunService.RenderStepped:Connect(function() --[[ Line: 155 ]]
					-- upvalues: FFlagLuaAppEdpMediaGalleryAutoAdvance (upval), Image (upval), Current (copy), FFlagLuaAppEdpMediaGalleryFullScreen (upval), Callback (upval)
					if FFlagLuaAppEdpMediaGalleryAutoAdvance and Image.onVideoProgressChanged then
						Image.onVideoProgressChanged(if Current.TimeLength > 0 then Current.TimePosition / Current.TimeLength else 0)
					end
					if FFlagLuaAppEdpMediaGalleryFullScreen and Image.showProgressBar then
						Callback(if Current.TimeLength > 0 then Current.TimePosition / Current.TimeLength else 0)
					end
				end)
				
				return function() --[[ Line: 169 ]]
					-- upvalues: RenderSteppedConnection (copy), FFlagLuaAppEdpMediaGalleryAutoAdvance (upval), Image (upval), FFlagLuaAppEdpMediaGalleryFullScreen (upval), Callback (upval)
					RenderSteppedConnection:Disconnect()
					
					if FFlagLuaAppEdpMediaGalleryAutoAdvance and Image.onVideoProgressChanged then
						Image.onVideoProgressChanged(0)
					end
					if FFlagLuaAppEdpMediaGalleryFullScreen and Image.showProgressBar then
						Callback(0)
					end
				end
			else
				return nil
			end
		end, {
			Image.shouldStartPlayback,
			if FFlagLuaAppEdpMediaGalleryAutoAdvance then Image.onVideoProgressChanged else nil,
			if FFlagLuaAppEdpMediaGalleryFullScreen then Image.showProgressBar else nil
		})
	end
	if FFlagLuaAppEnableHomepageOneByTwoTile then
		ReactModule.useEffect(function() --[[ Line: 193 ]]
			-- upvalues: Image (copy), UseRefResult (ref)
			local OnAspectRatioChangedFunction: (any) -> () = Image.onAspectRatioChanged
			local Current = UseRefResult and UseRefResult.current
			
			if not OnAspectRatioChangedFunction or not Current then return end
			local XRatio = nil
			local Connection = Current:GetPropertyChangedSignal("Resolution"):Connect(function() --[[ Line: 201 | Named "report" ]]
				-- upvalues: Current (copy), XRatio (ref), OnAspectRatioChangedFunction (copy)
				local Resolution = Current.Resolution
				
				if Resolution.X > 0 and Resolution.Y > 0 then
					local XRatio1 = Resolution.X / Resolution.Y
					
					if XRatio1 ~= XRatio then
						XRatio = XRatio1
						OnAspectRatioChangedFunction(XRatio1)
					end
				end
			end)
			local Resolution = Current.Resolution
			
			if Resolution.X > 0 and Resolution.Y > 0 then
				local XRatio1 = Resolution.X / Resolution.Y
				
				if XRatio1 ~= XRatio then
					XRatio = XRatio1
					OnAspectRatioChangedFunction(XRatio1)
				end
			end
			return function() --[[ Line: 215 ]]
				-- upvalues: Connection (copy)
				Connection:Disconnect()
			end
		end, { Image.onAspectRatioChanged })
	end
	local IsVideoPlaying = nil
	local UseStateResult2_2 = nil
	local Callback1 = nil
	local UseResult2 = nil
	local UseMemoResult1 = nil
	local UseMemoResult2 = nil
	local IsUsePreferredInputResultMatch: boolean? = nil
	
	if FFlagLuaAppEdpMediaGalleryFullScreen or FFlagLuaAppEdpConsoleMediaGalleryVideo then
		IsVideoPlaying, UseStateResult2_2 = ReactModule.useState(false)
		local UseResult3 = ReactModule.useCallback(function(p1) --[[ Line: 231 ]]
			-- upvalues: UseRefResult (ref), ReportWarningFunction (upval), LoggingProtocolModule (upval), Image (copy), VideoLoggerModule (upval)
			local Current = UseRefResult.current
			
			if not Current then
				ReportWarningFunction(LoggingProtocolModule.default, "EventLogging", "reportVideoAction requires a valid videoFrame")
				
				return
			end
			local Source = nil
			local SourceId = nil
			local PlaybackSessionId = nil
			
			if Image.videoAnalyticsContext then
				Source = Image.videoAnalyticsContext.videoAnalyticsData.source
				SourceId = Image.videoAnalyticsContext.videoAnalyticsData.sourceId
				PlaybackSessionId = Image.videoAnalyticsContext.getPlaybackSessionId()
				
				if not Source or not SourceId or not PlaybackSessionId then
					ReportWarningFunction(LoggingProtocolModule.default, "EventLogging", `reportVideoAction requires a valid {if Source then "" else "source "}{if SourceId then "" else "sourceId "}{if PlaybackSessionId then "" else "playbackSessionId"}`)
				end
			end
			VideoLoggerModule.reportVideoAction(p1, nil, {
				isVisible = true,
				videoAssetId = Image.video,
				source = Source or "",
				sourceId = SourceId or "",
				playbackSessionId = PlaybackSessionId or "",
				videoAssetDuration = Current.TimeLength,
				isAudible = Current.Volume ~= 0,
				volumeLevel = if Current.Volume == 0 then 0 else 1
			})
		end, { Image.video, Image.videoAnalyticsContext })
		Callback1 = ReactModule.useCallback(function() --[[ Line: 272 ]]
			-- upvalues: UseRefResult (ref), IsVideoPlaying (ref), VideoPlayerPlaybackEndThresholdInMsRatio (upval)
			local Current = UseRefResult.current
			
			if not Current then return end
			if IsVideoPlaying then
				Current:Pause()
				
				return
			end
			if math.abs(Current.TimePosition - Current.TimeLength) <= VideoPlayerPlaybackEndThresholdInMsRatio then
				Current.TimePosition = 0
			end
			Current:Play()
		end, { IsVideoPlaying })
		IsUsePreferredInputResultMatch = ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional
		ReactModule.useEffect(function() --[[ Line: 292 ]]
			-- upvalues: Image (copy), Callback1 (ref), UseResult1 (copy)
			local List = {}
			
			if Image.toggleVideoPlaybackSignal then
				table.insert(List, Image.toggleVideoPlaybackSignal:connect(Callback1))
			end
			if Image.toggleMuteSignal then
				table.insert(List, Image.toggleMuteSignal:connect(UseResult1))
			end
			return function() --[[ Line: 300 ]]
				-- upvalues: List (copy)
				for _, value in List do
					if value then
						value:disconnect()
					end
				end
			end
		end, {
			Image.toggleVideoPlaybackSignal,
			Image.toggleMuteSignal,
			Callback1,
			UseResult1
		})
		UseResult2 = ReactModule.useCallback(function() --[[ Line: 311 ]]
			-- upvalues: Image (copy), Callback1 (ref)
			if Image.onVideoPlayerActivated then
				Image.onVideoPlayerActivated()
				
				return
			else
				Callback1()
			end
		end, { Image.onVideoPlayerActivated, Callback1 })
		UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 321 ]]
			-- upvalues: Image (copy), IsVideoPlaying (ref), Callback1 (ref)
			return if Image.showPlayButton then {
				isVideoPlaying = IsVideoPlaying,
				onPlayButtonActivated = Callback1
			} else nil
		end, { Image.showPlayButton, IsVideoPlaying, Callback1 })
		UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 330 ]]
			-- upvalues: Image (copy), ProgressBinding (ref)
			return if Image.showProgressBar then { progressBinding = ProgressBinding } else nil
		end, { Image.showProgressBar, ProgressBinding })
		ReactModule.useEffect(function() --[[ Line: 338 ]]
			-- upvalues: UseRefResult (ref), Image (copy), UseStateResult2_2 (ref), UseResult3 (copy), VideoActions (upval)
			local Current = UseRefResult.current
			
			if Image.shouldStartPlayback and Current then
				local PlayedConnection = Current.Played:Connect(function() --[[ Line: 345 ]]
					-- upvalues: UseStateResult2_2 (upval), UseResult3 (upval), VideoActions (upval)
					UseStateResult2_2(true)
					UseResult3(VideoActions.play)
				end)
				local PausedConnection = Current.Paused:Connect(function() --[[ Line: 350 ]]
					-- upvalues: UseStateResult2_2 (upval), UseResult3 (upval), VideoActions (upval)
					UseStateResult2_2(false)
					UseResult3(VideoActions.pause)
				end)
				local EndedConnection = Current.Ended:Connect(function() --[[ Line: 355 ]]
					-- upvalues: UseStateResult2_2 (upval)
					UseStateResult2_2(false)
				end)
				
				return function() --[[ Line: 359 ]]
					-- upvalues: PlayedConnection (copy), PausedConnection (copy), EndedConnection (copy)
					PlayedConnection:Disconnect()
					PausedConnection:Disconnect()
					EndedConnection:Disconnect()
				end
			else
				return nil
			end
		end, { Image.shouldStartPlayback, UseResult3 })
		ReactModule.useEffect(function() --[[ Line: 367 ]]
			-- upvalues: Image (copy), UseStateResult2 (copy), UseStateResult2_2 (ref)
			if not Image.shouldStartPlayback then
				UseStateResult2(false)
				UseStateResult2_2(false)
			end
			return nil
		end, { Image.shouldStartPlayback })
		
		if FFlagLuaAppMediaGalleryGamepadSupport then
			ReactModule.useEffect(function() --[[ Line: 378 ]]
				-- upvalues: Image (copy), IsVideoPlaying (ref)
				if Image.onPlayingChanged then
					Image.onPlayingChanged(IsVideoPlaying)
				end
			end, { Image.onPlayingChanged, IsVideoPlaying })
			ReactModule.useEffect(function() --[[ Line: 385 ]]
				-- upvalues: Image (copy), UseStateResult (copy)
				if Image.onVideoLoadedChanged then
					Image.onVideoLoadedChanged(UseStateResult)
				end
			end, { Image.onVideoLoadedChanged, UseStateResult })
		end
	end
	return ReactModule.createElement(if FFlagLuaAppVideoTileDisableActivation and Image.disableActivation then "Frame" elseif FFlagLuaAppEdpMediaGalleryFullScreen then "TextButton" else "Frame", {
		Size = Image.Size,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		ZIndex = Image.ZIndex,
		Text = if FFlagLuaAppVideoTileDisableActivation and Image.disableActivation then nil elseif FFlagLuaAppEdpMediaGalleryFullScreen then "" else nil,
		[ReactModule.Event.Activated] = if FFlagLuaAppVideoTileDisableActivation and Image.disableActivation then nil elseif FFlagLuaAppEdpMediaGalleryFullScreen then UseResult2 else nil,
		Selectable = false
	}, {
		Corner = if Image.cornerRadius then ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, Image.cornerRadius) }) else nil,
		Video = ReactModule.createElement(LoadableVideoFrameModule, {
			video = Image.video,
			accessContext = if FFlagLuaAppHomeMomentVideoFallback then Image.accessContext else nil,
			thumbnail = Image.thumbnail,
			thumbnailComponentOverride = if FFlagLuaAppSduiVideoThumbnail then Image.thumbnailComponentOverride else nil,
			shouldStartPlayback = Image.shouldStartPlayback,
			muted = UseStateResult1,
			looped = Image.looped,
			ScaleType = Image.ScaleType,
			cornerRadius = Image.cornerRadius,
			onVideoLoaded = UseResult,
			onVideoLooped = Image.onVideoLooped,
			onVideoEnded = if FFlagLuaAppEdpMediaGalleryAutoAdvance then Image.onVideoEnded else nil,
			ref = if FFlagLuaAppEdpMediaGalleryAutoAdvance or FFlagLuaAppEdpMediaGalleryFullScreen or FFlagLuaAppEdpConsoleMediaGalleryVideo or FFlagLuaAppEnableHomepageOneByTwoTile then UseRefResult else nil
		}),
		PlayButton = if (FFlagLuaAppVideoTileHideCenterPlayButton or FFlagLuaAppEnableHomepageOneByTwoTile) and Image.hideCenterPlayButton then nil elseif (FFlagLuaAppEdpMediaGalleryFullScreen or FFlagLuaAppMediaGalleryGamepadSupport) and (UseStateResult and not IsVideoPlaying and (not FFlagLuaAppMediaGalleryGamepadSupport or Callback1 ~= nil)) then ReactModule.createElement(RoundIconButtonModule, {
			icon = "play-large",
			ZIndex = 2,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Selectable = not IsUsePreferredInputResultMatch and nil,
			onActivated = Callback1
		}) else nil,
		BottomOverlay = if ShowMuteButton then ReactModule.createElement(VideoPlayerBottomOverlayModule, {
			ZIndex = 10,
			cornerRadius = Image.cornerRadius,
			videoLoaded = UseStateResult,
			muteButtonConfig = UseMemoResult,
			playButtonConfig = if FFlagLuaAppEdpMediaGalleryFullScreen then UseMemoResult1 else nil,
			progressBarConfig = if FFlagLuaAppEdpMediaGalleryFullScreen then UseMemoResult2 else nil
		}) else nil
	})
end