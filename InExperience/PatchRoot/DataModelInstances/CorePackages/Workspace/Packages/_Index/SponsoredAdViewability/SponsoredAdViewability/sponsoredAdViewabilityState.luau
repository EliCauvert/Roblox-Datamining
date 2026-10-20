local _ = require(script.Parent.calculateIntersectionRatio)
local _ = require(script.Parent.sponsoredAdViewabilityTypes)
local HighestProgresses = {
	0,
	25,
	50,
	75,
	100
}
local MilestoneLabels = {
	IabDisplayStandard = "IabDisplayStandard",
	IabDisplayLarge = "IabDisplayLarge",
	FullView = "FullView",
	IabVideoStandard = "IabVideoStandard",
	FullViewVideo = "FullViewVideo"
}

local function newBand(Threshold, CurrentContinuousMs)
	return if CurrentContinuousMs == nil then {
		enteredAtMs = nil,
		cumulativeMs = 0,
		maxContinuousMs = 0,
		threshold = Threshold
	} else {
		enteredAtMs = nil,
		pendingContinuity = false,
		cumulativeMs = 0,
		maxContinuousMs = 0,
		threshold = Threshold,
		currentContinuousMs = CurrentContinuousMs
	}
end

local function _(p1, MaxContinuousMs)
	p1.cumulativeMs += MaxContinuousMs
	
	if p1.maxContinuousMs < MaxContinuousMs then
		p1.maxContinuousMs = MaxContinuousMs
	end
	p1.enteredAtMs = nil
end

local _ = function(p1, p2)
	local EnteredAtMs = p1.enteredAtMs
	local CurrentContinuousMs = p1.currentContinuousMs
	
	if CurrentContinuousMs == nil then
		if EnteredAtMs == nil then return end
		local ImageBandRequiresAnEndTimestampDelta = assert(p2, "image band requires an end timestamp") - EnteredAtMs
		p1.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
		
		if p1.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
			p1.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
		end
		p1.enteredAtMs = nil
		
		return
	else
		if EnteredAtMs == nil and not p1.pendingContinuity then return end
		p1.cumulativeMs += CurrentContinuousMs
		
		if p1.maxContinuousMs < CurrentContinuousMs then
			p1.maxContinuousMs = CurrentContinuousMs
		end
		p1.enteredAtMs = nil
		p1.currentContinuousMs = 0
		p1.pendingContinuity = false
	end
end

local _ = function(p1, p2, EnteredAtMs)
	if p1.threshold > p2 then
		local EnteredAtMs1 = p1.enteredAtMs
		local CurrentContinuousMs = p1.currentContinuousMs
		
		if CurrentContinuousMs == nil then
			if EnteredAtMs1 == nil then return end
			local ImageBandRequiresAnEndTimestampDelta = assert(EnteredAtMs, "image band requires an end timestamp") - EnteredAtMs1
			p1.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
			
			if p1.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
				p1.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
			end
			p1.enteredAtMs = nil
		else
			if EnteredAtMs1 == nil and not p1.pendingContinuity then return end
			p1.cumulativeMs += CurrentContinuousMs
			
			if p1.maxContinuousMs < CurrentContinuousMs then
				p1.maxContinuousMs = CurrentContinuousMs
			end
			p1.enteredAtMs = nil
			p1.currentContinuousMs = 0
			p1.pendingContinuity = false
			
			return
		end
	elseif p1.enteredAtMs == nil then
		p1.enteredAtMs = EnteredAtMs
		
		return
	end
end

local _ = function(p1, p2)
	local CumulativeMs = p1.cumulativeMs
	local MaxContinuousMs = p1.maxContinuousMs
	local EnteredAtMs = p1.enteredAtMs
	local CurrentContinuousMs = p1.currentContinuousMs
	local ImageBandRequiresTheCurrentTimestampDelta = nil
	
	if CurrentContinuousMs == nil then
		if EnteredAtMs ~= nil then
			ImageBandRequiresTheCurrentTimestampDelta = assert(p2, "image band requires the current timestamp") - EnteredAtMs
		end
	elseif EnteredAtMs ~= nil or p1.pendingContinuity then
		ImageBandRequiresTheCurrentTimestampDelta = CurrentContinuousMs
	end
	if ImageBandRequiresTheCurrentTimestampDelta ~= nil then
		CumulativeMs += ImageBandRequiresTheCurrentTimestampDelta
		
		if MaxContinuousMs < ImageBandRequiresTheCurrentTimestampDelta then
			MaxContinuousMs = ImageBandRequiresTheCurrentTimestampDelta
		end
	end
	return CumulativeMs, MaxContinuousMs
end

local _ = function(p1)
	return if p1.enteredAtMs == nil then 0 else p1.currentContinuousMs or 0
end

local _ = function(p1)
	if p1.enteredAtMs ~= nil then
		p1.enteredAtMs = nil
		p1.pendingContinuity = true
	end
end

local function copyGeometry(LatchedGeometry)
	return {
		adSize = LatchedGeometry.adSize,
		viewportBounds = {
			min = LatchedGeometry.viewportBounds.min,
			max = LatchedGeometry.viewportBounds.max
		}
	}
end

local _ = function(p1): boolean
	return p1 ~= nil and (p1.isPlaying and p1.audioLevel > 0)
end

local _ = function(p1: number): boolean
	return typeof(p1) == "number" and p1 >= 0 and p1 % 1 == 0
end

local function isValidVideoPlaybackSnapshot(LastSnapshot): boolean
	local PlaybackPositionMs: number = LastSnapshot.playbackPositionMs
	local LoopCount: number = LastSnapshot.loopCount
	local EndedCount: number = LastSnapshot.endedCount
	local AudioLevel: number = LastSnapshot.audioLevel
	local VideoLengthMs: number = LastSnapshot.videoLengthMs
	
	return typeof(LastSnapshot.isPlaying) == "boolean" and (typeof(PlaybackPositionMs) == "number" and PlaybackPositionMs >= 0) and (typeof(LoopCount) == "number" and (LoopCount >= 0 and LoopCount % 1 == 0 and (if EndedCount == nil then typeof(AudioLevel) == "number" and (AudioLevel >= 0 and AudioLevel <= 1) and (VideoLengthMs == nil or typeof(VideoLengthMs) == "number" and VideoLengthMs > 0) else typeof(EndedCount) == "number" and (EndedCount >= 0 and EndedCount % 1 == 0) and (typeof(AudioLevel) == "number" and (AudioLevel >= 0 and AudioLevel <= 1) and (VideoLengthMs == nil or typeof(VideoLengthMs) == "number" and VideoLengthMs > 0)))))
end

local _ = function(p1, p2)
	if p2 == nil then
		return 0
	else
		local ViewportBounds = p2.viewportBounds
		local ScaledX = (ViewportBounds.max.X - ViewportBounds.min.X) * (ViewportBounds.max.Y - ViewportBounds.min.Y)
		
		return if ScaledX <= 0 then 0 else p1 * p2.adSize.X * p2.adSize.Y / ScaledX
	end
end

local SponsoredAdViewabilityStateModule = {}
SponsoredAdViewabilityStateModule.__index = SponsoredAdViewabilityStateModule

function SponsoredAdViewabilityStateModule.new(StartTimestampMs, Enabled)
	-- upvalues: newBand (copy), SponsoredAdViewabilityStateModule (copy)
	local IsEnabled = Enabled == true
	
	return (setmetatable({
		_displayLabel = nil,
		_lastSampleMs = nil,
		_lastRatio = 0,
		_lastRealEstate = 0,
		_percentWeightedSum = 0,
		_realEstateWeightedSum = 0,
		_visibleWeightedMs = 0,
		_minPercentSeen = nil,
		_maxPercentSeen = nil,
		_latchedGeometry = nil,
		_pausedAtMs = nil,
		_pausedDurationMs = 0,
		_finalized = false,
		_terminalSnapshot = nil,
		startTimestampMs = StartTimestampMs,
		_achieved = {},
		_band30 = newBand(0.3, if IsEnabled then 0 else nil),
		_band50 = newBand(0.5, if IsEnabled then 0 else nil),
		_band100 = newBand(1, if IsEnabled then 0 else nil),
		_inGridBand50 = if IsEnabled then {
			threshold = 0.5,
			enteredAtMs = nil,
			currentContinuousMs = 0,
			pendingContinuity = false,
			cumulativeMs = 0,
			maxContinuousMs = 0
		} else nil,
		_fullscreenBand50 = if IsEnabled then {
			threshold = 0.5,
			enteredAtMs = nil,
			currentContinuousMs = 0,
			pendingContinuity = false,
			cumulativeMs = 0,
			maxContinuousMs = 0
		} else nil,
		_video = if IsEnabled then {
			highestProgress = nil,
			lengthMs = nil,
			cumulativePlaytimeMs = 0,
			lastSampleMs = nil,
			lastSnapshot = nil,
			isFullscreen = false,
			cumulativeAudioPlaybackMs = 0,
			cumulative100PercentAudibleMs = 0,
			maxAudioLevel = 0,
			audioOnAtEvent = false
		} else nil
	}, SponsoredAdViewabilityStateModule))
end

function SponsoredAdViewabilityStateModule:_classifyDisplayOnce(AdSize)
	-- upvalues: MilestoneLabels (copy)
	if self._displayLabel ~= nil then return end
	local ScaledX = AdSize.X * AdSize.Y
	
	if ScaledX > 0 then
		self._displayLabel = if ScaledX > 242500 then MilestoneLabels.IabDisplayLarge else MilestoneLabels.IabDisplayStandard
		
		return
	end
end

function SponsoredAdViewabilityStateModule:_tryFire(Band, MilestoneLabel, EnteredAtMs, _latchedGeometry, List, p1)
	-- upvalues: copyGeometry (copy)
	if self._achieved[MilestoneLabel] then return end
	local Video = self._video
	local IsEnteredAtMsAbove = nil
	
	if Video == nil then
		local EnteredAtMs1 = Band.enteredAtMs
		IsEnteredAtMsAbove = EnteredAtMs1 ~= nil and EnteredAtMs - EnteredAtMs1 >= 1000
	else
		IsEnteredAtMsAbove = (if Band.enteredAtMs == nil then 0 else Band.currentContinuousMs or 0) >= (p1 or 1000)
	end
	if not IsEnteredAtMsAbove then return end
	local Band30 = self._band30
	local CumulativeMs = Band30.cumulativeMs
	local MaxContinuousMs = Band30.maxContinuousMs
	local EnteredAtMs2 = Band30.enteredAtMs
	local CurrentContinuousMs = Band30.currentContinuousMs
	local ImageBandRequiresTheCurrentTimestampDelta = nil
	
	if CurrentContinuousMs == nil then
		if EnteredAtMs2 ~= nil then
			ImageBandRequiresTheCurrentTimestampDelta = assert(EnteredAtMs, "image band requires the current timestamp") - EnteredAtMs2
		end
	elseif EnteredAtMs2 ~= nil or Band30.pendingContinuity then
		ImageBandRequiresTheCurrentTimestampDelta = CurrentContinuousMs
	end
	if ImageBandRequiresTheCurrentTimestampDelta ~= nil then
		CumulativeMs += ImageBandRequiresTheCurrentTimestampDelta
		
		if MaxContinuousMs < ImageBandRequiresTheCurrentTimestampDelta then
			MaxContinuousMs = ImageBandRequiresTheCurrentTimestampDelta
		end
	end
	local Cumulative30PercentInViewDurationMs = CumulativeMs
	local MaxContinuous30PercentInViewDurationMs = MaxContinuousMs
	local Band50 = self._band50
	local CumulativeMs1 = Band50.cumulativeMs
	local MaxContinuousMs1 = Band50.maxContinuousMs
	local EnteredAtMs3 = Band50.enteredAtMs
	local CurrentContinuousMs1 = Band50.currentContinuousMs
	local ImageBandRequiresTheCurrentTimestampDelta1 = nil
	
	if CurrentContinuousMs1 == nil then
		if EnteredAtMs3 ~= nil then
			ImageBandRequiresTheCurrentTimestampDelta1 = assert(EnteredAtMs, "image band requires the current timestamp") - EnteredAtMs3
		end
	elseif EnteredAtMs3 ~= nil or Band50.pendingContinuity then
		ImageBandRequiresTheCurrentTimestampDelta1 = CurrentContinuousMs1
	end
	if ImageBandRequiresTheCurrentTimestampDelta1 ~= nil then
		CumulativeMs1 += ImageBandRequiresTheCurrentTimestampDelta1
		
		if MaxContinuousMs1 < ImageBandRequiresTheCurrentTimestampDelta1 then
			MaxContinuousMs1 = ImageBandRequiresTheCurrentTimestampDelta1
		end
	end
	local Cumulative50PercentInViewDurationMs = CumulativeMs1
	local MaxContinuous50PercentInViewDurationMs = MaxContinuousMs1
	local Band100 = self._band100
	local CumulativeMs2 = Band100.cumulativeMs
	local MaxContinuousMs2 = Band100.maxContinuousMs
	local EnteredAtMs4 = Band100.enteredAtMs
	local CurrentContinuousMs2 = Band100.currentContinuousMs
	local ImageBandRequiresTheCurrentTimestampDelta2 = nil
	
	if CurrentContinuousMs2 == nil then
		if EnteredAtMs4 ~= nil then
			ImageBandRequiresTheCurrentTimestampDelta2 = assert(EnteredAtMs, "image band requires the current timestamp") - EnteredAtMs4
		end
	elseif EnteredAtMs4 ~= nil or Band100.pendingContinuity then
		ImageBandRequiresTheCurrentTimestampDelta2 = CurrentContinuousMs2
	end
	if ImageBandRequiresTheCurrentTimestampDelta2 ~= nil then
		CumulativeMs2 += ImageBandRequiresTheCurrentTimestampDelta2
		
		if MaxContinuousMs2 < ImageBandRequiresTheCurrentTimestampDelta2 then
			MaxContinuousMs2 = ImageBandRequiresTheCurrentTimestampDelta2
		end
	end
	local config = {
		milestoneLabel = MilestoneLabel,
		geometry = copyGeometry(_latchedGeometry),
		viewabilitySessionStartTimestampMs = self.startTimestampMs,
		cumulative30PercentInViewDurationMs = Cumulative30PercentInViewDurationMs,
		cumulative50PercentInViewDurationMs = Cumulative50PercentInViewDurationMs,
		cumulative100PercentInViewDurationMs = CumulativeMs2,
		maxContinuous30PercentInViewDurationMs = MaxContinuous30PercentInViewDurationMs,
		maxContinuous50PercentInViewDurationMs = MaxContinuous50PercentInViewDurationMs,
		maxContinuous100PercentInViewDurationMs = MaxContinuousMs2
	}
	
	if Video ~= nil then
		local InGridBand50 = self._inGridBand50
		local FullscreenBand50 = self._fullscreenBand50
		
		if InGridBand50 == nil or FullscreenBand50 == nil then return end
		config.isFullScreen = Video.isFullscreen
		config.videoLengthMs = Video.lengthMs
		config.maxAudioLevel = Video.maxAudioLevel
		local CumulativeMs3 = InGridBand50.cumulativeMs
		local MaxContinuousMs3 = InGridBand50.maxContinuousMs
		local EnteredAtMs5 = InGridBand50.enteredAtMs
		local CurrentContinuousMs3 = InGridBand50.currentContinuousMs
		local ImageBandRequiresTheCurrentTimestampDelta3 = nil
		
		if CurrentContinuousMs3 == nil then
			if EnteredAtMs5 ~= nil then
				ImageBandRequiresTheCurrentTimestampDelta3 = assert(nil, "image band requires the current timestamp") - EnteredAtMs5
			end
		elseif EnteredAtMs5 ~= nil or InGridBand50.pendingContinuity then
			ImageBandRequiresTheCurrentTimestampDelta3 = CurrentContinuousMs3
		end
		if ImageBandRequiresTheCurrentTimestampDelta3 ~= nil then
			CumulativeMs3 += ImageBandRequiresTheCurrentTimestampDelta3
			
		end
		config.cumulativeInGridViewDurationMs = CumulativeMs3
		local CumulativeMs4 = FullscreenBand50.cumulativeMs
		local MaxContinuousMs4 = FullscreenBand50.maxContinuousMs
		local EnteredAtMs6 = FullscreenBand50.enteredAtMs
		local CurrentContinuousMs4 = FullscreenBand50.currentContinuousMs
		local ImageBandRequiresTheCurrentTimestampDelta4 = nil
		
		if CurrentContinuousMs4 == nil then
			if EnteredAtMs6 ~= nil then
				ImageBandRequiresTheCurrentTimestampDelta4 = assert(nil, "image band requires the current timestamp") - EnteredAtMs6
			end
		elseif EnteredAtMs6 ~= nil or FullscreenBand50.pendingContinuity then
			ImageBandRequiresTheCurrentTimestampDelta4 = CurrentContinuousMs4
		end
		if ImageBandRequiresTheCurrentTimestampDelta4 ~= nil then
			CumulativeMs4 += ImageBandRequiresTheCurrentTimestampDelta4
			
		end
		config.cumulativeFullScreenViewDurationMs = CumulativeMs4
	end
	self._achieved[MilestoneLabel] = true
	table.insert(List, config)
end

function SponsoredAdViewabilityStateModule:_accumulate(EnteredAtMs, LastRatio: number, LatchedGeometry)
	local LastSampleMs = self._lastSampleMs
	
	if LastSampleMs ~= nil and self._lastRatio > 0 then
		local EnteredAtMsDelta = EnteredAtMs - LastSampleMs
		
		if EnteredAtMsDelta > 0 then
			self._percentWeightedSum += self._lastRatio * EnteredAtMsDelta
			self._realEstateWeightedSum += self._lastRealEstate * EnteredAtMsDelta
			self._visibleWeightedMs += EnteredAtMsDelta
		end
	end
	self._lastSampleMs = EnteredAtMs
	self._lastRatio = LastRatio
	local XRatio = nil
	
	if LatchedGeometry == nil then
		XRatio = 0
	else
		local ViewportBounds = LatchedGeometry.viewportBounds
		local ScaledX = (ViewportBounds.max.X - ViewportBounds.min.X) * (ViewportBounds.max.Y - ViewportBounds.min.Y)
		XRatio = if ScaledX <= 0 then 0 else LastRatio * LatchedGeometry.adSize.X * LatchedGeometry.adSize.Y / ScaledX
	end
	self._lastRealEstate = XRatio
	
	if LastRatio > 0 then
		if self._minPercentSeen == nil or LastRatio < self._minPercentSeen then
			self._minPercentSeen = LastRatio
		end
		if self._maxPercentSeen == nil or self._maxPercentSeen < LastRatio then
			self._maxPercentSeen = LastRatio
		end
	end
end

local function updateVideoBand(FullscreenBand, p1, p2, p3, p4, Smallest, EnteredAtMs)
	if FullscreenBand.pendingContinuity then
		if p2 and FullscreenBand.threshold <= p4 then
			FullscreenBand.pendingContinuity = false
			FullscreenBand.enteredAtMs = EnteredAtMs
			local CurrentContinuousMs1 = FullscreenBand.currentContinuousMs
			
			if p1 and CurrentContinuousMs1 ~= nil then
				FullscreenBand.currentContinuousMs = CurrentContinuousMs1 + Smallest
				
				return
			end
		else
			local EnteredAtMs1 = FullscreenBand.enteredAtMs
			local CurrentContinuousMs = FullscreenBand.currentContinuousMs
			
			if CurrentContinuousMs == nil then
				if EnteredAtMs1 == nil then return end
				local ImageBandRequiresAnEndTimestampDelta = assert(nil, "image band requires an end timestamp") - EnteredAtMs1
				FullscreenBand.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
				
				if FullscreenBand.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
					FullscreenBand.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
				end
				FullscreenBand.enteredAtMs = nil
			else
				if EnteredAtMs1 == nil and not FullscreenBand.pendingContinuity then return end
				FullscreenBand.cumulativeMs += CurrentContinuousMs
				
				if FullscreenBand.maxContinuousMs < CurrentContinuousMs then
					FullscreenBand.maxContinuousMs = CurrentContinuousMs
				end
				FullscreenBand.enteredAtMs = nil
				FullscreenBand.currentContinuousMs = 0
				FullscreenBand.pendingContinuity = false
				
				return
			end
		end
		return
	elseif p1 and FullscreenBand.threshold <= p4 then
		if p3 < FullscreenBand.threshold then
			local EnteredAtMs3 = FullscreenBand.enteredAtMs
			local CurrentContinuousMs2 = FullscreenBand.currentContinuousMs
			
			if CurrentContinuousMs2 == nil then
				if EnteredAtMs3 ~= nil then
					local ImageBandRequiresAnEndTimestampDelta = assert(nil, "image band requires an end timestamp") - EnteredAtMs3
					FullscreenBand.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
					
					if FullscreenBand.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
						FullscreenBand.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
					end
					FullscreenBand.enteredAtMs = nil
				end
			elseif EnteredAtMs3 ~= nil or FullscreenBand.pendingContinuity then
				FullscreenBand.cumulativeMs += CurrentContinuousMs2
				
				if FullscreenBand.maxContinuousMs < CurrentContinuousMs2 then
					FullscreenBand.maxContinuousMs = CurrentContinuousMs2
				end
				FullscreenBand.enteredAtMs = nil
				FullscreenBand.currentContinuousMs = 0
				FullscreenBand.pendingContinuity = false
			end
			if p2 then
				FullscreenBand.enteredAtMs = EnteredAtMs
			end
			return
		else
			if FullscreenBand.enteredAtMs == nil then
				FullscreenBand.enteredAtMs = EnteredAtMs
			end
			local CurrentContinuousMs3 = FullscreenBand.currentContinuousMs
			
			if CurrentContinuousMs3 == nil then
				FullscreenBand.enteredAtMs = nil
				FullscreenBand.pendingContinuity = false
				
				return
			end
			FullscreenBand.currentContinuousMs = CurrentContinuousMs3 + Smallest
			
			if not p2 then
				local EnteredAtMs4 = FullscreenBand.enteredAtMs
				local CurrentContinuousMs4 = FullscreenBand.currentContinuousMs
				
				if CurrentContinuousMs4 == nil then
					if EnteredAtMs4 == nil then return end
					local ImageBandRequiresAnEndTimestampDelta = assert(nil, "image band requires an end timestamp") - EnteredAtMs4
					FullscreenBand.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
					
					if FullscreenBand.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
						FullscreenBand.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
					end
					FullscreenBand.enteredAtMs = nil
				else
					if EnteredAtMs4 == nil and not FullscreenBand.pendingContinuity then return end
					FullscreenBand.cumulativeMs += CurrentContinuousMs4
					
					if FullscreenBand.maxContinuousMs < CurrentContinuousMs4 then
						FullscreenBand.maxContinuousMs = CurrentContinuousMs4
					end
					FullscreenBand.enteredAtMs = nil
					FullscreenBand.currentContinuousMs = 0
					FullscreenBand.pendingContinuity = false
					
					return
				end
			end
			return
		end
	else
		local EnteredAtMs2 = FullscreenBand.enteredAtMs
		local CurrentContinuousMs = FullscreenBand.currentContinuousMs
		
		if CurrentContinuousMs == nil then
			if EnteredAtMs2 == nil then return end
			local ImageBandRequiresAnEndTimestampDelta = assert(nil, "image band requires an end timestamp") - EnteredAtMs2
			FullscreenBand.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
			
			if FullscreenBand.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
				FullscreenBand.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
			end
			FullscreenBand.enteredAtMs = nil
			
			return
		else
			if EnteredAtMs2 == nil and not FullscreenBand.pendingContinuity then return end
			FullscreenBand.cumulativeMs += CurrentContinuousMs
			
			if FullscreenBand.maxContinuousMs < CurrentContinuousMs then
				FullscreenBand.maxContinuousMs = CurrentContinuousMs
			end
			FullscreenBand.enteredAtMs = nil
			FullscreenBand.currentContinuousMs = 0
			FullscreenBand.pendingContinuity = false
		end
	end
end

local _ = function(p1, p2, p3, p4, p5, p6, p7, EnteredAtMs)
	-- upvalues: updateVideoBand (copy)
	local P40 = p2 or p1.pendingContinuity == true
	updateVideoBand(p1, p3 and P40, p4 and P40, p5, p6, p7, EnteredAtMs)
end

local _ = function(p1, p2, p3, p4, p5: number): number
	if p1 == nil or p2 == nil or p3 == nil or p4 == nil then
		return 0
	elseif p4 < p3 then
		return 0
	else
		local v1 = p4 - p3
		
		return if v1 == 0 then math.max(0, p2 - p1) elseif p5 == nil or p5 <= 0 then 0 else math.max(0, v1 * p5 + p2 - p1)
	end
end

local _ = function(p1, p2: number, p3): number
	return if p1 then 100 elseif p2 == nil or p2 <= 0 then 0 else math.clamp(p3 / p2 * 100, 0, 100)
end

function SponsoredAdViewabilityStateModule:_buildVideoProgressMilestone(VideoProgress, p1)
	-- upvalues: copyGeometry (copy)
	local Video = self._video
	local InGridBand50 = self._inGridBand50
	local FullscreenBand50 = self._fullscreenBand50
	
	if Video == nil or InGridBand50 == nil or FullscreenBand50 == nil then
		return nil
	end
	local Band30 = self._band30
	local CumulativeMs = Band30.cumulativeMs
	local MaxContinuousMs = Band30.maxContinuousMs
	local EnteredAtMs = Band30.enteredAtMs
	local CurrentContinuousMs = Band30.currentContinuousMs
	local ImageBandRequiresTheCurrentTimestampDelta = nil
	
	if CurrentContinuousMs == nil then
		if EnteredAtMs ~= nil then
			ImageBandRequiresTheCurrentTimestampDelta = assert(nil, "image band requires the current timestamp") - EnteredAtMs
		end
	elseif EnteredAtMs ~= nil or Band30.pendingContinuity then
		ImageBandRequiresTheCurrentTimestampDelta = CurrentContinuousMs
	end
	if ImageBandRequiresTheCurrentTimestampDelta ~= nil then
		CumulativeMs += ImageBandRequiresTheCurrentTimestampDelta
		
		if MaxContinuousMs < ImageBandRequiresTheCurrentTimestampDelta then
			MaxContinuousMs = ImageBandRequiresTheCurrentTimestampDelta
		end
	end
	local Cumulative30PercentInViewDurationMs = CumulativeMs
	local MaxContinuous30PercentInViewDurationMs = MaxContinuousMs
	local Band50 = self._band50
	local CumulativeMs1 = Band50.cumulativeMs
	local MaxContinuousMs1 = Band50.maxContinuousMs
	local EnteredAtMs1 = Band50.enteredAtMs
	local CurrentContinuousMs1 = Band50.currentContinuousMs
	local ImageBandRequiresTheCurrentTimestampDelta1 = nil
	
	if CurrentContinuousMs1 == nil then
		if EnteredAtMs1 ~= nil then
			ImageBandRequiresTheCurrentTimestampDelta1 = assert(nil, "image band requires the current timestamp") - EnteredAtMs1
		end
	elseif EnteredAtMs1 ~= nil or Band50.pendingContinuity then
		ImageBandRequiresTheCurrentTimestampDelta1 = CurrentContinuousMs1
	end
	if ImageBandRequiresTheCurrentTimestampDelta1 ~= nil then
		CumulativeMs1 += ImageBandRequiresTheCurrentTimestampDelta1
		
		if MaxContinuousMs1 < ImageBandRequiresTheCurrentTimestampDelta1 then
			MaxContinuousMs1 = ImageBandRequiresTheCurrentTimestampDelta1
		end
	end
	local Cumulative50PercentInViewDurationMs = CumulativeMs1
	local MaxContinuous50PercentInViewDurationMs = MaxContinuousMs1
	local Band100 = self._band100
	local CumulativeMs2 = Band100.cumulativeMs
	local MaxContinuousMs2 = Band100.maxContinuousMs
	local EnteredAtMs2 = Band100.enteredAtMs
	local CurrentContinuousMs2 = Band100.currentContinuousMs
	local ImageBandRequiresTheCurrentTimestampDelta2 = nil
	
	if CurrentContinuousMs2 == nil then
		if EnteredAtMs2 ~= nil then
			ImageBandRequiresTheCurrentTimestampDelta2 = assert(nil, "image band requires the current timestamp") - EnteredAtMs2
		end
	elseif EnteredAtMs2 ~= nil or Band100.pendingContinuity then
		ImageBandRequiresTheCurrentTimestampDelta2 = CurrentContinuousMs2
	end
	if ImageBandRequiresTheCurrentTimestampDelta2 ~= nil then
		CumulativeMs2 += ImageBandRequiresTheCurrentTimestampDelta2
		
		if MaxContinuousMs2 < ImageBandRequiresTheCurrentTimestampDelta2 then
			MaxContinuousMs2 = ImageBandRequiresTheCurrentTimestampDelta2
		end
	end
	local Cumulative100PercentInViewDurationMs = CumulativeMs2
	local MaxContinuous100PercentInViewDurationMs = MaxContinuousMs2
	local CumulativeMs3 = InGridBand50.cumulativeMs
	local MaxContinuousMs3 = InGridBand50.maxContinuousMs
	local EnteredAtMs3 = InGridBand50.enteredAtMs
	local CurrentContinuousMs3 = InGridBand50.currentContinuousMs
	local ImageBandRequiresTheCurrentTimestampDelta21 = nil
	
	if CurrentContinuousMs3 == nil then
		if EnteredAtMs3 ~= nil then
			ImageBandRequiresTheCurrentTimestampDelta21 = assert(nil, "image band requires the current timestamp") - EnteredAtMs3
		end
	elseif EnteredAtMs3 ~= nil or InGridBand50.pendingContinuity then
		ImageBandRequiresTheCurrentTimestampDelta21 = CurrentContinuousMs3
	end
	if ImageBandRequiresTheCurrentTimestampDelta21 ~= nil then
		CumulativeMs3 += ImageBandRequiresTheCurrentTimestampDelta21
		
	end
	local CumulativeInGridViewDurationMs = CumulativeMs3
	local CumulativeMs4 = FullscreenBand50.cumulativeMs
	local MaxContinuousMs4 = FullscreenBand50.maxContinuousMs
	local EnteredAtMs4 = FullscreenBand50.enteredAtMs
	local CurrentContinuousMs4 = FullscreenBand50.currentContinuousMs
	local ImageBandRequiresTheCurrentTimestampDelta3 = nil
	
	if CurrentContinuousMs4 == nil then
		if EnteredAtMs4 ~= nil then
			ImageBandRequiresTheCurrentTimestampDelta3 = assert(nil, "image band requires the current timestamp") - EnteredAtMs4
		end
	elseif EnteredAtMs4 ~= nil or FullscreenBand50.pendingContinuity then
		ImageBandRequiresTheCurrentTimestampDelta3 = CurrentContinuousMs4
	end
	if ImageBandRequiresTheCurrentTimestampDelta3 ~= nil then
		CumulativeMs4 += ImageBandRequiresTheCurrentTimestampDelta3
		
	end
	return {
		geometry = copyGeometry(p1),
		viewabilitySessionStartTimestampMs = self.startTimestampMs,
		cumulative30PercentInViewDurationMs = Cumulative30PercentInViewDurationMs,
		cumulative50PercentInViewDurationMs = Cumulative50PercentInViewDurationMs,
		cumulative100PercentInViewDurationMs = Cumulative100PercentInViewDurationMs,
		maxContinuous30PercentInViewDurationMs = MaxContinuous30PercentInViewDurationMs,
		maxContinuous50PercentInViewDurationMs = MaxContinuous50PercentInViewDurationMs,
		maxContinuous100PercentInViewDurationMs = MaxContinuous100PercentInViewDurationMs,
		videoProgress = VideoProgress,
		videoLengthMs = Video.lengthMs,
		videoCumulativePlaytimeMs = Video.cumulativePlaytimeMs,
		cumulativeAudioPlaybackDurationMs = Video.cumulativeAudioPlaybackMs,
		cumulative100PercentAudibleTimeMs = Video.cumulative100PercentAudibleMs,
		maxAudioLevel = Video.maxAudioLevel,
		audioOnAtEvent = Video.audioOnAtEvent,
		isFullScreen = Video.isFullscreen,
		cumulativeInGridViewDurationMs = CumulativeInGridViewDurationMs,
		cumulativeFullScreenViewDurationMs = CumulativeMs4
	}
end

function SponsoredAdViewabilityStateModule:_advanceVideo(EnteredAtMs, LastRatio: number, LastRatio1: number, _latchedGeometry, LastSnapshot, IsFullscreen)
	-- upvalues: isValidVideoPlaybackSnapshot (copy), updateVideoBand (copy), HighestProgresses (copy)
	local List = {}
	
	if self._video == nil or self._inGridBand50 == nil or self._fullscreenBand50 == nil then
		local Band30 = self._band30
		local EnteredAtMs1 = Band30.enteredAtMs
		local CurrentContinuousMs = Band30.currentContinuousMs
		
		if CurrentContinuousMs == nil then
			if EnteredAtMs1 ~= nil then
				local ImageBandRequiresAnEndTimestampDelta = assert(nil, "image band requires an end timestamp") - EnteredAtMs1
				Band30.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
				
				if Band30.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
					Band30.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
				end
				Band30.enteredAtMs = nil
			end
		elseif EnteredAtMs1 ~= nil or Band30.pendingContinuity then
			Band30.cumulativeMs += CurrentContinuousMs
			
			if Band30.maxContinuousMs < CurrentContinuousMs then
				Band30.maxContinuousMs = CurrentContinuousMs
			end
			Band30.enteredAtMs = nil
			Band30.currentContinuousMs = 0
			Band30.pendingContinuity = false
		end
		local Band50 = self._band50
		local EnteredAtMs2 = Band50.enteredAtMs
		local CurrentContinuousMs1 = Band50.currentContinuousMs
		
		if CurrentContinuousMs1 == nil then
			if EnteredAtMs2 ~= nil then
				local ImageBandRequiresAnEndTimestampDelta = assert(nil, "image band requires an end timestamp") - EnteredAtMs2
				Band50.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
				
				if Band50.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
					Band50.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
				end
				Band50.enteredAtMs = nil
			end
		elseif EnteredAtMs2 ~= nil or Band50.pendingContinuity then
			Band50.cumulativeMs += CurrentContinuousMs1
			
			if Band50.maxContinuousMs < CurrentContinuousMs1 then
				Band50.maxContinuousMs = CurrentContinuousMs1
			end
			Band50.enteredAtMs = nil
			Band50.currentContinuousMs = 0
			Band50.pendingContinuity = false
		end
		local Band100 = self._band100
		local EnteredAtMs3 = Band100.enteredAtMs
		local CurrentContinuousMs2 = Band100.currentContinuousMs
		
		if CurrentContinuousMs2 == nil then
			if EnteredAtMs3 ~= nil then
				local ImageBandRequiresAnEndTimestampDelta = assert(nil, "image band requires an end timestamp") - EnteredAtMs3
				Band100.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
				
				if Band100.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
					Band100.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
				end
				Band100.enteredAtMs = nil
			end
		elseif EnteredAtMs3 ~= nil or Band100.pendingContinuity then
			Band100.cumulativeMs += CurrentContinuousMs2
			
			if Band100.maxContinuousMs < CurrentContinuousMs2 then
				Band100.maxContinuousMs = CurrentContinuousMs2
			end
			Band100.enteredAtMs = nil
			Band100.currentContinuousMs = 0
			Band100.pendingContinuity = false
		end
		return List, false, false
	else
		local Video = self._video
		local InGridBand50 = self._inGridBand50
		local FullscreenBand50 = self._fullscreenBand50
		local LastSampleMs = Video.lastSampleMs
		local LastSnapshot1 = Video.lastSnapshot
		
		if LastSnapshot ~= nil and not isValidVideoPlaybackSnapshot(LastSnapshot) then
			LastSnapshot = nil
		end
		Video.isFullscreen = IsFullscreen
		Video.audioOnAtEvent = LastSnapshot ~= nil and (LastSnapshot.isPlaying and LastSnapshot.audioLevel > 0)
		
		if LastSnapshot == nil then
			local Band30 = self._band30
			
			if Band30.pendingContinuity then
				local EnteredAtMs4 = Band30.enteredAtMs
				local CurrentContinuousMs = Band30.currentContinuousMs
				
				if CurrentContinuousMs == nil then
					if EnteredAtMs4 ~= nil then
						local ImageBandRequiresAnEndTimestampDelta = assert(nil, "image band requires an end timestamp") - EnteredAtMs4
						Band30.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
						
						if Band30.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
							Band30.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
						end
						Band30.enteredAtMs = nil
					end
				elseif EnteredAtMs4 ~= nil or Band30.pendingContinuity then
					Band30.cumulativeMs += CurrentContinuousMs
					
					if Band30.maxContinuousMs < CurrentContinuousMs then
						Band30.maxContinuousMs = CurrentContinuousMs
					end
					Band30.enteredAtMs = nil
					Band30.currentContinuousMs = 0
					Band30.pendingContinuity = false
				end
			else
				local EnteredAtMs5 = Band30.enteredAtMs
				local CurrentContinuousMs2 = Band30.currentContinuousMs
				
				if CurrentContinuousMs2 == nil then
					if EnteredAtMs5 ~= nil then
						local ImageBandRequiresAnEndTimestampDelta = assert(nil, "image band requires an end timestamp") - EnteredAtMs5
						Band30.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
						
						if Band30.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
							Band30.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
						end
						Band30.enteredAtMs = nil
					end
				elseif EnteredAtMs5 ~= nil or Band30.pendingContinuity then
					Band30.cumulativeMs += CurrentContinuousMs2
					
					if Band30.maxContinuousMs < CurrentContinuousMs2 then
						Band30.maxContinuousMs = CurrentContinuousMs2
					end
					Band30.enteredAtMs = nil
					Band30.currentContinuousMs = 0
					Band30.pendingContinuity = false
				end
			end
			local Band50 = self._band50
			
			if Band50.pendingContinuity then
				local EnteredAtMs6 = Band50.enteredAtMs
				local CurrentContinuousMs = Band50.currentContinuousMs
				
				if CurrentContinuousMs == nil then
					if EnteredAtMs6 ~= nil then
						local ImageBandRequiresAnEndTimestampDelta = assert(nil, "image band requires an end timestamp") - EnteredAtMs6
						Band50.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
						
						if Band50.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
							Band50.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
						end
						Band50.enteredAtMs = nil
					end
				elseif EnteredAtMs6 ~= nil or Band50.pendingContinuity then
					Band50.cumulativeMs += CurrentContinuousMs
					
					if Band50.maxContinuousMs < CurrentContinuousMs then
						Band50.maxContinuousMs = CurrentContinuousMs
					end
					Band50.enteredAtMs = nil
					Band50.currentContinuousMs = 0
					Band50.pendingContinuity = false
				end
			else
				local EnteredAtMs7 = Band50.enteredAtMs
				local CurrentContinuousMs3 = Band50.currentContinuousMs
				
				if CurrentContinuousMs3 == nil then
					if EnteredAtMs7 ~= nil then
						local ImageBandRequiresAnEndTimestampDelta1 = assert(nil, "image band requires an end timestamp") - EnteredAtMs7
						Band50.cumulativeMs += ImageBandRequiresAnEndTimestampDelta1
						
						if Band50.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta1 then
							Band50.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta1
						end
						Band50.enteredAtMs = nil
					end
				elseif EnteredAtMs7 ~= nil or Band50.pendingContinuity then
					Band50.cumulativeMs += CurrentContinuousMs3
					
					if Band50.maxContinuousMs < CurrentContinuousMs3 then
						Band50.maxContinuousMs = CurrentContinuousMs3
					end
					Band50.enteredAtMs = nil
					Band50.currentContinuousMs = 0
					Band50.pendingContinuity = false
				end
			end
			local Band100 = self._band100
			
			if Band100.pendingContinuity then
				local EnteredAtMs8 = Band100.enteredAtMs
				local CurrentContinuousMs = Band100.currentContinuousMs
				
				if CurrentContinuousMs == nil then
					if EnteredAtMs8 ~= nil then
						local ImageBandRequiresAnEndTimestampDelta = assert(nil, "image band requires an end timestamp") - EnteredAtMs8
						Band100.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
						
						if Band100.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
							Band100.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
						end
						Band100.enteredAtMs = nil
					end
				elseif EnteredAtMs8 ~= nil or Band100.pendingContinuity then
					Band100.cumulativeMs += CurrentContinuousMs
					
					if Band100.maxContinuousMs < CurrentContinuousMs then
						Band100.maxContinuousMs = CurrentContinuousMs
					end
					Band100.enteredAtMs = nil
					Band100.currentContinuousMs = 0
					Band100.pendingContinuity = false
				end
			else
				local EnteredAtMs9 = Band100.enteredAtMs
				local CurrentContinuousMs4 = Band100.currentContinuousMs
				
				if CurrentContinuousMs4 == nil then
					if EnteredAtMs9 ~= nil then
						local ImageBandRequiresAnEndTimestampDelta = assert(nil, "image band requires an end timestamp") - EnteredAtMs9
						Band100.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
						
						if Band100.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
							Band100.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
						end
						Band100.enteredAtMs = nil
					end
				elseif EnteredAtMs9 ~= nil or Band100.pendingContinuity then
					Band100.cumulativeMs += CurrentContinuousMs4
					
					if Band100.maxContinuousMs < CurrentContinuousMs4 then
						Band100.maxContinuousMs = CurrentContinuousMs4
					end
					Band100.enteredAtMs = nil
					Band100.currentContinuousMs = 0
					Band100.pendingContinuity = false
				end
			end
			if InGridBand50.pendingContinuity then
				local EnteredAtMs10 = InGridBand50.enteredAtMs
				local CurrentContinuousMs = InGridBand50.currentContinuousMs
				
				if CurrentContinuousMs == nil then
					if EnteredAtMs10 ~= nil then
						local ImageBandRequiresAnEndTimestampDelta2 = assert(nil, "image band requires an end timestamp") - EnteredAtMs10
						InGridBand50.cumulativeMs += ImageBandRequiresAnEndTimestampDelta2
						
						if InGridBand50.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta2 then
							InGridBand50.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta2
						end
						InGridBand50.enteredAtMs = nil
					end
				elseif EnteredAtMs10 ~= nil or InGridBand50.pendingContinuity then
					InGridBand50.cumulativeMs += CurrentContinuousMs
					
					if InGridBand50.maxContinuousMs < CurrentContinuousMs then
						InGridBand50.maxContinuousMs = CurrentContinuousMs
					end
					InGridBand50.enteredAtMs = nil
					InGridBand50.currentContinuousMs = 0
					InGridBand50.pendingContinuity = false
				end
			else
				local EnteredAtMs11 = InGridBand50.enteredAtMs
				local CurrentContinuousMs5 = InGridBand50.currentContinuousMs
				
				if CurrentContinuousMs5 == nil then
					if EnteredAtMs11 ~= nil then
						local ImageBandRequiresAnEndTimestampDelta = assert(nil, "image band requires an end timestamp") - EnteredAtMs11
						InGridBand50.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
						
						if InGridBand50.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
							InGridBand50.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
						end
						InGridBand50.enteredAtMs = nil
					end
				elseif EnteredAtMs11 ~= nil or InGridBand50.pendingContinuity then
					InGridBand50.cumulativeMs += CurrentContinuousMs5
					
					if InGridBand50.maxContinuousMs < CurrentContinuousMs5 then
						InGridBand50.maxContinuousMs = CurrentContinuousMs5
					end
					InGridBand50.enteredAtMs = nil
					InGridBand50.currentContinuousMs = 0
					InGridBand50.pendingContinuity = false
				end
			end
			if FullscreenBand50.pendingContinuity then
				local EnteredAtMs12 = FullscreenBand50.enteredAtMs
				local CurrentContinuousMs = FullscreenBand50.currentContinuousMs
				
				if CurrentContinuousMs == nil then
					if EnteredAtMs12 ~= nil then
						local ImageBandRequiresAnEndTimestampDelta = assert(nil, "image band requires an end timestamp") - EnteredAtMs12
						FullscreenBand50.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
						
						if FullscreenBand50.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
							FullscreenBand50.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
						end
						FullscreenBand50.enteredAtMs = nil
					end
				elseif EnteredAtMs12 ~= nil or FullscreenBand50.pendingContinuity then
					FullscreenBand50.cumulativeMs += CurrentContinuousMs
					
					if FullscreenBand50.maxContinuousMs < CurrentContinuousMs then
						FullscreenBand50.maxContinuousMs = CurrentContinuousMs
					end
					FullscreenBand50.enteredAtMs = nil
					FullscreenBand50.currentContinuousMs = 0
					FullscreenBand50.pendingContinuity = false
				end
			else
				local EnteredAtMs13 = FullscreenBand50.enteredAtMs
				local CurrentContinuousMs6 = FullscreenBand50.currentContinuousMs
				
				if CurrentContinuousMs6 == nil then
					if EnteredAtMs13 ~= nil then
						local ImageBandRequiresAnEndTimestampDelta = assert(nil, "image band requires an end timestamp") - EnteredAtMs13
						FullscreenBand50.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
						
						if FullscreenBand50.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
							FullscreenBand50.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
						end
						FullscreenBand50.enteredAtMs = nil
					end
				elseif EnteredAtMs13 ~= nil or FullscreenBand50.pendingContinuity then
					FullscreenBand50.cumulativeMs += CurrentContinuousMs6
					
					if FullscreenBand50.maxContinuousMs < CurrentContinuousMs6 then
						FullscreenBand50.maxContinuousMs = CurrentContinuousMs6
					end
					FullscreenBand50.enteredAtMs = nil
					FullscreenBand50.currentContinuousMs = 0
					FullscreenBand50.pendingContinuity = false
				end
			end
			Video.lastSampleMs = EnteredAtMs
			Video.lastSnapshot = nil
			
			return List, false, false
		else
			if LastSnapshot.videoLengthMs ~= nil then
				Video.lengthMs = LastSnapshot.videoLengthMs
			end
			local PlaybackPositionMs = LastSnapshot.playbackPositionMs
			local LoopCount = LastSnapshot.loopCount
			local EndedCount = LastSnapshot.endedCount or 0
			local EndedCount1 = if LastSnapshot1 then LastSnapshot1.endedCount or 0 else nil
			local PlaybackPositionMs1 = if LastSnapshot1 then LastSnapshot1.playbackPositionMs else nil
			local LoopCount1 = if LastSnapshot1 then LastSnapshot1.loopCount else nil
			local LengthMs: number = Video.lengthMs
			local Largest = nil
			
			if PlaybackPositionMs1 == nil or PlaybackPositionMs == nil or LoopCount1 == nil or LoopCount == nil then
				Largest = 0
			elseif LoopCount < LoopCount1 then
				Largest = 0
			else
				local LoopCountDelta = LoopCount - LoopCount1
				Largest = if LoopCountDelta == 0 then math.max(0, PlaybackPositionMs - PlaybackPositionMs1) elseif LengthMs == nil or LengthMs <= 0 then 0 else math.max(0, LoopCountDelta * LengthMs + PlaybackPositionMs - PlaybackPositionMs1)
			end
			local IsEndedCountBelow: boolean = EndedCount1 ~= nil and EndedCount < EndedCount1
			local IsEndedCountBelow1: boolean = EndedCount1 ~= nil and (not IsEndedCountBelow and EndedCount1 < EndedCount)
			local IsLoopCountBelow: boolean = LastSnapshot1 ~= nil and LastSnapshot1.loopCount < LoopCount or IsEndedCountBelow1
			local IsPlaying = LastSnapshot.isPlaying
			local IsPlaying1 = LastSnapshot1 ~= nil and LastSnapshot1.isPlaying and (Largest > 0 and (not IsEndedCountBelow and (IsPlaying or IsEndedCountBelow1)))
			local NoIsEndedCountBelow1: boolean = IsPlaying1 and (IsPlaying and not IsEndedCountBelow1)
			local EnteredAtMsDelta = if LastSampleMs == nil then 0 else EnteredAtMs - LastSampleMs
			local Smallest: number = if IsPlaying1 then math.min(EnteredAtMsDelta, Largest) else 0
			local HasLatchedGeometry: boolean = IsEndedCountBelow1 and (IsPlaying1 and _latchedGeometry ~= nil)
			local IsPlaying2 = IsPlaying or HasLatchedGeometry
			
			for _, value in { self._band30, self._band50, self._band100 } do
				updateVideoBand(value, IsPlaying1, IsPlaying2, LastRatio, LastRatio1, Smallest, EnteredAtMs)
			end
			local NoIsFullscreen: boolean = not IsFullscreen or InGridBand50.pendingContinuity == true
			updateVideoBand(InGridBand50, IsPlaying1 and NoIsFullscreen, IsPlaying2 and NoIsFullscreen, LastRatio, LastRatio1, Smallest, EnteredAtMs)
			local IsFullscreen1 = IsFullscreen or FullscreenBand50.pendingContinuity == true
			updateVideoBand(FullscreenBand50, IsPlaying1 and IsFullscreen1, IsPlaying2 and IsFullscreen1, LastRatio, LastRatio1, Smallest, EnteredAtMs)
			
			if IsPlaying1 then
				Video.cumulativePlaytimeMs += Smallest
				
				if LastSnapshot1 ~= nil and (LastSnapshot1 ~= nil and (LastSnapshot1.isPlaying and LastSnapshot1.audioLevel > 0) and (LastSnapshot ~= nil and (LastSnapshot.isPlaying and LastSnapshot.audioLevel > 0) or IsEndedCountBelow1)) then
					Video.cumulativeAudioPlaybackMs += Smallest
					Video.maxAudioLevel = math.max(Video.maxAudioLevel, LastSnapshot1.audioLevel, LastSnapshot.audioLevel)
					
					if LastRatio >= 1 and LastRatio1 >= 1 then
						Video.cumulative100PercentAudibleMs += Smallest
					end
				end
			end
			if (IsPlaying1 or IsLoopCountBelow) and _latchedGeometry ~= nil then
				local LengthMs1: number = Video.lengthMs
				local ClampedValue: number = if IsLoopCountBelow then 100 elseif LengthMs1 == nil or LengthMs1 <= 0 then 0 else math.clamp(PlaybackPositionMs / LengthMs1 * 100, 0, 100)
				for _, highestProgress in HighestProgresses do
					if (Video.highestProgress == nil or Video.highestProgress < highestProgress) and highestProgress <= ClampedValue then
						local VideoProgressMilestone = self:_buildVideoProgressMilestone(highestProgress, _latchedGeometry)
						
						if VideoProgressMilestone ~= nil then
							Video.highestProgress = highestProgress
							table.insert(List, VideoProgressMilestone)
						end
					end
				end
			end
			Video.lastSampleMs = EnteredAtMs
			Video.lastSnapshot = LastSnapshot
			
			return List, NoIsEndedCountBelow1, HasLatchedGeometry
		end
	end
end

function SponsoredAdViewabilityStateModule:transitionVideoSource(p1: number, p2)
	local Video = self._video
	local InGridBand50 = self._inGridBand50
	local FullscreenBand50 = self._fullscreenBand50
	
	if self._finalized or self._pausedAtMs ~= nil or Video == nil or InGridBand50 == nil or FullscreenBand50 == nil then return end
	local Largest = math.max(p1, Video.lastSampleMs or self.startTimestampMs)
	
	if p2 then
		for _, value in { self._band30, self._band50, self._band100 } do
			if value.enteredAtMs ~= nil then
				value.enteredAtMs = nil
				value.pendingContinuity = true
			end
		end
		if Video.isFullscreen then
			local EnteredAtMs = InGridBand50.enteredAtMs
			local CurrentContinuousMs = InGridBand50.currentContinuousMs
			
			if CurrentContinuousMs == nil then
				if EnteredAtMs ~= nil then
					local ImageBandRequiresAnEndTimestampDelta = assert(nil, "image band requires an end timestamp") - EnteredAtMs
					InGridBand50.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
					
					if InGridBand50.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
						InGridBand50.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
					end
					InGridBand50.enteredAtMs = nil
				end
			elseif EnteredAtMs ~= nil or InGridBand50.pendingContinuity then
				InGridBand50.cumulativeMs += CurrentContinuousMs
				
				if InGridBand50.maxContinuousMs < CurrentContinuousMs then
					InGridBand50.maxContinuousMs = CurrentContinuousMs
				end
				InGridBand50.enteredAtMs = nil
				InGridBand50.currentContinuousMs = 0
				InGridBand50.pendingContinuity = false
			end
			if FullscreenBand50.enteredAtMs ~= nil then
				FullscreenBand50.enteredAtMs = nil
				FullscreenBand50.pendingContinuity = true
			end
		else
			if InGridBand50.enteredAtMs ~= nil then
				InGridBand50.enteredAtMs = nil
				InGridBand50.pendingContinuity = true
			end
			local EnteredAtMs = FullscreenBand50.enteredAtMs
			local CurrentContinuousMs = FullscreenBand50.currentContinuousMs
			
			if CurrentContinuousMs == nil then
				if EnteredAtMs ~= nil then
					local ImageBandRequiresAnEndTimestampDelta = assert(nil, "image band requires an end timestamp") - EnteredAtMs
					FullscreenBand50.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
					
					if FullscreenBand50.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
						FullscreenBand50.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
					end
					FullscreenBand50.enteredAtMs = nil
				end
			elseif EnteredAtMs ~= nil or FullscreenBand50.pendingContinuity then
				FullscreenBand50.cumulativeMs += CurrentContinuousMs
				
				if FullscreenBand50.maxContinuousMs < CurrentContinuousMs then
					FullscreenBand50.maxContinuousMs = CurrentContinuousMs
				end
				FullscreenBand50.enteredAtMs = nil
				FullscreenBand50.currentContinuousMs = 0
				FullscreenBand50.pendingContinuity = false
			end
		end
	else
		for _, value1 in { self._band30, self._band50, self._band100 } do
			local EnteredAtMs1 = value1.enteredAtMs
			local CurrentContinuousMs1 = value1.currentContinuousMs
			
			if CurrentContinuousMs1 == nil then
				if EnteredAtMs1 ~= nil then
					local ImageBandRequiresAnEndTimestampDelta = assert(nil, "image band requires an end timestamp") - EnteredAtMs1
					value1.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
					
					if value1.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
						value1.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
					end
					value1.enteredAtMs = nil
				end
			elseif EnteredAtMs1 ~= nil or value1.pendingContinuity then
				value1.cumulativeMs += CurrentContinuousMs1
				
				if value1.maxContinuousMs < CurrentContinuousMs1 then
					value1.maxContinuousMs = CurrentContinuousMs1
				end
				value1.enteredAtMs = nil
				value1.currentContinuousMs = 0
				value1.pendingContinuity = false
			end
		end
		local EnteredAtMs2 = InGridBand50.enteredAtMs
		local CurrentContinuousMs2 = InGridBand50.currentContinuousMs
		
		if CurrentContinuousMs2 == nil then
			if EnteredAtMs2 ~= nil then
				local ImageBandRequiresAnEndTimestampDelta = assert(nil, "image band requires an end timestamp") - EnteredAtMs2
				InGridBand50.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
				
				if InGridBand50.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
					InGridBand50.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
				end
				InGridBand50.enteredAtMs = nil
			end
		elseif EnteredAtMs2 ~= nil or InGridBand50.pendingContinuity then
			InGridBand50.cumulativeMs += CurrentContinuousMs2
			
			if InGridBand50.maxContinuousMs < CurrentContinuousMs2 then
				InGridBand50.maxContinuousMs = CurrentContinuousMs2
			end
			InGridBand50.enteredAtMs = nil
			InGridBand50.currentContinuousMs = 0
			InGridBand50.pendingContinuity = false
		end
		local EnteredAtMs = FullscreenBand50.enteredAtMs
		local CurrentContinuousMs = FullscreenBand50.currentContinuousMs
		
		if CurrentContinuousMs == nil then
			if EnteredAtMs ~= nil then
				local ImageBandRequiresAnEndTimestampDelta = assert(nil, "image band requires an end timestamp") - EnteredAtMs
				FullscreenBand50.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
				
				if FullscreenBand50.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
					FullscreenBand50.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
				end
				FullscreenBand50.enteredAtMs = nil
			end
		elseif EnteredAtMs ~= nil or FullscreenBand50.pendingContinuity then
			FullscreenBand50.cumulativeMs += CurrentContinuousMs
			
			if FullscreenBand50.maxContinuousMs < CurrentContinuousMs then
				FullscreenBand50.maxContinuousMs = CurrentContinuousMs
			end
			FullscreenBand50.enteredAtMs = nil
			FullscreenBand50.currentContinuousMs = 0
			FullscreenBand50.pendingContinuity = false
		end
	end
	if not p2 then
		Video.lastSampleMs = nil
		Video.lastSnapshot = nil
	end
	Video.audioOnAtEvent = false
	self._lastSampleMs = Largest
	self._lastRatio = 0
	self._lastRealEstate = 0
end

function SponsoredAdViewabilityStateModule:pause(Largest: number)
	local HasVideo = self._video ~= nil
	
	if HasVideo then
		if self._finalized or self._pausedAtMs ~= nil then return end
		Largest = math.max(Largest, self._lastSampleMs or self.startTimestampMs)
	else
		assert(not self._finalized, "pause called after finalize")
		assert(self._pausedAtMs == nil, "pause called while already paused")
		assert((self._lastSampleMs or self.startTimestampMs) <= Largest, "pause timestamp precedes the last sample")
	end
	self:_accumulate(Largest, 0, nil)
	
	if HasVideo then
		local Video = self._video
		local Band30 = self._band30
		local EnteredAtMs = Band30.enteredAtMs
		local CurrentContinuousMs = Band30.currentContinuousMs
		
		if CurrentContinuousMs == nil then
			if EnteredAtMs ~= nil then
				local ImageBandRequiresAnEndTimestampDelta = assert(nil, "image band requires an end timestamp") - EnteredAtMs
				Band30.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
				
				if Band30.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
					Band30.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
				end
				Band30.enteredAtMs = nil
			end
		elseif EnteredAtMs ~= nil or Band30.pendingContinuity then
			Band30.cumulativeMs += CurrentContinuousMs
			
			if Band30.maxContinuousMs < CurrentContinuousMs then
				Band30.maxContinuousMs = CurrentContinuousMs
			end
			Band30.enteredAtMs = nil
			Band30.currentContinuousMs = 0
			Band30.pendingContinuity = false
		end
		local Band50 = self._band50
		local EnteredAtMs2 = Band50.enteredAtMs
		local CurrentContinuousMs2 = Band50.currentContinuousMs
		
		if CurrentContinuousMs2 == nil then
			if EnteredAtMs2 ~= nil then
				local ImageBandRequiresAnEndTimestampDelta = assert(nil, "image band requires an end timestamp") - EnteredAtMs2
				Band50.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
				
				if Band50.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
					Band50.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
				end
				Band50.enteredAtMs = nil
			end
		elseif EnteredAtMs2 ~= nil or Band50.pendingContinuity then
			Band50.cumulativeMs += CurrentContinuousMs2
			
			if Band50.maxContinuousMs < CurrentContinuousMs2 then
				Band50.maxContinuousMs = CurrentContinuousMs2
			end
			Band50.enteredAtMs = nil
			Band50.currentContinuousMs = 0
			Band50.pendingContinuity = false
		end
		local Band100 = self._band100
		local EnteredAtMs1 = Band100.enteredAtMs
		local CurrentContinuousMs1 = Band100.currentContinuousMs
		
		if CurrentContinuousMs1 == nil then
			if EnteredAtMs1 ~= nil then
				local ImageBandRequiresAnEndTimestampDelta = assert(nil, "image band requires an end timestamp") - EnteredAtMs1
				Band100.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
				
				if Band100.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
					Band100.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
				end
				Band100.enteredAtMs = nil
			end
		elseif EnteredAtMs1 ~= nil or Band100.pendingContinuity then
			Band100.cumulativeMs += CurrentContinuousMs1
			
			if Band100.maxContinuousMs < CurrentContinuousMs1 then
				Band100.maxContinuousMs = CurrentContinuousMs1
			end
			Band100.enteredAtMs = nil
			Band100.currentContinuousMs = 0
			Band100.pendingContinuity = false
		end
		local InGridBand50 = self._inGridBand50
		local FullscreenBand50 = self._fullscreenBand50
		
		if InGridBand50 ~= nil then
			local EnteredAtMs3 = InGridBand50.enteredAtMs
			local CurrentContinuousMs3 = InGridBand50.currentContinuousMs
			
			if CurrentContinuousMs3 == nil then
				if EnteredAtMs3 ~= nil then
					local ImageBandRequiresAnEndTimestampDelta = assert(nil, "image band requires an end timestamp") - EnteredAtMs3
					InGridBand50.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
					
					if InGridBand50.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
						InGridBand50.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
					end
					InGridBand50.enteredAtMs = nil
				end
			elseif EnteredAtMs3 ~= nil or InGridBand50.pendingContinuity then
				InGridBand50.cumulativeMs += CurrentContinuousMs3
				
				if InGridBand50.maxContinuousMs < CurrentContinuousMs3 then
					InGridBand50.maxContinuousMs = CurrentContinuousMs3
				end
				InGridBand50.enteredAtMs = nil
				InGridBand50.currentContinuousMs = 0
				InGridBand50.pendingContinuity = false
			end
		end
		if FullscreenBand50 ~= nil then
			local EnteredAtMs4 = FullscreenBand50.enteredAtMs
			local CurrentContinuousMs4 = FullscreenBand50.currentContinuousMs
			
			if CurrentContinuousMs4 == nil then
				if EnteredAtMs4 ~= nil then
					local ImageBandRequiresAnEndTimestampDelta1 = assert(nil, "image band requires an end timestamp") - EnteredAtMs4
					FullscreenBand50.cumulativeMs += ImageBandRequiresAnEndTimestampDelta1
					
					if FullscreenBand50.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta1 then
						FullscreenBand50.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta1
					end
					FullscreenBand50.enteredAtMs = nil
				end
			elseif EnteredAtMs4 ~= nil or FullscreenBand50.pendingContinuity then
				FullscreenBand50.cumulativeMs += CurrentContinuousMs4
				
				if FullscreenBand50.maxContinuousMs < CurrentContinuousMs4 then
					FullscreenBand50.maxContinuousMs = CurrentContinuousMs4
				end
				FullscreenBand50.enteredAtMs = nil
				FullscreenBand50.currentContinuousMs = 0
				FullscreenBand50.pendingContinuity = false
			end
		end
		Video.lastSampleMs = nil
		Video.lastSnapshot = nil
		Video.audioOnAtEvent = false
	else
		local Band30_1 = self._band30
		local Largest1: number = Largest
		local EnteredAtMs1 = Band30_1.enteredAtMs
		local CurrentContinuousMs1 = Band30_1.currentContinuousMs
		
		if CurrentContinuousMs1 == nil then
			if EnteredAtMs1 ~= nil then
				local ImageBandRequiresAnEndTimestampDelta2 = assert(Largest1, "image band requires an end timestamp") - EnteredAtMs1
				Band30_1.cumulativeMs += ImageBandRequiresAnEndTimestampDelta2
				
				if Band30_1.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta2 then
					Band30_1.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta2
				end
				Band30_1.enteredAtMs = nil
			end
		elseif EnteredAtMs1 ~= nil or Band30_1.pendingContinuity then
			Band30_1.cumulativeMs += CurrentContinuousMs1
			
			if Band30_1.maxContinuousMs < CurrentContinuousMs1 then
				Band30_1.maxContinuousMs = CurrentContinuousMs1
			end
			Band30_1.enteredAtMs = nil
			Band30_1.currentContinuousMs = 0
			Band30_1.pendingContinuity = false
		end
		local Band50 = self._band50
		local Largest2: number = Largest
		local EnteredAtMs = Band50.enteredAtMs
		local CurrentContinuousMs = Band50.currentContinuousMs
		
		if CurrentContinuousMs == nil then
			if EnteredAtMs ~= nil then
				local ImageBandRequiresAnEndTimestampDelta3 = assert(Largest2, "image band requires an end timestamp") - EnteredAtMs
				Band50.cumulativeMs += ImageBandRequiresAnEndTimestampDelta3
				
				if Band50.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta3 then
					Band50.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta3
				end
				Band50.enteredAtMs = nil
			end
		elseif EnteredAtMs ~= nil or Band50.pendingContinuity then
			Band50.cumulativeMs += CurrentContinuousMs
			
			if Band50.maxContinuousMs < CurrentContinuousMs then
				Band50.maxContinuousMs = CurrentContinuousMs
			end
			Band50.enteredAtMs = nil
			Band50.currentContinuousMs = 0
			Band50.pendingContinuity = false
		end
		local Band100 = self._band100
		local Largest3: number = Largest
		local EnteredAtMs3 = Band100.enteredAtMs
		local CurrentContinuousMs3 = Band100.currentContinuousMs
		
		if CurrentContinuousMs3 == nil then
			if EnteredAtMs3 ~= nil then
				local ImageBandRequiresAnEndTimestampDelta = assert(Largest3, "image band requires an end timestamp") - EnteredAtMs3
				Band100.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
				
				if Band100.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
					Band100.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
				end
				Band100.enteredAtMs = nil
			end
		elseif EnteredAtMs3 ~= nil or Band100.pendingContinuity then
			Band100.cumulativeMs += CurrentContinuousMs3
			
			if Band100.maxContinuousMs < CurrentContinuousMs3 then
				Band100.maxContinuousMs = CurrentContinuousMs3
			end
			Band100.enteredAtMs = nil
			Band100.currentContinuousMs = 0
			Band100.pendingContinuity = false
		end
	end
	self._pausedAtMs = Largest
end

function SponsoredAdViewabilityStateModule:resume(_lastSampleMs: number)
	local PausedAtMs: number = self._pausedAtMs
	
	if self._video ~= nil then
		if self._finalized or PausedAtMs == nil then return end
		_lastSampleMs = math.max(_lastSampleMs, PausedAtMs)
	else
		assert(not self._finalized, "resume called after finalize")
		assert(PausedAtMs ~= nil, "resume called while not paused")
		assert(PausedAtMs <= _lastSampleMs, "resume timestamp precedes pause")
	end
	self._pausedDurationMs += _lastSampleMs - PausedAtMs
	self._pausedAtMs = nil
	self._lastSampleMs = _lastSampleMs
	self._lastRatio = 0
	self._lastRealEstate = 0
end

function SponsoredAdViewabilityStateModule:_advance_deprecated(EnteredAtMs, LastRatio, _latchedGeometry)
	-- upvalues: MilestoneLabels (copy)
	assert(not self._finalized, "advance called after finalize")
	assert(self._pausedAtMs == nil, "advance called while paused")
	local t = {}
	
	if _latchedGeometry ~= nil then
		self:_classifyDisplayOnce(_latchedGeometry.adSize)
		self._latchedGeometry = _latchedGeometry
	end
	self:_accumulate(EnteredAtMs, LastRatio, _latchedGeometry)
	local Band30 = self._band30
	
	if Band30.threshold <= LastRatio then
		if Band30.enteredAtMs == nil then
			Band30.enteredAtMs = EnteredAtMs
		end
	else
		local EnteredAtMs1 = Band30.enteredAtMs
		local CurrentContinuousMs = Band30.currentContinuousMs
		
		if CurrentContinuousMs == nil then
			if EnteredAtMs1 ~= nil then
				local ImageBandRequiresAnEndTimestampDelta = assert(EnteredAtMs, "image band requires an end timestamp") - EnteredAtMs1
				Band30.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
				
				if Band30.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
					Band30.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
				end
				Band30.enteredAtMs = nil
			end
		elseif EnteredAtMs1 ~= nil or Band30.pendingContinuity then
			Band30.cumulativeMs += CurrentContinuousMs
			
			if Band30.maxContinuousMs < CurrentContinuousMs then
				Band30.maxContinuousMs = CurrentContinuousMs
			end
			Band30.enteredAtMs = nil
			Band30.currentContinuousMs = 0
			Band30.pendingContinuity = false
		end
	end
	local Band50 = self._band50
	
	if Band50.threshold <= LastRatio then
		if Band50.enteredAtMs == nil then
			Band50.enteredAtMs = EnteredAtMs
		end
	else
		local EnteredAtMs2 = Band50.enteredAtMs
		local CurrentContinuousMs = Band50.currentContinuousMs
		
		if CurrentContinuousMs == nil then
			if EnteredAtMs2 ~= nil then
				local ImageBandRequiresAnEndTimestampDelta = assert(EnteredAtMs, "image band requires an end timestamp") - EnteredAtMs2
				Band50.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
				
				if Band50.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
					Band50.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
				end
				Band50.enteredAtMs = nil
			end
		elseif EnteredAtMs2 ~= nil or Band50.pendingContinuity then
			Band50.cumulativeMs += CurrentContinuousMs
			
			if Band50.maxContinuousMs < CurrentContinuousMs then
				Band50.maxContinuousMs = CurrentContinuousMs
			end
			Band50.enteredAtMs = nil
			Band50.currentContinuousMs = 0
			Band50.pendingContinuity = false
		end
	end
	local Band100 = self._band100
	
	if Band100.threshold <= LastRatio then
		if Band100.enteredAtMs == nil then
			Band100.enteredAtMs = EnteredAtMs
		end
	else
		local EnteredAtMs3 = Band100.enteredAtMs
		local CurrentContinuousMs = Band100.currentContinuousMs
		
		if CurrentContinuousMs == nil then
			if EnteredAtMs3 ~= nil then
				local ImageBandRequiresAnEndTimestampDelta = assert(EnteredAtMs, "image band requires an end timestamp") - EnteredAtMs3
				Band100.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
				
				if Band100.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
					Band100.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
				end
				Band100.enteredAtMs = nil
			end
		elseif EnteredAtMs3 ~= nil or Band100.pendingContinuity then
			Band100.cumulativeMs += CurrentContinuousMs
			
			if Band100.maxContinuousMs < CurrentContinuousMs then
				Band100.maxContinuousMs = CurrentContinuousMs
			end
			Band100.enteredAtMs = nil
			Band100.currentContinuousMs = 0
			Band100.pendingContinuity = false
		end
	end
	if _latchedGeometry == nil then
		return t
	end
	local DisplayLabel = self._displayLabel
	
	if DisplayLabel ~= nil then
		self:_tryFire(if DisplayLabel == MilestoneLabels.IabDisplayLarge then self._band30 else self._band50, DisplayLabel, EnteredAtMs, _latchedGeometry, t)
	end
	self:_tryFire(self._band100, MilestoneLabels.FullView, EnteredAtMs, _latchedGeometry, t)
	
	return t
end

function SponsoredAdViewabilityStateModule:advance(EnteredAtMs, LastRatio, _latchedGeometry, LastSnapshot, Enabled)
	-- upvalues: MilestoneLabels (copy)
	if self._video == nil then
		return self:_advance_deprecated(EnteredAtMs, LastRatio, _latchedGeometry)
	end
	local t = {}
	
	if self._finalized or self._pausedAtMs ~= nil or EnteredAtMs < (self._lastSampleMs or self.startTimestampMs) then
		return t, {}
	end
	if _latchedGeometry ~= nil then
		self._latchedGeometry = _latchedGeometry
	end
	local LastRatio1 = self._lastRatio
	self:_accumulate(EnteredAtMs, LastRatio, _latchedGeometry)
	local AdvanceVideoResult, AdvanceVideoResult2, AdvanceVideoResult3 = self:_advanceVideo(EnteredAtMs, LastRatio1, LastRatio, _latchedGeometry, LastSnapshot, Enabled == true)
	
	if _latchedGeometry == nil then
		return t, AdvanceVideoResult
	end
	if AdvanceVideoResult2 or AdvanceVideoResult3 then
		self:_tryFire(self._band50, MilestoneLabels.IabVideoStandard, EnteredAtMs, _latchedGeometry, t, 2000)
		self:_tryFire(self._band100, MilestoneLabels.FullViewVideo, EnteredAtMs, _latchedGeometry, t, 1000)
	end
	if AdvanceVideoResult3 then
		local Band30 = self._band30
		local EnteredAtMs1 = Band30.enteredAtMs
		local CurrentContinuousMs = Band30.currentContinuousMs
		
		if CurrentContinuousMs == nil then
			if EnteredAtMs1 ~= nil then
				local ImageBandRequiresAnEndTimestampDelta = assert(nil, "image band requires an end timestamp") - EnteredAtMs1
				Band30.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
				
				if Band30.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
					Band30.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
				end
				Band30.enteredAtMs = nil
			end
		elseif EnteredAtMs1 ~= nil or Band30.pendingContinuity then
			Band30.cumulativeMs += CurrentContinuousMs
			
			if Band30.maxContinuousMs < CurrentContinuousMs then
				Band30.maxContinuousMs = CurrentContinuousMs
			end
			Band30.enteredAtMs = nil
			Band30.currentContinuousMs = 0
			Band30.pendingContinuity = false
		end
		local Band50 = self._band50
		local EnteredAtMs2 = Band50.enteredAtMs
		local CurrentContinuousMs1 = Band50.currentContinuousMs
		
		if CurrentContinuousMs1 == nil then
			if EnteredAtMs2 ~= nil then
				local ImageBandRequiresAnEndTimestampDelta1 = assert(nil, "image band requires an end timestamp") - EnteredAtMs2
				Band50.cumulativeMs += ImageBandRequiresAnEndTimestampDelta1
				
				if Band50.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta1 then
					Band50.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta1
				end
				Band50.enteredAtMs = nil
			end
		elseif EnteredAtMs2 ~= nil or Band50.pendingContinuity then
			Band50.cumulativeMs += CurrentContinuousMs1
			
			if Band50.maxContinuousMs < CurrentContinuousMs1 then
				Band50.maxContinuousMs = CurrentContinuousMs1
			end
			Band50.enteredAtMs = nil
			Band50.currentContinuousMs = 0
			Band50.pendingContinuity = false
		end
		local Band100 = self._band100
		local EnteredAtMs3 = Band100.enteredAtMs
		local CurrentContinuousMs2 = Band100.currentContinuousMs
		
		if CurrentContinuousMs2 == nil then
			if EnteredAtMs3 ~= nil then
				local ImageBandRequiresAnEndTimestampDelta = assert(nil, "image band requires an end timestamp") - EnteredAtMs3
				Band100.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
				
				if Band100.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
					Band100.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
				end
				Band100.enteredAtMs = nil
			end
		elseif EnteredAtMs3 ~= nil or Band100.pendingContinuity then
			Band100.cumulativeMs += CurrentContinuousMs2
			
			if Band100.maxContinuousMs < CurrentContinuousMs2 then
				Band100.maxContinuousMs = CurrentContinuousMs2
			end
			Band100.enteredAtMs = nil
			Band100.currentContinuousMs = 0
			Band100.pendingContinuity = false
		end
		local InGridBand50 = self._inGridBand50
		local FullscreenBand50 = self._fullscreenBand50
		
		if InGridBand50 ~= nil then
			local EnteredAtMs4 = InGridBand50.enteredAtMs
			local CurrentContinuousMs3 = InGridBand50.currentContinuousMs
			
			if CurrentContinuousMs3 == nil then
				if EnteredAtMs4 ~= nil then
					local ImageBandRequiresAnEndTimestampDelta = assert(nil, "image band requires an end timestamp") - EnteredAtMs4
					InGridBand50.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
					
					if InGridBand50.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
						InGridBand50.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
					end
					InGridBand50.enteredAtMs = nil
				end
			elseif EnteredAtMs4 ~= nil or InGridBand50.pendingContinuity then
				InGridBand50.cumulativeMs += CurrentContinuousMs3
				
				if InGridBand50.maxContinuousMs < CurrentContinuousMs3 then
					InGridBand50.maxContinuousMs = CurrentContinuousMs3
				end
				InGridBand50.enteredAtMs = nil
				InGridBand50.currentContinuousMs = 0
				InGridBand50.pendingContinuity = false
			end
		end
		if FullscreenBand50 ~= nil then
			local EnteredAtMs5 = FullscreenBand50.enteredAtMs
			local CurrentContinuousMs4 = FullscreenBand50.currentContinuousMs
			
			if CurrentContinuousMs4 == nil then
				if EnteredAtMs5 ~= nil then
					local ImageBandRequiresAnEndTimestampDelta = assert(nil, "image band requires an end timestamp") - EnteredAtMs5
					FullscreenBand50.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
					
					if FullscreenBand50.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
						FullscreenBand50.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
					end
					FullscreenBand50.enteredAtMs = nil
				end
			elseif EnteredAtMs5 ~= nil or FullscreenBand50.pendingContinuity then
				FullscreenBand50.cumulativeMs += CurrentContinuousMs4
				
				if FullscreenBand50.maxContinuousMs < CurrentContinuousMs4 then
					FullscreenBand50.maxContinuousMs = CurrentContinuousMs4
				end
				FullscreenBand50.enteredAtMs = nil
				FullscreenBand50.currentContinuousMs = 0
				FullscreenBand50.pendingContinuity = false
			end
		end
	end
	return t, AdvanceVideoResult
end

function SponsoredAdViewabilityStateModule:_finalize_deprecated(ViewabilitySessionEndTimestampMs)
	assert(not self._finalized, "finalize called more than once on the same session")
	self._finalized = true
	self:_accumulate(ViewabilitySessionEndTimestampMs, self._lastRatio, self._latchedGeometry)
	local Band30 = self._band30
	local EnteredAtMs = Band30.enteredAtMs
	local CurrentContinuousMs = Band30.currentContinuousMs
	
	if CurrentContinuousMs == nil then
		if EnteredAtMs ~= nil then
			local ImageBandRequiresAnEndTimestampDelta = assert(ViewabilitySessionEndTimestampMs, "image band requires an end timestamp") - EnteredAtMs
			Band30.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
			
			if Band30.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
				Band30.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
			end
			Band30.enteredAtMs = nil
		end
	elseif EnteredAtMs ~= nil or Band30.pendingContinuity then
		Band30.cumulativeMs += CurrentContinuousMs
		
		if Band30.maxContinuousMs < CurrentContinuousMs then
			Band30.maxContinuousMs = CurrentContinuousMs
		end
		Band30.enteredAtMs = nil
		Band30.currentContinuousMs = 0
		Band30.pendingContinuity = false
	end
	local Band50 = self._band50
	local EnteredAtMs1 = Band50.enteredAtMs
	local CurrentContinuousMs1 = Band50.currentContinuousMs
	
	if CurrentContinuousMs1 == nil then
		if EnteredAtMs1 ~= nil then
			local ImageBandRequiresAnEndTimestampDelta = assert(ViewabilitySessionEndTimestampMs, "image band requires an end timestamp") - EnteredAtMs1
			Band50.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
			
			if Band50.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
				Band50.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
			end
			Band50.enteredAtMs = nil
		end
	elseif EnteredAtMs1 ~= nil or Band50.pendingContinuity then
		Band50.cumulativeMs += CurrentContinuousMs1
		
		if Band50.maxContinuousMs < CurrentContinuousMs1 then
			Band50.maxContinuousMs = CurrentContinuousMs1
		end
		Band50.enteredAtMs = nil
		Band50.currentContinuousMs = 0
		Band50.pendingContinuity = false
	end
	local Band100 = self._band100
	local EnteredAtMs2 = Band100.enteredAtMs
	local CurrentContinuousMs2 = Band100.currentContinuousMs
	
	if CurrentContinuousMs2 == nil then
		if EnteredAtMs2 ~= nil then
			local ImageBandRequiresAnEndTimestampDelta = assert(ViewabilitySessionEndTimestampMs, "image band requires an end timestamp") - EnteredAtMs2
			Band100.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
			
			if Band100.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
				Band100.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
			end
			Band100.enteredAtMs = nil
		end
	elseif EnteredAtMs2 ~= nil or Band100.pendingContinuity then
		Band100.cumulativeMs += CurrentContinuousMs2
		
		if Band100.maxContinuousMs < CurrentContinuousMs2 then
			Band100.maxContinuousMs = CurrentContinuousMs2
		end
		Band100.enteredAtMs = nil
		Band100.currentContinuousMs = 0
		Band100.pendingContinuity = false
	end
	local VisibleWeightedMs: number = self._visibleWeightedMs
	local LatchedGeometry = self._latchedGeometry
	local PausedDurationMs = self._pausedDurationMs
	local PausedAtMs = self._pausedAtMs
	
	if PausedAtMs ~= nil then
		assert(PausedAtMs <= ViewabilitySessionEndTimestampMs, "session end precedes pause")
		PausedDurationMs += ViewabilitySessionEndTimestampMs - PausedAtMs
	end
	return {
		geometry = if LatchedGeometry == nil then {
			adSize = Vector2.zero,
			viewportBounds = { min = Vector2.zero, max = Vector2.zero }
		} else {
			adSize = LatchedGeometry.adSize,
			viewportBounds = {
				min = LatchedGeometry.viewportBounds.min,
				max = LatchedGeometry.viewportBounds.max
			}
		},
		viewabilitySessionStartTimestampMs = self.startTimestampMs,
		viewabilitySessionEndTimestampMs = ViewabilitySessionEndTimestampMs,
		dwellDurationMs = ViewabilitySessionEndTimestampMs - self.startTimestampMs - PausedDurationMs,
		cumulative30PercentInViewDurationMs = self._band30.cumulativeMs,
		cumulative50PercentInViewDurationMs = self._band50.cumulativeMs,
		cumulative100PercentInViewDurationMs = self._band100.cumulativeMs,
		maxContinuous30PercentInViewDurationMs = self._band30.maxContinuousMs,
		maxContinuous50PercentInViewDurationMs = self._band50.maxContinuousMs,
		maxContinuous100PercentInViewDurationMs = self._band100.maxContinuousMs,
		averagePercentSeen = if VisibleWeightedMs > 0 then self._percentWeightedSum / VisibleWeightedMs else 0,
		minPercentSeen = self._minPercentSeen or 0,
		maxPercentSeen = self._maxPercentSeen or 0,
		averageOnScreenRealEstate = if VisibleWeightedMs > 0 then self._realEstateWeightedSum / VisibleWeightedMs else 0
	}
end

function SponsoredAdViewabilityStateModule:finalize(ViewabilitySessionEndTimestampMs: number)
	-- upvalues: copyGeometry (copy)
	if self._video == nil then
		return self:_finalize_deprecated(ViewabilitySessionEndTimestampMs)
	end
	if self._finalized then
		return self._terminalSnapshot
	end
	local Video = self._video
	local InGridBand50 = self._inGridBand50
	local FullscreenBand50 = self._fullscreenBand50
	local Largest = math.max(ViewabilitySessionEndTimestampMs, self.startTimestampMs, self._lastSampleMs or self.startTimestampMs, self._pausedAtMs or self.startTimestampMs)
	
	if Video == nil or InGridBand50 == nil or FullscreenBand50 == nil then
		local Finalize_deprecatedResult = self:_finalize_deprecated(Largest)
		self._terminalSnapshot = Finalize_deprecatedResult
		
		return Finalize_deprecatedResult
	end
	self._finalized = true
	self:_accumulate(Largest, self._lastRatio, self._latchedGeometry)
	local Band30 = self._band30
	local EnteredAtMs = Band30.enteredAtMs
	local CurrentContinuousMs = Band30.currentContinuousMs
	
	if CurrentContinuousMs == nil then
		if EnteredAtMs ~= nil then
			local ImageBandRequiresAnEndTimestampDelta = assert(nil, "image band requires an end timestamp") - EnteredAtMs
			Band30.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
			
			if Band30.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
				Band30.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
			end
			Band30.enteredAtMs = nil
		end
	elseif EnteredAtMs ~= nil or Band30.pendingContinuity then
		Band30.cumulativeMs += CurrentContinuousMs
		
		if Band30.maxContinuousMs < CurrentContinuousMs then
			Band30.maxContinuousMs = CurrentContinuousMs
		end
		Band30.enteredAtMs = nil
		Band30.currentContinuousMs = 0
		Band30.pendingContinuity = false
	end
	local Band50 = self._band50
	local EnteredAtMs1 = Band50.enteredAtMs
	local CurrentContinuousMs1 = Band50.currentContinuousMs
	
	if CurrentContinuousMs1 == nil then
		if EnteredAtMs1 ~= nil then
			local ImageBandRequiresAnEndTimestampDelta = assert(nil, "image band requires an end timestamp") - EnteredAtMs1
			Band50.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
			
			if Band50.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
				Band50.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
			end
			Band50.enteredAtMs = nil
		end
	elseif EnteredAtMs1 ~= nil or Band50.pendingContinuity then
		Band50.cumulativeMs += CurrentContinuousMs1
		
		if Band50.maxContinuousMs < CurrentContinuousMs1 then
			Band50.maxContinuousMs = CurrentContinuousMs1
		end
		Band50.enteredAtMs = nil
		Band50.currentContinuousMs = 0
		Band50.pendingContinuity = false
	end
	local Band100 = self._band100
	local EnteredAtMs2 = Band100.enteredAtMs
	local CurrentContinuousMs2 = Band100.currentContinuousMs
	
	if CurrentContinuousMs2 == nil then
		if EnteredAtMs2 ~= nil then
			local ImageBandRequiresAnEndTimestampDelta = assert(nil, "image band requires an end timestamp") - EnteredAtMs2
			Band100.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
			
			if Band100.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
				Band100.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
			end
			Band100.enteredAtMs = nil
		end
	elseif EnteredAtMs2 ~= nil or Band100.pendingContinuity then
		Band100.cumulativeMs += CurrentContinuousMs2
		
		if Band100.maxContinuousMs < CurrentContinuousMs2 then
			Band100.maxContinuousMs = CurrentContinuousMs2
		end
		Band100.enteredAtMs = nil
		Band100.currentContinuousMs = 0
		Band100.pendingContinuity = false
	end
	local EnteredAtMs21 = InGridBand50.enteredAtMs
	local CurrentContinuousMs21 = InGridBand50.currentContinuousMs
	
	if CurrentContinuousMs21 == nil then
		if EnteredAtMs21 ~= nil then
			local ImageBandRequiresAnEndTimestampDelta = assert(nil, "image band requires an end timestamp") - EnteredAtMs21
			InGridBand50.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
			
			if InGridBand50.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
				InGridBand50.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
			end
			InGridBand50.enteredAtMs = nil
		end
	elseif EnteredAtMs21 ~= nil or InGridBand50.pendingContinuity then
		InGridBand50.cumulativeMs += CurrentContinuousMs21
		
		if InGridBand50.maxContinuousMs < CurrentContinuousMs21 then
			InGridBand50.maxContinuousMs = CurrentContinuousMs21
		end
		InGridBand50.enteredAtMs = nil
		InGridBand50.currentContinuousMs = 0
		InGridBand50.pendingContinuity = false
	end
	local EnteredAtMs3 = FullscreenBand50.enteredAtMs
	local CurrentContinuousMs3 = FullscreenBand50.currentContinuousMs
	
	if CurrentContinuousMs3 == nil then
		if EnteredAtMs3 ~= nil then
			local ImageBandRequiresAnEndTimestampDelta = assert(nil, "image band requires an end timestamp") - EnteredAtMs3
			FullscreenBand50.cumulativeMs += ImageBandRequiresAnEndTimestampDelta
			
			if FullscreenBand50.maxContinuousMs < ImageBandRequiresAnEndTimestampDelta then
				FullscreenBand50.maxContinuousMs = ImageBandRequiresAnEndTimestampDelta
			end
			FullscreenBand50.enteredAtMs = nil
		end
	elseif EnteredAtMs3 ~= nil or FullscreenBand50.pendingContinuity then
		FullscreenBand50.cumulativeMs += CurrentContinuousMs3
		
		if FullscreenBand50.maxContinuousMs < CurrentContinuousMs3 then
			FullscreenBand50.maxContinuousMs = CurrentContinuousMs3
		end
		FullscreenBand50.enteredAtMs = nil
		FullscreenBand50.currentContinuousMs = 0
		FullscreenBand50.pendingContinuity = false
	end
	local VisibleWeightedMs: number = self._visibleWeightedMs
	local LatchedGeometry = self._latchedGeometry
	local PausedDurationMs = self._pausedDurationMs
	local PausedAtMs: number = self._pausedAtMs
	
	if PausedAtMs ~= nil then
		PausedDurationMs += Largest - PausedAtMs
	end
	local config = {
		geometry = if LatchedGeometry == nil then {
			adSize = Vector2.zero,
			viewportBounds = { min = Vector2.zero, max = Vector2.zero }
		} else copyGeometry(LatchedGeometry),
		viewabilitySessionStartTimestampMs = self.startTimestampMs,
		viewabilitySessionEndTimestampMs = Largest,
		dwellDurationMs = Largest - self.startTimestampMs - PausedDurationMs,
		cumulative30PercentInViewDurationMs = self._band30.cumulativeMs,
		cumulative50PercentInViewDurationMs = self._band50.cumulativeMs,
		cumulative100PercentInViewDurationMs = self._band100.cumulativeMs,
		maxContinuous30PercentInViewDurationMs = self._band30.maxContinuousMs,
		maxContinuous50PercentInViewDurationMs = self._band50.maxContinuousMs,
		maxContinuous100PercentInViewDurationMs = self._band100.maxContinuousMs,
		averagePercentSeen = if VisibleWeightedMs > 0 then self._percentWeightedSum / VisibleWeightedMs else 0,
		minPercentSeen = self._minPercentSeen or 0,
		maxPercentSeen = self._maxPercentSeen or 0,
		averageOnScreenRealEstate = if VisibleWeightedMs > 0 then self._realEstateWeightedSum / VisibleWeightedMs else 0,
		isFullScreen = Video.isFullscreen,
		videoProgress = Video.highestProgress,
		videoLengthMs = Video.lengthMs,
		videoCumulativePlaytimeMs = Video.cumulativePlaytimeMs,
		cumulativeAudioPlaybackDurationMs = Video.cumulativeAudioPlaybackMs,
		cumulative100PercentAudibleTimeMs = Video.cumulative100PercentAudibleMs,
		maxAudioLevel = Video.maxAudioLevel,
		audioOnAtEvent = if Video.highestProgress == nil then nil else Video.audioOnAtEvent,
		cumulativeInGridViewDurationMs = InGridBand50.cumulativeMs,
		cumulativeFullScreenViewDurationMs = FullscreenBand50.cumulativeMs
	}
	self._terminalSnapshot = config
	
	return config
end

SponsoredAdViewabilityStateModule.MilestoneLabels = MilestoneLabels
SponsoredAdViewabilityStateModule.MilestoneDurationMs = 1000

return SponsoredAdViewabilityStateModule