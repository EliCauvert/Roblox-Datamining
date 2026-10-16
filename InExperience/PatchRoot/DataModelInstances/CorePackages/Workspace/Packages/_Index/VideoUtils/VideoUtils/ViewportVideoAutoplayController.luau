local CollectionService = game:GetService("CollectionService")
local VideoUtils = script:FindFirstAncestor("VideoUtils")
local Parent = VideoUtils.Parent
local SignalsModule = require(Parent.Signals)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local ViewportVideoAutoplayModeModule = require(VideoUtils.ViewportVideoAutoplayMode)
local ViewportAutoplayVideoKeyAttributeModule = require(VideoUtils.ViewportAutoplayVideoKeyAttribute)
local UserIntentModeAutoplayCandidateTagModule = require(VideoUtils.UserIntentModeAutoplayCandidateTag)
local _ = require(VideoUtils.VideoPlaybackCoordinator)
local VideoEndReason = require(VideoUtils.Analytics.Enums).VideoEndReason
local GetIsInstanceVisibleModule = require(VideoUtils.getIsInstanceVisible)
local ViewportAutoplayCandidateTagModule = require(VideoUtils.ViewportAutoplayCandidateTag)
local ViewportAutoplayHelpersModule = require(VideoUtils.ViewportAutoplayHelpers)
local GetTileRowSpanFunction = ViewportAutoplayHelpersModule.getTileRowSpan
local ResolveOneByOneHeightFunction = ViewportAutoplayHelpersModule.resolveOneByOneHeight
local GetReadingOrderPositionsFunction = ViewportAutoplayHelpersModule.getReadingOrderPositions
local IsTilePinnedLeftFunction = ViewportAutoplayHelpersModule.isTilePinnedLeft
local ComputeRowAnchorOverridesFunction = ViewportAutoplayHelpersModule.computeRowAnchorOverrides
local FIntLuaAppGameTileVideoVisiblePercent = require(Parent.SharedFlags).FIntLuaAppGameTileVideoVisiblePercent
local FIntLuaAppOneByTwoTileVideoVisiblePercent = require(Parent.SharedFlags).FIntLuaAppOneByTwoTileVideoVisiblePercent
local FFlagLuaAppOneByTwoHoverIdleAutoplay = require(Parent.SharedFlags).FFlagLuaAppOneByTwoHoverIdleAutoplay
local FFlagLuaAppHoverIdleAutoplayDuringScroll = require(Parent.SharedFlags).FFlagLuaAppHoverIdleAutoplayDuringScroll
local FFlagLuaAppTileVideoKeepPlayingOnScroll = require(Parent.SharedFlags).FFlagLuaAppTileVideoKeepPlayingOnScroll
local FFlagLuaAppVideoAutoplayFeedElection = require(Parent.SharedFlags).FFlagLuaAppVideoAutoplayFeedElection
local FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback = require(Parent.SharedFlags).FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback
local FFlagLuaAppVideoAutoplayElectOnNewCandidateModule = require(script.Parent.FFlagLuaAppVideoAutoplayElectOnNewCandidate)
local LuaAppVideoAutoplayMaxDistanceToWinnerLinePercent = game:DefineFastInt("LuaAppVideoAutoplayMaxDistanceToWinnerLinePercent", 50)
local LuaAppVideoAutoplayScrollUpdateIntervalMs = game:DefineFastInt("LuaAppVideoAutoplayScrollUpdateIntervalMs", 100)
local config = {
	instance = nil,
	shouldUseDwell = true,
	isUserIntentWinner = not FFlagLuaAppOneByTwoHoverIdleAutoplay and nil
}

local function winnerStateEquals(p1, p2): boolean --[[ Line: 75 ]]
	-- upvalues: FFlagLuaAppOneByTwoHoverIdleAutoplay (copy)
	return p1.instance == p2.instance and p1.shouldUseDwell == p2.shouldUseDwell and (not FFlagLuaAppOneByTwoHoverIdleAutoplay or p1.isUserIntentWinner == p2.isUserIntentWinner)
end

local function _(AppBackgrounded): boolean --[[ Line: 81 | Named "shouldSuppressReelection" ]]
	-- upvalues: VideoEndReason (copy)
	return AppBackgrounded == VideoEndReason.TileClicked or (AppBackgrounded == VideoEndReason.ExperienceLaunched or AppBackgrounded == VideoEndReason.AppBackgrounded)
end

local function reportCandidateOverlap(Frame, Frame1: Frame, X) --[[ Line: 87 ]]
	-- upvalues: DiscoveryEventErrorLogger (copy)
	DiscoveryEventErrorLogger.reportError("ViewportAutoplayCandidateOverlap", "Two visible autoplay candidates share identical reading-order position and AbsolutePosition.X", {
		candidateA = Frame.Name,
		candidateB = Frame1.Name,
		absolutePositionX = X,
		absolutePositionY = Frame1.AbsolutePosition.Y,
		absoluteSizeX = Frame1.AbsoluteSize.X,
		absoluteSizeY = Frame1.AbsoluteSize.Y
	})
end

local ViewportVideoAutoplayController = {}
ViewportVideoAutoplayController.__index = ViewportVideoAutoplayController

function ViewportVideoAutoplayController.new(Coordinator, Enabled, Enabled1, UserIntentWithSelectiveAutoplay) --[[ Line: 130 ]]
	-- upvalues: SignalsModule (copy), config (copy), winnerStateEquals (copy), FFlagLuaAppOneByTwoHoverIdleAutoplay (copy), FFlagLuaAppVideoAutoplayFeedElection (copy), FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback (copy), ViewportVideoAutoplayController (copy), ViewportVideoAutoplayModeModule (copy), ViewportAutoplayVideoKeyAttributeModule (copy), VideoEndReason (copy)
	local Signal, Signal2 = SignalsModule.createSignal(config, winnerStateEquals)
	local self = setmetatable({
		isScrolling = false,
		pendingUpdateTask = nil,
		pendingAdsUpdateTask = nil,
		viewPortBounds = nil,
		feedScopeRef = nil,
		winnerLineOffsetFromTopBarPx = 0,
		adsPlaybackCoordinatorInfo = nil,
		coordinator = Coordinator,
		mode = if FFlagLuaAppOneByTwoHoverIdleAutoplay then UserIntentWithSelectiveAutoplay else nil,
		preferTallestWinner = if FFlagLuaAppVideoAutoplayFeedElection then Enabled == true else false,
		electOnNewCandidate = if FFlagLuaAppVideoAutoplayFeedElection then Enabled1 == true else false,
		playedVideoKeys = if FFlagLuaAppOneByTwoHoverIdleAutoplay then {} else nil,
		getWinnerState = Signal,
		setWinnerState = Signal2,
		isResettingPairedPlayback = not FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback and nil
	}, ViewportVideoAutoplayController)
	
	if FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback then
		function Coordinator.onPlaybackReset(p1, p2) --[[ Line: 157 ]]
			-- upvalues: self (copy), Coordinator (copy)
			self:_resetPairedPlayback(Coordinator, p1, p2)
		end
	end
	if FFlagLuaAppOneByTwoHoverIdleAutoplay and UserIntentWithSelectiveAutoplay == ViewportVideoAutoplayModeModule.UserIntentWithSelectiveAutoplay then
		self.playbackChangedConnection = Coordinator.changed:connect(function(Attribute, AppBackgrounded) --[[ Line: 164 ]]
			-- upvalues: self (copy), ViewportAutoplayVideoKeyAttributeModule (upval), config (upval), VideoEndReason (upval)
			local _Instance = self.getWinnerState(false).instance
			local Attribute1 = if _Instance then _Instance:GetAttribute(ViewportAutoplayVideoKeyAttributeModule) else nil
			
			if Attribute == nil then
				if _Instance ~= nil then
					self.setWinnerState(config)
				end
				if AppBackgrounded == VideoEndReason.TileClicked or (AppBackgrounded == VideoEndReason.ExperienceLaunched or AppBackgrounded == VideoEndReason.AppBackgrounded) then
					self:_cancelPendingUpdate()
					self:_cancelScrollUpdate()
					
					return
				else
					self:scheduleUpdateWinner("Y", nil, false)
					
					return
				end
			elseif Attribute1 ~= Attribute then
				self.setWinnerState(config)
			end
		end)
	end
	return self
end

function ViewportVideoAutoplayController:isUserIntentWithSelectiveAutoplay(): boolean --[[ Line: 189 ]]
	-- upvalues: ViewportVideoAutoplayModeModule (copy)
	return self.mode == ViewportVideoAutoplayModeModule.UserIntentWithSelectiveAutoplay
end

function ViewportVideoAutoplayController:setCandidateUserIntent(CurrentUserIntentCandidate, p1) --[[ Line: 196 ]]
	-- upvalues: FFlagLuaAppHoverIdleAutoplayDuringScroll (copy)
	if not self:isUserIntentWithSelectiveAutoplay() then return end
	if p1 then
		if self.currentUserIntentCandidate == CurrentUserIntentCandidate then return end
		self.currentUserIntentCandidate = CurrentUserIntentCandidate
	else
		if self.currentUserIntentCandidate ~= CurrentUserIntentCandidate then return end
		self.currentUserIntentCandidate = nil
	end
	if self.isScrolling and not FFlagLuaAppHoverIdleAutoplayDuringScroll then
		self:_scheduleScrollUpdate()
		
		return
	else
		self:scheduleUpdateWinner("Y", nil, false)
	end
end

function ViewportVideoAutoplayController:clearUserIntentCandidate() --[[ Line: 224 ]]
	self.currentUserIntentCandidate = nil
end

function ViewportVideoAutoplayController:requestWinnerPlayback(Object, Callback: (any) -> ()) --[[ Line: 229 ]]
	-- upvalues: ViewportAutoplayVideoKeyAttributeModule (copy)
	local WinnerState = self.getWinnerState(false)
	
	if WinnerState.instance ~= Object then return end
	if not self:isUserIntentWithSelectiveAutoplay() then
		Callback(WinnerState.shouldUseDwell)
		
		return
	end
	if WinnerState.isUserIntentWinner then
		Callback(false)
		
		return
	end
	local Attribute = Object:GetAttribute(ViewportAutoplayVideoKeyAttributeModule)
	
	if typeof(Attribute) == "string" and not self.playedVideoKeys[Attribute] and self.coordinator.playingVideoKey == nil then
		Callback(false)
		
		return
	end
end

function ViewportVideoAutoplayController:onVideoCompleted(CurrentUserIntentCandidate) --[[ Line: 259 ]]
	-- upvalues: ViewportAutoplayVideoKeyAttributeModule (copy), VideoEndReason (copy)
	if not self:isUserIntentWithSelectiveAutoplay() then return end
	local Attribute = CurrentUserIntentCandidate:GetAttribute(ViewportAutoplayVideoKeyAttributeModule)
	
	if typeof(Attribute) == "string" and self.coordinator.playingVideoKey == Attribute and self.currentUserIntentCandidate ~= CurrentUserIntentCandidate then
		self.playedVideoKeys[Attribute] = true
		self.coordinator:reset(VideoEndReason.Completed)
		
		return
	end
end

function ViewportVideoAutoplayController:getAdsPlaybackCoordinator() --[[ Line: 277 ]]
	local AdsPlaybackCoordinatorInfo = self.adsPlaybackCoordinatorInfo
	
	return if AdsPlaybackCoordinatorInfo then AdsPlaybackCoordinatorInfo.coordinator else nil
end

function ViewportVideoAutoplayController:getWinnerStateForCoordinator(Coordinator) --[[ Line: 284 ]]
	local AdsPlaybackCoordinatorInfo = self.adsPlaybackCoordinatorInfo
	
	return if AdsPlaybackCoordinatorInfo and AdsPlaybackCoordinatorInfo.coordinator == Coordinator then AdsPlaybackCoordinatorInfo.getWinnerState else self.getWinnerState
end

function ViewportVideoAutoplayController:completeAdsPlayback(p1, p2) --[[ Line: 293 ]]
	-- upvalues: VideoEndReason (copy)
	local AdsPlaybackCoordinatorInfo = self.adsPlaybackCoordinatorInfo
	
	if not AdsPlaybackCoordinatorInfo then return end
	AdsPlaybackCoordinatorInfo.completedVideoKeys[p2] = true
	AdsPlaybackCoordinatorInfo.handedOffInstances[p1] = true
	
	if AdsPlaybackCoordinatorInfo.getWinnerState(false).instance == p1 then
		AdsPlaybackCoordinatorInfo.coordinator:reset(VideoEndReason.Completed)
		AdsPlaybackCoordinatorInfo.setWinnerState({ instance = nil, shouldUseDwell = false })
	end
end

function ViewportVideoAutoplayController:_consumeAdsHandoff(p1): boolean --[[ Line: 311 ]]
	local AdsPlaybackCoordinatorInfo = self.adsPlaybackCoordinatorInfo
	
	if AdsPlaybackCoordinatorInfo and AdsPlaybackCoordinatorInfo.handedOffInstances[p1] then
		AdsPlaybackCoordinatorInfo.handedOffInstances[p1] = nil
		
		return true
	else
		return false
	end
end

function ViewportVideoAutoplayController:hasCompletedAdsPlayback(p1): boolean --[[ Line: 324 ]]
	local AdsPlaybackCoordinatorInfo = self.adsPlaybackCoordinatorInfo
	
	return AdsPlaybackCoordinatorInfo ~= nil and AdsPlaybackCoordinatorInfo.completedVideoKeys[p1] == true
end

function ViewportVideoAutoplayController:attachAdsPlaybackCoordinator(Coordinator, CandidateTag) --[[ Line: 332 ]]
	-- upvalues: SignalsModule (copy), config (copy), winnerStateEquals (copy)
	if not self.adsPlaybackCoordinatorInfo then
		local Signal, Signal2 = SignalsModule.createSignal(config, winnerStateEquals)
		self.adsPlaybackCoordinatorInfo = {
			coordinator = Coordinator,
			candidateTag = CandidateTag,
			getWinnerState = Signal,
			setWinnerState = Signal2,
			completedVideoKeys = {},
			handedOffInstances = setmetatable({}, { __mode = "k" })
		}
		
		function Coordinator.onPlaybackReset(p1, p2) --[[ Line: 350 ]]
			-- upvalues: self (copy), Coordinator (copy)
			self:_resetPairedPlayback(Coordinator, p1, p2)
		end
		
		return
	end
end

function ViewportVideoAutoplayController._hasUsableViewportBounds(p1): boolean --[[ Line: 355 ]]
	return if p1.viewPortBounds then p1.viewPortBounds.min.X < p1.viewPortBounds.max.X and p1.viewPortBounds.min.Y < p1.viewPortBounds.max.Y else false
end

function ViewportVideoAutoplayController:_maybeScheduleInitialWinnerUpdate() --[[ Line: 364 ]]
	-- upvalues: FFlagLuaAppVideoAutoplayFeedElection (copy)
	if self.getWinnerState(false).instance ~= nil or self.isScrolling then return end
	if not self:_hasUsableViewportBounds() then return end
	if FFlagLuaAppVideoAutoplayFeedElection then
		self:scheduleUpdateWinner("Y", nil, true, true)
		
		return
	else
		self:scheduleUpdateWinner("Y", nil, true)
	end
end

function ViewportVideoAutoplayController:onCandidateRegistered(Object) --[[ Line: 384 ]]
	-- upvalues: FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback (copy), FFlagLuaAppOneByTwoHoverIdleAutoplay (copy), FFlagLuaAppVideoAutoplayFeedElection (copy)
	if FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback and self:_consumeAdsHandoff(Object) then return end
	local Current = if self.feedScopeRef then self.feedScopeRef.current else nil
	
	if not Current or not Object:IsDescendantOf(Current) then return end
	if self.isScrolling then return end
	if not self:_hasUsableViewportBounds() then return end
	if FFlagLuaAppOneByTwoHoverIdleAutoplay and self:isUserIntentWithSelectiveAutoplay() then
		self:scheduleUpdateWinner("Y", nil, false)
		
		return
	end
	if self.coordinator.playingVideoKey ~= nil then return end
	if not FFlagLuaAppVideoAutoplayFeedElection then
		self:scheduleUpdateWinner("Y", nil, true)
		
		return
	end
	if self.getWinnerState(false).instance == nil then
		self:_maybeScheduleInitialWinnerUpdate()
		
		return
	end
	if self.pendingUpdateTask == nil then
		self.pendingUpdateTask = task.defer(function() --[[ Line: 428 ]]
			-- upvalues: self (copy)
			self.pendingUpdateTask = nil
			
			if self.isScrolling then return end
			if self.coordinator.playingVideoKey == nil then
				self:_updateWinner("Y", nil, true)
				
				return
			end
		end)
		
		return
	end
end

function ViewportVideoAutoplayController:forceScheduleInitialWinnerUpdate() --[[ Line: 445 ]]
	-- upvalues: FFlagLuaAppVideoAutoplayFeedElection (copy)
	self:_cancelPendingUpdate()
	
	if FFlagLuaAppVideoAutoplayFeedElection then
		self:scheduleUpdateWinner("Y", nil, true, true)
		
		return
	else
		self:scheduleUpdateWinner("Y", nil, true)
	end
end

function ViewportVideoAutoplayController:setViewPortBounds(ViewPortBounds) --[[ Line: 454 ]]
	-- upvalues: FFlagLuaAppOneByTwoHoverIdleAutoplay (copy), VideoEndReason (copy), FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback (copy)
	self.viewPortBounds = ViewPortBounds
	self:_maybeScheduleInitialWinnerUpdate()
	local WinnerState = self.getWinnerState(false)
	local WinnerStateInstance = WinnerState.instance
	
	if WinnerStateInstance ~= nil and not self.isScrolling and self:_hasUsableViewportBounds() then
		self:_cancelPendingUpdate()
		local v1 = nil
		local Y = nil
		
		if FFlagLuaAppOneByTwoHoverIdleAutoplay and self:isUserIntentWithSelectiveAutoplay() then
			Y, v45 = self:_selectUserIntentOrAutoplayWinner("Y", nil)
		else
			Y = self:_selectWinner("Y", nil)
		end
		local ShouldUseDwell = WinnerState.shouldUseDwell
		
		if Y ~= WinnerStateInstance then
			self.coordinator:reset(VideoEndReason.ViewportResized)
			ShouldUseDwell = true
		end
		self.setWinnerState({
			instance = Y,
			shouldUseDwell = ShouldUseDwell,
			isUserIntentWinner = if FFlagLuaAppOneByTwoHoverIdleAutoplay and self:isUserIntentWithSelectiveAutoplay() then v1 else nil
		})
	end
	if FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback then
		self:_refreshAdsWinnerForViewportChange()
	end
end

function ViewportVideoAutoplayController:setWinnerLineOffsetFromTopBarPx(WinnerLineOffsetFromTopBarPx) --[[ Line: 500 ]]
	self.winnerLineOffsetFromTopBarPx = WinnerLineOffsetFromTopBarPx
end

function ViewportVideoAutoplayController:setFeedScopeRef(FeedScopeRef) --[[ Line: 510 ]]
	self.feedScopeRef = FeedScopeRef
	self:_maybeScheduleInitialWinnerUpdate()
end

function ViewportVideoAutoplayController:_cancelPendingUpdate() --[[ Line: 516 ]]
	if self.pendingUpdateTask ~= nil then
		task.cancel(self.pendingUpdateTask)
		self.pendingUpdateTask = nil
	end
end

function ViewportVideoAutoplayController:_cancelPendingAdsUpdate() --[[ Line: 524 ]]
	if self.pendingAdsUpdateTask ~= nil then
		task.cancel(self.pendingAdsUpdateTask)
		self.pendingAdsUpdateTask = nil
	end
end

function ViewportVideoAutoplayController:_deferApplyAdsWinner() --[[ Line: 531 ]]
	-- upvalues: VideoEndReason (copy)
	self:_cancelPendingAdsUpdate()
	self.pendingAdsUpdateTask = task.defer(function() --[[ Line: 533 ]]
		-- upvalues: self (copy), VideoEndReason (upval)
		self.pendingAdsUpdateTask = nil
		
		if not self.isScrolling and self.adsPlaybackCoordinatorInfo then
			self:_applyAdsWinner(true, VideoEndReason.ExitViewport)
			
			return
		end
	end)
end

function ViewportVideoAutoplayController:_cancelScrollUpdate() --[[ Line: 544 ]]
	if self.scrollUpdateTask ~= nil then
		task.cancel(self.scrollUpdateTask)
		self.scrollUpdateTask = nil
	end
end

function ViewportVideoAutoplayController:_scheduleScrollUpdate() --[[ Line: 552 ]]
	-- upvalues: LuaAppVideoAutoplayScrollUpdateIntervalMs (copy), FFlagLuaAppHoverIdleAutoplayDuringScroll (copy)
	if self.scrollUpdateTask == nil and self.isScrolling and self:isUserIntentWithSelectiveAutoplay() then
		self.scrollUpdateTask = task.delay(LuaAppVideoAutoplayScrollUpdateIntervalMs / 1000, function() --[[ Line: 557 ]]
			-- upvalues: self (copy), FFlagLuaAppHoverIdleAutoplayDuringScroll (upval)
			self.scrollUpdateTask = nil
			
			if not self.isScrolling then return end
			self:_updateWinner("Y", nil, false)
			
			if FFlagLuaAppHoverIdleAutoplayDuringScroll then
				self:_scheduleScrollUpdate()
			end
		end)
		
		return
	end
end

function ViewportVideoAutoplayController:onScrollStart() --[[ Line: 571 ]]
	-- upvalues: FFlagLuaAppOneByTwoHoverIdleAutoplay (copy), FFlagLuaAppHoverIdleAutoplayDuringScroll (copy), FFlagLuaAppTileVideoKeepPlayingOnScroll (copy), VideoEndReason (copy), FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback (copy)
	self:_cancelPendingUpdate()
	self.isScrolling = true
	
	if FFlagLuaAppOneByTwoHoverIdleAutoplay and self:isUserIntentWithSelectiveAutoplay() then
		if FFlagLuaAppHoverIdleAutoplayDuringScroll then
			self:_scheduleScrollUpdate()
		end
		return
	elseif not FFlagLuaAppTileVideoKeepPlayingOnScroll then
		self.coordinator:reset(VideoEndReason.ScrollStart)
		self.setWinnerState({ instance = nil, shouldUseDwell = false })
		
		if FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback then
			self:_resetAdsPlayback(VideoEndReason.ScrollStart)
		end
	end
end

function ViewportVideoAutoplayController:onScrollSettled(p1, _, p2) --[[ Line: 596 ]]
	-- upvalues: FFlagLuaAppOneByTwoHoverIdleAutoplay (copy), FFlagLuaAppTileVideoKeepPlayingOnScroll (copy), VideoEndReason (copy), FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback (copy)
	self:_cancelPendingUpdate()
	self.isScrolling = false
	
	if FFlagLuaAppOneByTwoHoverIdleAutoplay then
		self:_cancelScrollUpdate()
	end
	if FFlagLuaAppOneByTwoHoverIdleAutoplay and self:isUserIntentWithSelectiveAutoplay() then
		self:_updateWinner(p1, p2, false)
		
		return
	end
	if FFlagLuaAppTileVideoKeepPlayingOnScroll then
		local _Instance = self.getWinnerState(false).instance
		local SelectWinnerResult = self:_selectWinner(p1, p2)
		
		if _Instance ~= SelectWinnerResult and _Instance ~= nil then
			self.coordinator:reset(VideoEndReason.ScrollSettled)
		end
		self.setWinnerState({ shouldUseDwell = false, instance = SelectWinnerResult })
		
		if FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback then
			self:_applyAdsWinner(false, VideoEndReason.ScrollSettled)
			
			return
		end
	else
		self:_updateWinner(p1, p2, false)
	end
end

function ViewportVideoAutoplayController:_resetPairedPlayback(Coordinator, ExperienceLaunched, p1) --[[ Line: 631 ]]
	-- upvalues: VideoEndReason (copy)
	if self.isResettingPairedPlayback or ExperienceLaunched ~= VideoEndReason.TileClicked and ExperienceLaunched ~= VideoEndReason.ExperienceLaunched then return end
	self.isResettingPairedPlayback = true
	self:_cancelPendingUpdate()
	self:_cancelPendingAdsUpdate()
	
	if Coordinator == self.coordinator then
		local AdsPlaybackCoordinatorInfo = self.adsPlaybackCoordinatorInfo
		
		if AdsPlaybackCoordinatorInfo then
			AdsPlaybackCoordinatorInfo.coordinator:reset(ExperienceLaunched, nil, p1, nil)
		end
	else
		self.coordinator:reset(ExperienceLaunched, nil, p1, nil)
	end
	self.isResettingPairedPlayback = false
end

function ViewportVideoAutoplayController:reset(p1) --[[ Line: 658 ]]
	-- upvalues: FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback (copy), FFlagLuaAppOneByTwoHoverIdleAutoplay (copy)
	if FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback then
		self:_resetOrganicPlayback(p1)
		self:_cancelPendingAdsUpdate()
		self:_resetAdsPlayback(p1)
		
		return
	end
	self:_cancelPendingUpdate()
	
	if FFlagLuaAppOneByTwoHoverIdleAutoplay then
		self:_cancelScrollUpdate()
	end
	self.isScrolling = false
	self.coordinator:reset(p1)
	self.setWinnerState({
		instance = nil,
		shouldUseDwell = false,
		isUserIntentWinner = (not FFlagLuaAppOneByTwoHoverIdleAutoplay or not self:isUserIntentWithSelectiveAutoplay()) and nil
	})
end

function ViewportVideoAutoplayController:_resetOrganicPlayback(p1) --[[ Line: 681 ]]
	-- upvalues: FFlagLuaAppOneByTwoHoverIdleAutoplay (copy)
	self:_cancelPendingUpdate()
	
	if FFlagLuaAppOneByTwoHoverIdleAutoplay then
		self:_cancelScrollUpdate()
	end
	self.isScrolling = false
	self.coordinator:reset(p1)
	self.setWinnerState({
		instance = nil,
		shouldUseDwell = false,
		isUserIntentWinner = (not FFlagLuaAppOneByTwoHoverIdleAutoplay or not self:isUserIntentWithSelectiveAutoplay()) and nil
	})
end

function ViewportVideoAutoplayController:resetIfActiveInstance(p1, p2) --[[ Line: 698 ]]
	-- upvalues: FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback (copy)
	if self.getWinnerState(false).instance == p1 then
		if FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback then
			self:_resetOrganicPlayback(p2)
		else
			self:reset(p2)
		end
		self:_maybeScheduleInitialWinnerUpdate()
		
		return
	elseif FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback then
		local AdsPlaybackCoordinatorInfo = self.adsPlaybackCoordinatorInfo
		
		if AdsPlaybackCoordinatorInfo and AdsPlaybackCoordinatorInfo.getWinnerState(false).instance == p1 then
			self:_resetAdsPlayback(p2)
			
			if not self.isScrolling and self:_hasUsableViewportBounds() then
				self:_deferApplyAdsWinner()
			end
		end
	end
end

function ViewportVideoAutoplayController:onAdsCandidateRegistered(Object) --[[ Line: 724 ]]
	if not self.adsPlaybackCoordinatorInfo then return end
	local Current = if self.feedScopeRef then self.feedScopeRef.current else nil
	
	if not Current or not Object:IsDescendantOf(Current) then return end
	if not self.isScrolling and self:_hasUsableViewportBounds() then
		self:_deferApplyAdsWinner()
		
		return
	end
end

function ViewportVideoAutoplayController:scheduleUpdateWinner(p1, p2, ShouldUseDwell, p3) --[[ Line: 746 ]]
	-- upvalues: FFlagLuaAppVideoAutoplayFeedElection (copy)
	if self.pendingUpdateTask == nil then
		self.pendingUpdateTask = task.defer(function() --[[ Line: 757 ]]
			-- upvalues: self (copy), p1 (copy), p2 (copy), ShouldUseDwell (copy), FFlagLuaAppVideoAutoplayFeedElection (upval), p3 (copy)
			self.pendingUpdateTask = nil
			
			if not self.isScrolling then
				self:_updateWinner(p1, p2, ShouldUseDwell, if FFlagLuaAppVideoAutoplayFeedElection then p3 else nil)
				
				return
			end
		end)
		
		return
	end
end

function ViewportVideoAutoplayController:_updateWinner(p1, p2, ShouldUseDwell, p3) --[[ Line: 774 ]]
	-- upvalues: FFlagLuaAppOneByTwoHoverIdleAutoplay (copy), ViewportAutoplayVideoKeyAttributeModule (copy), CollectionService (copy), UserIntentModeAutoplayCandidateTagModule (copy), VideoEndReason (copy), FFlagLuaAppVideoAutoplayFeedElection (copy), FFlagLuaAppVideoAutoplayElectOnNewCandidateModule (copy), FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback (copy)
	if FFlagLuaAppOneByTwoHoverIdleAutoplay and self:isUserIntentWithSelectiveAutoplay() then
		local WinnerState = self.getWinnerState(false)
		local WinnerStateInstance = WinnerState.instance
		local SelectUserIntentOrAutoplayWinnerResult, SelectUserIntentOrAutoplayWinnerResult2 = self:_selectUserIntentOrAutoplayWinner(p1, p2, p3)
		
		if SelectUserIntentOrAutoplayWinnerResult == WinnerStateInstance and SelectUserIntentOrAutoplayWinnerResult2 == WinnerState.isUserIntentWinner then return end
		local PlayingVideoKey = self.coordinator.playingVideoKey
		local Attribute = if SelectUserIntentOrAutoplayWinnerResult then SelectUserIntentOrAutoplayWinnerResult:GetAttribute(ViewportAutoplayVideoKeyAttributeModule) else nil
		local Attribute1 = if WinnerStateInstance then WinnerStateInstance:GetAttribute(ViewportAutoplayVideoKeyAttributeModule) else nil
		
		if PlayingVideoKey ~= nil and Attribute ~= PlayingVideoKey and (SelectUserIntentOrAutoplayWinnerResult2 or Attribute1 == PlayingVideoKey) then
			local HasTag = WinnerStateInstance ~= nil and CollectionService:HasTag(WinnerStateInstance, UserIntentModeAutoplayCandidateTagModule)
			self.coordinator:reset(if SelectUserIntentOrAutoplayWinnerResult2 then VideoEndReason.HoverTakeover elseif WinnerStateInstance and (not HasTag or typeof(Attribute1) == "string" and self.playedVideoKeys[Attribute1]) then VideoEndReason.Unhovered else VideoEndReason.ExitViewport)
		end
		self.setWinnerState({
			shouldUseDwell = false,
			instance = SelectUserIntentOrAutoplayWinnerResult,
			isUserIntentWinner = SelectUserIntentOrAutoplayWinnerResult2
		})
		
		return
	elseif FFlagLuaAppVideoAutoplayFeedElection then
		local _Instance = self.getWinnerState(false).instance
		local SelectWinnerResult = self:_selectWinner(p1, p2, p3)
		
		if (self.electOnNewCandidate or FFlagLuaAppVideoAutoplayElectOnNewCandidateModule) and (_Instance ~= nil and SelectWinnerResult ~= _Instance) then
			self.coordinator:reset(VideoEndReason.ExitViewport)
		end
		self.setWinnerState({
			instance = SelectWinnerResult,
			shouldUseDwell = ShouldUseDwell
		})
		
		if FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback then
			self:_applyAdsWinner(ShouldUseDwell, VideoEndReason.ExitViewport)
		end
		return
	else
		self.setWinnerState({
			instance = self:_selectWinner(p1, p2),
			shouldUseDwell = ShouldUseDwell
		})
		
		if FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback then
			self:_applyAdsWinner(ShouldUseDwell, VideoEndReason.ExitViewport)
		end
	end
end

function ViewportVideoAutoplayController:_resetAdsPlayback(ScrollStart) --[[ Line: 848 ]]
	local AdsPlaybackCoordinatorInfo = self.adsPlaybackCoordinatorInfo
	
	if AdsPlaybackCoordinatorInfo then
		AdsPlaybackCoordinatorInfo.coordinator:reset(ScrollStart)
		AdsPlaybackCoordinatorInfo.setWinnerState({ instance = nil, shouldUseDwell = false })
		
		return
	end
end

function ViewportVideoAutoplayController:_refreshAdsWinnerForViewportChange() --[[ Line: 858 ]]
	-- upvalues: VideoEndReason (copy)
	local AdsPlaybackCoordinatorInfo = self.adsPlaybackCoordinatorInfo
	
	if not AdsPlaybackCoordinatorInfo or self.isScrolling or not self:_hasUsableViewportBounds() then return end
	local WinnerState = AdsPlaybackCoordinatorInfo.getWinnerState(false)
	local SelectAdsWinnerResult = self:_selectAdsWinner()
	local ShouldUseDwell = WinnerState.shouldUseDwell
	
	if SelectAdsWinnerResult ~= WinnerState.instance and WinnerState.instance ~= nil then
		AdsPlaybackCoordinatorInfo.coordinator:reset(VideoEndReason.ViewportResized)
		ShouldUseDwell = true
	end
	AdsPlaybackCoordinatorInfo.setWinnerState({
		instance = SelectAdsWinnerResult,
		shouldUseDwell = ShouldUseDwell
	})
end

function ViewportVideoAutoplayController:_applyAdsWinner(ShouldUseDwell, ExitViewport) --[[ Line: 875 ]]
	local AdsPlaybackCoordinatorInfo = self.adsPlaybackCoordinatorInfo
	
	if not AdsPlaybackCoordinatorInfo then return end
	local _Instance = AdsPlaybackCoordinatorInfo.getWinnerState(false).instance
	local SelectAdsWinnerResult = self:_selectAdsWinner()
	
	if SelectAdsWinnerResult ~= _Instance and _Instance ~= nil then
		AdsPlaybackCoordinatorInfo.coordinator:reset(ExitViewport)
	end
	AdsPlaybackCoordinatorInfo.setWinnerState({
		instance = SelectAdsWinnerResult,
		shouldUseDwell = ShouldUseDwell
	})
end

function ViewportVideoAutoplayController:_selectAdsWinner() --[[ Line: 894 ]]
	-- upvalues: CollectionService (copy), GetIsInstanceVisibleModule (copy), FIntLuaAppOneByTwoTileVideoVisiblePercent (copy), reportCandidateOverlap (copy)
	local AdsPlaybackCoordinatorInfo = self.adsPlaybackCoordinatorInfo
	local ViewPortBounds = self.viewPortBounds
	local Current = if self.feedScopeRef then self.feedScopeRef.current else nil
	
	if not AdsPlaybackCoordinatorInfo or not ViewPortBounds or not Current then
		return nil
	end
	local NewY = ViewPortBounds.min.Y + self.winnerLineOffsetFromTopBarPx
	local Largest = math.max(ViewPortBounds.max.X - ViewPortBounds.min.X, 1)
	local v1 = nil
	local Magnitude = 1e999
	local X = 1e999
	local Flag = false
	
	for _, Frame in CollectionService:GetTagged(AdsPlaybackCoordinatorInfo.candidateTag) do
		if Frame:IsA("GuiObject") and Frame:IsDescendantOf(Current) and GetIsInstanceVisibleModule(Frame, ViewPortBounds, FIntLuaAppOneByTwoTileVideoVisiblePercent) then
			local X1 = Frame.AbsolutePosition.X
			local Magnitude1 = math.abs(Frame.AbsolutePosition.Y + X1 / Largest * Frame.AbsoluteSize.Y - NewY)
			local Flag1 = false
			
			if Magnitude1 < Magnitude then
				Flag1 = true
			elseif Magnitude1 == Magnitude and X1 < X then
				Flag1 = true
			elseif Magnitude1 == Magnitude and X1 == X and not Flag and v1 then
				Flag = true
				reportCandidateOverlap(v1, Frame, X1)
			end
			if Flag1 then
				Magnitude = Magnitude1
				X = X1
				v1 = Frame
			end
		end
	end
	return v1
end

function ViewportVideoAutoplayController:_selectUserIntentOrAutoplayWinner(p1, p2, p3) --[[ Line: 952 ]]
	-- upvalues: FFlagLuaAppHoverIdleAutoplayDuringScroll (copy), UserIntentModeAutoplayCandidateTagModule (copy)
	local SelectUserIntentWinnerResult = self:_selectUserIntentWinner()
	
	if SelectUserIntentWinnerResult then
		return SelectUserIntentWinnerResult, true
	end
	local PlayingVideoKey = self.coordinator.playingVideoKey
	
	if PlayingVideoKey ~= nil then
		return self:_selectCurrentIdleWinner(PlayingVideoKey), false
	elseif self.isScrolling and not FFlagLuaAppHoverIdleAutoplayDuringScroll then
		return nil, false
	else
		return self:_selectWinner(p1, p2, p3, UserIntentModeAutoplayCandidateTagModule, true), false
	end
end

function ViewportVideoAutoplayController:_selectUserIntentWinner() --[[ Line: 976 ]]
	-- upvalues: CollectionService (copy), ViewportAutoplayCandidateTagModule (copy)
	local CurrentUserIntentCandidate = self.currentUserIntentCandidate
	local Current = if self.feedScopeRef then self.feedScopeRef.current else nil
	
	return if CurrentUserIntentCandidate == nil or Current == nil or not CurrentUserIntentCandidate:IsDescendantOf(Current) or not CollectionService:HasTag(CurrentUserIntentCandidate, ViewportAutoplayCandidateTagModule) then nil else CurrentUserIntentCandidate
end

function ViewportVideoAutoplayController:_selectCurrentIdleWinner(PlayingVideoKey) --[[ Line: 992 ]]
	-- upvalues: CollectionService (copy), UserIntentModeAutoplayCandidateTagModule (copy), ViewportAutoplayVideoKeyAttributeModule (copy), GetTileRowSpanFunction (copy), FIntLuaAppOneByTwoTileVideoVisiblePercent (copy), FIntLuaAppGameTileVideoVisiblePercent (copy), GetIsInstanceVisibleModule (copy)
	local Current = if self.feedScopeRef then self.feedScopeRef.current else nil
	local ViewPortBounds = self.viewPortBounds
	
	if Current == nil or ViewPortBounds == nil then
		return nil
	end
	for _, Gui in CollectionService:GetTagged(UserIntentModeAutoplayCandidateTagModule) do
		if Gui:IsA("GuiObject") and Gui:GetAttribute(ViewportAutoplayVideoKeyAttributeModule) == PlayingVideoKey and not self.playedVideoKeys[PlayingVideoKey] and Gui:IsDescendantOf(Current) and GetIsInstanceVisibleModule(Gui, ViewPortBounds, if GetTileRowSpanFunction(Gui) == 2 and not self.preferTallestWinner then FIntLuaAppOneByTwoTileVideoVisiblePercent else FIntLuaAppGameTileVideoVisiblePercent) then
			return Gui
		end
	end
	return nil
end

function ViewportVideoAutoplayController:_isCandidateEligibleForSelection(Frame, p1): boolean --[[ Line: 1026 ]]
	-- upvalues: ViewportAutoplayVideoKeyAttributeModule (copy)
	if p1 then
		local Attribute = Frame:GetAttribute(ViewportAutoplayVideoKeyAttributeModule)
		
		return typeof(Attribute) == "string" and not self.playedVideoKeys[Attribute]
	else
		return true
	end
end

function ViewportVideoAutoplayController:_selectWinner(p1, p2, p3, UserIntentModeAutoplayCandidateTagModule, p4) --[[ Line: 1041 ]]
	-- upvalues: LuaAppVideoAutoplayMaxDistanceToWinnerLinePercent (copy), reportCandidateOverlap (copy), CollectionService (copy), FFlagLuaAppOneByTwoHoverIdleAutoplay (copy), ViewportAutoplayCandidateTagModule (copy), ComputeRowAnchorOverridesFunction (copy), GetTileRowSpanFunction (copy), FIntLuaAppOneByTwoTileVideoVisiblePercent (copy), FIntLuaAppGameTileVideoVisiblePercent (copy), GetIsInstanceVisibleModule (copy), FFlagLuaAppVideoAutoplayFeedElection (copy), ResolveOneByOneHeightFunction (copy), GetReadingOrderPositionsFunction (copy), IsTilePinnedLeftFunction (copy)
	local ViewPortBounds = self.viewPortBounds
	
	if not ViewPortBounds then
		return nil
	end
	local Current = nil
	
	if p1 == "X" and p2 then
		Current = p2.current
	elseif self.feedScopeRef then
		Current = self.feedScopeRef.current
	end
	if not Current then
		return nil
	end
	local NewY = ViewPortBounds.min.Y + self.winnerLineOffsetFromTopBarPx
	local Largest = math.max(ViewPortBounds.max.X - ViewPortBounds.min.X, 1)
	local ScaledY = (ViewPortBounds.max.Y - ViewPortBounds.min.Y) * (LuaAppVideoAutoplayMaxDistanceToWinnerLinePercent / 100)
	local Frame1 = nil
	local Magnitude = 1e999
	local X = 1e999
	local Flag1 = false
	local Y: number? = nil
	local Magnitude1: number? = nil
	
	if self.preferTallestWinner then
		Y = -1
		Magnitude1 = 1e999
	end
	local function _(AbsolutePositionX, Frame): boolean --[[ Line: 1087 | Named "shouldReplaceByLeftmostX" ]]
		-- upvalues: X (ref), Flag1 (ref), Frame1 (ref), reportCandidateOverlap (upval)
		if AbsolutePositionX < X then
			return true
		end
		if AbsolutePositionX == X and not Flag1 and Frame1 then
			Flag1 = true
			reportCandidateOverlap(Frame1, Frame, AbsolutePositionX)
		end
		return false
	end
	
	local _ = function(Frame, AbsolutePositionX, p5) --[[ Line: 1097 | Named "considerFoldXCandidate" ]]
		-- upvalues: NewY (copy), Magnitude (ref), X (ref), Frame1 (ref), Flag1 (ref), reportCandidateOverlap (upval)
		local Magnitude1 = math.abs(p5 - NewY)
		
		if Magnitude1 < Magnitude then
			Magnitude = Magnitude1
			X = AbsolutePositionX
			Frame1 = Frame
			
			return
		end
		if Magnitude1 == Magnitude then
			local Flag = nil
			if AbsolutePositionX < X then
				Flag = true
			else
				if AbsolutePositionX == X and not Flag1 and Frame1 then
					Flag1 = true
					reportCandidateOverlap(Frame1, Frame, AbsolutePositionX)
				end
				Flag = false
			end
			if Flag then
				Magnitude = Magnitude1
				X = AbsolutePositionX
				Frame1 = Frame
			end
		end
	end
	
	local Tagged = CollectionService:GetTagged(if FFlagLuaAppOneByTwoHoverIdleAutoplay and UserIntentModeAutoplayCandidateTagModule then UserIntentModeAutoplayCandidateTagModule else ViewportAutoplayCandidateTagModule)
	local Guis = {}
	
	for _, Gui in Tagged do
		if Gui:IsA("GuiObject") and Gui:IsDescendantOf(Current) and (not FFlagLuaAppOneByTwoHoverIdleAutoplay or self:_isCandidateEligibleForSelection(Gui, p4)) then
			table.insert(Guis, Gui)
		end
	end
	local RowAnchorOverrides = ComputeRowAnchorOverridesFunction(Guis, Largest)
	
	for _, Frame in Tagged do
		if Frame:IsA("GuiObject") and Frame:IsDescendantOf(Current) and (not FFlagLuaAppOneByTwoHoverIdleAutoplay or self:_isCandidateEligibleForSelection(Frame, p4)) and GetIsInstanceVisibleModule(Frame, ViewPortBounds, if GetTileRowSpanFunction(Frame) == 2 and not self.preferTallestWinner then FIntLuaAppOneByTwoTileVideoVisiblePercent else FIntLuaAppGameTileVideoVisiblePercent) then
			local X1 = Frame.AbsolutePosition.X
			
			if FFlagLuaAppVideoAutoplayFeedElection and self.preferTallestWinner then
				local Magnitude2 = math.abs(math.clamp(NewY, Frame.AbsolutePosition.Y, Frame.AbsolutePosition.Y + Frame.AbsoluteSize.Y) - NewY)
				local Y1 = Frame.AbsoluteSize.Y
				local Magnitude3 = math.abs(Frame.AbsolutePosition.Y + X1 / Largest * Y1 - NewY)
				local Flag3 = false
				
				if Magnitude2 < Magnitude then
					Flag3 = true
				elseif Magnitude2 == Magnitude then
					if Y < Y1 then
						Flag3 = true
					elseif Y1 == Y then
						if p3 then
							local Flag5 = nil
							if X1 < X then
								Flag5 = true
							else
								if X1 == X and not Flag1 and Frame1 then
									Flag1 = true
									reportCandidateOverlap(Frame1, Frame, X1)
								end
								Flag5 = false
							end
							if Flag5 then
								Flag3 = true
							end
						elseif Magnitude3 < Magnitude1 then
							Flag3 = true
						elseif Magnitude3 == Magnitude1 then
							local Flag2 = nil
							if X1 < X then
								Flag2 = true
							else
								if X1 == X and (not Flag1 and Frame1) then
									Flag1 = true
									reportCandidateOverlap(Frame1, Frame, X1)
								end
								Flag2 = false
							end
							if Flag2 then
								Flag3 = true
							end
						end
					end
				end
				if Flag3 then
					Magnitude = Magnitude2
					Y = Y1
					Magnitude1 = Magnitude3
					X = X1
					Frame1 = Frame
				end
			else
				local TileRowSpan = GetTileRowSpanFunction(Frame)
				local RowAnchorOverride: number = RowAnchorOverrides[Frame]
				
				if TileRowSpan == 2 then
					local ReadingOrderPositions = GetReadingOrderPositionsFunction(Frame, X1, Largest, TileRowSpan, (ResolveOneByOneHeightFunction(Frame, TileRowSpan)))
					
					if RowAnchorOverride ~= nil then
						ReadingOrderPositions[if IsTilePinnedLeftFunction(Frame) then 1 else TileRowSpan] = RowAnchorOverride
					end
					for _, value in ReadingOrderPositions do
						local Magnitude6 = math.abs(value - NewY)
						
						if Magnitude6 < Magnitude then
							Magnitude = Magnitude6
							X = X1
							Frame1 = Frame
						elseif Magnitude6 == Magnitude then
							local Flag4 = nil
							if X1 < X then
								Flag4 = true
							else
								if X1 == X and (not Flag1 and Frame1) then
									Flag1 = true
									reportCandidateOverlap(Frame1, Frame, X1)
								end
								Flag4 = false
							end
							if Flag4 then
								Magnitude = Magnitude6
								X = X1
								Frame1 = Frame
							end
						end
					end
				else
					if RowAnchorOverride == nil then
						local Magnitude5 = math.abs(Frame.AbsolutePosition.Y + X1 / Largest * Frame.AbsoluteSize.Y - NewY)
						
						if Magnitude5 < Magnitude then
							Magnitude = Magnitude5
							X = X1
							Frame1 = Frame
							continue
						elseif Magnitude5 == Magnitude then
							local Flag = nil
							if X1 < X then
								Flag = true
							else
								if X1 == X and (not Flag1 and Frame1) then
									Flag1 = true
									reportCandidateOverlap(Frame1, Frame, X1)
								end
								Flag = false
							end
							if Flag then
								Magnitude = Magnitude5
								X = X1
								Frame1 = Frame
							end
						end
					else
						local Magnitude4 = math.abs(RowAnchorOverride - NewY)
						
						if Magnitude4 < Magnitude then
							Magnitude = Magnitude4
							X = X1
							Frame1 = Frame
							continue
						elseif Magnitude4 == Magnitude then
							local Flag6 = nil
							if X1 < X then
								Flag6 = true
							else
								if X1 == X and not Flag1 and Frame1 then
									Flag1 = true
									reportCandidateOverlap(Frame1, Frame, X1)
								end
								Flag6 = false
							end
							if Flag6 then
								Magnitude = Magnitude4
								X = X1
								Frame1 = Frame
							end
						end
					end
				end
			end
		end
	end
	return if ScaledY < Magnitude then nil else Frame1
end

return ViewportVideoAutoplayController