local collectionService = game:GetService("CollectionService")
local constantsModule = require(script.Parent.Constants)
local calculateIntersectionRatioModule = require(script.Parent.calculateIntersectionRatio)
local sponsoredAdViewabilityRegistryModule = require(script.Parent.sponsoredAdViewabilityRegistry)
local sponsoredAdViewabilityStateModule = require(script.Parent.sponsoredAdViewabilityState)

local function measureTile(p0, p1, p2) --[[ line: 32 ]]
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
	local var8 = sponsoredAdViewabilityRegistryModule.get(viewabilityTargetIdAttribute)
	
	if var8 == nil then
		return nil
	end
	local absoluteSize = p0.AbsoluteSize
	
	return {
		metadata = var8,
		geometry = { adSize = absoluteSize, viewportBounds = p2 },
		ratio = calculateIntersectionRatioModule(p0.AbsolutePosition, absoluteSize, p2)
	}
end

local t = {}
t.__index = t

function t.new(p3) --[[ line: 79 ]]
	-- upvalues: t (ref)
	return setmetatable({
		_surfaceScope = nil,
		_viewportBounds = nil,
		_running = false,
		_scanThread = nil,
		_callbacks = p3,
		_sessions = {}
	}, t)
end

function t:setSurfaceScope(p4) --[[ line: 90 ]]
	self._surfaceScope = p4
end

function t:setViewportBounds(p5) --[[ line: 94 ]]
	self._viewportBounds = p5
end

function t:start() --[[ line: 101 ]]
	if self._running then
		return
	end
	self._running = true
	self:_scheduleNextScan()
end

function t:_scheduleNextScan() --[[ line: 109 ]]
	self._scanThread = task.delay(0.2, function() --[[ line: 110 ]]
		-- upvalues: self (ref)
		if not self._running then return end
		self:_scanTick(DateTime.now().UnixTimestampMillis)
		
		if self._running then
			self:_scheduleNextScan()
		end
	end)
end

function t:_scanTick(p6) --[[ line: 123 ]]
	-- upvalues: collectionService (ref), constantsModule (ref), measureTile (ref), sponsoredAdViewabilityStateModule (ref)
	local surfaceScope = self._surfaceScope
	local viewportBounds = self._viewportBounds
	
	if surfaceScope == nil or viewportBounds == nil then return end
	if viewportBounds.max.X <= viewportBounds.min.X or viewportBounds.max.Y <= viewportBounds.min.Y then return end
	local t = {}
	
	for i, v in collectionService:GetTagged(constantsModule.CandidateTag) do
		local var10 = measureTile(v, surfaceScope, viewportBounds)
		
		if var10 then
			local metadata = var10.metadata
			local encryptedAdTrackingData = metadata.encryptedAdTrackingData
			t[encryptedAdTrackingData] = true
			local var11 = self._sessions[encryptedAdTrackingData]
			
			if not var11 then
				var11 = sponsoredAdViewabilityStateModule.new(p6)
				self._sessions[encryptedAdTrackingData] = var11
				self._callbacks.onSessionStart(metadata, var10.geometry, p6)
			end
			for i_1, v_1 in var11:advance(p6, var10.ratio, var10.geometry) do
				self._callbacks.onMilestone(metadata, v_1)
			end
		end
	end
	for i_1, v_1 in self._sessions do
		if not t[i_1] then
			v_1:advance(p6, 0, nil)
		end
	end
end

function t:reset() --[[ line: 164 ]]
	self._running = false
	local scanThread = self._scanThread
	
	if scanThread ~= nil and coroutine.status(scanThread) == "suspended" then
		task.cancel(scanThread)
	end
	self._scanThread = nil
	self._sessions = {}
end

return t