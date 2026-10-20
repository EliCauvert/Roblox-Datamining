local CollectionService = game:GetService("CollectionService")
local VideoUtils = script:FindFirstAncestor("VideoUtils")
local Parent = VideoUtils.Parent
local SignalsModule = require(Parent.Signals)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local _ = require(VideoUtils.VideoPlaybackCoordinator)
local VideoEndReason = require(VideoUtils.Analytics.Enums).VideoEndReason
local GetIsInstanceVisibleModule = require(VideoUtils.getIsInstanceVisible)
local ViewportAutoplayCandidateTagModule = require(VideoUtils.ViewportAutoplayCandidateTag)
local FIntLuaAppGameTileVideoVisiblePercent = require(Parent.SharedFlags).FIntLuaAppGameTileVideoVisiblePercent
local FFlagLuaAppTileVideoKeepPlayingOnScroll = require(Parent.SharedFlags).FFlagLuaAppTileVideoKeepPlayingOnScroll
local LuaAppVideoAutoplayMaxDistanceToWinnerLinePercent = game:DefineFastInt("LuaAppVideoAutoplayMaxDistanceToWinnerLinePercent", 50)
local config = { instance = nil, shouldUseDwell = true }

local function winnerStateEquals(p1, p2): boolean
	return p1.instance == p2.instance and p1.shouldUseDwell == p2.shouldUseDwell
end

local ViewportVideoAutoplayController = {}
ViewportVideoAutoplayController.__index = ViewportVideoAutoplayController

function ViewportVideoAutoplayController.new(Coordinator)
	-- upvalues: SignalsModule (copy), config (copy), winnerStateEquals (copy), ViewportVideoAutoplayController (copy)
	local Signal, Signal2 = SignalsModule.createSignal(config, winnerStateEquals)
	
	return (setmetatable({
		isScrolling = false,
		pendingUpdateTask = nil,
		viewPortBounds = nil,
		feedScopeRef = nil,
		winnerLineOffsetFromTopBarPx = 0,
		coordinator = Coordinator,
		getWinnerState = Signal,
		setWinnerState = Signal2
	}, ViewportVideoAutoplayController))
end

function ViewportVideoAutoplayController._hasUsableViewportBounds(p1): boolean
	return if p1.viewPortBounds then p1.viewPortBounds.min.X < p1.viewPortBounds.max.X and p1.viewPortBounds.min.Y < p1.viewPortBounds.max.Y else false
end

function ViewportVideoAutoplayController:_maybeScheduleInitialWinnerUpdate()
	if self.getWinnerState(false).instance ~= nil or self.isScrolling then return end
	if self:_hasUsableViewportBounds() then
		self:scheduleUpdateWinner("Y", nil, true)
		
		return
	end
end

function ViewportVideoAutoplayController:setViewPortBounds(ViewPortBounds)
	-- upvalues: VideoEndReason (copy)
	self.viewPortBounds = ViewPortBounds
	self:_maybeScheduleInitialWinnerUpdate()
	local WinnerState = self.getWinnerState(false)
	local WinnerStateInstance = WinnerState.instance
	
	if WinnerStateInstance ~= nil and not self.isScrolling and self:_hasUsableViewportBounds() then
		self:_cancelPendingUpdate()
		local Y = self:_selectWinner("Y", nil)
		local ShouldUseDwell = WinnerState.shouldUseDwell
		
		if Y ~= WinnerStateInstance then
			self.coordinator:reset(VideoEndReason.ViewportResized)
			ShouldUseDwell = true
		end
		self.setWinnerState({ instance = Y, shouldUseDwell = ShouldUseDwell })
	end
end

function ViewportVideoAutoplayController:setWinnerLineOffsetFromTopBarPx(WinnerLineOffsetFromTopBarPx)
	self.winnerLineOffsetFromTopBarPx = WinnerLineOffsetFromTopBarPx
end

function ViewportVideoAutoplayController:setFeedScopeRef(FeedScopeRef)
	self.feedScopeRef = FeedScopeRef
	self:_maybeScheduleInitialWinnerUpdate()
end

function ViewportVideoAutoplayController:_cancelPendingUpdate()
	if self.pendingUpdateTask ~= nil then
		task.cancel(self.pendingUpdateTask)
		self.pendingUpdateTask = nil
	end
end

function ViewportVideoAutoplayController:onScrollStart()
	-- upvalues: FFlagLuaAppTileVideoKeepPlayingOnScroll (copy), VideoEndReason (copy)
	self:_cancelPendingUpdate()
	self.isScrolling = true
	
	if not FFlagLuaAppTileVideoKeepPlayingOnScroll then
		self.coordinator:reset(VideoEndReason.ScrollStart)
		self.setWinnerState({ instance = nil, shouldUseDwell = false })
	end
end

function ViewportVideoAutoplayController:onScrollSettled(p1, _, p2)
	-- upvalues: FFlagLuaAppTileVideoKeepPlayingOnScroll (copy), VideoEndReason (copy)
	self:_cancelPendingUpdate()
	self.isScrolling = false
	
	if not FFlagLuaAppTileVideoKeepPlayingOnScroll then
		self:_updateWinner(p1, p2, false)
		
		return
	end
	local _Instance = self.getWinnerState(false).instance
	local SelectWinnerResult = self:_selectWinner(p1, p2)
	
	if _Instance ~= SelectWinnerResult and _Instance ~= nil then
		self.coordinator:reset(VideoEndReason.ScrollSettled)
	end
	self.setWinnerState({ shouldUseDwell = false, instance = SelectWinnerResult })
end

function ViewportVideoAutoplayController:reset(p1)
	self:_cancelPendingUpdate()
	self.isScrolling = false
	self.coordinator:reset(p1)
	self.setWinnerState({ instance = nil, shouldUseDwell = false })
end

function ViewportVideoAutoplayController:resetIfActiveInstance(p1, p2)
	if self.getWinnerState(false).instance == p1 then
		self:reset(p2)
		self:_maybeScheduleInitialWinnerUpdate()
	end
end

function ViewportVideoAutoplayController:scheduleUpdateWinner(p1, p2, ShouldUseDwell)
	if self.pendingUpdateTask == nil then
		self.pendingUpdateTask = task.defer(function()
			-- upvalues: self (copy), p1 (copy), p2 (copy), ShouldUseDwell (copy)
			self.pendingUpdateTask = nil
			
			if not self.isScrolling then
				self:_updateWinner(p1, p2, ShouldUseDwell)
				
				return
			end
		end)
		
		return
	end
end

function ViewportVideoAutoplayController:_updateWinner(p1, p2, ShouldUseDwell)
	self.setWinnerState({
		instance = self:_selectWinner(p1, p2),
		shouldUseDwell = ShouldUseDwell
	})
end

function ViewportVideoAutoplayController:_selectWinner(p1, p2)
	-- upvalues: LuaAppVideoAutoplayMaxDistanceToWinnerLinePercent (copy), CollectionService (copy), ViewportAutoplayCandidateTagModule (copy), GetIsInstanceVisibleModule (copy), FIntLuaAppGameTileVideoVisiblePercent (copy), DiscoveryEventErrorLogger (copy)
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
	local v1 = nil
	local Magnitude = 1e999
	local X = 1e999
	local Flag = false
	
	for _, Frame in CollectionService:GetTagged(ViewportAutoplayCandidateTagModule) do
		if Frame:IsA("GuiObject") and Frame:IsDescendantOf(Current) and GetIsInstanceVisibleModule(Frame, ViewPortBounds, FIntLuaAppGameTileVideoVisiblePercent) then
			local Magnitude1 = math.abs(Frame.AbsolutePosition.Y + Frame.AbsolutePosition.X / Largest * Frame.AbsoluteSize.Y - NewY)
			local X1 = Frame.AbsolutePosition.X
			local Flag1 = false
			
			if Magnitude1 < Magnitude then
				Flag1 = true
			elseif Magnitude1 == Magnitude then
				if X1 < X then
					Flag1 = true
				elseif X1 == X and not Flag and v1 then
					Flag = true
					DiscoveryEventErrorLogger.reportError("ViewportAutoplayCandidateOverlap", "Two visible autoplay candidates share identical reading-order position and AbsolutePosition.X", {
						candidateA = v1.Name,
						candidateB = Frame.Name,
						absolutePositionX = X1,
						absolutePositionY = Frame.AbsolutePosition.Y,
						absoluteSizeX = Frame.AbsoluteSize.X,
						absoluteSizeY = Frame.AbsoluteSize.Y
					})
				end
			end
			if Flag1 then
				Magnitude = Magnitude1
				X = X1
				v1 = Frame
			end
		end
	end
	return if ScaledY < Magnitude then nil else v1
end

return ViewportVideoAutoplayController