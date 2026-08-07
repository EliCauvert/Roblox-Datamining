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
local var8 = game:DefineFastInt("VideoPlayerPlaybackEndThresholdInMs", 100) / 1000

return function(p0) --[[ line: 81 | named "VideoPlayer" ]]
	-- upvalues: fFlagLuaAppEdpMediaGalleryFullScreen (ref), reactModule (ref), fFlagLuaAppEdpMediaGalleryAutoAdvance (ref), fFlagLuaAppEdpConsoleMediaGalleryVideo (ref), fFlagLuaAppEnableHomepageOneByTwoTile (ref), runService (ref), reportWarning (ref), loggingProtocolModule (ref), videoLoggerModule (ref), var8 (ref), responsiveModule (ref), videoActions (ref), fFlagLuaAppVideoTileDisableActivation (ref), loadableVideoFrameModule (ref), fFlagLuaAppVideoTileHideCenterPlayButton (ref), roundIconButtonModule (ref), videoPlayerBottomOverlayModule (ref)
	local showMuteButton = p0.showMuteButton or fFlagLuaAppEdpMediaGalleryFullScreen and (p0.showPlayButton or p0.showProgressBar)
	local var10, var11 = reactModule.useState(false)
	local var12, var13 = reactModule.useState(p0.muted)
	local var14 = reactModule.useCallback(function(p1, p2) --[[ line: 89 ]]
		-- upvalues: var11 (ref), p0 (ref)
		var11(true)
		
		if p0.onVideoLoaded then
			p0.onVideoLoaded(p1, p2)
		end
	end, { p0.onVideoLoaded })
	reactModule.useEffect(function() --[[ line: 97 ]]
		-- upvalues: p0 (ref), var12 (ref)
		if p0.onMutedChanged then
			p0.onMutedChanged(var12)
		end
	end, { p0.onMutedChanged, var12 })
	local var15 = reactModule.useCallback(function() --[[ line: 103 ]]
		-- upvalues: var13 (ref), p0 (ref)
		var13(function(p3) --[[ line: 104 ]]
			-- upvalues: p0 (copy)
			if p0.onMuteButtonActivated then
				p0.onMuteButtonActivated(p3)
			end
			return not p3
		end)
	end, { p0.onMuteButtonActivated })
	local var16 = reactModule.useMemo(function() --[[ line: 112 ]]
		-- upvalues: p0 (ref), var12 (ref), var15 (ref)
		return if p0.showMuteButton then { muted = var12, onMuteButtonActivated = var15 } else nil
	end, { p0.showMuteButton, var12, var15 })
	local var17 = if fFlagLuaAppEdpMediaGalleryAutoAdvance or fFlagLuaAppEdpMediaGalleryFullScreen or (fFlagLuaAppEdpConsoleMediaGalleryVideo or fFlagLuaAppEnableHomepageOneByTwoTile) then reactModule.useRef(nil) else nil
	local var18 = nil
	local var19 = nil
	
	if fFlagLuaAppEdpMediaGalleryFullScreen then
		local var20, var21 = reactModule.useBinding(0)
		var18 = var20
		var19 = var21
	end
	if fFlagLuaAppEdpMediaGalleryAutoAdvance or fFlagLuaAppEdpMediaGalleryFullScreen then
		reactModule.useEffect(function() --[[ line: 139 ]]
			-- upvalues: var17 (write), p0 (ref), fFlagLuaAppEdpMediaGalleryAutoAdvance (copy), fFlagLuaAppEdpMediaGalleryFullScreen (copy), runService (copy), var19 (write)
			local current = var17.current
			
			if p0.shouldStartPlayback and (fFlagLuaAppEdpMediaGalleryAutoAdvance and p0.onVideoProgressChanged or fFlagLuaAppEdpMediaGalleryFullScreen and p0.showProgressBar) and current then
				local renderSteppedConnection = runService.RenderStepped:Connect(function() --[[ line: 147 ]]
					-- upvalues: fFlagLuaAppEdpMediaGalleryAutoAdvance (copy), p0 (copy), current (ref), fFlagLuaAppEdpMediaGalleryFullScreen (copy), var19 (copy)
					if fFlagLuaAppEdpMediaGalleryAutoAdvance and p0.onVideoProgressChanged then
						p0.onVideoProgressChanged(if current.TimeLength > 0 then current.TimePosition / current.TimeLength else 0)
					end
					if fFlagLuaAppEdpMediaGalleryFullScreen and p0.showProgressBar then
						var19(if current.TimeLength > 0 then current.TimePosition / current.TimeLength else 0)
					end
				end)
				
				return function() --[[ line: 161 ]]
					-- upvalues: renderSteppedConnection (ref), fFlagLuaAppEdpMediaGalleryAutoAdvance (copy), p0 (copy), fFlagLuaAppEdpMediaGalleryFullScreen (copy), var19 (copy)
					renderSteppedConnection:Disconnect()
					
					if fFlagLuaAppEdpMediaGalleryAutoAdvance and p0.onVideoProgressChanged then
						p0.onVideoProgressChanged(0)
					end
					if fFlagLuaAppEdpMediaGalleryFullScreen and p0.showProgressBar then
						var19(0)
					end
				end
			end
			return nil
		end, {
			p0.shouldStartPlayback,
			if fFlagLuaAppEdpMediaGalleryAutoAdvance then p0.onVideoProgressChanged else nil,
			if fFlagLuaAppEdpMediaGalleryFullScreen then p0.showProgressBar else nil
		})
	end
	if fFlagLuaAppEnableHomepageOneByTwoTile then
		reactModule.useEffect(function() --[[ line: 185 ]]
			-- upvalues: p0 (ref), var17 (write)
			local onAspectRatioChanged = p0.onAspectRatioChanged
			local current = var17 and var17.current
			
			if not onAspectRatioChanged or not current then return end
			local var34 = nil
			local var35 = current:GetPropertyChangedSignal("Resolution"):Connect(function() --[[ line: 193 | named "report" ]]
				-- upvalues: current (ref), var34 (write), onAspectRatioChanged (ref)
				local resolution = current.Resolution
				
				if resolution.X > 0 and resolution.Y > 0 then
					local var37 = resolution.X / resolution.Y
					
					if var37 ~= var34 then
						var34 = var37
						onAspectRatioChanged(var37)
					end
				end
			end)
			local resolution = current.Resolution
			
			if resolution.X > 0 and resolution.Y > 0 then
				local var36 = resolution.X / resolution.Y
				
				if var36 ~= var34 then
					var34 = var36
					onAspectRatioChanged(var36)
				end
			end
			return function() --[[ line: 207 ]]
				-- upvalues: var35 (ref)
				var35:Disconnect()
			end
		end, { p0.onAspectRatioChanged })
	end
	local var22 = nil
	local _ = nil
	local var23 = nil
	local var24 = nil
	local var25 = nil
	local var26 = nil
	local var27 = nil
	
	if fFlagLuaAppEdpMediaGalleryFullScreen or fFlagLuaAppEdpConsoleMediaGalleryVideo then
		local var28, var29 = reactModule.useState(false)
		var22 = var28
		local var30 = var29
		local var31 = reactModule.useCallback(function(p4) --[[ line: 223 ]]
			-- upvalues: var17 (write), reportWarning (copy), loggingProtocolModule (copy), p0 (ref), videoLoggerModule (copy)
			local current = var17.current
			
			if not current then
				reportWarning(loggingProtocolModule.default, "EventLogging", "reportVideoAction requires a valid videoFrame")
				
				return
			end
			local source = nil
			local sourceId = nil
			local playbackSessionId = nil
			
			if p0.videoAnalyticsContext then
				source = p0.videoAnalyticsContext.videoAnalyticsData.source
				sourceId = p0.videoAnalyticsContext.videoAnalyticsData.sourceId
				playbackSessionId = p0.videoAnalyticsContext.getPlaybackSessionId()
				
				if not source or not sourceId or not playbackSessionId then
					reportWarning(loggingProtocolModule.default, "EventLogging", `reportVideoAction requires a valid {if not source then "source " else ""}{if not sourceId then "sourceId " else ""}{if not playbackSessionId then "playbackSessionId" else ""}`)
				end
			end
			videoLoggerModule.reportVideoAction(p4, nil, {
				isVisible = true,
				videoAssetId = p0.video,
				source = source or "",
				sourceId = sourceId or "",
				playbackSessionId = playbackSessionId or "",
				videoAssetDuration = current.TimeLength,
				isAudible = current.Volume ~= 0,
				volumeLevel = if current.Volume == 0 then 0 else 1
			})
		end, { p0.video, p0.videoAnalyticsContext })
		var23 = reactModule.useCallback(function() --[[ line: 264 ]]
			-- upvalues: var17 (write), var22 (write), var8 (copy)
			local current = var17.current
			
			if not current then return end
			if var22 then
				current:Pause()
				
				return
			elseif math.abs(current.TimePosition - current.TimeLength) <= var8 then
				current.TimePosition = 0
			end
			current:Play()
		end, { var22 })
		var27 = responsiveModule.usePreferredInput() == responsiveModule.Input.Directional
		reactModule.useEffect(function() --[[ line: 284 ]]
			-- upvalues: p0 (ref), var23 (write), var15 (ref)
			local t = {}
			
			if p0.toggleVideoPlaybackSignal then
				table.insert(t, p0.toggleVideoPlaybackSignal:connect(var23))
			end
			if p0.toggleMuteSignal then
				table.insert(t, p0.toggleMuteSignal:connect(var15))
			end
			return function() --[[ line: 292 ]]
				-- upvalues: t (ref)
				for i, v in t do
					if v then
						v:disconnect()
					end
				end
			end
		end, {
			p0.toggleVideoPlaybackSignal,
			p0.toggleMuteSignal,
			var23,
			var15
		})
		var24 = reactModule.useCallback(function() --[[ line: 303 ]]
			-- upvalues: p0 (ref), var23 (write)
			if p0.onVideoPlayerActivated then
				p0.onVideoPlayerActivated()
				
				return
			end
			var23()
		end, { p0.onVideoPlayerActivated, var23 })
		var25 = reactModule.useMemo(function() --[[ line: 313 ]]
			-- upvalues: p0 (ref), var22 (write), var23 (write)
			return if p0.showPlayButton then { isVideoPlaying = var22, onPlayButtonActivated = var23 } else nil
		end, { p0.showPlayButton, var22, var23 })
		var26 = reactModule.useMemo(function() --[[ line: 322 ]]
			-- upvalues: p0 (ref), var18 (write)
			return if p0.showProgressBar then { progressBinding = var18 } else nil
		end, { p0.showProgressBar, var18 })
		reactModule.useEffect(function() --[[ line: 330 ]]
			-- upvalues: var17 (write), p0 (ref), var30 (write), var31 (ref), videoActions (copy)
			local current = var17.current
			
			if p0.shouldStartPlayback and current then
				local playedConnection = current.Played:Connect(function() --[[ line: 337 ]]
					-- upvalues: var30 (copy), var31 (copy), videoActions (copy)
					var30(true)
					var31(videoActions.play)
				end)
				local pausedConnection = current.Paused:Connect(function() --[[ line: 342 ]]
					-- upvalues: var30 (copy), var31 (copy), videoActions (copy)
					var30(false)
					var31(videoActions.pause)
				end)
				local endedConnection = current.Ended:Connect(function() --[[ line: 347 ]]
					-- upvalues: var30 (copy)
					var30(false)
				end)
				
				return function() --[[ line: 351 ]]
					-- upvalues: playedConnection (ref), pausedConnection (ref), endedConnection (ref)
					playedConnection:Disconnect()
					pausedConnection:Disconnect()
					endedConnection:Disconnect()
				end
			end
			return nil
		end, { p0.shouldStartPlayback, var31 })
		reactModule.useEffect(function() --[[ line: 359 ]]
			-- upvalues: p0 (ref), var11 (ref), var30 (write)
			if not p0.shouldStartPlayback then
				var11(false)
				var30(false)
			end
			return nil
		end, { p0.shouldStartPlayback })
	end
	return reactModule.createElement(if fFlagLuaAppVideoTileDisableActivation and p0.disableActivation then "Frame" elseif fFlagLuaAppEdpMediaGalleryFullScreen then "TextButton" else "Frame", {
		Size = p0.Size,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		ZIndex = p0.ZIndex,
		Text = if fFlagLuaAppVideoTileDisableActivation and p0.disableActivation then nil elseif fFlagLuaAppEdpMediaGalleryFullScreen then "" else nil,
		[reactModule.Event.Activated] = if fFlagLuaAppVideoTileDisableActivation and p0.disableActivation then nil elseif fFlagLuaAppEdpMediaGalleryFullScreen then var24 else nil,
		Selectable = false
	}, {
		Corner = if p0.cornerRadius then reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, p0.cornerRadius) }) else nil,
		Video = reactModule.createElement(loadableVideoFrameModule, {
			video = p0.video,
			thumbnail = p0.thumbnail,
			shouldStartPlayback = p0.shouldStartPlayback,
			muted = var12,
			looped = p0.looped,
			ScaleType = p0.ScaleType,
			cornerRadius = p0.cornerRadius,
			onVideoLoaded = var14,
			onVideoLooped = p0.onVideoLooped,
			onVideoEnded = if fFlagLuaAppEdpMediaGalleryAutoAdvance then p0.onVideoEnded else nil,
			ref = if fFlagLuaAppEdpMediaGalleryAutoAdvance or fFlagLuaAppEdpMediaGalleryFullScreen or (fFlagLuaAppEdpConsoleMediaGalleryVideo or fFlagLuaAppEnableHomepageOneByTwoTile) then var17 else nil
		}),
		PlayButton = if (fFlagLuaAppVideoTileHideCenterPlayButton or fFlagLuaAppEnableHomepageOneByTwoTile) and p0.hideCenterPlayButton then nil elseif fFlagLuaAppEdpMediaGalleryFullScreen and var10 and not var22 then reactModule.createElement(roundIconButtonModule, {
			icon = "play-large",
			ZIndex = 2,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Selectable = if var27 then false else nil,
			onActivated = var23
		}) else nil,
		BottomOverlay = if showMuteButton then reactModule.createElement(videoPlayerBottomOverlayModule, {
			ZIndex = 10,
			cornerRadius = p0.cornerRadius,
			videoLoaded = var10,
			muteButtonConfig = var16,
			playButtonConfig = if fFlagLuaAppEdpMediaGalleryFullScreen then var25 else nil,
			progressBarConfig = if fFlagLuaAppEdpMediaGalleryFullScreen then var26 else nil
		}) else nil
	})
end