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
local fFlagLuaAppVideoAutoplayOneByTwoTileCandidatePercentageUpdate = require(parent.SharedFlags).FFlagLuaAppVideoAutoplayOneByTwoTileCandidatePercentageUpdate
local fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor = require(parent.SharedFlags).FFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor
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
	-- upvalues: signalsModule (ref), t (ref), winnerStateEquals (ref), fFlagLuaAppOneByTwoHoverIdleAutoplay (ref), fFlagLuaAppVideoAutoplayFeedElection (ref), t_1 (ref), viewportVideoAutoplayModeModule (ref), viewportAutoplayVideoKeyAttributeModule (ref), videoEndReason (ref)
	local var1
	local var2, var3 = signalsModule.createSignal(t, winnerStateEquals)
	local t_2 = {
		isScrolling = false,
		pendingUpdateTask = nil,
		viewPortBounds = nil,
		feedScopeRef = nil,
		winnerLineOffsetFromTopBarPx = 0,
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
	local tbl = setmetatable(t_2, t_1)
	
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
	-- upvalues: fFlagLuaAppOneByTwoHoverIdleAutoplay (ref), fFlagLuaAppVideoAutoplayFeedElection (ref)
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
	-- upvalues: fFlagLuaAppOneByTwoHoverIdleAutoplay (ref), videoEndReason (ref)
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
	-- upvalues: fFlagLuaAppOneByTwoHoverIdleAutoplay (ref), fFlagLuaAppHoverIdleAutoplayDuringScroll (ref), fFlagLuaAppTileVideoKeepPlayingOnScroll (ref), videoEndReason (ref)
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
	end
end

function t_1:onScrollSettled(p1, _, p2)
	-- upvalues: fFlagLuaAppOneByTwoHoverIdleAutoplay (ref), fFlagLuaAppTileVideoKeepPlayingOnScroll (ref), videoEndReason (ref)
	self:_cancelPendingUpdate()
	self.isScrolling = false
	
	if fFlagLuaAppOneByTwoHoverIdleAutoplay then
		self:_cancelScrollUpdate()
	end
	if fFlagLuaAppOneByTwoHoverIdleAutoplay and self:isUserIntentWithSelectiveAutoplay() then
		self:_updateWinner(p1, p2, false)
		
		return
	elseif not fFlagLuaAppTileVideoKeepPlayingOnScroll then
		self:_updateWinner(p1, p2, false)
		
		return
	end
	local instance = self.getWinnerState(false).instance
	local var1 = self:_selectWinner(p1, p2)
	
	if instance ~= var1 and instance ~= nil then
		self.coordinator:reset(videoEndReason.ScrollSettled)
	end
	self.setWinnerState({ shouldUseDwell = false, instance = var1 })
end

function t_1:reset(p1)
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
	if self.getWinnerState(false).instance == p1 then
		self:reset(p2)
		self:_maybeScheduleInitialWinnerUpdate()
	end
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
	-- upvalues: fFlagLuaAppOneByTwoHoverIdleAutoplay (ref), viewportAutoplayVideoKeyAttributeModule (ref), collectionService (ref), userIntentModeAutoplayCandidateTagModule (ref), videoEndReason (ref), fFlagLuaAppVideoAutoplayFeedElection (ref), fFlagLuaAppVideoAutoplayElectOnNewCandidateModule (ref)
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
	elseif not fFlagLuaAppVideoAutoplayFeedElection then
		self.setWinnerState({
			instance = self:_selectWinner(p1, p2),
			shouldUseDwell = p3
		})
		
		return
	end
	local instance_1 = self.getWinnerState(false).instance
	instance = self:_selectWinner(p1, p2, p4)
	
	if (self.electOnNewCandidate or fFlagLuaAppVideoAutoplayElectOnNewCandidateModule) and (instance_1 ~= nil and instance ~= instance_1) then
		self.coordinator:reset(videoEndReason.ExitViewport)
	end
	self.setWinnerState({ instance = instance, shouldUseDwell = p3 })
end

function t_1:_selectUserIntentOrAutoplayWinner(p1, p2, p3)
	-- upvalues: fFlagLuaAppHoverIdleAutoplayDuringScroll (ref), userIntentModeAutoplayCandidateTagModule (ref)
	local var1 = self:_selectUserIntentWinner()
	
	if var1 then
		return var1, true
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
	local var1 = if self.feedScopeRef then self.feedScopeRef.current else nil
	
	return if currentUserIntentCandidate == nil or var1 == nil or (not currentUserIntentCandidate:IsDescendantOf(var1) or not collectionService:HasTag(currentUserIntentCandidate, viewportAutoplayCandidateTagModule)) then nil else currentUserIntentCandidate
end

function t_1:_selectCurrentIdleWinner(p1)
	-- upvalues: collectionService (ref), userIntentModeAutoplayCandidateTagModule (ref), viewportAutoplayVideoKeyAttributeModule (ref), fFlagLuaAppVideoAutoplayOneByTwoTileCandidatePercentageUpdate (ref), getTileRowSpan (ref), fIntLuaAppOneByTwoTileVideoVisiblePercent (ref), fIntLuaAppGameTileVideoVisiblePercent (ref), getIsInstanceVisibleModule (ref)
	local var1 = if self.feedScopeRef then self.feedScopeRef.current else nil
	local viewPortBounds = self.viewPortBounds
	
	if var1 == nil or viewPortBounds == nil then
		return nil
	end
	for i, v in collectionService:GetTagged(userIntentModeAutoplayCandidateTagModule) do
		if v:IsA("GuiObject") and v:GetAttribute(viewportAutoplayVideoKeyAttributeModule) == p1 and (not self.playedVideoKeys[p1] and v:IsDescendantOf(var1)) then
			if getIsInstanceVisibleModule(v, viewPortBounds, if fFlagLuaAppVideoAutoplayOneByTwoTileCandidatePercentageUpdate and getTileRowSpan(v) == 2 and not self.preferTallestWinner then fIntLuaAppOneByTwoTileVideoVisiblePercent else fIntLuaAppGameTileVideoVisiblePercent) then
				return v
			end
		end
	end
	return nil
end

function t_1:_isCandidateEligibleForSelection(p2, p3)
	-- upvalues: viewportAutoplayVideoKeyAttributeModule (ref)
	if p3 then
		local var2 = p2:GetAttribute(viewportAutoplayVideoKeyAttributeModule)
		
		return typeof(var2) == "string" and not self.playedVideoKeys[var2]
	end
	return true
end

function t_1:_selectWinner(p2, p3, p4, p5, p6)
	-- upvalues: luaAppVideoAutoplayMaxDistanceToWinnerLinePercent (ref), fFlagLuaAppVideoAutoplayFeedElection (ref), fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor (ref), collectionService (ref), fFlagLuaAppOneByTwoHoverIdleAutoplay (ref), viewportAutoplayCandidateTagModule (ref), fFlagLuaAppVideoAutoplayOneByTwoTileCandidatePercentageUpdate (ref), getTileRowSpan (ref), fIntLuaAppOneByTwoTileVideoVisiblePercent (ref), fIntLuaAppGameTileVideoVisiblePercent (ref), getIsInstanceVisibleModule (ref), discoveryEventErrorLogger (ref), reportCandidateOverlap (ref), computeRowAnchorOverrides (ref), resolveOneByOneHeight (ref), getReadingOrderPositions (ref), isTilePinnedLeft (ref)
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
	local var2 = viewPortBounds.min.Y + self.winnerLineOffsetFromTopBarPx
	local maxValue = math.max(viewPortBounds.max.X - viewPortBounds.min.X, 1)
	local var3 = (viewPortBounds.max.Y - viewPortBounds.min.Y) * (luaAppVideoAutoplayMaxDistanceToWinnerLinePercent / 100)
	local var4 = nil
	local var5 = 1e999
	local var6 = 1e999
	local var7 = false
	
	if fFlagLuaAppVideoAutoplayFeedElection or fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor then
		local var8 = nil
		local var9 = nil
		
		if self.preferTallestWinner then
			var8 = -1
			var9 = 1e999
		end
		local function _(p7, p8)
			-- upvalues: var6 (write), var7 (write), var4 (write), reportCandidateOverlap (copy)
			if p7 < var6 then
				return true
			elseif p7 == var6 and not var7 and var4 then
				var7 = true
				reportCandidateOverlap(var4, p8, p7)
			end
			return false
		end
		
		local function considerFoldXCandidate(p7, p8, p9)
			-- upvalues: fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor (copy), maxValue (ref), var2 (ref), var5 (write), var6 (write), var4 (write), var7 (write), reportCandidateOverlap (copy)
			local absValue = math.abs((if fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor then p9 else p7.AbsolutePosition.Y + p8 / maxValue * p7.AbsoluteSize.Y) - var2)
			
			if absValue < var5 then
				var5 = absValue
				var6 = p8
				var4 = p7
				
				return
			elseif absValue == var5 then
				local var10
				if p8 < var6 then
					var10 = true
				elseif p8 == var6 and not var7 and var4 then
					var7 = true
					reportCandidateOverlap(var4, p7, p8)
				end
				var10 = false
				if var10 then
					var5 = absValue
					var6 = p8
					var4 = p7
				end
			end
		end
		
		local var10 = collectionService:GetTagged(if fFlagLuaAppOneByTwoHoverIdleAutoplay and p5 then p5 else viewportAutoplayCandidateTagModule)
		local var11 = if fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor then {} else nil
		
		if fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor then
			local t = {}
			
			for i, v in var10 do
				if v:IsA("GuiObject") and v:IsDescendantOf(current) and (not fFlagLuaAppOneByTwoHoverIdleAutoplay or self:_isCandidateEligibleForSelection(v, p6)) then
					table.insert(t, v)
				end
			end
			var11 = computeRowAnchorOverrides(t, maxValue)
		end
		for i, v in var10 do
			if v:IsA("GuiObject") and v:IsDescendantOf(current) and (not fFlagLuaAppOneByTwoHoverIdleAutoplay or self:_isCandidateEligibleForSelection(v, p6)) then
				local var12
				if fFlagLuaAppVideoAutoplayOneByTwoTileCandidatePercentageUpdate then
					var12 = if getTileRowSpan(v) == 2 and not self.preferTallestWinner then fIntLuaAppOneByTwoTileVideoVisiblePercent else fIntLuaAppGameTileVideoVisiblePercent
					
					if getIsInstanceVisibleModule(v, viewPortBounds, var12) then
						var12 = v.AbsolutePosition.X
						
						if fFlagLuaAppVideoAutoplayFeedElection and self.preferTallestWinner then
							local absValue = math.abs(math.clamp(var2, v.AbsolutePosition.Y, v.AbsolutePosition.Y + v.AbsoluteSize.Y) - var2)
							local y = v.AbsoluteSize.Y
							local absValue_1 = math.abs(v.AbsolutePosition.Y + var12 / maxValue * y - var2)
							local var13 = false
							
							if absValue < var5 then
								var13 = true
							elseif absValue == var5 then
								if var8 < y then
									var13 = true
								elseif y == var8 then
									if p4 then
										local var14
										if var12 < var6 then
											var14 = true
										elseif var12 == var6 and not var7 and var4 then
											var7 = true
											reportCandidateOverlap(var4, v, var12)
										end
										var14 = false
										if var14 then
											var13 = true
										end
									elseif absValue_1 < var9 then
										var13 = true
									elseif absValue_1 == var9 then
										local var15
										if var12 < var6 then
											var15 = true
										elseif var12 == var6 and not var7 and var4 then
											var7 = true
											reportCandidateOverlap(var4, v, var12)
										end
										var15 = false
										if var15 then
											var13 = true
										end
									end
								end
							end
							if var13 then
								var5 = absValue
								var8 = y
								var9 = absValue_1
								var6 = var12
								var4 = v
							end
						elseif fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor then
							local var16 = getTileRowSpan(v)
							local var17 = var11[v]
							
							if var16 == 2 then
								local var18 = getReadingOrderPositions(v, var12, maxValue, var16, resolveOneByOneHeight(v, var16))
								
								if var17 ~= nil then
									var18[if isTilePinnedLeft(v) then 1 else var16] = var17
								end
								for i_1, v_1 in var18 do
									considerFoldXCandidate(v, var12, v_1)
								end
							elseif var17 == nil then
								considerFoldXCandidate(v, var12, v.AbsolutePosition.Y + var12 / maxValue * v.AbsoluteSize.Y)
							else
								considerFoldXCandidate(v, var12, var17)
							end
						else
							considerFoldXCandidate(v, var12)
						end
					end
				elseif getIsInstanceVisibleModule(v, viewPortBounds, fIntLuaAppGameTileVideoVisiblePercent) then
				end
			end
		end
		return if var3 < var5 then nil else var4
	else
		for i, v in collectionService:GetTagged(if fFlagLuaAppOneByTwoHoverIdleAutoplay and p5 then p5 else viewportAutoplayCandidateTagModule) do
			if v:IsA("GuiObject") and v:IsDescendantOf(current) and (not fFlagLuaAppOneByTwoHoverIdleAutoplay or self:_isCandidateEligibleForSelection(v, p6)) then
				if fFlagLuaAppVideoAutoplayOneByTwoTileCandidatePercentageUpdate then
					if getIsInstanceVisibleModule(v, viewPortBounds, if getTileRowSpan(v) == 2 then fIntLuaAppOneByTwoTileVideoVisiblePercent else fIntLuaAppGameTileVideoVisiblePercent) then
						local absValue = math.abs(v.AbsolutePosition.Y + v.AbsolutePosition.X / maxValue * v.AbsoluteSize.Y - var2)
						local x = v.AbsolutePosition.X
						local var19 = false
						
						if absValue < var5 then
							var19 = true
						elseif absValue == var5 then
							if x < var6 then
								var19 = true
							elseif x == var6 and not var7 and var4 then
								var7 = true
								discoveryEventErrorLogger.reportError("ViewportAutoplayCandidateOverlap", "Two visible autoplay candidates share identical reading-order position and AbsolutePosition.X", {
									candidateA = var4.Name,
									candidateB = v.Name,
									absolutePositionX = x,
									absolutePositionY = v.AbsolutePosition.Y,
									absoluteSizeX = v.AbsoluteSize.X,
									absoluteSizeY = v.AbsoluteSize.Y
								})
							end
						end
						if var19 then
							var5 = absValue
							var6 = x
							var4 = v
						end
					end
				elseif getIsInstanceVisibleModule(v, viewPortBounds, fIntLuaAppGameTileVideoVisiblePercent) then
				end
			end
		end
		return if var3 < var5 then nil else var4
	end
end

return t_1