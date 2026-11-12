local GameJoinCard = script:FindFirstAncestor("GameJoinCard")
local Parent = GameJoinCard.Parent
local HttpService = game:GetService("HttpService")
local ReactModule = require(Parent.React)
local UseNavigationFocusFunction = require(Parent.Navigation).useNavigationFocus
local VideoUtilsModule = require(Parent.VideoUtils)
local VideoLogger = VideoUtilsModule.VideoLogger
local VideoPlaybackCoordinator = VideoUtilsModule.VideoPlaybackCoordinator
local VideoActions = VideoUtilsModule.AnalyticsEnums.VideoActions
local VideoEndReason = VideoUtilsModule.AnalyticsEnums.VideoEndReason
local UseAppLifecycleCallbacksModule = require(GameJoinCard.Hooks.useAppLifecycleCallbacks)
local _ = require(script.Parent.JoinCardBannerVideoView)

return function(p1)
	-- upvalues: UseNavigationFocusFunction (copy), ReactModule (copy), VideoPlaybackCoordinator (copy), VideoEndReason (copy), UseAppLifecycleCallbacksModule (copy), HttpService (copy), VideoLogger (copy), VideoActions (copy)
	local UseNavigationFocusResult = UseNavigationFocusFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local VideoPlaybackCoordinator1 = if p1.videoPlaybackContext then p1.videoPlaybackContext.videoPlaybackCoordinator else VideoPlaybackCoordinator.default
	local ViewportVideoAutoplayController = if p1.videoPlaybackContext then p1.videoPlaybackContext.viewportVideoAutoplayController else nil
	local Text = "game_join_card_banner_video_" .. p1.videoId
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(function(): boolean
		-- upvalues: VideoPlaybackCoordinator1 (copy), Text (copy)
		return VideoPlaybackCoordinator1.playingVideoKey == Text
	end)
	local UseStateResult1_1 = UseNavigationFocusResult and UseStateResult1
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2_1 (copy), Text (copy), VideoPlaybackCoordinator1 (copy)
		local ChangedConnection = VideoPlaybackCoordinator1.changed:connect(function(PlayingVideoKey)
			-- upvalues: UseStateResult2_1 (upval), Text (upval)
			UseStateResult2_1(PlayingVideoKey == Text)
		end)
		UseStateResult2_1(VideoPlaybackCoordinator1.playingVideoKey == Text)
		
		return function()
			-- upvalues: ChangedConnection (copy)
			ChangedConnection:disconnect()
		end
	end, { VideoPlaybackCoordinator1, Text })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: VideoPlaybackCoordinator1 (copy), Text (copy), VideoEndReason (upval)
		if VideoPlaybackCoordinator1.playingVideoKey ~= Text then
			VideoPlaybackCoordinator1:reset(VideoEndReason.OverlayTakeover)
			VideoPlaybackCoordinator1:requestPlayback(Text, false, 0)
			
			return
		end
	end, { VideoPlaybackCoordinator1, Text })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: VideoPlaybackCoordinator1 (copy), Text (copy), VideoEndReason (upval)
		VideoPlaybackCoordinator1:cancelPlayback(Text, VideoEndReason.AppBackgrounded)
	end, { VideoPlaybackCoordinator1, Text })
	ReactModule.useEffect(function()
		-- upvalues: UseNavigationFocusResult (copy), UseResult (copy), VideoPlaybackCoordinator1 (copy), Text (copy), VideoEndReason (upval)
		if UseNavigationFocusResult then
			UseResult()
			local DeferredThread = nil
			local ChangedConnection = VideoPlaybackCoordinator1.changed:connect(function(PlayingVideoKey)
				-- upvalues: Text (upval), DeferredThread (ref), VideoPlaybackCoordinator1 (upval), UseResult (upval)
				if PlayingVideoKey ~= nil and PlayingVideoKey ~= Text and DeferredThread == nil then
					DeferredThread = task.defer(function()
						-- upvalues: DeferredThread (upval), VideoPlaybackCoordinator1 (upval), Text (upval), UseResult (upval)
						DeferredThread = nil
						local PlayingVideoKey = VideoPlaybackCoordinator1.playingVideoKey
						
						if PlayingVideoKey ~= nil and PlayingVideoKey ~= Text then
							UseResult()
						end
					end)
					
					return
				end
			end)
			
			return function()
				-- upvalues: ChangedConnection (copy), DeferredThread (ref), VideoPlaybackCoordinator1 (upval), Text (upval), VideoEndReason (upval)
				ChangedConnection:disconnect()
				
				if DeferredThread ~= nil then
					task.cancel(DeferredThread)
				end
				VideoPlaybackCoordinator1:cancelPlayback(Text, VideoEndReason.OverlayTakeover)
			end
		else
			return nil
		end
	end, {
		VideoPlaybackCoordinator1,
		Text,
		UseNavigationFocusResult,
		UseResult
	})
	UseAppLifecycleCallbacksModule(if UseNavigationFocusResult then UseResult1 else nil, if UseNavigationFocusResult then UseResult else nil)
	ReactModule.useEffect(function()
		-- upvalues: ViewportVideoAutoplayController (copy)
		return if ViewportVideoAutoplayController == nil then nil else function()
			-- upvalues: ViewportVideoAutoplayController (upval)
			ViewportVideoAutoplayController:reset("gameJoinCardClosed")
			ViewportVideoAutoplayController:forceScheduleInitialWinnerUpdate()
		end
	end, { ViewportVideoAutoplayController })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: HttpService (upval)
		return HttpService:GenerateGUID(false)
	end, { p1.videoId, UseStateResult1_1 })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, { p1.videoId, UseStateResult1_1 })
	
	return {
		video = `rbxassetid://{p1.videoId}`,
		shouldStartPlayback = UseStateResult1_1,
		isVisible = UseStateResult1_1 and UseStateResult,
		Size = p1.Size,
		cornerRadius = p1.cornerRadius,
		ZIndex = p1.ZIndex,
		onActivated = p1.onActivated,
		videoAnalyticsContext = ReactModule.useMemo(function()
			-- upvalues: p1 (copy), UseMemoResult (copy)
			return {
				videoAnalyticsData = { source = "GameJoinCard", sourceId = p1.universeId },
				getPlaybackSessionId = function()
					-- upvalues: UseMemoResult (upval)
					return UseMemoResult
				end
			}
		end, { p1.universeId, UseMemoResult }),
		onVideoLoaded = ReactModule.useCallback(function(VideoAssetDuration, LoadTime)
			-- upvalues: UseStateResult2 (copy), VideoLogger (upval), VideoActions (upval), p1 (copy), UseMemoResult (copy)
			UseStateResult2(true)
			VideoLogger.reportVideoAction(VideoActions.load, "GameJoinCard", {
				source = "GameJoinCard",
				isVisible = true,
				isAudible = false,
				volumeLevel = 0,
				videoAssetId = p1.videoId,
				sourceId = p1.universeId,
				playbackSessionId = UseMemoResult,
				videoAssetDuration = VideoAssetDuration
			}, { loadTime = LoadTime })
		end, { p1.videoId, p1.universeId, UseMemoResult })
	}
end