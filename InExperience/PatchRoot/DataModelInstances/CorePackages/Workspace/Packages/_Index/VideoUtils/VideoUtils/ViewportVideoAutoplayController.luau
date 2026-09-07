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
local luaAppVideoAutoplayMaxDistanceToWinnerLinePercent = game:DefineFastInt("LuaAppVideoAutoplayMaxDistanceToWinnerLinePercent", 50)
local t = { instance = nil, shouldUseDwell = true }

local function winnerStateEquals(p1, p2)
	return p1.instance == p2.instance and p1.shouldUseDwell == p2.shouldUseDwell
end

local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: signalsModule (ref), t (ref), winnerStateEquals (ref), t_1 (ref)
	local var1, var2 = signalsModule.createSignal(t, winnerStateEquals)
	
	return setmetatable({
		isScrolling = false,
		pendingUpdateTask = nil,
		viewPortBounds = nil,
		feedScopeRef = nil,
		winnerLineOffsetFromTopBarPx = 0,
		coordinator = p1,
		getWinnerState = var1,
		setWinnerState = var2
	}, t_1)
end

function t_1:_hasUsableViewportBounds()
	return if self.viewPortBounds then self.viewPortBounds.min.X < self.viewPortBounds.max.X and self.viewPortBounds.min.Y < self.viewPortBounds.max.Y else false
end

function t_1:_maybeScheduleInitialWinnerUpdate()
	if self.getWinnerState(false).instance ~= nil or self.isScrolling then return end
	if self:_hasUsableViewportBounds() then
		self:scheduleUpdateWinner("Y", nil, true)
		
		return
	end
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

function t_1:scheduleUpdateWinner(p1, p2, p3)
	if self.pendingUpdateTask == nil then
		self.pendingUpdateTask = task.defer(function()
			-- upvalues: self (ref), p1 (ref), p2 (ref), p3 (ref)
			self.pendingUpdateTask = nil
			
			if self.isScrolling then
				return
			end
			self:_updateWinner(p1, p2, p3)
		end)
		
		return
	end
end

function t_1:_updateWinner(p1, p2, p3)
	self.setWinnerState({
		instance = self:_selectWinner(p1, p2),
		shouldUseDwell = p3
	})
end

function t_1:_selectWinner(p1, p2)
	-- upvalues: luaAppVideoAutoplayMaxDistanceToWinnerLinePercent (ref), collectionService (ref), viewportAutoplayCandidateTagModule (ref), getIsInstanceVisibleModule (ref), fIntLuaAppGameTileVideoVisiblePercent (ref), discoveryEventErrorLogger (ref)
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
	
	for i, v in collectionService:GetTagged(viewportAutoplayCandidateTagModule) do
		if v:IsA("GuiObject") and v:IsDescendantOf(current) and getIsInstanceVisibleModule(v, viewPortBounds, fIntLuaAppGameTileVideoVisiblePercent) then
			local absValue = math.abs(v.AbsolutePosition.Y + v.AbsolutePosition.X / maxValue * v.AbsoluteSize.Y - var1)
			local x = v.AbsolutePosition.X
			local var7 = false
			
			if absValue < var4 then
				var7 = true
			elseif absValue == var4 then
				if x < var5 then
					var7 = true
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
			if var7 then
				var4 = absValue
				var5 = x
				var3 = v
			end
		end
	end
	return if var2 < var4 then nil else var3
end

return t_1