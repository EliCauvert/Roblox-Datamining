local collectionService = game:GetService("CollectionService")
local constantsModule = require(script.Parent.Constants)
local calculateIntersectionRatioModule = require(script.Parent.calculateIntersectionRatio)
local sponsoredAdViewabilityRegistryModule = require(script.Parent.sponsoredAdViewabilityRegistry)
local sponsoredAdViewabilityStateModule = require(script.Parent.sponsoredAdViewabilityState)
local t = {
	SurfaceTeardown = "SurfaceTeardown",
	FeedRefresh = "FeedRefresh"
}

local function measureTile(p0, p1, p2) --[[ line: 54 ]]
	-- upvalues: constantsModule (ref), sponsoredAdViewabilityRegistryModule (ref), calculateIntersectionRatioModule (ref)
	if not p0:IsA("GuiObject") then
		return nil
	elseif not p0:IsDescendantOf(p1) then
		return nil
	end
	local viewabilityTargetIdAttribute = p0:GetAttribute(constantsModule.ViewabilityTargetIdAttribute)
	
	if typeof(viewabilityTargetIdAttribute) ~= "string" then
		return nil
	end
	local var9 = sponsoredAdViewabilityRegistryModule.get(viewabilityTargetIdAttribute)
	
	if var9 == nil then
		return nil
	end
	local absoluteSize = p0.AbsoluteSize
	
	return {
		metadata = var9,
		geometry = { adSize = absoluteSize, viewportBounds = p2 },
		ratio = calculateIntersectionRatioModule(p0.AbsolutePosition, absoluteSize, p2)
	}
end

local t_1 = {}
t_1.__index = t_1

function t_1.new(p3) --[[ line: 102 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		_surfaceScope = nil,
		_viewportBounds = nil,
		_running = false,
		_paused = false,
		_scanThread = nil,
		_callbacks = p3,
		_sessions = {}
	}, t_1)
end

function t_1:setSurfaceScope(p4) --[[ line: 114 ]]
	self._surfaceScope = p4
end

function t_1:setViewportBounds(p5) --[[ line: 118 ]]
	self._viewportBounds = p5
end

function t_1:start() --[[ line: 125 ]]
	if self._running then return end
	self._running = true
	
	if not self._paused then
		self:_scheduleNextScan()
	end
end

function t_1:_cancelScheduledScan() --[[ line: 135 ]]
	local scanThread = self._scanThread
	
	if scanThread ~= nil and coroutine.status(scanThread) == "suspended" then
		task.cancel(scanThread)
	end
	self._scanThread = nil
end

function t_1:_scheduleNextScan() --[[ line: 143 ]]
	assert(self._scanThread == nil, "scan is already scheduled")
	self._scanThread = task.delay(0.2, function() --[[ line: 145 ]]
		-- upvalues: self (ref)
		self._scanThread = nil
		
		if not self._running or self._paused then return end
		self:_scanTick(DateTime.now().UnixTimestampMillis)
		
		if self._running and not self._paused then
			self:_scheduleNextScan()
		end
	end)
end

function t_1:_scanTick(p6) --[[ line: 159 ]]
	-- upvalues: collectionService (ref), constantsModule (ref), measureTile (ref), sponsoredAdViewabilityStateModule (ref)
	local surfaceScope = self._surfaceScope
	local viewportBounds = self._viewportBounds
	
	if surfaceScope == nil or viewportBounds == nil then return end
	if viewportBounds.max.X <= viewportBounds.min.X or viewportBounds.max.Y <= viewportBounds.min.Y then return end
	local t = {}
	
	for i, v in collectionService:GetTagged(constantsModule.CandidateTag) do
		local var11 = measureTile(v, surfaceScope, viewportBounds)
		
		if var11 then
			local metadata = var11.metadata
			local encryptedAdTrackingData = metadata.encryptedAdTrackingData
			t[encryptedAdTrackingData] = true
			local var12 = self._sessions[encryptedAdTrackingData]
			
			if not var12 then
				var12 = {
					state = sponsoredAdViewabilityStateModule.new(p6),
					metadata = metadata
				}
				self._sessions[encryptedAdTrackingData] = var12
				self._callbacks.onSessionStart(metadata, var11.geometry, p6)
			end
			for i_1, v_1 in var12.state:advance(p6, var11.ratio, var11.geometry) do
				self._callbacks.onMilestone(metadata, v_1)
			end
		end
	end
	for i_1, v_1 in self._sessions do
		if not t[i_1] then
			v_1.state:advance(p6, 0, nil)
		end
	end
end

function t_1:pause(p7) --[[ line: 200 ]]
	if self._paused then return end
	p7 = p7 or DateTime.now().UnixTimestampMillis
	
	for i, v in self._sessions do
		v.state:pause(p7)
	end
	self._paused = true
	self:_cancelScheduledScan()
end

function t_1:resume(p8) --[[ line: 212 ]]
	if not self._paused then return end
	p8 = p8 or DateTime.now().UnixTimestampMillis
	
	for i, v in self._sessions do
		v.state:resume(p8)
	end
	self._paused = false
	
	if self._running then
		self:_scheduleNextScan()
	end
end

function t_1:_terminateAllSessions(b, p9) --[[ line: 227 ]]
	local sessions = self._sessions
	self._sessions = {}
	
	for i, v in sessions do
		self._callbacks.onUnload(v.metadata, v.state:finalize(b), p9)
	end
end

function t_1:onFeedRefresh(p10) --[[ line: 243 ]]
	-- upvalues: t (ref)
	self:_terminateAllSessions(p10 or DateTime.now().UnixTimestampMillis, t.FeedRefresh)
end

function t_1:reset(p11) --[[ line: 248 ]]
	-- upvalues: t (ref)
	self._running = false
	self:_cancelScheduledScan()
	self:_terminateAllSessions(p11 or DateTime.now().UnixTimestampMillis, t.SurfaceTeardown)
end

t_1.TerminalReason = t

return t_1