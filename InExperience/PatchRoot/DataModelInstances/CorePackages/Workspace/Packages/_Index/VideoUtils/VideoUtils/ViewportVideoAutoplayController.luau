local collectionService = game:GetService("CollectionService")
local videoUtils = script:FindFirstAncestor("VideoUtils")
local parent = videoUtils.Parent
local signalsModule = require(parent.Signals)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local viewportVideoAutoplayModeModule = require(videoUtils.ViewportVideoAutoplayMode)
local viewportAutoplayVideoKeyAttributeModule = require(videoUtils.ViewportAutoplayVideoKeyAttribute)
local userIntentModeAutoplayCandidateTagModule = require(videoUtils.UserIntentModeAutoplayCandidateTag)
local _ = require(videoUtils.VideoPlaybackCoordinator)
local videoEndReason = require(videoUtils.Analytics.Enums).VideoEndReason
local getIsInstanceVisibleModule = require(videoUtils.getIsInstanceVisible)
local viewportAutoplayCandidateTagModule = require(videoUtils.ViewportAutoplayCandidateTag)
local viewportAutoplayHelpersModule = require(videoUtils.ViewportAutoplayHelpers)
local getTileRowSpan = viewportAutoplayHelpersModule.getTileRowSpan
local resolveOneByOneHeight = viewportAutoplayHelpersModule.resolveOneByOneHeight
local getReadingOrderPositions = viewportAutoplayHelpersModule.getReadingOrderPositions
local isTilePinnedLeft = viewportAutoplayHelpersModule.isTilePinnedLeft
local computeRowAnchorOverrides = viewportAutoplayHelpersModule.computeRowAnchorOverrides
local fIntLuaAppGameTileVideoVisiblePercent = require(parent.SharedFlags).FIntLuaAppGameTileVideoVisiblePercent
local fIntLuaAppOneByTwoTileVideoVisiblePercent = require(parent.SharedFlags).FIntLuaAppOneByTwoTileVideoVisiblePercent
local fFlagLuaAppOneByTwoHoverIdleAutoplay = require(parent.SharedFlags).FFlagLuaAppOneByTwoHoverIdleAutoplay
local fFlagLuaAppHoverIdleAutoplayDuringScroll = require(parent.SharedFlags).FFlagLuaAppHoverIdleAutoplayDuringScroll
local fFlagLuaAppTileVideoKeepPlayingOnScroll = require(parent.SharedFlags).FFlagLuaAppTileVideoKeepPlayingOnScroll
local fFlagLuaAppVideoAutoplayFeedElection = require(parent.SharedFlags).FFlagLuaAppVideoAutoplayFeedElection
local fFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback = require(parent.SharedFlags).FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback
local fFlagLuaAppVideoAutoplayElectOnNewCandidateModule = require(script.Parent.FFlagLuaAppVideoAutoplayElectOnNewCandidate)
local luaAppVideoAutoplayMaxDistanceToWinnerLinePercent = game:DefineFastInt("LuaAppVideoAutoplayMaxDistanceToWinnerLinePercent", 50)
local luaAppVideoAutoplayScrollUpdateIntervalMs = game:DefineFastInt("LuaAppVideoAutoplayScrollUpdateIntervalMs", 100)
local t = {
	instance = nil,
	shouldUseDwell = true,
	isUserIntentWinner = if fFlagLuaAppOneByTwoHoverIdleAutoplay then false else nil
}

local function winnerStateEquals(p1, p2)
	-- upvalues: fFlagLuaAppOneByTwoHoverIdleAutoplay (ref)
	return p1.instance == p2.instance and (p1.shouldUseDwell == p2.shouldUseDwell and (not fFlagLuaAppOneByTwoHoverIdleAutoplay or p1.isUserIntentWinner == p2.isUserIntentWinner))
end

local function _(p1)
	-- upvalues: videoEndReason (ref)
	return if p1 ~= videoEndReason.TileClicked then if p1 ~= videoEndReason.ExperienceLaunched then p1 == videoEndReason.AppBackgrounded else true else true
end

local function reportCandidateOverlap(p1, p2, p3)
	-- upvalues: discoveryEventErrorLogger (ref)
	discoveryEventErrorLogger.reportError("ViewportAutoplayCandidateOverlap", "Two visible autoplay candidates share identical reading-order position and AbsolutePosition.X", {
		candidateA = p1.Name,
		candidateB = p2.Name,
		absolutePositionX = p3,
		absolutePositionY = p2.AbsolutePosition.Y,
		absoluteSizeX = p2.AbsoluteSize.X,
		absoluteSizeY = p2.AbsoluteSize.Y
	})
end

local t_1 = {}
t_1.__index = t_1

function t_1.new(p1, p2, p3, p4)
	-- upvalues: signalsModule (ref), t (ref), winnerStateEquals (ref), fFlagLuaAppOneByTwoHoverIdleAutoplay (ref), fFlagLuaAppVideoAutoplayFeedElection (ref), fFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback (ref), t_1 (ref), viewportVideoAutoplayModeModule (ref), viewportAutoplayVideoKeyAttributeModule (ref), videoEndReason (ref)
	local var1
	local var2, var3 = signalsModule.createSignal(t, winnerStateEquals)
	local t_2 = {
		isScrolling = false,
		pendingUpdateTask = nil,
		pendingAdsUpdateTask = nil,
		viewPortBounds = nil,
		feedScopeRef = nil,
		winnerLineOffsetFromTopBarPx = 0,
		adsPlaybackCoordinatorInfo = nil,
		coordinator = p1,
		mode = if fFlagLuaAppOneByTwoHoverIdleAutoplay then p4 else nil
	}
	
	if fFlagLuaAppVideoAutoplayFeedElection then
		var1 = p2 == true
		var1 = nil
	else
		var1 = false
	end
	local var4
	t_2.preferTallestWinner = var1
	
	if fFlagLuaAppVideoAutoplayFeedElection then
		var4 = p3 == true
		var4 = nil
	else
		var4 = false
	end
	t_2.electOnNewCandidate = var4
	t_2.playedVideoKeys = if fFlagLuaAppOneByTwoHoverIdleAutoplay then {} else nil
	t_2.getWinnerState = var2
	t_2.setWinnerState = var3
	t_2.isResettingPairedPlayback = if fFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback then false else nil
	local tbl = setmetatable(t_2, t_1)
	
	if fFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback then
		function p1.onPlaybackReset(p5, p6)
			-- upvalues: tbl (ref), p1 (ref)
			tbl:_resetPairedPlayback(p1, p5, p6)
		end
	end
	if fFlagLuaAppOneByTwoHoverIdleAutoplay and p4 == viewportVideoAutoplayModeModule.UserIntentWithSelectiveAutoplay then
		tbl.playbackChangedConnection = p1.changed:connect(function(p5, p6)
			-- upvalues: tbl (ref), viewportAutoplayVideoKeyAttributeModule (copy), t (copy), videoEndReason (copy)
			local instance = tbl.getWinnerState(false).instance
			local var5 = if instance then instance:GetAttribute(viewportAutoplayVideoKeyAttributeModule) else nil
			
			if p5 == nil then
				if instance ~= nil then
					tbl.setWinnerState(t)
				end
				if if p6 ~= videoEndReason.TileClicked then if p6 ~= videoEndReason.ExperienceLaunched then p6 == videoEndReason.AppBackgrounded else true else true then
					tbl:_cancelPendingUpdate()
					tbl:_cancelScrollUpdate()
					
					return
				end
				tbl:scheduleUpdateWinner("Y", nil, false)
				
				return
			elseif var5 ~= p5 then
				tbl.setWinnerState(t)
			end
		end)
	end
	return tbl
end

function t_1:isUserIntentWithSelectiveAutoplay()
	-- upvalues: viewportVideoAutoplayModeModule (ref)
	return self.mode == viewportVideoAutoplayModeModule.UserIntentWithSelectiveAutoplay
end

function t_1:setCandidateUserIntent(p1, p2)
	-- upvalues: fFlagLuaAppHoverIdleAutoplayDuringScroll (ref)
	if not self:isUserIntentWithSelectiveAutoplay() then return end
	if p2 then
		if self.currentUserIntentCandidate == p1 then return end
		self.currentUserIntentCandidate = p1
	elseif self.currentUserIntentCandidate == p1 then
		self.currentUserIntentCandidate = nil
	else
		return
	end
	if self.isScrolling and not fFlagLuaAppHoverIdleAutoplayDuringScroll then
		self:_scheduleScrollUpdate()
		
		return
	end
	self:scheduleUpdateWinner("Y", nil, false)
end

function t_1:clearUserIntentCandidate()
	self.currentUserIntentCandidate = nil
end

function t_1:requestWinnerPlayback(p1, p2)
	-- upvalues: viewportAutoplayVideoKeyAttributeModule (ref)
	local winnerState = self.getWinnerState(false)
	
	if winnerState.instance ~= p1 then return end
	if not self:isUserIntentWithSelectiveAutoplay() then
		p2(winnerState.shouldUseDwell)
		
		return
	elseif winnerState.isUserIntentWinner then
		p2(false)
		
		return
	end
	local var1 = p1:GetAttribute(viewportAutoplayVideoKeyAttributeModule)
	
	if typeof(var1) == "string" and not self.playedVideoKeys[var1] and self.coordinator.playingVideoKey == nil then
		p2(false)
		
		return
	end
end

function t_1:onVideoCompleted(p1)
	-- upvalues: viewportAutoplayVideoKeyAttributeModule (ref), videoEndReason (ref)
	if not self:isUserIntentWithSelectiveAutoplay() then return end
	local var1 = p1:GetAttribute(viewportAutoplayVideoKeyAttributeModule)
	
	if typeof(var1) == "string" and self.coordinator.playingVideoKey == var1 and self.currentUserIntentCandidate ~= p1 then
		self.playedVideoKeys[var1] = true
		self.coordinator:reset(videoEndReason.Completed)
		
		return
	end
end

function t_1:getAdsPlaybackCoordinator()
	local adsPlaybackCoordinatorInfo = self.adsPlaybackCoordinatorInfo
	
	return if adsPlaybackCoordinatorInfo then adsPlaybackCoordinatorInfo.coordinator else nil
end

function t_1:getWinnerStateForCoordinator(p1)
	local adsPlaybackCoordinatorInfo = self.adsPlaybackCoordinatorInfo
	
	return if adsPlaybackCoordinatorInfo and adsPlaybackCoordinatorInfo.coordinator == p1 then adsPlaybackCoordinatorInfo.getWinnerState else self.getWinnerState
end

function t_1:completeAdsPlayback(p1, p2)
	-- upvalues: videoEndReason (ref)
	local adsPlaybackCoordinatorInfo = self.adsPlaybackCoordinatorInfo
	
	if not adsPlaybackCoordinatorInfo then return end
	adsPlaybackCoordinatorInfo.completedVideoKeys[p2] = true
	adsPlaybackCoordinatorInfo.handedOffInstances[p1] = true
	
	if adsPlaybackCoordinatorInfo.getWinnerState(false).instance == p1 then
		adsPlaybackCoordinatorInfo.coordinator:reset(videoEndReason.Completed)
		adsPlaybackCoordinatorInfo.setWinnerState({ instance = nil, shouldUseDwell = false })
	end
end

function t_1:_consumeAdsHandoff(p1)
	local adsPlaybackCoordinatorInfo = self.adsPlaybackCoordinatorInfo
	
	if adsPlaybackCoordinatorInfo and adsPlaybackCoordinatorInfo.handedOffInstances[p1] then
		adsPlaybackCoordinatorInfo.handedOffInstances[p1] = nil
		
		return true
	end
	return false
end

function t_1:hasCompletedAdsPlayback(p1)
	local adsPlaybackCoordinatorInfo = self.adsPlaybackCoordinatorInfo
	
	return adsPlaybackCoordinatorInfo ~= nil and adsPlaybackCoordinatorInfo.completedVideoKeys[p1] == true
end

function t_1:attachAdsPlaybackCoordinator(p1, p2)
	-- upvalues: signalsModule (ref), t (ref), winnerStateEquals (ref)
	if self.adsPlaybackCoordinatorInfo then
		return
	end
	local var1, var2 = signalsModule.createSignal(t, winnerStateEquals)
	self.adsPlaybackCoordinatorInfo = {
		coordinator = p1,
		candidateTag = p2,
		getWinnerState = var1,
		setWinnerState = var2,
		completedVideoKeys = {},
		handedOffInstances = setmetatable({}, { __mode = "k" })
	}
	
	function p1.onPlaybackReset(p3, p4)
		-- upvalues: self (ref), p1 (ref)
		self:_resetPairedPlayback(p1, p3, p4)
	end
end

function t_1:_hasUsableViewportBounds()
	return if self.viewPortBounds then self.viewPortBounds.min.X < self.viewPortBounds.max.X and self.viewPortBounds.min.Y < self.viewPortBounds.max.Y else false
end

function t_1:_maybeScheduleInitialWinnerUpdate()
	-- upvalues: fFlagLuaAppVideoAutoplayFeedElection (ref)
	if self.getWinnerState(false).instance ~= nil or self.isScrolling then return end
	if not self:_hasUsableViewportBounds() then return end
	if fFlagLuaAppVideoAutoplayFeedElection then
		self:scheduleUpdateWinner("Y", nil, true, true)
		
		return
	end
	self:scheduleUpdateWinner("Y", nil, true)
end

function t_1:onCandidateRegistered(p1)
	-- upvalues: fFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback (ref), fFlagLuaAppOneByTwoHoverIdleAutoplay (ref), fFlagLuaAppVideoAutoplayFeedElection (ref)
	if fFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback and self:_consumeAdsHandoff(p1) then return end
	local var1 = if self.feedScopeRef then self.feedScopeRef.current else nil
	
	if not var1 or not p1:IsDescendantOf(var1) then return end
	if self.isScrolling then return end
	if not self:_hasUsableViewportBounds() then return end
	if fFlagLuaAppOneByTwoHoverIdleAutoplay and self:isUserIntentWithSelectiveAutoplay() then
		self:scheduleUpdateWinner("Y", nil, false)
		
		return
	elseif self.coordinator.playingVideoKey ~= nil then return end
	if not fFlagLuaAppVideoAutoplayFeedElection then
		self:scheduleUpdateWinner("Y", nil, true)
		
		return
	elseif self.getWinnerState(false).instance == nil then
		self:_maybeScheduleInitialWinnerUpdate()
		
		return
	elseif self.pendingUpdateTask == nil then
		self.pendingUpdateTask = task.defer(function()
			-- upvalues: self (ref)
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

function t_1:forceScheduleInitialWinnerUpdate()
	-- upvalues: fFlagLuaAppVideoAutoplayFeedElection (ref)
	self:_cancelPendingUpdate()
	
	if fFlagLuaAppVideoAutoplayFeedElection then
		self:scheduleUpdateWinner("Y", nil, true, true)
		
		return
	end
	self:scheduleUpdateWinner("Y", nil, true)
end

function t_1:setViewPortBounds(p1)
	-- upvalues: fFlagLuaAppOneByTwoHoverIdleAutoplay (ref), videoEndReason (ref), fFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback (ref)
	self.viewPortBounds = p1
	self:_maybeScheduleInitialWinnerUpdate()
	local winnerState = self.getWinnerState(false)
	local instance = winnerState.instance
	
	if instance ~= nil and not self.isScrolling and self:_hasUsableViewportBounds() then
		local y
		self:_cancelPendingUpdate()
		local _ = nil
		local var1 = nil
		
		if fFlagLuaAppOneByTwoHoverIdleAutoplay and self:isUserIntentWithSelectiveAutoplay() then
			local y_1, y_2 = self:_selectUserIntentOrAutoplayWinner("Y", nil)
			y = y_1
			var1 = y_2
		else
			y = self:_selectWinner("Y", nil)
		end
		local shouldUseDwell = winnerState.shouldUseDwell
		
		if y ~= instance then
			self.coordinator:reset(videoEndReason.ViewportResized)
			shouldUseDwell = true
		end
		self.setWinnerState({
			instance = y,
			shouldUseDwell = shouldUseDwell,
			isUserIntentWinner = if fFlagLuaAppOneByTwoHoverIdleAutoplay and self:isUserIntentWithSelectiveAutoplay() then var1 else nil
		})
	end
	if fFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback then
		self:_refreshAdsWinnerForViewportChange()
	end
end

function t_1:setWinnerLineOffsetFromTopBarPx(p1)
	self.winnerLineOffsetFromTopBarPx = p1
end

function t_1:setFeedScopeRef(p1)
	self.feedScopeRef = p1
	self:_maybeScheduleInitialWinnerUpdate()
end

function t_1:_cancelPendingUpdate()
	if self.pendingUpdateTask ~= nil then
		task.cancel(self.pendingUpdateTask)
		self.pendingUpdateTask = nil
	end
end

function t_1:_cancelPendingAdsUpdate()
	if self.pendingAdsUpdateTask ~= nil then
		task.cancel(self.pendingAdsUpdateTask)
		self.pendingAdsUpdateTask = nil
	end
end

function t_1:_deferApplyAdsWinner()
	-- upvalues: videoEndReason (ref)
	self:_cancelPendingAdsUpdate()
	self.pendingAdsUpdateTask = task.defer(function()
		-- upvalues: self (ref), videoEndReason (copy)
		self.pendingAdsUpdateTask = nil
		
		if self.isScrolling or not self.adsPlaybackCoordinatorInfo then
			return
		end
		self:_applyAdsWinner(true, videoEndReason.ExitViewport)
	end)
end

function t_1:_cancelScrollUpdate()
	if self.scrollUpdateTask ~= nil then
		task.cancel(self.scrollUpdateTask)
		self.scrollUpdateTask = nil
	end
end

function t_1:_scheduleScrollUpdate()
	-- upvalues: luaAppVideoAutoplayScrollUpdateIntervalMs (ref), fFlagLuaAppHoverIdleAutoplayDuringScroll (ref)
	if self.scrollUpdateTask == nil and self.isScrolling and self:isUserIntentWithSelectiveAutoplay() then
		self.scrollUpdateTask = task.delay(luaAppVideoAutoplayScrollUpdateIntervalMs / 1000, function()
			-- upvalues: self (ref), fFlagLuaAppHoverIdleAutoplayDuringScroll (copy)
			self.scrollUpdateTask = nil
			
			if not self.isScrolling then return end
			self:_updateWinner("Y", nil, false)
			
			if fFlagLuaAppHoverIdleAutoplayDuringScroll then
				self:_scheduleScrollUpdate()
			end
		end)
		
		return
	end
end

function t_1:onScrollStart()
	-- upvalues: fFlagLuaAppOneByTwoHoverIdleAutoplay (ref), fFlagLuaAppHoverIdleAutoplayDuringScroll (ref), fFlagLuaAppTileVideoKeepPlayingOnScroll (ref), videoEndReason (ref), fFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback (ref)
	self:_cancelPendingUpdate()
	self.isScrolling = true
	
	if fFlagLuaAppOneByTwoHoverIdleAutoplay and self:isUserIntentWithSelectiveAutoplay() then
		if fFlagLuaAppHoverIdleAutoplayDuringScroll then
			self:_scheduleScrollUpdate()
		end
		return
	elseif not fFlagLuaAppTileVideoKeepPlayingOnScroll then
		self.coordinator:reset(videoEndReason.ScrollStart)
		self.setWinnerState({ instance = nil, shouldUseDwell = false })
		
		if fFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback then
			self:_resetAdsPlayback(videoEndReason.ScrollStart)
		end
	end
end

function t_1:onScrollSettled(p1, _, p2)
	-- upvalues: fFlagLuaAppOneByTwoHoverIdleAutoplay (ref), fFlagLuaAppTileVideoKeepPlayingOnScroll (ref), videoEndReason (ref), fFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback (ref)
	self:_cancelPendingUpdate()
	self.isScrolling = false
	
	if fFlagLuaAppOneByTwoHoverIdleAutoplay then
		self:_cancelScrollUpdate()
	end
	if fFlagLuaAppOneByTwoHoverIdleAutoplay and self:isUserIntentWithSelectiveAutoplay() then
		self:_updateWinner(p1, p2, false)
		
		return
	elseif fFlagLuaAppTileVideoKeepPlayingOnScroll then
		local instance = self.getWinnerState(false).instance
		local var1 = self:_selectWinner(p1, p2)
		
		if instance ~= var1 and instance ~= nil then
			self.coordinator:reset(videoEndReason.ScrollSettled)
		end
		self.setWinnerState({ shouldUseDwell = false, instance = var1 })
		
		if fFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback then
			self:_applyAdsWinner(false, videoEndReason.ScrollSettled)
			
			return
		end
	else
		self:_updateWinner(p1, p2, false)
	end
end

function t_1:_resetPairedPlayback(p1, p2, p3)
	-- upvalues: videoEndReason (ref)
	if self.isResettingPairedPlayback or p2 ~= videoEndReason.TileClicked and p2 ~= videoEndReason.ExperienceLaunched then return end
	self.isResettingPairedPlayback = true
	self:_cancelPendingUpdate()
	self:_cancelPendingAdsUpdate()
	
	if p1 == self.coordinator then
		local adsPlaybackCoordinatorInfo = self.adsPlaybackCoordinatorInfo
		
		if adsPlaybackCoordinatorInfo then
			adsPlaybackCoordinatorInfo.coordinator:reset(p2, nil, p3, nil)
		end
	else
		self.coordinator:reset(p2, nil, p3, nil)
	end
	self.isResettingPairedPlayback = false
end

function t_1:reset(p1)
	-- upvalues: fFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback (ref), fFlagLuaAppOneByTwoHoverIdleAutoplay (ref)
	if fFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback then
		self:_resetOrganicPlayback(p1)
		self:_cancelPendingAdsUpdate()
		self:_resetAdsPlayback(p1)
		
		return
	end
	self:_cancelPendingUpdate()
	
	if fFlagLuaAppOneByTwoHoverIdleAutoplay then
		self:_cancelScrollUpdate()
	end
	self.isScrolling = false
	self.coordinator:reset(p1)
	self.setWinnerState({
		instance = nil,
		shouldUseDwell = false,
		isUserIntentWinner = if fFlagLuaAppOneByTwoHoverIdleAutoplay and self:isUserIntentWithSelectiveAutoplay() then false else nil
	})
end

function t_1:_resetOrganicPlayback(p1)
	-- upvalues: fFlagLuaAppOneByTwoHoverIdleAutoplay (ref)
	self:_cancelPendingUpdate()
	
	if fFlagLuaAppOneByTwoHoverIdleAutoplay then
		self:_cancelScrollUpdate()
	end
	self.isScrolling = false
	self.coordinator:reset(p1)
	self.setWinnerState({
		instance = nil,
		shouldUseDwell = false,
		isUserIntentWinner = if fFlagLuaAppOneByTwoHoverIdleAutoplay and self:isUserIntentWithSelectiveAutoplay() then false else nil
	})
end

function t_1:resetIfActiveInstance(p1, p2)
	-- upvalues: fFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback (ref)
	if self.getWinnerState(false).instance == p1 then
		if fFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback then
			self:_resetOrganicPlayback(p2)
		else
			self:reset(p2)
		end
		self:_maybeScheduleInitialWinnerUpdate()
		
		return
	elseif fFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback then
		local adsPlaybackCoordinatorInfo = self.adsPlaybackCoordinatorInfo
		
		if adsPlaybackCoordinatorInfo and adsPlaybackCoordinatorInfo.getWinnerState(false).instance == p1 then
			self:_resetAdsPlayback(p2)
			
			if not self.isScrolling and self:_hasUsableViewportBounds() then
				self:_deferApplyAdsWinner()
			end
		end
	end
end

function t_1:onAdsCandidateRegistered(p1)
	if not self.adsPlaybackCoordinatorInfo then return end
	local var1 = if self.feedScopeRef then self.feedScopeRef.current else nil
	
	if not var1 or not p1:IsDescendantOf(var1) then return end
	if self.isScrolling or not self:_hasUsableViewportBounds() then
		return
	end
	self:_deferApplyAdsWinner()
end

function t_1:scheduleUpdateWinner(p1, p2, p3, p4)
	-- upvalues: fFlagLuaAppVideoAutoplayFeedElection (ref)
	if self.pendingUpdateTask == nil then
		self.pendingUpdateTask = task.defer(function()
			-- upvalues: self (ref), p1 (ref), p2 (ref), p3 (ref), fFlagLuaAppVideoAutoplayFeedElection (copy), p4 (ref)
			self.pendingUpdateTask = nil
			
			if self.isScrolling then
				return
			end
			self:_updateWinner(p1, p2, p3, if fFlagLuaAppVideoAutoplayFeedElection then p4 else nil)
		end)
		
		return
	end
end

function t_1:_updateWinner(p1, p2, p3, p4)
	-- upvalues: fFlagLuaAppOneByTwoHoverIdleAutoplay (ref), viewportAutoplayVideoKeyAttributeModule (ref), collectionService (ref), userIntentModeAutoplayCandidateTagModule (ref), videoEndReason (ref), fFlagLuaAppVideoAutoplayFeedElection (ref), fFlagLuaAppVideoAutoplayElectOnNewCandidateModule (ref), fFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback (ref)
	local instance
	if fFlagLuaAppOneByTwoHoverIdleAutoplay and self:isUserIntentWithSelectiveAutoplay() then
		local winnerState = self.getWinnerState(false)
		instance = winnerState.instance
		local var1, var2 = self:_selectUserIntentOrAutoplayWinner(p1, p2, p4)
		
		if var1 == instance and var2 == winnerState.isUserIntentWinner then return end
		local playingVideoKey = self.coordinator.playingVideoKey
		local var3 = if instance then instance:GetAttribute(viewportAutoplayVideoKeyAttributeModule) else nil
		
		if playingVideoKey ~= nil and (if var1 then var1:GetAttribute(viewportAutoplayVideoKeyAttributeModule) else nil) ~= playingVideoKey and (var2 or var3 == playingVideoKey) then
			self.coordinator:reset(if var2 then videoEndReason.HoverTakeover elseif instance and (not (instance ~= nil and collectionService:HasTag(instance, userIntentModeAutoplayCandidateTagModule)) or typeof(var3) == "string" and self.playedVideoKeys[var3]) then videoEndReason.Unhovered else videoEndReason.ExitViewport)
		end
		self.setWinnerState({
			shouldUseDwell = false,
			instance = var1,
			isUserIntentWinner = var2
		})
		
		return
	elseif fFlagLuaAppVideoAutoplayFeedElection then
		local instance_1 = self.getWinnerState(false).instance
		instance = self:_selectWinner(p1, p2, p4)
		
		if (self.electOnNewCandidate or fFlagLuaAppVideoAutoplayElectOnNewCandidateModule) and (instance_1 ~= nil and instance ~= instance_1) then
			self.coordinator:reset(videoEndReason.ExitViewport)
		end
		self.setWinnerState({ instance = instance, shouldUseDwell = p3 })
		
		if fFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback then
			self:_applyAdsWinner(p3, videoEndReason.ExitViewport)
		end
		return
	else
		self.setWinnerState({
			instance = self:_selectWinner(p1, p2),
			shouldUseDwell = p3
		})
		
		if fFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback then
			self:_applyAdsWinner(p3, videoEndReason.ExitViewport)
		end
	end
end

function t_1:_resetAdsPlayback(p1)
	local adsPlaybackCoordinatorInfo = self.adsPlaybackCoordinatorInfo
	
	if adsPlaybackCoordinatorInfo then
		adsPlaybackCoordinatorInfo.coordinator:reset(p1)
		adsPlaybackCoordinatorInfo.setWinnerState({ instance = nil, shouldUseDwell = false })
		
		return
	end
end

function t_1:_refreshAdsWinnerForViewportChange()
	-- upvalues: videoEndReason (ref)
	local adsPlaybackCoordinatorInfo = self.adsPlaybackCoordinatorInfo
	
	if not adsPlaybackCoordinatorInfo or self.isScrolling or not self:_hasUsableViewportBounds() then return end
	local winnerState = adsPlaybackCoordinatorInfo.getWinnerState(false)
	local var1 = self:_selectAdsWinner()
	local shouldUseDwell = winnerState.shouldUseDwell
	
	if var1 ~= winnerState.instance and winnerState.instance ~= nil then
		adsPlaybackCoordinatorInfo.coordinator:reset(videoEndReason.ViewportResized)
		shouldUseDwell = true
	end
	adsPlaybackCoordinatorInfo.setWinnerState({ instance = var1, shouldUseDwell = shouldUseDwell })
end

function t_1:_applyAdsWinner(p1, p2)
	local adsPlaybackCoordinatorInfo = self.adsPlaybackCoordinatorInfo
	
	if not adsPlaybackCoordinatorInfo then return end
	local instance = adsPlaybackCoordinatorInfo.getWinnerState(false).instance
	local var1 = self:_selectAdsWinner()
	
	if var1 ~= instance and instance ~= nil then
		adsPlaybackCoordinatorInfo.coordinator:reset(p2)
	end
	adsPlaybackCoordinatorInfo.setWinnerState({ instance = var1, shouldUseDwell = p1 })
end

function t_1:_selectAdsWinner()
	-- upvalues: collectionService (ref), getIsInstanceVisibleModule (ref), fIntLuaAppOneByTwoTileVideoVisiblePercent (ref), reportCandidateOverlap (ref)
	local adsPlaybackCoordinatorInfo = self.adsPlaybackCoordinatorInfo
	local viewPortBounds = self.viewPortBounds
	local var1 = if self.feedScopeRef then self.feedScopeRef.current else nil
	
	if not adsPlaybackCoordinatorInfo or not viewPortBounds or not var1 then
		return nil
	end
	local var2 = viewPortBounds.min.Y + self.winnerLineOffsetFromTopBarPx
	local maxValue = math.max(viewPortBounds.max.X - viewPortBounds.min.X, 1)
	local var3 = nil
	local var4 = 1e999
	local var5 = 1e999
	local var6 = false
	
	for i, v in collectionService:GetTagged(adsPlaybackCoordinatorInfo.candidateTag) do
		if v:IsA("GuiObject") and v:IsDescendantOf(var1) and getIsInstanceVisibleModule(v, viewPortBounds, fIntLuaAppOneByTwoTileVideoVisiblePercent) then
			local x = v.AbsolutePosition.X
			local absValue = math.abs(v.AbsolutePosition.Y + x / maxValue * v.AbsoluteSize.Y - var2)
			local var7 = false
			
			if absValue < var4 then
				var7 = true
			elseif absValue == var4 and x < var5 then
				var7 = true
			elseif absValue == var4 and x == var5 and (not var6 and var3) then
				var6 = true
				reportCandidateOverlap(var3, v, x)
			end
			if var7 then
				var4 = absValue
				var5 = x
				var3 = v
			end
		end
	end
	return var3
end

function t_1:_selectUserIntentOrAutoplayWinner(p1, p2, p3)
	-- upvalues: fFlagLuaAppHoverIdleAutoplayDuringScroll (ref), userIntentModeAutoplayCandidateTagModule (ref)
	local var8 = self:_selectUserIntentWinner()
	
	if var8 then
		return var8, true
	end
	local playingVideoKey = self.coordinator.playingVideoKey
	
	if playingVideoKey ~= nil then
		return self:_selectCurrentIdleWinner(playingVideoKey), false
	elseif self.isScrolling and not fFlagLuaAppHoverIdleAutoplayDuringScroll then
		return nil, false
	end
	return self:_selectWinner(p1, p2, p3, userIntentModeAutoplayCandidateTagModule, true), false
end

function t_1:_selectUserIntentWinner()
	-- upvalues: collectionService (ref), viewportAutoplayCandidateTagModule (ref)
	local currentUserIntentCandidate = self.currentUserIntentCandidate
	local var8 = if self.feedScopeRef then self.feedScopeRef.current else nil
	
	return if currentUserIntentCandidate == nil or var8 == nil or (not currentUserIntentCandidate:IsDescendantOf(var8) or not collectionService:HasTag(currentUserIntentCandidate, viewportAutoplayCandidateTagModule)) then nil else currentUserIntentCandidate
end

function t_1:_selectCurrentIdleWinner(p1)
	-- upvalues: collectionService (ref), userIntentModeAutoplayCandidateTagModule (ref), viewportAutoplayVideoKeyAttributeModule (ref), getTileRowSpan (ref), fIntLuaAppOneByTwoTileVideoVisiblePercent (ref), fIntLuaAppGameTileVideoVisiblePercent (ref), getIsInstanceVisibleModule (ref)
	local var8 = if self.feedScopeRef then self.feedScopeRef.current else nil
	local viewPortBounds = self.viewPortBounds
	
	if var8 == nil or viewPortBounds == nil then
		return nil
	end
	for i, v in collectionService:GetTagged(userIntentModeAutoplayCandidateTagModule) do
		if v:IsA("GuiObject") and v:GetAttribute(viewportAutoplayVideoKeyAttributeModule) == p1 and (not self.playedVideoKeys[p1] and v:IsDescendantOf(var8)) then
			if getIsInstanceVisibleModule(v, viewPortBounds, if getTileRowSpan(v) == 2 and not self.preferTallestWinner then fIntLuaAppOneByTwoTileVideoVisiblePercent else fIntLuaAppGameTileVideoVisiblePercent) then
				return v
			end
		end
	end
	return nil
end

function t_1:_isCandidateEligibleForSelection(p2, p3)
	-- upvalues: viewportAutoplayVideoKeyAttributeModule (ref)
	if p3 then
		local var9 = p2:GetAttribute(viewportAutoplayVideoKeyAttributeModule)
		
		return typeof(var9) == "string" and not self.playedVideoKeys[var9]
	end
	return true
end

function t_1:_selectWinner(p2, p3, p4, p5, p6)
	-- upvalues: luaAppVideoAutoplayMaxDistanceToWinnerLinePercent (ref), reportCandidateOverlap (ref), collectionService (ref), fFlagLuaAppOneByTwoHoverIdleAutoplay (ref), viewportAutoplayCandidateTagModule (ref), computeRowAnchorOverrides (ref), getTileRowSpan (ref), fIntLuaAppOneByTwoTileVideoVisiblePercent (ref), fIntLuaAppGameTileVideoVisiblePercent (ref), getIsInstanceVisibleModule (ref), fFlagLuaAppVideoAutoplayFeedElection (ref), resolveOneByOneHeight (ref), getReadingOrderPositions (ref), isTilePinnedLeft (ref)
	local viewPortBounds = self.viewPortBounds
	
	if not viewPortBounds then
		return nil
	end
	local current = nil
	
	if p2 == "X" and p3 then
		current = p3.current
	elseif self.feedScopeRef then
		current = self.feedScopeRef.current
	end
	if not current then
		return nil
	end
	local var9 = viewPortBounds.min.Y + self.winnerLineOffsetFromTopBarPx
	local maxValue = math.max(viewPortBounds.max.X - viewPortBounds.min.X, 1)
	local var10 = (viewPortBounds.max.Y - viewPortBounds.min.Y) * (luaAppVideoAutoplayMaxDistanceToWinnerLinePercent / 100)
	local var11 = nil
	local var12 = 1e999
	local var13 = 1e999
	local var14 = false
	local var15 = nil
	local var16 = nil
	
	if self.preferTallestWinner then
		var15 = -1
		var16 = 1e999
	end
	local function _(p7, p8)
		-- upvalues: var13 (write), var14 (write), var11 (write), reportCandidateOverlap (copy)
		if p7 < var13 then
			return true
		elseif p7 == var13 and not var14 and var11 then
			var14 = true
			reportCandidateOverlap(var11, p8, p7)
		end
		return false
	end
	
	local _ = function(p7, p8, p9)
		-- upvalues: var9 (ref), var12 (write), var13 (write), var11 (write), var14 (write), reportCandidateOverlap (copy)
		local absValue = math.abs(p9 - var9)
		
		if absValue < var12 then
			var12 = absValue
			var13 = p8
			var11 = p7
			
			return
		elseif absValue == var12 then
			local var17
			if p8 < var13 then
				var17 = true
			elseif p8 == var13 and not var14 and var11 then
				var14 = true
				reportCandidateOverlap(var11, p7, p8)
			end
			var17 = false
			if var17 then
				var12 = absValue
				var13 = p8
				var11 = p7
			end
		end
	end
	
	local var17 = collectionService:GetTagged(if fFlagLuaAppOneByTwoHoverIdleAutoplay and p5 then p5 else viewportAutoplayCandidateTagModule)
	local t = {}
	
	for i, v in var17 do
		if v:IsA("GuiObject") and v:IsDescendantOf(current) and (not fFlagLuaAppOneByTwoHoverIdleAutoplay or self:_isCandidateEligibleForSelection(v, p6)) then
			table.insert(t, v)
		end
	end
	local var18 = computeRowAnchorOverrides(t, maxValue)
	
	for i_1, v_1 in var17 do
		if v_1:IsA("GuiObject") and v_1:IsDescendantOf(current) and (not fFlagLuaAppOneByTwoHoverIdleAutoplay or self:_isCandidateEligibleForSelection(v_1, p6)) then
			if getIsInstanceVisibleModule(v_1, viewPortBounds, if getTileRowSpan(v_1) == 2 and not self.preferTallestWinner then fIntLuaAppOneByTwoTileVideoVisiblePercent else fIntLuaAppGameTileVideoVisiblePercent) then
				local x = v_1.AbsolutePosition.X
				
				if fFlagLuaAppVideoAutoplayFeedElection and self.preferTallestWinner then
					local absValue = math.abs(math.clamp(var9, v_1.AbsolutePosition.Y, v_1.AbsolutePosition.Y + v_1.AbsoluteSize.Y) - var9)
					local y = v_1.AbsoluteSize.Y
					local absValue_1 = math.abs(v_1.AbsolutePosition.Y + x / maxValue * y - var9)
					local var19 = false
					
					if absValue < var12 then
						var19 = true
					elseif absValue == var12 then
						if var15 < y then
							var19 = true
						elseif y == var15 then
							if p4 then
								local var20
								if x < var13 then
									var20 = true
								elseif x == var13 and not var14 and var11 then
									var14 = true
									reportCandidateOverlap(var11, v_1, x)
								end
								var20 = false
								if var20 then
									var19 = true
								end
							elseif absValue_1 < var16 then
								var19 = true
							elseif absValue_1 == var16 then
								local var21
								if x < var13 then
									var21 = true
								elseif x == var13 and not var14 and var11 then
									var14 = true
									reportCandidateOverlap(var11, v_1, x)
								end
								var21 = false
								if var21 then
									var19 = true
								end
							end
						end
					end
					if var19 then
						var12 = absValue
						var15 = y
						var16 = absValue_1
						var13 = x
						var11 = v_1
					end
				else
					local var22 = getTileRowSpan(v_1)
					local var23 = var18[v_1]
					
					if var22 == 2 then
						local var24 = getReadingOrderPositions(v_1, x, maxValue, var22, resolveOneByOneHeight(v_1, var22))
						
						if var23 ~= nil then
							var24[if isTilePinnedLeft(v_1) then 1 else var22] = var23
						end
						for i_2, v_2 in var24 do
							local absValue = math.abs(v_2 - var9)
							
							if absValue < var12 then
								var12 = absValue
								var13 = x
								var11 = v_1
							elseif absValue == var12 then
								local var25
								if x < var13 then
									var25 = true
								elseif x == var13 and not var14 and var11 then
									var14 = true
									reportCandidateOverlap(var11, v_1, x)
								end
								var25 = false
								if var25 then
									var12 = absValue
									var13 = x
									var11 = v_1
								end
							end
						end
					elseif var23 == nil then
						local absValue = math.abs(v_1.AbsolutePosition.Y + x / maxValue * v_1.AbsoluteSize.Y - var9)
						
						if absValue < var12 then
							var12 = absValue
							var13 = x
							var11 = v_1
						elseif absValue == var12 then
							local var26
							if x < var13 then
								var26 = true
							elseif x == var13 and not var14 and var11 then
								var14 = true
								reportCandidateOverlap(var11, v_1, x)
							end
							var26 = false
							if var26 then
								var12 = absValue
								var13 = x
								var11 = v_1
							end
						end
					else
						local absValue = math.abs(var23 - var9)
						
						if absValue < var12 then
							var12 = absValue
							var13 = x
							var11 = v_1
						elseif absValue == var12 then
							local var27
							if x < var13 then
								var27 = true
							elseif x == var13 and not var14 and var11 then
								var14 = true
								reportCandidateOverlap(var11, v_1, x)
							end
							var27 = false
							if var27 then
								var12 = absValue
								var13 = x
								var11 = v_1
							end
						end
					end
				end
			end
		end
	end
	return if var10 < var12 then nil else var11
end

return t_1