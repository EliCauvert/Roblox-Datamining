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

local function winnerStateEquals(p0, p1)
	return p0.instance == p1.instance and p0.shouldUseDwell == p1.shouldUseDwell
end

local t_1 = {}
t_1.__index = t_1

function t_1.new(p2)
	-- upvalues: signalsModule (ref), t (ref), winnerStateEquals (ref), t_1 (ref)
	local var9, var10 = signalsModule.createSignal(t, winnerStateEquals)
	
	return setmetatable({
		isScrolling = false,
		pendingUpdateTask = nil,
		viewPortBounds = nil,
		feedScopeRef = nil,
		winnerLineOffsetFromTopBarPx = 0,
		coordinator = p2,
		getWinnerState = var9,
		setWinnerState = var10
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

function t_1:setViewPortBounds(p3)
	-- upvalues: videoEndReason (ref)
	self.viewPortBounds = p3
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

function t_1:setWinnerLineOffsetFromTopBarPx(p4)
	self.winnerLineOffsetFromTopBarPx = p4
end

function t_1:setFeedScopeRef(p5)
	self.feedScopeRef = p5
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

function t_1:onScrollSettled(p6, _, p7)
	-- upvalues: fFlagLuaAppTileVideoKeepPlayingOnScroll (ref), videoEndReason (ref)
	self:_cancelPendingUpdate()
	self.isScrolling = false
	
	if not fFlagLuaAppTileVideoKeepPlayingOnScroll then
		self:_updateWinner(p6, p7, false)
		
		return
	end
	local instance = self.getWinnerState(false).instance
	local var13 = self:_selectWinner(p6, p7)
	
	if instance ~= var13 and instance ~= nil then
		self.coordinator:reset(videoEndReason.ScrollSettled)
	end
	self.setWinnerState({ shouldUseDwell = false, instance = var13 })
end

function t_1:reset(p8)
	self:_cancelPendingUpdate()
	self.isScrolling = false
	self.coordinator:reset(p8)
	self.setWinnerState({ instance = nil, shouldUseDwell = false })
end

function t_1:resetIfActiveInstance(p9, p10)
	if self.getWinnerState(false).instance == p9 then
		self:reset(p10)
		self:_maybeScheduleInitialWinnerUpdate()
	end
end

function t_1:scheduleUpdateWinner(p11, p12, p13)
	if self.pendingUpdateTask == nil then
		self.pendingUpdateTask = task.defer(function()
			-- upvalues: self (ref), p11 (ref), p12 (ref), p13 (ref)
			self.pendingUpdateTask = nil
			
			if self.isScrolling then
				return
			end
			self:_updateWinner(p11, p12, p13)
		end)
		
		return
	end
end

function t_1:_updateWinner(p14, p15, p16)
	self.setWinnerState({
		instance = self:_selectWinner(p14, p15),
		shouldUseDwell = p16
	})
end

function t_1:_selectWinner(p17, p18)
	-- upvalues: luaAppVideoAutoplayMaxDistanceToWinnerLinePercent (ref), collectionService (ref), viewportAutoplayCandidateTagModule (ref), getIsInstanceVisibleModule (ref), fIntLuaAppGameTileVideoVisiblePercent (ref), discoveryEventErrorLogger (ref)
	local viewPortBounds = self.viewPortBounds
	
	if not viewPortBounds then
		return nil
	end
	local current = nil
	
	if p17 == "X" and p18 then
		current = p18.current
	elseif self.feedScopeRef then
		current = self.feedScopeRef.current
	end
	if not current then
		return nil
	end
	local var14 = viewPortBounds.min.Y + self.winnerLineOffsetFromTopBarPx
	local maxValue = math.max(viewPortBounds.max.X - viewPortBounds.min.X, 1)
	local var16 = (viewPortBounds.max.Y - viewPortBounds.min.Y) * (luaAppVideoAutoplayMaxDistanceToWinnerLinePercent / 100)
	local var17 = nil
	local var18 = 1e999
	local var19 = 1e999
	local var20 = false
	
	for i, v in collectionService:GetTagged(viewportAutoplayCandidateTagModule) do
		if v:IsA("GuiObject") and v:IsDescendantOf(current) and getIsInstanceVisibleModule(v, viewPortBounds, fIntLuaAppGameTileVideoVisiblePercent) then
			local absValue = math.abs(v.AbsolutePosition.Y + v.AbsolutePosition.X / maxValue * v.AbsoluteSize.Y - var14)
			local x = v.AbsolutePosition.X
			local var22 = false
			
			if absValue < var18 then
				var22 = true
			elseif absValue == var18 then
				if x < var19 then
					var22 = true
				elseif x == var19 and not var20 and var17 then
					var20 = true
					discoveryEventErrorLogger.reportError("ViewportAutoplayCandidateOverlap", "Two visible autoplay candidates share identical reading-order position and AbsolutePosition.X", {
						candidateA = var17.Name,
						candidateB = v.Name,
						absolutePositionX = x,
						absolutePositionY = v.AbsolutePosition.Y,
						absoluteSizeX = v.AbsoluteSize.X,
						absoluteSizeY = v.AbsoluteSize.Y
					})
				end
			end
			if var22 then
				var18 = absValue
				var19 = x
				var17 = v
			end
		end
	end
	return if var16 < var18 then nil else var17
end

return t_1