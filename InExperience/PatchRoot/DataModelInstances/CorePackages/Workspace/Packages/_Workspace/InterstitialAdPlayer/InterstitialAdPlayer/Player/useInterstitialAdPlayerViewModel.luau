local InterstitialAdPlayer = script:FindFirstAncestor("InterstitialAdPlayer")
local Parent = InterstitialAdPlayer.Parent
local VideoPlayerModule = require(Parent.VideoPlayer)
local ReactModule = require(Parent.React)
local AdSessionModule = require(InterstitialAdPlayer.AdSession)
local _ = require(InterstitialAdPlayer.Environment)
local _ = require(InterstitialAdPlayer.Player.InterstitialAdPlayerView)
local _ = require(InterstitialAdPlayer.types)
local UseIconFontLoadedModule = require(InterstitialAdPlayer.Components.useIconFontLoaded)

local function _(p1)
	return p1
end

local function sameView(List, ViewResult): boolean
	for i, value in List do
		if ViewResult[i] ~= value then
			return false
		end
	end
	for i1, value1 in ViewResult do
		if List[i1] ~= value1 then
			return false
		end
	end
	return true
end

return function(p1)
	-- upvalues: ReactModule (copy), AdSessionModule (copy), sameView (copy), UseIconFontLoadedModule (copy), VideoPlayerModule (copy)
	local Host = p1.host
	local Environment = p1.environment
	local Config = Host.config
	local UseRefResult = ReactModule.useRef(nil)
	
	if UseRefResult.current == nil then
		UseRefResult.current = AdSessionModule.new(Config)
	end
	local Current = UseRefResult.current
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult11 = ReactModule.useRef(Vector2.zero)
	local UseRefResult2 = ReactModule.useRef(Vector2.zero)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: Current (copy)
		return Current:view()
	end)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(1.7777777777777777)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local UseResult = ReactModule.useCallback(function(List)
		-- upvalues: Environment (copy), Config (copy), Host (copy), UseBindingResult2 (copy), Current (copy), UseBindingResult2_1 (copy), UseStateResult2 (copy), sameView (upval)
		for _, value in List do
			if value.kind == "Measure" then
				local Success, Result = pcall(function()
					-- upvalues: Environment (upval), value (copy), Config (upval), Host (upval)
					Environment.sink(value.event, Config, Host.experience)
				end)
				
				if not Success then
					warn(`InterstitialAdPlayer: couldn't send {value.event.name}: {Result}`)
				end
			elseif value.kind == "Result" then
				Host.reportResult(value.result, value.watchedSeconds)
			elseif value.kind == "ReadyToEnter" then
				Host.reportReadyToEnter()
			elseif value.kind == "CloseBrowser" then
				Environment.closeBrowser()
			end
		end
		UseBindingResult2(Current:progress())
		UseBindingResult2_1(Current:enterFadeProgress())
		local ViewResult = Current:view()
		UseStateResult2(function(p2)
			-- upvalues: sameView (upval), ViewResult (copy)
			return if sameView(p2, ViewResult) then p2 else ViewResult
		end)
	end, {
		Current, Config, Host.experience, Environment.sink, Environment.closeBrowser,
		Host.reportResult, Host.reportReadyToEnter
	})
	ReactModule.useEffect(function()
		-- upvalues: Environment (copy), UseRefResult1 (copy), UseResult (copy), Current (copy), UseRefResult2 (copy), UseRefResult11 (copy), Host (copy)
		local Connections = {
			Environment.heartbeat:Connect(function(Dt)
				-- upvalues: UseRefResult1 (upval), UseResult (upval), Current (upval), Environment (upval), UseRefResult2 (upval), UseRefResult11 (upval)
				local CurrentFunction = UseRefResult1.current
				local CurrentResult = if CurrentFunction then CurrentFunction() else nil
				UseResult(Current:advance({
					dt = Dt,
					position = if CurrentResult then CurrentResult.playbackPositionMs / 1000 else 0,
					length = if CurrentResult and CurrentResult.videoLengthMs then CurrentResult.videoLengthMs / 1000 else 0,
					audioLevel = if CurrentResult then CurrentResult.audioLevel else 0,
					nowMs = Environment.nowMs(),
					screenSize = UseRefResult2.current,
					adSize = UseRefResult11.current
				}))
			end),
			Environment.inputBegan:Connect(function(Input, p2)
				-- upvalues: Current (upval), UseResult (upval), Environment (upval)
				if Input.KeyCode == Enum.KeyCode.Escape then
					if not p2 or Current.overlay ~= "ReportAd" then
						UseResult(Current:back("Device"))
						
						return
					end
				elseif Input.KeyCode == Enum.KeyCode.ButtonB then
					if not Environment.isTypingText() then
						UseResult(Current:back("Device"))
						
						return
					end
				elseif Input.KeyCode == Enum.KeyCode.Space and not p2 then
					UseResult(Current:togglePause())
				end
			end),
			Environment.leaveRequested:Connect(function()
				-- upvalues: UseResult (upval), Current (upval)
				UseResult(Current:back("Device"))
			end)
		}
		local SubscribeVisibilityResult = Host.subscribeVisibility(function(p2)
			-- upvalues: UseResult (upval), Current (upval), Environment (upval)
			UseResult(Current:setVisible(p2, Environment.nowMs()))
		end)
		
		return function()
			-- upvalues: SubscribeVisibilityResult (copy), Connections (copy)
			SubscribeVisibilityResult()
			
			for _, connection in Connections do
				connection:Disconnect()
			end
		end
	end, {
		UseResult, Current, Environment.heartbeat, Environment.nowMs,
		Environment.inputBegan, Environment.isTypingText, Environment.leaveRequested,
		Host.subscribeVisibility
	})
	
	return {
		view = UseStateResult,
		progress = UseBindingResult,
		enterFade = UseBindingResult1,
		videoAspect = UseStateResult1,
		videoSize = UseStateResult3,
		controlsVisible = UseIconFontLoadedModule(Environment.preloadFonts),
		advertiserLogo = Config.advertiserLogo,
		ctaButtonType = Config.ctaButtonType,
		advertiserName = Config.advertiserName or "",
		payerName = Config.payerName or "",
		learnMoreUrl = Environment.learnMoreUrl,
		reportAbuse = function(p2, p3)
			-- upvalues: Environment (copy), Config (copy), Host (copy)
			return Environment.reportAd(Config, Host.userId, p2, p3)
		end,
		illegalContentReportingUrl = ReactModule.useMemo(function()
			-- upvalues: Environment (copy), Config (copy), Host (copy)
			return Environment.illegalContentReportingUrl(Config.creativeAssetId, Host.userId)
		end, {
			Environment.illegalContentReportingUrl,
			Config.creativeAssetId,
			Host.userId,
			UseStateResult.overlay == "ReportAd"
		}),
		video = {
			Component = Environment.VideoDisplay,
			content = Config.video,
			shouldPlay = UseStateResult.isActive and not UseStateResult.isHeld,
			muted = UseStateResult.muted,
			playbackStateRef = UseRefResult1,
			onLoadingStateChanged = function(Failed)
				-- upvalues: VideoPlayerModule (upval), UseResult (copy), Current (copy)
				if Failed == VideoPlayerModule.VideoLoadingState.Loaded then
					UseResult(Current:videoLoaded())
					
					return
				end
				if Failed == VideoPlayerModule.VideoLoadingState.Failed then
					UseResult(Current:videoFailed())
				end
			end,
			onVideoEnded = function()
				-- upvalues: UseResult (copy), Current (copy)
				UseResult(Current:videoEnded())
			end,
			onAspectRatioChanged = function(p2: number)
				-- upvalues: UseStateResult2_1 (copy), Current (copy), Host (copy)
				UseStateResult2_1(p2)
				
				if Current:isActive() then
					Host.requestScreenOrientation(if p2 > 1 then "Landscape" else "Portrait")
				end
			end
		},
		onScreenSize = function(Frame)
			-- upvalues: UseRefResult2 (copy)
			UseRefResult2.current = Frame.AbsoluteSize
		end,
		onVideoSize = function(Frame: Frame)
			-- upvalues: UseRefResult11 (copy), UseStateResult2_2 (copy)
			UseRefResult11.current = Frame.AbsoluteSize
			UseStateResult2_2(Frame.AbsoluteSize)
		end,
		onTogglePause = function()
			-- upvalues: UseResult (copy), Current (copy)
			UseResult(Current:togglePause())
		end,
		onToggleMute = function()
			-- upvalues: UseResult (copy), Current (copy)
			UseResult(Current:toggleMute())
		end,
		onToggleMenu = function()
			-- upvalues: UseResult (copy), Current (copy)
			UseResult(if Current.overlay == "Menu" then Current:closeOverlay() else Current:openOverlay("Menu"))
		end,
		onOpenOverlay = function(p2)
			-- upvalues: UseResult (copy), Current (copy)
			UseResult(Current:openOverlay(p2))
		end,
		onClickOut = function()
			-- upvalues: Current (copy), Environment (copy), Config (copy), UseResult (copy)
			if not Current:canOpenOverlay("Browser") then return end
			if Environment.openBrowser(Config.clickThroughUrl, function()
				-- upvalues: Current (upval), UseResult (upval)
				if Current.overlay == "Browser" then
					UseResult(Current:closeOverlay())
				end
			end) then
				UseResult(Current:openOverlay("Browser"))
			end
		end,
		onCloseOverlay = function()
			-- upvalues: UseResult (copy), Current (copy)
			UseResult(Current:closeOverlay())
		end,
		onSkip = function()
			-- upvalues: UseResult (copy), Current (copy)
			UseResult(Current:skip())
		end,
		onBack = function()
			-- upvalues: UseResult (copy), Current (copy)
			UseResult(Current:back("Button"))
		end,
		onOpenExternally = Environment.openExternally
	}
end