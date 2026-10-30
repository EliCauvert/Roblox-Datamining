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
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local ReportWarningFunction = require(Parent.DiscoveryAnalytics).Points.reportWarning
local GetVideoEditsModule = require(script.Parent.getVideoEdits)
local FFlagLuaAppEdpMediaGalleryAutoAdvance = require(Parent.SharedFlags).FFlagLuaAppEdpMediaGalleryAutoAdvance
local FFlagLuaAppEdpMediaGalleryFullScreen = require(Parent.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen
local FFlagLuaAppVideoTileDisableActivation = require(Parent.SharedFlags).FFlagLuaAppVideoTileDisableActivation
local FFlagLuaAppVideoTileHideCenterPlayButton = require(Parent.SharedFlags).FFlagLuaAppVideoTileHideCenterPlayButton
local FFlagLuaAppEdpConsoleMediaGalleryVideo = require(Parent.SharedFlags).FFlagLuaAppEdpConsoleMediaGalleryVideo
local FFlagLuaAppMediaGalleryGamepadSupport = require(Parent.SharedFlags).FFlagLuaAppMediaGalleryGamepadSupport
local FFlagLuaAppEnableHomepageOneByTwoTile = require(Parent.SharedFlags).FFlagLuaAppEnableHomepageOneByTwoTile
local FFlagLuaAppSduiVideoThumbnail = require(Parent.SharedFlags).FFlagLuaAppSduiVideoThumbnail
local FFlagLuaAppHomeMomentVideoFallback = require(Parent.SharedFlags).FFlagLuaAppHomeMomentVideoFallback
local FFlagLuaAppVideoLoadFailureFallback = require(Parent.SharedFlags).FFlagLuaAppVideoLoadFailureFallback
local FFlagLuaAppVideoPlayerTrimAndMusic = require(Parent.SharedFlags).FFlagLuaAppVideoPlayerTrimAndMusic
local VideoPlayerPlaybackEndThresholdInMsRatio = game:DefineFastInt("VideoPlayerPlaybackEndThresholdInMs", 100) / 1000

return function(Image)
	-- upvalues: FFlagLuaAppVideoPlayerTrimAndMusic (copy), ReactModule (copy), GetVideoEditsModule (copy), FFlagLuaAppEdpMediaGalleryFullScreen (copy), FFlagLuaAppVideoLoadFailureFallback (copy), DiscoveryEventErrorLogger (copy), FFlagLuaAppEdpMediaGalleryAutoAdvance (copy), FFlagLuaAppEdpConsoleMediaGalleryVideo (copy), FFlagLuaAppEnableHomepageOneByTwoTile (copy), RunService (copy), ReportWarningFunction (copy), LoggingProtocolModule (copy), VideoLoggerModule (copy), VideoPlayerPlaybackEndThresholdInMsRatio (copy), ResponsiveModule (copy), VideoActions (copy), FFlagLuaAppMediaGalleryGamepadSupport (copy), FFlagLuaAppVideoTileDisableActivation (copy), LoadableVideoFrameModule (copy), FFlagLuaAppHomeMomentVideoFallback (copy), FFlagLuaAppSduiVideoThumbnail (copy), FFlagLuaAppVideoTileHideCenterPlayButton (copy), RoundIconButtonModule (copy), VideoPlayerBottomOverlayModule (copy)
	local v1 = nil
	local v2 = nil
	
	if FFlagLuaAppVideoPlayerTrimAndMusic then
		v1, v27 = ReactModule.useMemo(function()
			-- upvalues: GetVideoEditsModule (upval), Image (copy)
			return GetVideoEditsModule.getVideoEdits({
				trimStartTime = Image.trimStartTime,
				trimEndTime = Image.trimEndTime,
				musicAssetId = Image.musicAssetId,
				musicStartTime = Image.musicStartTime
			})
		end, {
			Image.trimStartTime,
			Image.trimEndTime,
			Image.musicAssetId,
			Image.musicStartTime
		})
	end
	local ShowMuteButton = Image.showMuteButton or FFlagLuaAppEdpMediaGalleryFullScreen and (Image.showPlayButton or Image.showProgressBar)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Image.muted)
	local UseResult = ReactModule.useCallback(function(p1, p2)
		-- upvalues: UseStateResult2 (copy), Image (copy)
		UseStateResult2(true)
		
		if Image.onVideoLoaded then
			Image.onVideoLoaded(p1, p2)
		end
	end, { Image.onVideoLoaded })
	local UseResult1 = if FFlagLuaAppVideoLoadFailureFallback then ReactModule.useCallback(function(Reason)
		-- upvalues: Image (copy), DiscoveryEventErrorLogger (upval)
		local Match: string = string.match(Image.video, "^rbxassetid://(%d+)") or "unknown"
		local VideoAnalyticsData = if Image.videoAnalyticsContext then Image.videoAnalyticsContext.videoAnalyticsData else nil
		local Message: string = `Video asset {Match} failed to load: {Reason}`
		DiscoveryEventErrorLogger.reportError("VideoLoadFailure", Message, {
			message = Message,
			videoAssetId = Match,
			reason = Reason,
			hasAccessContext = tostring(Image.accessContext ~= nil and Image.accessContext ~= ""),
			source = if VideoAnalyticsData then VideoAnalyticsData.source else nil,
			sourceId = if VideoAnalyticsData then VideoAnalyticsData.sourceId else nil
		})
		
		if Image.onVideoLoadFailed then
			Image.onVideoLoadFailed(Reason)
		end
	end, {
		Image.video,
		Image.accessContext,
		Image.videoAnalyticsContext,
		Image.onVideoLoadFailed
	}) else nil
	
	if FFlagLuaAppVideoPlayerTrimAndMusic then
		local UseRefResult = ReactModule.useRef(UseResult1)
		UseRefResult.current = UseResult1
		ReactModule.useEffect(function()
			-- upvalues: v2 (ref), Image (copy), UseRefResult (copy)
			if not v2 and Image.shouldStartPlayback and UseRefResult.current then
				UseRefResult.current("InvalidEdits")
			end
		end, { v2, Image.shouldStartPlayback, Image.video })
	end
	ReactModule.useEffect(function()
		-- upvalues: Image (copy), UseStateResult1 (copy)
		if Image.onMutedChanged then
			Image.onMutedChanged(UseStateResult1)
		end
	end, { Image.onMutedChanged, UseStateResult1 })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy), Image (copy)
		UseStateResult2_1(function(p1): boolean
			-- upvalues: Image (upval)
			if Image.onMuteButtonActivated then
				Image.onMuteButtonActivated(p1)
			end
			return not p1
		end)
	end, { Image.onMuteButtonActivated })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Image (copy), UseStateResult1 (copy), UseResult2 (copy)
		return if Image.showMuteButton then {
			muted = UseStateResult1,
			onMuteButtonActivated = UseResult2
		} else nil
	end, { Image.showMuteButton, UseStateResult1, UseResult2 })
	local UseRefResult1 = if FFlagLuaAppEdpMediaGalleryAutoAdvance or FFlagLuaAppEdpMediaGalleryFullScreen or FFlagLuaAppEdpConsoleMediaGalleryVideo or FFlagLuaAppEnableHomepageOneByTwoTile then ReactModule.useRef(nil) else nil
	local ProgressBinding = nil
	local Callback = nil
	
	if FFlagLuaAppEdpMediaGalleryFullScreen then
		ProgressBinding, Callback = ReactModule.useBinding(0)
	end
	if FFlagLuaAppEdpMediaGalleryAutoAdvance or FFlagLuaAppEdpMediaGalleryFullScreen then
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult1 (ref), Image (copy), FFlagLuaAppEdpMediaGalleryAutoAdvance (upval), FFlagLuaAppEdpMediaGalleryFullScreen (upval), RunService (upval), FFlagLuaAppVideoPlayerTrimAndMusic (upval), v1 (ref), GetVideoEditsModule (upval), Callback (ref)
			local Current = UseRefResult1.current
			
			if Image.shouldStartPlayback and (FFlagLuaAppEdpMediaGalleryAutoAdvance and Image.onVideoProgressChanged or FFlagLuaAppEdpMediaGalleryFullScreen and Image.showProgressBar) and Current then
				local RenderSteppedConnection = RunService.RenderStepped:Connect(function()
					-- upvalues: FFlagLuaAppVideoPlayerTrimAndMusic (upval), v1 (upval), GetVideoEditsModule (upval), Current (copy), FFlagLuaAppEdpMediaGalleryAutoAdvance (upval), Image (upval), FFlagLuaAppEdpMediaGalleryFullScreen (upval), Callback (upval)
					local ClampedValue: number? = nil
					
					if FFlagLuaAppVideoPlayerTrimAndMusic and v1 and v1.trim then
						local PlaybackRange, PlaybackRange2 = GetVideoEditsModule.getPlaybackRange(Current.TimeLength, v1.trim)
						ClampedValue = if PlaybackRange < PlaybackRange2 then math.clamp((Current.TimePosition - PlaybackRange) / (PlaybackRange2 - PlaybackRange), 0, 1) else 0
					end
					if FFlagLuaAppEdpMediaGalleryAutoAdvance and Image.onVideoProgressChanged then
						Image.onVideoProgressChanged(if FFlagLuaAppVideoPlayerTrimAndMusic and ClampedValue ~= nil then ClampedValue elseif Current.TimeLength > 0 then Current.TimePosition / Current.TimeLength else 0)
					end
					if FFlagLuaAppEdpMediaGalleryFullScreen and Image.showProgressBar then
						Callback(if FFlagLuaAppVideoPlayerTrimAndMusic and ClampedValue ~= nil then ClampedValue elseif Current.TimeLength > 0 then Current.TimePosition / Current.TimeLength else 0)
					end
				end)
				
				return function()
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
			if FFlagLuaAppEdpMediaGalleryFullScreen then Image.showProgressBar else nil,
			if FFlagLuaAppVideoPlayerTrimAndMusic then v1 else nil
		})
	end
	if FFlagLuaAppEnableHomepageOneByTwoTile then
		ReactModule.useEffect(function()
			-- upvalues: Image (copy), UseRefResult1 (ref)
			local OnAspectRatioChangedFunction: (any) -> () = Image.onAspectRatioChanged
			local Current = UseRefResult1 and UseRefResult1.current
			
			if not OnAspectRatioChangedFunction or not Current then return end
			local XRatio = nil
			local Connection = Current:GetPropertyChangedSignal("Resolution"):Connect(function()
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
			return function()
				-- upvalues: Connection (copy)
				Connection:Disconnect()
			end
		end, { Image.onAspectRatioChanged })
	end
	local IsVideoPlaying = nil
	local UseStateResult2_2 = nil
	local Callback1 = nil
	local UseResult3 = nil
	local UseMemoResult1 = nil
	local UseMemoResult2 = nil
	local IsUsePreferredInputResultMatch: boolean? = nil
	
	if FFlagLuaAppEdpMediaGalleryFullScreen or FFlagLuaAppEdpConsoleMediaGalleryVideo then
		IsVideoPlaying, UseStateResult2_2 = ReactModule.useState(false)
		local UseResult4 = ReactModule.useCallback(function(p1)
			-- upvalues: UseRefResult1 (ref), ReportWarningFunction (upval), LoggingProtocolModule (upval), Image (copy), FFlagLuaAppVideoPlayerTrimAndMusic (upval), v1 (ref), GetVideoEditsModule (upval), VideoLoggerModule (upval), UseStateResult1 (copy)
			local Current = UseRefResult1.current
			
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
			local v3 = nil
			
			if FFlagLuaAppVideoPlayerTrimAndMusic and v1 then
				local PlaybackRange, PlaybackRange2 = GetVideoEditsModule.getPlaybackRange(Current.TimeLength, v1.trim)
				v3 = PlaybackRange2 - PlaybackRange
			end
			VideoLoggerModule.reportVideoAction(p1, nil, {
				isVisible = true,
				videoAssetId = Image.video,
				source = Source or "",
				sourceId = SourceId or "",
				playbackSessionId = PlaybackSessionId or "",
				videoAssetDuration = if FFlagLuaAppVideoPlayerTrimAndMusic and v3 ~= nil then v3 else Current.TimeLength,
				isAudible = if FFlagLuaAppVideoPlayerTrimAndMusic then not UseStateResult1 else Current.Volume ~= 0,
				volumeLevel = if FFlagLuaAppVideoPlayerTrimAndMusic then if UseStateResult1 then 0 else 1 elseif Current.Volume == 0 then 0 else 1
			})
		end, {
			Image.video,
			Image.videoAnalyticsContext,
			if FFlagLuaAppVideoPlayerTrimAndMusic then v1 else nil,
			if FFlagLuaAppVideoPlayerTrimAndMusic then UseStateResult1 else nil
		})
		Callback1 = ReactModule.useCallback(function()
			-- upvalues: UseRefResult1 (ref), IsVideoPlaying (ref), VideoPlayerPlaybackEndThresholdInMsRatio (upval)
			local Current = UseRefResult1.current
			
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
		ReactModule.useEffect(function()
			-- upvalues: Image (copy), Callback1 (ref), UseResult2 (copy)
			local List = {}
			
			if Image.toggleVideoPlaybackSignal then
				table.insert(List, Image.toggleVideoPlaybackSignal:connect(Callback1))
			end
			if Image.toggleMuteSignal then
				table.insert(List, Image.toggleMuteSignal:connect(UseResult2))
			end
			return function()
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
			UseResult2
		})
		UseResult3 = ReactModule.useCallback(function()
			-- upvalues: Image (copy), Callback1 (ref)
			if Image.onVideoPlayerActivated then
				Image.onVideoPlayerActivated()
				
				return
			else
				Callback1()
			end
		end, { Image.onVideoPlayerActivated, Callback1 })
		UseMemoResult1 = ReactModule.useMemo(function()
			-- upvalues: Image (copy), IsVideoPlaying (ref), Callback1 (ref)
			return if Image.showPlayButton then {
				isVideoPlaying = IsVideoPlaying,
				onPlayButtonActivated = Callback1
			} else nil
		end, { Image.showPlayButton, IsVideoPlaying, Callback1 })
		UseMemoResult2 = ReactModule.useMemo(function()
			-- upvalues: Image (copy), ProgressBinding (ref)
			return if Image.showProgressBar then { progressBinding = ProgressBinding } else nil
		end, { Image.showProgressBar, ProgressBinding })
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult1 (ref), Image (copy), UseStateResult2_2 (ref), UseResult4 (copy), VideoActions (upval)
			local Current = UseRefResult1.current
			
			if Image.shouldStartPlayback and Current then
				local PlayedConnection = Current.Played:Connect(function()
					-- upvalues: UseStateResult2_2 (upval), UseResult4 (upval), VideoActions (upval)
					UseStateResult2_2(true)
					UseResult4(VideoActions.play)
				end)
				local PausedConnection = Current.Paused:Connect(function()
					-- upvalues: UseStateResult2_2 (upval), UseResult4 (upval), VideoActions (upval)
					UseStateResult2_2(false)
					UseResult4(VideoActions.pause)
				end)
				local EndedConnection = Current.Ended:Connect(function()
					-- upvalues: UseStateResult2_2 (upval)
					UseStateResult2_2(false)
				end)
				
				return function()
					-- upvalues: PlayedConnection (copy), PausedConnection (copy), EndedConnection (copy)
					PlayedConnection:Disconnect()
					PausedConnection:Disconnect()
					EndedConnection:Disconnect()
				end
			else
				return nil
			end
		end, { Image.shouldStartPlayback, UseResult4 })
		ReactModule.useEffect(function()
			-- upvalues: Image (copy), UseStateResult2 (copy), UseStateResult2_2 (ref)
			if not Image.shouldStartPlayback then
				UseStateResult2(false)
				UseStateResult2_2(false)
			end
			return nil
		end, { Image.shouldStartPlayback })
		
		if FFlagLuaAppMediaGalleryGamepadSupport then
			ReactModule.useEffect(function()
				-- upvalues: Image (copy), IsVideoPlaying (ref)
				if Image.onPlayingChanged then
					Image.onPlayingChanged(IsVideoPlaying)
				end
			end, { Image.onPlayingChanged, IsVideoPlaying })
			ReactModule.useEffect(function()
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
		[ReactModule.Event.Activated] = if FFlagLuaAppVideoTileDisableActivation and Image.disableActivation then nil elseif FFlagLuaAppEdpMediaGalleryFullScreen then UseResult3 else nil,
		Selectable = false
	}, {
		Corner = if Image.cornerRadius then ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, Image.cornerRadius) }) else nil,
		Video = ReactModule.createElement(LoadableVideoFrameModule, {
			video = Image.video,
			accessContext = if FFlagLuaAppHomeMomentVideoFallback then Image.accessContext else nil,
			edits = if FFlagLuaAppVideoPlayerTrimAndMusic then v1 else nil,
			thumbnail = Image.thumbnail,
			thumbnailComponentOverride = if FFlagLuaAppSduiVideoThumbnail then Image.thumbnailComponentOverride else nil,
			shouldStartPlayback = Image.shouldStartPlayback and (not FFlagLuaAppVideoPlayerTrimAndMusic or v2),
			muted = UseStateResult1,
			looped = Image.looped,
			ScaleType = Image.ScaleType,
			cornerRadius = Image.cornerRadius,
			onVideoLoaded = UseResult,
			onVideoLooped = Image.onVideoLooped,
			onVideoEnded = if FFlagLuaAppEdpMediaGalleryAutoAdvance then Image.onVideoEnded else nil,
			onVideoLoadFailed = if FFlagLuaAppVideoLoadFailureFallback then UseResult1 else nil,
			ref = if FFlagLuaAppEdpMediaGalleryAutoAdvance or FFlagLuaAppEdpMediaGalleryFullScreen or FFlagLuaAppEdpConsoleMediaGalleryVideo or FFlagLuaAppEnableHomepageOneByTwoTile then UseRefResult1 else nil
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