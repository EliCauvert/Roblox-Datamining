local runService = game:GetService("RunService")
local parent = script:FindFirstAncestor("VideoUtils").Parent
local loggingProtocolModule = require(parent.LoggingProtocol)
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local _ = require(parent.AppCommonLib)
local loadableVideoFrameModule = require(script.Parent.LoadableVideoFrame)
local roundIconButtonModule = require(script.Parent.RoundIconButton)
local videoActions = require(script.Parent.Analytics.Enums).VideoActions
local _ = require(script.Parent.Analytics.VideoAnalyticsTypes)
local videoLoggerModule = require(script.Parent.Analytics.VideoLogger)
local videoPlayerBottomOverlayModule = require(script.Parent.VideoPlayerBottomOverlay)
local reportWarning = require(parent.DiscoveryAnalytics).Points.reportWarning
local fFlagLuaAppEdpMediaGalleryAutoAdvance = require(parent.SharedFlags).FFlagLuaAppEdpMediaGalleryAutoAdvance
local fFlagLuaAppEdpMediaGalleryFullScreen = require(parent.SharedFlags).FFlagLuaAppEdpMediaGalleryFullScreen
local fFlagLuaAppVideoTileDisableActivation = require(parent.SharedFlags).FFlagLuaAppVideoTileDisableActivation
local fFlagLuaAppVideoTileHideCenterPlayButton = require(parent.SharedFlags).FFlagLuaAppVideoTileHideCenterPlayButton
local fFlagLuaAppEdpConsoleMediaGalleryVideo = require(parent.SharedFlags).FFlagLuaAppEdpConsoleMediaGalleryVideo
local fFlagLuaAppEnableHomepageOneByTwoTile = require(parent.SharedFlags).FFlagLuaAppEnableHomepageOneByTwoTile
local fFlagLuaAppSduiVideoThumbnail = require(parent.SharedFlags).FFlagLuaAppSduiVideoThumbnail
local var1 = game:DefineFastInt("VideoPlayerPlaybackEndThresholdInMs", 100) / 1000

return function(p1)
	-- upvalues: fFlagLuaAppEdpMediaGalleryFullScreen (ref), reactModule (ref), fFlagLuaAppEdpMediaGalleryAutoAdvance (ref), fFlagLuaAppEdpConsoleMediaGalleryVideo (ref), fFlagLuaAppEnableHomepageOneByTwoTile (ref), runService (ref), reportWarning (ref), loggingProtocolModule (ref), videoLoggerModule (ref), var1 (ref), responsiveModule (ref), videoActions (ref), fFlagLuaAppVideoTileDisableActivation (ref), loadableVideoFrameModule (ref), fFlagLuaAppSduiVideoThumbnail (ref), fFlagLuaAppVideoTileHideCenterPlayButton (ref), roundIconButtonModule (ref), videoPlayerBottomOverlayModule (ref)
	local showMuteButton = p1.showMuteButton or fFlagLuaAppEdpMediaGalleryFullScreen and (p1.showPlayButton or p1.showProgressBar)
	local var2, var3 = reactModule.useState(false)
	local var4, var5 = reactModule.useState(p1.muted)
	local var6 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var3 (ref), p1 (ref)
		var3(true)
		
		if p1.onVideoLoaded then
			p1.onVideoLoaded(p2, p3)
		end
	end, { p1.onVideoLoaded })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var4 (ref)
		if p1.onMutedChanged then
			p1.onMutedChanged(var4)
		end
	end, { p1.onMutedChanged, var4 })
	local var7 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), p1 (ref)
		var5(function(p2)
			-- upvalues: p1 (copy)
			if p1.onMuteButtonActivated then
				p1.onMuteButtonActivated(p2)
			end
			return not p2
		end)
	end, { p1.onMuteButtonActivated })
	local var8 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), var4 (ref), var7 (ref)
		return if p1.showMuteButton then { muted = var4, onMuteButtonActivated = var7 } else nil
	end, { p1.showMuteButton, var4, var7 })
	local var9 = if fFlagLuaAppEdpMediaGalleryAutoAdvance or fFlagLuaAppEdpMediaGalleryFullScreen or (fFlagLuaAppEdpConsoleMediaGalleryVideo or fFlagLuaAppEnableHomepageOneByTwoTile) then reactModule.useRef(nil) else nil
	local var10 = nil
	local var11 = nil
	
	if fFlagLuaAppEdpMediaGalleryFullScreen then
		local var12, var13 = reactModule.useBinding(0)
		var10 = var12
		var11 = var13
	end
	if fFlagLuaAppEdpMediaGalleryAutoAdvance or fFlagLuaAppEdpMediaGalleryFullScreen then
		reactModule.useEffect(function()
			-- upvalues: var9 (write), p1 (ref), fFlagLuaAppEdpMediaGalleryAutoAdvance (copy), fFlagLuaAppEdpMediaGalleryFullScreen (copy), runService (copy), var11 (write)
			local current = var9.current
			
			if p1.shouldStartPlayback and (fFlagLuaAppEdpMediaGalleryAutoAdvance and p1.onVideoProgressChanged or fFlagLuaAppEdpMediaGalleryFullScreen and p1.showProgressBar) and current then
				local renderSteppedConnection = runService.RenderStepped:Connect(function()
					-- upvalues: fFlagLuaAppEdpMediaGalleryAutoAdvance (copy), p1 (copy), current (ref), fFlagLuaAppEdpMediaGalleryFullScreen (copy), var11 (copy)
					if fFlagLuaAppEdpMediaGalleryAutoAdvance and p1.onVideoProgressChanged then
						p1.onVideoProgressChanged(if current.TimeLength > 0 then current.TimePosition / current.TimeLength else 0)
					end
					if fFlagLuaAppEdpMediaGalleryFullScreen and p1.showProgressBar then
						var11(if current.TimeLength > 0 then current.TimePosition / current.TimeLength else 0)
					end
				end)
				
				return function()
					-- upvalues: renderSteppedConnection (ref), fFlagLuaAppEdpMediaGalleryAutoAdvance (copy), p1 (copy), fFlagLuaAppEdpMediaGalleryFullScreen (copy), var11 (copy)
					renderSteppedConnection:Disconnect()
					
					if fFlagLuaAppEdpMediaGalleryAutoAdvance and p1.onVideoProgressChanged then
						p1.onVideoProgressChanged(0)
					end
					if fFlagLuaAppEdpMediaGalleryFullScreen and p1.showProgressBar then
						var11(0)
					end
				end
			end
			return nil
		end, {
			p1.shouldStartPlayback,
			if fFlagLuaAppEdpMediaGalleryAutoAdvance then p1.onVideoProgressChanged else nil,
			if fFlagLuaAppEdpMediaGalleryFullScreen then p1.showProgressBar else nil
		})
	end
	if fFlagLuaAppEnableHomepageOneByTwoTile then
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), var9 (write)
			local onAspectRatioChanged = p1.onAspectRatioChanged
			local current = var9 and var9.current
			
			if not onAspectRatioChanged or not current then return end
			local var14 = nil
			local var15 = current:GetPropertyChangedSignal("Resolution"):Connect(function()
				-- upvalues: current (ref), var14 (write), onAspectRatioChanged (ref)
				local resolution = current.Resolution
				
				if resolution.X > 0 and resolution.Y > 0 then
					local var16 = resolution.X / resolution.Y
					
					if var16 ~= var14 then
						var14 = var16
						onAspectRatioChanged(var16)
					end
				end
			end)
			local resolution = current.Resolution
			
			if resolution.X > 0 and resolution.Y > 0 then
				local var16 = resolution.X / resolution.Y
				
				if var16 ~= var14 then
					var14 = var16
					onAspectRatioChanged(var16)
				end
			end
			return function()
				-- upvalues: var15 (ref)
				var15:Disconnect()
			end
		end, { p1.onAspectRatioChanged })
	end
	local var14 = nil
	local _ = nil
	local var15 = nil
	local var16 = nil
	local var17 = nil
	local var18 = nil
	local var19 = nil
	
	if fFlagLuaAppEdpMediaGalleryFullScreen or fFlagLuaAppEdpConsoleMediaGalleryVideo then
		local var20, var21 = reactModule.useState(false)
		var14 = var20
		local var22 = var21
		local var23 = reactModule.useCallback(function(p2)
			-- upvalues: var9 (write), reportWarning (copy), loggingProtocolModule (copy), p1 (ref), videoLoggerModule (copy)
			local current = var9.current
			
			if not current then
				reportWarning(loggingProtocolModule.default, "EventLogging", "reportVideoAction requires a valid videoFrame")
				
				return
			end
			local source = nil
			local sourceId = nil
			local playbackSessionId = nil
			
			if p1.videoAnalyticsContext then
				source = p1.videoAnalyticsContext.videoAnalyticsData.source
				sourceId = p1.videoAnalyticsContext.videoAnalyticsData.sourceId
				playbackSessionId = p1.videoAnalyticsContext.getPlaybackSessionId()
				
				if not source or not sourceId or not playbackSessionId then
					reportWarning(loggingProtocolModule.default, "EventLogging", `reportVideoAction requires a valid {if not source then "source " else ""}{if not sourceId then "sourceId " else ""}{if not playbackSessionId then "playbackSessionId" else ""}`)
				end
			end
			videoLoggerModule.reportVideoAction(p2, nil, {
				isVisible = true,
				videoAssetId = p1.video,
				source = source or "",
				sourceId = sourceId or "",
				playbackSessionId = playbackSessionId or "",
				videoAssetDuration = current.TimeLength,
				isAudible = current.Volume ~= 0,
				volumeLevel = if current.Volume == 0 then 0 else 1
			})
		end, { p1.video, p1.videoAnalyticsContext })
		var15 = reactModule.useCallback(function()
			-- upvalues: var9 (write), var14 (write), var1 (copy)
			local current = var9.current
			
			if not current then return end
			if var14 then
				current:Pause()
				
				return
			elseif math.abs(current.TimePosition - current.TimeLength) <= var1 then
				current.TimePosition = 0
			end
			current:Play()
		end, { var14 })
		var19 = responsiveModule.usePreferredInput() == responsiveModule.Input.Directional
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), var15 (write), var7 (ref)
			local t = {}
			
			if p1.toggleVideoPlaybackSignal then
				table.insert(t, p1.toggleVideoPlaybackSignal:connect(var15))
			end
			if p1.toggleMuteSignal then
				table.insert(t, p1.toggleMuteSignal:connect(var7))
			end
			return function()
				-- upvalues: t (ref)
				for i, v in t do
					if v then
						v:disconnect()
					end
				end
			end
		end, {
			p1.toggleVideoPlaybackSignal,
			p1.toggleMuteSignal,
			var15,
			var7
		})
		var16 = reactModule.useCallback(function()
			-- upvalues: p1 (ref), var15 (write)
			if p1.onVideoPlayerActivated then
				p1.onVideoPlayerActivated()
				
				return
			end
			var15()
		end, { p1.onVideoPlayerActivated, var15 })
		var17 = reactModule.useMemo(function()
			-- upvalues: p1 (ref), var14 (write), var15 (write)
			return if p1.showPlayButton then { isVideoPlaying = var14, onPlayButtonActivated = var15 } else nil
		end, { p1.showPlayButton, var14, var15 })
		var18 = reactModule.useMemo(function()
			-- upvalues: p1 (ref), var10 (write)
			return if p1.showProgressBar then { progressBinding = var10 } else nil
		end, { p1.showProgressBar, var10 })
		reactModule.useEffect(function()
			-- upvalues: var9 (write), p1 (ref), var22 (write), var23 (ref), videoActions (copy)
			local current = var9.current
			
			if p1.shouldStartPlayback and current then
				local playedConnection = current.Played:Connect(function()
					-- upvalues: var22 (copy), var23 (copy), videoActions (copy)
					var22(true)
					var23(videoActions.play)
				end)
				local pausedConnection = current.Paused:Connect(function()
					-- upvalues: var22 (copy), var23 (copy), videoActions (copy)
					var22(false)
					var23(videoActions.pause)
				end)
				local endedConnection = current.Ended:Connect(function()
					-- upvalues: var22 (copy)
					var22(false)
				end)
				
				return function()
					-- upvalues: playedConnection (ref), pausedConnection (ref), endedConnection (ref)
					playedConnection:Disconnect()
					pausedConnection:Disconnect()
					endedConnection:Disconnect()
				end
			end
			return nil
		end, { p1.shouldStartPlayback, var23 })
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), var3 (ref), var22 (write)
			if not p1.shouldStartPlayback then
				var3(false)
				var22(false)
			end
			return nil
		end, { p1.shouldStartPlayback })
	end
	return reactModule.createElement(if fFlagLuaAppVideoTileDisableActivation and p1.disableActivation then "Frame" elseif fFlagLuaAppEdpMediaGalleryFullScreen then "TextButton" else "Frame", {
		Size = p1.Size,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		ZIndex = p1.ZIndex,
		Text = if fFlagLuaAppVideoTileDisableActivation and p1.disableActivation then nil elseif fFlagLuaAppEdpMediaGalleryFullScreen then "" else nil,
		[reactModule.Event.Activated] = if fFlagLuaAppVideoTileDisableActivation and p1.disableActivation then nil elseif fFlagLuaAppEdpMediaGalleryFullScreen then var16 else nil,
		Selectable = false
	}, {
		Corner = if p1.cornerRadius then reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p1.cornerRadius) }) else nil,
		Video = reactModule.createElement(loadableVideoFrameModule, {
			video = p1.video,
			thumbnail = p1.thumbnail,
			thumbnailComponentOverride = if fFlagLuaAppSduiVideoThumbnail then p1.thumbnailComponentOverride else nil,
			shouldStartPlayback = p1.shouldStartPlayback,
			muted = var4,
			looped = p1.looped,
			ScaleType = p1.ScaleType,
			cornerRadius = p1.cornerRadius,
			onVideoLoaded = var6,
			onVideoLooped = p1.onVideoLooped,
			onVideoEnded = if fFlagLuaAppEdpMediaGalleryAutoAdvance then p1.onVideoEnded else nil,
			ref = if fFlagLuaAppEdpMediaGalleryAutoAdvance or fFlagLuaAppEdpMediaGalleryFullScreen or (fFlagLuaAppEdpConsoleMediaGalleryVideo or fFlagLuaAppEnableHomepageOneByTwoTile) then var9 else nil
		}),
		PlayButton = if (fFlagLuaAppVideoTileHideCenterPlayButton or fFlagLuaAppEnableHomepageOneByTwoTile) and p1.hideCenterPlayButton then nil elseif fFlagLuaAppEdpMediaGalleryFullScreen and var2 and not var14 then reactModule.createElement(roundIconButtonModule, {
			icon = "play-large",
			ZIndex = 2,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Selectable = if var19 then false else nil,
			onActivated = var15
		}) else nil,
		BottomOverlay = if showMuteButton then reactModule.createElement(videoPlayerBottomOverlayModule, {
			ZIndex = 10,
			cornerRadius = p1.cornerRadius,
			videoLoaded = var2,
			muteButtonConfig = var8,
			playButtonConfig = if fFlagLuaAppEdpMediaGalleryFullScreen then var17 else nil,
			progressBarConfig = if fFlagLuaAppEdpMediaGalleryFullScreen then var18 else nil
		}) else nil
	})
end