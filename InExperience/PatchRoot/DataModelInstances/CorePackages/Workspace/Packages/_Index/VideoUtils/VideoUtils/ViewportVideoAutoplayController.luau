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

local function winnerStateEquals(p1, p2)
	return p1.instance == p2.instance and p1.shouldUseDwell == p2.shouldUseDwell
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

function t_1.new(p1, p2, p3)
	-- upvalues: signalsModule (ref), t (ref), winnerStateEquals (ref), fFlagLuaAppVideoAutoplayFeedElection (ref), t_1 (ref)
	local var1
	local var2, var3 = signalsModule.createSignal(t, winnerStateEquals)
	local t_2 = {
		isScrolling = false,
		pendingUpdateTask = nil,
		viewPortBounds = nil,
		feedScopeRef = nil,
		winnerLineOffsetFromTopBarPx = 0,
		coordinator = p1
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
	t_2.getWinnerState = var2
	t_2.setWinnerState = var3
	
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

function t_1:onCandidateRegistered(p1)
	-- upvalues: fFlagLuaAppVideoAutoplayFeedElection (ref)
	local var1 = if self.feedScopeRef then self.feedScopeRef.current else nil
	
	if not var1 or not p1:IsDescendantOf(var1) then return end
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

function t_1:setViewPortBounds(p1)
	-- upvalues: videoEndReason (ref)
	self.viewPortBounds = p1
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

function t_1:onScrollStart()
	-- upvalues: fFlagLuaAppTileVideoKeepPlayingOnScroll (ref), videoEndReason (ref)
	self:_cancelPendingUpdate()
	self.isScrolling = true
	
	if not fFlagLuaAppTileVideoKeepPlayingOnScroll then
		self.coordinator:reset(videoEndReason.ScrollStart)
		self.setWinnerState({ instance = nil, shouldUseDwell = false })
	end
end

function t_1:onScrollSettled(p1, _, p2)
	-- upvalues: fFlagLuaAppTileVideoKeepPlayingOnScroll (ref), videoEndReason (ref)
	self:_cancelPendingUpdate()
	self.isScrolling = false
	
	if not fFlagLuaAppTileVideoKeepPlayingOnScroll then
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
	self:_cancelPendingUpdate()
	self.isScrolling = false
	self.coordinator:reset(p1)
	self.setWinnerState({ instance = nil, shouldUseDwell = false })
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
	-- upvalues: fFlagLuaAppVideoAutoplayFeedElection (ref), fFlagLuaAppVideoAutoplayElectOnNewCandidateModule (ref), videoEndReason (ref)
	if not fFlagLuaAppVideoAutoplayFeedElection then
		self.setWinnerState({
			instance = self:_selectWinner(p1, p2),
			shouldUseDwell = p3
		})
		
		return
	end
	local instance = self.getWinnerState(false).instance
	local var1 = self:_selectWinner(p1, p2, p4)
	
	if (self.electOnNewCandidate or fFlagLuaAppVideoAutoplayElectOnNewCandidateModule) and (instance ~= nil and var1 ~= instance) then
		self.coordinator:reset(videoEndReason.ExitViewport)
	end
	self.setWinnerState({ instance = var1, shouldUseDwell = p3 })
end

function t_1:_selectWinner(p1, p2, p3)
	-- upvalues: luaAppVideoAutoplayMaxDistanceToWinnerLinePercent (ref), fFlagLuaAppVideoAutoplayFeedElection (ref), collectionService (ref), viewportAutoplayCandidateTagModule (ref), getIsInstanceVisibleModule (ref), fIntLuaAppGameTileVideoVisiblePercent (ref), discoveryEventErrorLogger (ref), reportCandidateOverlap (ref)
	local viewPortBounds = self.viewPortBounds
	
	if not viewPortBounds then
		return nil
	end
	local current = nil
	
	if p1 == "X" and p2 then
		current = p2.current
	elseif self.feedScopeRef then
		current = self.feedScopeRef.current
	end
	if not current then
		return nil
	end
	local var1 = viewPortBounds.min.Y + self.winnerLineOffsetFromTopBarPx
	local maxValue = math.max(viewPortBounds.max.X - viewPortBounds.min.X, 1)
	local var2 = (viewPortBounds.max.Y - viewPortBounds.min.Y) * (luaAppVideoAutoplayMaxDistanceToWinnerLinePercent / 100)
	local var3 = nil
	local var4 = 1e999
	local var5 = 1e999
	local var6 = false
	
	if fFlagLuaAppVideoAutoplayFeedElection then
		local var7 = nil
		local var8 = nil
		
		if self.preferTallestWinner then
			var7 = -1
			var8 = 1e999
		end
		local function _(p4, p5)
			-- upvalues: var5 (write), var6 (write), var3 (write), reportCandidateOverlap (copy)
			if p4 < var5 then
				return true
			elseif p4 == var5 and not var6 and var3 then
				var6 = true
				reportCandidateOverlap(var3, p5, p4)
			end
			return false
		end
		
		local _ = function(p4, p5)
			-- upvalues: maxValue (ref), var1 (ref), var4 (write), var5 (write), var3 (write), var6 (write), reportCandidateOverlap (copy)
			local absValue = math.abs(p4.AbsolutePosition.Y + p5 / maxValue * p4.AbsoluteSize.Y - var1)
			
			if absValue < var4 then
				var4 = absValue
				var5 = p5
				var3 = p4
				
				return
			elseif absValue == var4 then
				local var9
				if p5 < var5 then
					var9 = true
				elseif p5 == var5 and not var6 and var3 then
					var6 = true
					reportCandidateOverlap(var3, p4, p5)
				end
				var9 = false
				if var9 then
					var4 = absValue
					var5 = p5
					var3 = p4
				end
			end
		end
		
		for i, v in collectionService:GetTagged(viewportAutoplayCandidateTagModule) do
			if v:IsA("GuiObject") and v:IsDescendantOf(current) and getIsInstanceVisibleModule(v, viewPortBounds, fIntLuaAppGameTileVideoVisiblePercent) then
				local x = v.AbsolutePosition.X
				
				if fFlagLuaAppVideoAutoplayFeedElection and self.preferTallestWinner then
					local absValue = math.abs(math.clamp(var1, v.AbsolutePosition.Y, v.AbsolutePosition.Y + v.AbsoluteSize.Y) - var1)
					local y = v.AbsoluteSize.Y
					local absValue_1 = math.abs(v.AbsolutePosition.Y + x / maxValue * y - var1)
					local var9 = false
					
					if absValue < var4 then
						var9 = true
					elseif absValue == var4 then
						if var7 < y then
							var9 = true
						elseif y == var7 then
							if p3 then
								local var10
								if x < var5 then
									var10 = true
								elseif x == var5 and not var6 and var3 then
									var6 = true
									reportCandidateOverlap(var3, v, x)
								end
								var10 = false
								if var10 then
									var9 = true
								end
							elseif absValue_1 < var8 then
								var9 = true
							elseif absValue_1 == var8 then
								local var11
								if x < var5 then
									var11 = true
								elseif x == var5 and not var6 and var3 then
									var6 = true
									reportCandidateOverlap(var3, v, x)
								end
								var11 = false
								if var11 then
									var9 = true
								end
							end
						end
					end
					if var9 then
						var4 = absValue
						var7 = y
						var8 = absValue_1
						var5 = x
						var3 = v
					end
				else
					local absValue = math.abs(v.AbsolutePosition.Y + x / maxValue * v.AbsoluteSize.Y - var1)
					
					if absValue < var4 then
						var4 = absValue
						var5 = x
						var3 = v
					elseif absValue == var4 then
						local var12
						if x < var5 then
							var12 = true
						elseif x == var5 and not var6 and var3 then
							var6 = true
							reportCandidateOverlap(var3, v, x)
						end
						var12 = false
						if var12 then
							var4 = absValue
							var5 = x
							var3 = v
						end
					end
				end
			end
		end
		return if var2 < var4 then nil else var3
	else
		for i, v in collectionService:GetTagged(viewportAutoplayCandidateTagModule) do
			if v:IsA("GuiObject") and v:IsDescendantOf(current) and getIsInstanceVisibleModule(v, viewPortBounds, fIntLuaAppGameTileVideoVisiblePercent) then
				local absValue = math.abs(v.AbsolutePosition.Y + v.AbsolutePosition.X / maxValue * v.AbsoluteSize.Y - var1)
				local x = v.AbsolutePosition.X
				local var13 = false
				
				if absValue < var4 then
					var13 = true
				elseif absValue == var4 then
					if x < var5 then
						var13 = true
					elseif x == var5 and not var6 and var3 then
						var6 = true
						discoveryEventErrorLogger.reportError("ViewportAutoplayCandidateOverlap", "Two visible autoplay candidates share identical reading-order position and AbsolutePosition.X", {
							candidateA = var3.Name,
							candidateB = v.Name,
							absolutePositionX = x,
							absolutePositionY = v.AbsolutePosition.Y,
							absoluteSizeX = v.AbsoluteSize.X,
							absoluteSizeY = v.AbsoluteSize.Y
						})
					end
				end
				if var13 then
					var4 = absValue
					var5 = x
					var3 = v
				end
			end
		end
		return if var2 < var4 then nil else var3
	end
end

return t_1