local _ = require(script.Parent.types)
local Frozen = table.freeze({
	Completed = "Completed",
	Skipped = "Skipped",
	Failed = "Failed",
	Cancelled = "Cancelled"
})
local Frozen1 = table.freeze({
	LoadFailed = 401,
	LoadTimeout = 402,
	RenderTimeout = 405,
	PlaybackFailed = 400
})
local config = { Browser = true }
local Video_progresses = { 25, 50, 75 }
local AdSessionModule = {}
AdSessionModule.__index = AdSessionModule
AdSessionModule.Result = Frozen
AdSessionModule.StartTimeoutSeconds = 8
AdSessionModule.StallTimeoutSeconds = game:DefineFastInt("LuaAppInterstitialAdStallTimeoutMs", 8000) / 1000
AdSessionModule.MaxFrameSeconds = 1
AdSessionModule.JoiningServerSeconds = 3
AdSessionModule.JoiningServerAfterResumeSeconds = 3
AdSessionModule.ViewableSeconds = 2
AdSessionModule.EnterFadeSeconds = 0.6
AdSessionModule.MaxCarriedAdvanceSeconds = 0.1

function AdSessionModule.new(Config)
	-- upvalues: AdSessionModule (copy)
	return (setmetatable({
		config = Config,
		phase = "Loading",
		result = nil,
		loaded = false,
		shown = false,
		endedBeforeShown = false,
		position = 0,
		length = 0,
		carriedAdvance = 0,
		watchedSeconds = 0,
		loadingSeconds = 0,
		stalledSeconds = 0,
		userPaused = false,
		overlay = nil,
		muted = false,
		backgrounded = false,
		toggleCount = 0,
		joiningServerUntil = Config.joiningServerSeconds or AdSessionModule.JoiningServerSeconds,
		playSeconds = 0,
		audibleSeconds = 0,
		viewableRun = 0,
		viewableSent = false,
		quartilesSent = {},
		completeSent = false,
		backgroundCount = 0,
		backgroundSeconds = 0,
		backgroundedAtMs = nil,
		returnedAtMs = nil,
		clock = 0,
		loadedAt = nil,
		audioLevel = 0,
		maxAudioLevel = 0,
		audibleInViewSeconds = 0,
		fullScreenSeconds = 0,
		enterFade = nil,
		readySent = false
	}, AdSessionModule))
end

local function _(p1: number): number
	return (math.round(p1 * 1000))
end

function AdSessionModule:isActive(): boolean
	return self.phase == "Loading" or self.phase == "Playing"
end

local _ = function(p1)
	-- upvalues: config (copy)
	return p1.backgrounded or p1.overlay ~= nil and config[p1.overlay] == true
end

function AdSessionModule:isHeld()
	-- upvalues: config (copy)
	return self.userPaused or (self.backgrounded or self.overlay ~= nil and config[self.overlay] == true)
end

local _ = function(p1): boolean
	local ClickThroughUrl: string = p1.config.clickThroughUrl
	
	return ClickThroughUrl ~= nil and (string.match(ClickThroughUrl, "^https://") ~= nil and (string.find(ClickThroughUrl, "[<>]") == nil and #ClickThroughUrl <= 4096))
end

local _ = function(p1): number
	return if p1.length <= 0 then 0 else math.clamp(p1.position / p1.length * 100, 0, 100)
end

local function measure(p1, p2)
	local Fields = {
		video_progress = if p1.length <= 0 then 0 else math.clamp(p1.position / p1.length * 100, 0, 100),
		video_length_ms = math.round(p1.length * 1000),
		video_cumulative_playtime_ms = math.round(p1.playSeconds * 1000),
		cumulative_audio_playback_duration_ms = math.round(p1.audibleSeconds * 1000),
		background_count = p1.backgroundCount,
		cumulative_background_duration_ms = math.round(p1.backgroundSeconds * 1000),
		max_audio_level = p1.maxAudioLevel,
		cumulative_ad_full_screen_duration_ms = math.round(p1.fullScreenSeconds * 1000),
		dwell_duration_ms = if p1.loadedAt then math.round((p1.clock - p1.loadedAt) * 1000) else 0
	}
	local Fields1 = p2.fields
	
	if Fields1 then
		for i, value in Fields1 do
			Fields[i] = value
		end
	end
	return {
		kind = "Measure",
		event = { name = p2.name, fields = Fields }
	}
end

local _ = function(p3)
	-- upvalues: AdSessionModule (copy)
	p3.joiningServerUntil = p3.watchedSeconds + AdSessionModule.JoiningServerAfterResumeSeconds
end

local function finish(p3, Failed, Unload_reason, List)
	-- upvalues: Frozen (copy), measure (copy)
	if p3.result ~= nil then
		return {}
	end
	p3.result = Failed
	p3.phase = if Failed == Frozen.Cancelled then "Finished" else "Entering"
	local List1 = {}
	
	if p3.overlay == "Browser" then
		table.insert(List1, { kind = "CloseBrowser" })
	end
	p3.overlay = nil
	p3.userPaused = false
	
	if List then
		for _, value in List do
			table.insert(List1, value)
		end
	end
	if p3.loaded then
		local Rounded = math.round((if p3.length > 0 then math.min(p3.playSeconds, p3.length) else p3.playSeconds) * 1000)
		table.insert(List1, (measure(p3, {
			name = "ImmersiveAdUnload",
			fields = {
				is_viewability_measurable = true,
				unload_reason = Unload_reason,
				video_cumulative_playtime_ms = Rounded,
				cumulative_50_percent_in_view_duration_ms = Rounded
			}
		})))
	end
	table.insert(List1, {
		kind = "Result",
		result = Failed,
		watchedSeconds = p3.watchedSeconds
	})
	
	return List1
end

local function errorEvent(p4, Error_stage, PlaybackFailed, Error_message)
	-- upvalues: measure (copy)
	return (measure(p4, {
		name = "ImmersiveAdVideoGenericError",
		fields = {
			error_stage = Error_stage,
			error_code = PlaybackFailed,
			error_message = Error_message
		}
	}))
end

function AdSessionModule:videoLoaded()
	-- upvalues: measure (copy)
	if self.phase == "Loading" and not self.loaded then
		self.loaded = true
		self.loadedAt = self.clock
		
		return { (measure(self, { name = "ImmersiveAdLoad" })) }
	else
		return {}
	end
end

local function completion(p4)
	-- upvalues: measure (copy)
	return (measure(p4, {
		name = "ImmersiveAdVideoProgress",
		fields = {
			video_progress = 100,
			average_percent_seen_pre_event = 100,
			quartile_4_audible = p4.audioLevel,
			cumulative_100_percent_audible_time_ms = math.round(p4.audibleInViewSeconds * 1000)
		}
	}))
end

local function reportProgress(p4, List)
	-- upvalues: Video_progresses (copy), measure (copy), completion (copy)
	local ClampedValue: number = if p4.length <= 0 then 0 else math.clamp(p4.position / p4.length * 100, 0, 100)
	for _, videoProgress in Video_progresses do
		if videoProgress <= ClampedValue and not p4.quartilesSent[videoProgress] then
			p4.quartilesSent[videoProgress] = true
			table.insert(List, (measure(p4, {
				name = "ImmersiveAdVideoProgress",
				fields = {
					average_percent_seen_pre_event = 100,
					video_progress = videoProgress
				}
			})))
		end
	end
	if ClampedValue >= 99 and not p4.completeSent then
		p4.completeSent = true
		table.insert(List, (completion(p4)))
	end
end

local function advancePlaying(p5, p6, Smallest, Smallest1, IsPositionBelow, List)
	-- upvalues: config (copy), reportProgress (copy), AdSessionModule (copy), measure (copy)
	p5.watchedSeconds = math.max(p5.watchedSeconds, p6.position)
	local Inverted = not p5:isHeld()
	local Inverted1 = not (p5.backgrounded or p5.overlay ~= nil and config[p5.overlay] == true)
	local IsAudioLevelAbove: boolean = Inverted and p6.audioLevel > 0
	
	if Inverted then
		p5.playSeconds += Smallest1
		p5.maxAudioLevel = math.max(p5.maxAudioLevel, p6.audioLevel)
	end
	if IsAudioLevelAbove then
		p5.audibleSeconds += Smallest1
		
		if Inverted1 then
			p5.audibleInViewSeconds += Smallest1
		end
	end
	if Inverted1 then
		p5.fullScreenSeconds += Smallest
	end
	reportProgress(p5, List)
	
	if Inverted and Inverted1 and IsPositionBelow then
		p5.viewableRun += Smallest1
	else
		p5.viewableRun = 0
	end
	if not p5.viewableSent and AdSessionModule.ViewableSeconds <= p5.viewableRun then
		p5.viewableSent = true
		table.insert(List, (measure(p5, {
			name = "ImmersiveAdViewableImpression",
			fields = {
				average_percent_seen = 100,
				is_viewability_measurable = true,
				max_50_percent_in_view_duration_ms = math.round(p5.viewableRun * 1000),
				impression_start_timestamp_ms = p6.nowMs - math.round(p5.viewableRun * 1000),
				impression_end_timestamp_ms = p6.nowMs
			}
		})))
	end
end

function AdSessionModule:advance(p5)
	-- upvalues: AdSessionModule (copy), config (copy), measure (copy), errorEvent (copy), Frozen1 (copy), finish (copy), Frozen (copy), advancePlaying (copy)
	local List = {}
	
	if self.phase == "Entering" then
		if self.enterFade == nil then
			self.enterFade = 0
		else
			self.enterFade = math.min(AdSessionModule.EnterFadeSeconds, self.enterFade + p5.dt)
		end
		if not self.readySent and AdSessionModule.EnterFadeSeconds <= self.enterFade then
			self.readySent = true
			table.insert(List, { kind = "ReadyToEnter" })
		end
		return List
	else
		if not self:isActive() then
			return List
		end
		self.clock += p5.dt
		local Smallest = math.min(p5.dt, AdSessionModule.MaxFrameSeconds)
		
		if self.returnedAtMs ~= nil then
			Smallest = math.min(Smallest, math.max(0, p5.nowMs - self.returnedAtMs) / 1000)
			self.returnedAtMs = nil
		end
		local IsPositionBelow = self.position < p5.position
		local NewLargest = math.max(0, p5.position - self.position) + self.carriedAdvance
		local Smallest1 = math.min(p5.dt, NewLargest)
		self.carriedAdvance = if self:isHeld() then 0 else math.min(NewLargest - Smallest1, AdSessionModule.MaxCarriedAdvanceSeconds)
		self.position = p5.position
		self.length = p5.length
		self.audioLevel = p5.audioLevel
		
		if (self.backgrounded or self.overlay ~= nil and config[self.overlay] == true) and not self.backgrounded then
			self.backgroundSeconds += Smallest
		end
		if self.phase == "Loading" then
			if self.loaded and p5.position > 0 and not self:isHeld() then
				self.phase = "Playing"
				self.shown = true
				table.insert(List, (measure(self, {
					name = "ImmersiveAdVideoProgress",
					fields = {
						video_progress = 0,
						video_player_state = "autoplayed",
						screen_width = p5.screenSize.X,
						screen_height = p5.screenSize.Y,
						ad_width = p5.adSize.X,
						ad_height = p5.adSize.Y
					}
				})))
			elseif not self:isHeld() then
				self.loadingSeconds += Smallest
				
				if (self.config.startTimeoutSeconds or AdSessionModule.StartTimeoutSeconds) <= self.loadingSeconds then
					return (finish(self, Frozen.Failed, "error", {
						if self.loaded then errorEvent(self, "render", Frozen1.RenderTimeout, "the video loaded but showed no frame") else errorEvent(self, "load", Frozen1.LoadTimeout, "the video didn't load")
					}))
				end
			end
		end
		if self.phase == "Playing" then
			advancePlaying(self, p5, Smallest, Smallest1, IsPositionBelow, List)
			
			if self.endedBeforeShown then
				for _, value in self:videoEnded() do
					table.insert(List, value)
				end
				return List
			else
				self.stalledSeconds = if self:isHeld() or IsPositionBelow then 0 else self.stalledSeconds + Smallest
				
				if AdSessionModule.StallTimeoutSeconds > 0 and AdSessionModule.StallTimeoutSeconds <= self.stalledSeconds then
					if self.completeSent then
						return (finish(self, Frozen.Completed, "completed_auto_close", List))
					else
						table.insert(List, (errorEvent(self, "playback", Frozen1.PlaybackFailed, "the video stopped playing")))
						
						return (finish(self, Frozen.Failed, "error", List))
					end
				end
			end
		end
		return List
	end
end

function AdSessionModule:setVisible(Backgrounded, BackgroundedAtMs)
	-- upvalues: AdSessionModule (copy), config (copy)
	if Backgrounded ~= self.backgrounded or not self:isActive() then
		return {}
	end
	if Backgrounded then
		self.backgroundSeconds += math.max(0, BackgroundedAtMs - (self.backgroundedAtMs or BackgroundedAtMs)) / 1000
		self.backgroundedAtMs = nil
		self.backgrounded = false
		self.returnedAtMs = BackgroundedAtMs
		
		if self.phase == "Playing" and not self:isHeld() then
			self.joiningServerUntil = self.watchedSeconds + AdSessionModule.JoiningServerAfterResumeSeconds
		end
	else
		if not self.backgrounded and (self.overlay == nil or config[self.overlay] ~= true) then
			self.backgroundCount += 1
		end
		self.backgroundedAtMs = BackgroundedAtMs
		self.backgrounded = true
		self.viewableRun = 0
	end
	return {}
end

function AdSessionModule:videoEnded()
	-- upvalues: reportProgress (copy), completion (copy), finish (copy), Frozen (copy)
	if self.phase == "Loading" and self.loaded then
		self.endedBeforeShown = true
		
		return {}
	end
	if self.phase ~= "Playing" then
		return {}
	end
	if self.length > 0 then
		self.position = self.length
	end
	self.watchedSeconds = math.max(self.watchedSeconds, self.position)
	local List = {}
	reportProgress(self, List)
	
	if not self.completeSent then
		self.completeSent = true
		table.insert(List, (completion(self)))
	end
	return (finish(self, Frozen.Completed, "completed_auto_close", List))
end

function AdSessionModule.videoFailed(p6)
	-- upvalues: finish (copy), Frozen (copy), errorEvent (copy), Frozen1 (copy)
	return if p6.phase == "Loading" then finish(p6, Frozen.Failed, "error", {
		(errorEvent(p6, "load", Frozen1.LoadFailed, "the video couldn't load"))
	}) elseif p6.phase == "Playing" then finish(p6, Frozen.Failed, "error", {
		(errorEvent(p6, "playback", Frozen1.PlaybackFailed, "the video failed while playing"))
	}) else {}
end

function AdSessionModule:togglePause()
	-- upvalues: measure (copy), AdSessionModule (copy)
	if self.overlay == "Browser" then
		local CloseOverlayResult = self:closeOverlay()
		table.insert(CloseOverlayResult, { kind = "CloseBrowser" })
		
		return CloseOverlayResult
	elseif self.phase ~= "Playing" or self.overlay ~= nil then
		return {}
	else
		self.userPaused = not self.userPaused
		self.toggleCount += 1
		self.viewableRun = 0
		
		if self.userPaused then
			return { (measure(self, { name = "ImmersiveAdVideoPause" })) }
		else
			self.joiningServerUntil = self.watchedSeconds + AdSessionModule.JoiningServerAfterResumeSeconds
			
			return { (measure(self, { name = "ImmersiveAdVideoResume" })) }
		end
	end
end

function AdSessionModule:toggleMute()
	-- upvalues: measure (copy)
	if self:isActive() then
		self.muted = not self.muted
		
		return if self.shown then {
			(measure(self, {
				name = if self.muted then "ImmersiveAdVideoMute" else "ImmersiveAdVideoUnmute"
			}))
		} else {}
	else
		return {}
	end
end

function AdSessionModule:canOpenOverlay(Overlay): boolean
	if not self:isActive() or self.overlay ~= nil then
		return false
	end
	local v1 = true
	
	if Overlay == "Browser" then
		local ClickThroughUrl: string = self.config.clickThroughUrl
		v1 = ClickThroughUrl ~= nil and (string.match(ClickThroughUrl, "^https://") ~= nil and (string.find(ClickThroughUrl, "[<>]") == nil and #ClickThroughUrl <= 4096))
	end
	return v1
end

function AdSessionModule:openOverlay(Overlay)
	-- upvalues: config (copy), measure (copy)
	if not self:canOpenOverlay(Overlay) then
		return {}
	end
	if config[Overlay] then
		if not self.backgrounded then
			self.backgroundCount += 1
		end
		self.viewableRun = 0
	end
	self.overlay = Overlay
	
	return if self.shown then if Overlay == "Browser" then {
		(measure(self, {
			name = "ImmersiveAdClickCTA",
			fields = {
				click_element = "cta_button",
				is_end_card_visible = false
			}
		}))
	} else {} else {}
end

function AdSessionModule:closeOverlay()
	-- upvalues: config (copy), AdSessionModule (copy)
	local Overlay = self.overlay
	
	if Overlay == nil then
		return {}
	end
	self.overlay = nil
	
	if config[Overlay] and not self.userPaused then
		self.joiningServerUntil = self.watchedSeconds + AdSessionModule.JoiningServerAfterResumeSeconds
	end
	return {}
end

function AdSessionModule:canSkip(): boolean
	local SkipAfterSeconds = self.config.skipAfterSeconds
	
	return self.phase == "Playing" and (SkipAfterSeconds ~= nil and SkipAfterSeconds <= self.watchedSeconds)
end

function AdSessionModule.skip(p6)
	-- upvalues: finish (copy), Frozen (copy)
	return if p6:canSkip() then finish(p6, Frozen.Skipped, "skip") else {}
end

function AdSessionModule.back(p6, p7)
	-- upvalues: finish (copy), Frozen (copy)
	return if p6:isActive() then if p7 == "Device" and p6.overlay ~= nil then p6:closeOverlay() else finish(p6, Frozen.Cancelled, if p7 == "Button" then "close_button" else "system_back") else {}
end

local _ = function(p6): boolean
	-- upvalues: Frozen (copy)
	return if p6.phase == "Finished" or p6.phase == "Entering" then p6.result ~= Frozen.Cancelled else p6.phase == "Playing" and (not p6:isHeld() and (not p6:canSkip() and p6.watchedSeconds < p6.joiningServerUntil))
end

function AdSessionModule:view()
	-- upvalues: Frozen (copy)
	local ClickThroughUrl: string = self.config.clickThroughUrl
	
	return {
		isActive = self:isActive(),
		isHeld = self:isHeld(),
		userPaused = self.userPaused,
		muted = self.muted,
		hasClickThrough = ClickThroughUrl ~= nil and (string.match(ClickThroughUrl, "^https://") ~= nil and (string.find(ClickThroughUrl, "[<>]") == nil and #ClickThroughUrl <= 4096)),
		isSkippable = self.config.skipAfterSeconds ~= nil,
		canSkip = self:canSkip(),
		secondsUntilSkip = math.max(0, (math.ceil((self.config.skipAfterSeconds or 0) - self.watchedSeconds))),
		showsJoiningServer = if self.phase == "Finished" or self.phase == "Entering" then self.result ~= Frozen.Cancelled else self.phase == "Playing" and (not self:isHeld() and (not self:canSkip() and self.watchedSeconds < self.joiningServerUntil)),
		toggleCount = self.toggleCount
	}
end

function AdSessionModule.progress(p6): number
	return (if p6.length <= 0 then 0 else math.clamp(p6.position / p6.length * 100, 0, 100)) / 100
end

function AdSessionModule.enterFadeProgress(p6)
	-- upvalues: AdSessionModule (copy)
	return if p6.enterFade then p6.enterFade / AdSessionModule.EnterFadeSeconds else 0
end

return AdSessionModule