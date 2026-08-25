local collectionService = game:GetService("CollectionService")
local videoUtils = script:FindFirstAncestor("VideoUtils")
local parent = videoUtils.Parent
local signalsModule = require(parent.Signals)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local _ = require(videoUtils.VideoPlaybackCoordinator)
local videoEndReason = require(videoUtils.Analytics.Enums).VideoEndReason
local getIsInstanceVisibleModule = require(videoUtils.getIsInstanceVisible)
local viewportAutoplayCandidateTagModule = require(videoUtils.ViewportAutoplayCandidateTag)
local fIntLuaAppGameTileVideoVisiblePercent = require(parent.SharedFlags).FIntLuaAppGameTileVideoVisiblePercent
local fFlagLuaAppTileVideoKeepPlayingOnScroll = require(parent.SharedFlags).FFlagLuaAppTileVideoKeepPlayingOnScroll
local fFlagLuaAppVideoAutoplayFeedElection = require(parent.SharedFlags).FFlagLuaAppVideoAutoplayFeedElection
local fFlagLuaAppVideoAutoplayElectOnNewCandidateModule = require(script.Parent.FFlagLuaAppVideoAutoplayElectOnNewCandidate)
local luaAppVideoAutoplayMaxDistanceToWinnerLinePercent = game:DefineFastInt("LuaAppVideoAutoplayMaxDistanceToWinnerLinePercent", 50)
local t = { instance = nil, shouldUseDwell = true }

local function winnerStateEquals(p0, p1)
	return p0.instance == p1.instance and p0.shouldUseDwell == p1.shouldUseDwell
end

local function reportCandidateOverlap(p2, p3, p4)
	-- upvalues: discoveryEventErrorLogger (ref)
	discoveryEventErrorLogger.reportError("ViewportAutoplayCandidateOverlap", "Two visible autoplay candidates share identical reading-order position and AbsolutePosition.X", {
		candidateA = p2.Name,
		candidateB = p3.Name,
		absolutePositionX = p4,
		absolutePositionY = p3.AbsolutePosition.Y,
		absoluteSizeX = p3.AbsoluteSize.X,
		absoluteSizeY = p3.AbsoluteSize.Y
	})
end

local t_1 = {}
t_1.__index = t_1

function t_1.new(p5, p6, p7)
	-- upvalues: signalsModule (ref), t (ref), winnerStateEquals (ref), fFlagLuaAppVideoAutoplayFeedElection (ref), t_1 (ref)
	local var14
	local var11, var12 = signalsModule.createSignal(t, winnerStateEquals)
	local t_2 = {
		isScrolling = false,
		pendingUpdateTask = nil,
		viewPortBounds = nil,
		feedScopeRef = nil,
		winnerLineOffsetFromTopBarPx = 0,
		coordinator = p5
	}
	
	if fFlagLuaAppVideoAutoplayFeedElection then
		var14 = p6 == true
		var14 = nil
	else
		var14 = false
	end
	local var15
	t_2.preferTallestWinner = var14
	
	if fFlagLuaAppVideoAutoplayFeedElection then
		var15 = p7 == true
		var15 = nil
	else
		var15 = false
	end
	t_2.electOnNewCandidate = var15
	t_2.getWinnerState = var11
	t_2.setWinnerState = var12
	
	return setmetatable(t_2, t_1)
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

function t_1:onCandidateRegistered(p8)
	-- upvalues: fFlagLuaAppVideoAutoplayFeedElection (ref)
	local var16 = if self.feedScopeRef then self.feedScopeRef.current else nil
	
	if not var16 or not p8:IsDescendantOf(var16) then return end
	if self.isScrolling then return end
	if not self:_hasUsableViewportBounds() then return end
	if self.coordinator.playingVideoKey ~= nil then return end
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

function t_1:setViewPortBounds(p9)
	-- upvalues: videoEndReason (ref)
	self.viewPortBounds = p9
	self:_maybeScheduleInitialWinnerUpdate()
	local winnerState = self.getWinnerState(false)
	local instance = winnerState.instance
	
	if instance ~= nil and not self.isScrolling and self:_hasUsableViewportBounds() then
		self:_cancelPendingUpdate()
		local y = self:_selectWinner("Y", nil)
		local shouldUseDwell = winnerState.shouldUseDwell
		
		if y ~= instance then
			self.coordinator:reset(videoEndReason.ViewportResized)
			shouldUseDwell = true
		end
		self.setWinnerState({ instance = y, shouldUseDwell = shouldUseDwell })
	end
end

function t_1:setWinnerLineOffsetFromTopBarPx(p10)
	self.winnerLineOffsetFromTopBarPx = p10
end

function t_1:setFeedScopeRef(p11)
	self.feedScopeRef = p11
	self:_maybeScheduleInitialWinnerUpdate()
end

function t_1:_cancelPendingUpdate()
	if self.pendingUpdateTask ~= nil then
		task.cancel(self.pendingUpdateTask)
		self.pendingUpdateTask = nil
	end
end

function t_1:onScrollStart()
	-- upvalues: fFlagLuaAppTileVideoKeepPlayingOnScroll (ref), videoEndReason (ref)
	self:_cancelPendingUpdate()
	self.isScrolling = true
	
	if not fFlagLuaAppTileVideoKeepPlayingOnScroll then
		self.coordinator:reset(videoEndReason.ScrollStart)
		self.setWinnerState({ instance = nil, shouldUseDwell = false })
	end
end

function t_1:onScrollSettled(p12, _, p13)
	-- upvalues: fFlagLuaAppTileVideoKeepPlayingOnScroll (ref), videoEndReason (ref)
	self:_cancelPendingUpdate()
	self.isScrolling = false
	
	if not fFlagLuaAppTileVideoKeepPlayingOnScroll then
		self:_updateWinner(p12, p13, false)
		
		return
	end
	local instance = self.getWinnerState(false).instance
	local var19 = self:_selectWinner(p12, p13)
	
	if instance ~= var19 and instance ~= nil then
		self.coordinator:reset(videoEndReason.ScrollSettled)
	end
	self.setWinnerState({ shouldUseDwell = false, instance = var19 })
end

function t_1:reset(p14)
	self:_cancelPendingUpdate()
	self.isScrolling = false
	self.coordinator:reset(p14)
	self.setWinnerState({ instance = nil, shouldUseDwell = false })
end

function t_1:resetIfActiveInstance(p15, p16)
	if self.getWinnerState(false).instance == p15 then
		self:reset(p16)
		self:_maybeScheduleInitialWinnerUpdate()
	end
end

function t_1:scheduleUpdateWinner(p17, p18, p19, p20)
	-- upvalues: fFlagLuaAppVideoAutoplayFeedElection (ref)
	if self.pendingUpdateTask == nil then
		self.pendingUpdateTask = task.defer(function()
			-- upvalues: self (ref), p17 (ref), p18 (ref), p19 (ref), fFlagLuaAppVideoAutoplayFeedElection (copy), p20 (ref)
			self.pendingUpdateTask = nil
			
			if self.isScrolling then
				return
			end
			self:_updateWinner(p17, p18, p19, if fFlagLuaAppVideoAutoplayFeedElection then p20 else nil)
		end)
		
		return
	end
end

function t_1:_updateWinner(p21, p22, p23, p24)
	-- upvalues: fFlagLuaAppVideoAutoplayFeedElection (ref), fFlagLuaAppVideoAutoplayElectOnNewCandidateModule (ref), videoEndReason (ref)
	if not fFlagLuaAppVideoAutoplayFeedElection then
		self.setWinnerState({
			instance = self:_selectWinner(p21, p22),
			shouldUseDwell = p23
		})
		
		return
	end
	local instance = self.getWinnerState(false).instance
	local var20 = self:_selectWinner(p21, p22, p24)
	
	if (self.electOnNewCandidate or fFlagLuaAppVideoAutoplayElectOnNewCandidateModule) and (instance ~= nil and var20 ~= instance) then
		self.coordinator:reset(videoEndReason.ExitViewport)
	end
	self.setWinnerState({ instance = var20, shouldUseDwell = p23 })
end

function t_1:_selectWinner(p25, p26, p27)
	-- upvalues: luaAppVideoAutoplayMaxDistanceToWinnerLinePercent (ref), fFlagLuaAppVideoAutoplayFeedElection (ref), collectionService (ref), viewportAutoplayCandidateTagModule (ref), getIsInstanceVisibleModule (ref), fIntLuaAppGameTileVideoVisiblePercent (ref), discoveryEventErrorLogger (ref), reportCandidateOverlap (ref)
	local viewPortBounds = self.viewPortBounds
	
	if not viewPortBounds then
		return nil
	end
	local current = nil
	
	if p25 == "X" and p26 then
		current = p26.current
	elseif self.feedScopeRef then
		current = self.feedScopeRef.current
	end
	if not current then
		return nil
	end
	local var21 = viewPortBounds.min.Y + self.winnerLineOffsetFromTopBarPx
	local maxValue = math.max(viewPortBounds.max.X - viewPortBounds.min.X, 1)
	local var23 = (viewPortBounds.max.Y - viewPortBounds.min.Y) * (luaAppVideoAutoplayMaxDistanceToWinnerLinePercent / 100)
	local var24 = nil
	local var25 = 1e999
	local var26 = 1e999
	local var27 = false
	
	if fFlagLuaAppVideoAutoplayFeedElection then
		local var30 = nil
		local var31 = nil
		
		if self.preferTallestWinner then
			var30 = -1
			var31 = 1e999
		end
		local function _(p28, p29)
			-- upvalues: var26 (write), var27 (write), var24 (write), reportCandidateOverlap (copy)
			if p28 < var26 then
				return true
			elseif p28 == var26 and not var27 and var24 then
				var27 = true
				reportCandidateOverlap(var24, p29, p28)
			end
			return false
		end
		
		local _ = function(p30, p31)
			-- upvalues: maxValue (ref), var21 (ref), var25 (write), var26 (write), var24 (write), var27 (write), reportCandidateOverlap (copy)
			local absValue = math.abs(p30.AbsolutePosition.Y + p31 / maxValue * p30.AbsoluteSize.Y - var21)
			
			if absValue < var25 then
				var25 = absValue
				var26 = p31
				var24 = p30
				
				return
			elseif absValue == var25 then
				local var40
				if p31 < var26 then
					var40 = true
				elseif p31 == var26 and not var27 and var24 then
					var27 = true
					reportCandidateOverlap(var24, p30, p31)
				end
				var40 = false
				if var40 then
					var25 = absValue
					var26 = p31
					var24 = p30
				end
			end
		end
		
		for i, v in collectionService:GetTagged(viewportAutoplayCandidateTagModule) do
			if v:IsA("GuiObject") and v:IsDescendantOf(current) and getIsInstanceVisibleModule(v, viewPortBounds, fIntLuaAppGameTileVideoVisiblePercent) then
				local x = v.AbsolutePosition.X
				
				if fFlagLuaAppVideoAutoplayFeedElection and self.preferTallestWinner then
					local absValue = math.abs(math.clamp(var21, v.AbsolutePosition.Y, v.AbsolutePosition.Y + v.AbsoluteSize.Y) - var21)
					local y = v.AbsoluteSize.Y
					local absValue_1 = math.abs(v.AbsolutePosition.Y + x / maxValue * y - var21)
					local var36 = false
					
					if absValue < var25 then
						var36 = true
					elseif absValue == var25 then
						if var30 < y then
							var36 = true
						elseif y == var30 then
							if p27 then
								local var37
								if x < var26 then
									var37 = true
								elseif x == var26 and not var27 and var24 then
									var27 = true
									reportCandidateOverlap(var24, v, x)
								end
								var37 = false
								if var37 then
									var36 = true
								end
							elseif absValue_1 < var31 then
								var36 = true
							elseif absValue_1 == var31 then
								local var38
								if x < var26 then
									var38 = true
								elseif x == var26 and not var27 and var24 then
									var27 = true
									reportCandidateOverlap(var24, v, x)
								end
								var38 = false
								if var38 then
									var36 = true
								end
							end
						end
					end
					if var36 then
						var25 = absValue
						var30 = y
						var31 = absValue_1
						var26 = x
						var24 = v
					end
				else
					local absValue = math.abs(v.AbsolutePosition.Y + x / maxValue * v.AbsoluteSize.Y - var21)
					
					if absValue < var25 then
						var25 = absValue
						var26 = x
						var24 = v
					elseif absValue == var25 then
						local var33
						if x < var26 then
							var33 = true
						elseif x == var26 and not var27 and var24 then
							var27 = true
							reportCandidateOverlap(var24, v, x)
						end
						var33 = false
						if var33 then
							var25 = absValue
							var26 = x
							var24 = v
						end
					end
				end
			end
		end
		return if var23 < var25 then nil else var24
	else
		for i, v in collectionService:GetTagged(viewportAutoplayCandidateTagModule) do
			if v:IsA("GuiObject") and v:IsDescendantOf(current) and getIsInstanceVisibleModule(v, viewPortBounds, fIntLuaAppGameTileVideoVisiblePercent) then
				local absValue = math.abs(v.AbsolutePosition.Y + v.AbsolutePosition.X / maxValue * v.AbsoluteSize.Y - var21)
				local x = v.AbsolutePosition.X
				local var29 = false
				
				if absValue < var25 then
					var29 = true
				elseif absValue == var25 then
					if x < var26 then
						var29 = true
					elseif x == var26 and not var27 and var24 then
						var27 = true
						discoveryEventErrorLogger.reportError("ViewportAutoplayCandidateOverlap", "Two visible autoplay candidates share identical reading-order position and AbsolutePosition.X", {
							candidateA = var24.Name,
							candidateB = v.Name,
							absolutePositionX = x,
							absolutePositionY = v.AbsolutePosition.Y,
							absoluteSizeX = v.AbsoluteSize.X,
							absoluteSizeY = v.AbsoluteSize.Y
						})
					end
				end
				if var29 then
					var25 = absValue
					var26 = x
					var24 = v
				end
			end
		end
		return if var23 < var25 then nil else var24
	end
end

return t_1