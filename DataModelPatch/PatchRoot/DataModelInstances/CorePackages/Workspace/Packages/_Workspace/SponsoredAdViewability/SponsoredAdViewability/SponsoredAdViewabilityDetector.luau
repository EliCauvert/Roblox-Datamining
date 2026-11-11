local CollectionService = game:GetService("CollectionService")
local ConstantsModule = require(script.Parent.Constants)
local CalculateIntersectionRatioModule = require(script.Parent.calculateIntersectionRatio)
local SponsoredAdViewabilityRegistryModule = require(script.Parent.sponsoredAdViewabilityRegistry)
local SponsoredAdViewabilityStateModule = require(script.Parent.sponsoredAdViewabilityState)

local function measureTile(Frame: Frame, SurfaceScope, ViewportBounds)
	-- upvalues: ConstantsModule (copy), SponsoredAdViewabilityRegistryModule (copy), CalculateIntersectionRatioModule (copy)
	if not Frame:IsA("GuiObject") then
		return nil
	elseif not Frame:IsDescendantOf(SurfaceScope) then
		return nil
	else
		local Attribute = Frame:GetAttribute(ConstantsModule.ViewabilityTargetIdAttribute)
		
		if typeof(Attribute) ~= "string" then
			return nil
		end
		local GetResult = SponsoredAdViewabilityRegistryModule.get(Attribute)
		
		if GetResult == nil then
			return nil
		else
			local AbsoluteSize = Frame.AbsoluteSize
			
			return {
				metadata = GetResult,
				geometry = { adSize = AbsoluteSize, viewportBounds = ViewportBounds },
				ratio = CalculateIntersectionRatioModule(Frame.AbsolutePosition, AbsoluteSize, ViewportBounds)
			}
		end
	end
end

local SponsoredAdViewabilityDetectorModule = {}
SponsoredAdViewabilityDetectorModule.__index = SponsoredAdViewabilityDetectorModule

function SponsoredAdViewabilityDetectorModule.new(_callbacks)
	-- upvalues: SponsoredAdViewabilityDetectorModule (copy)
	return (setmetatable({
		_surfaceScope = nil,
		_viewportBounds = nil,
		_running = false,
		_scanThread = nil,
		_callbacks = _callbacks,
		_sessions = {}
	}, SponsoredAdViewabilityDetectorModule))
end

function SponsoredAdViewabilityDetectorModule:setSurfaceScope(_surfaceScope)
	self._surfaceScope = _surfaceScope
end

function SponsoredAdViewabilityDetectorModule:setViewportBounds(_viewportBounds)
	self._viewportBounds = _viewportBounds
end

function SponsoredAdViewabilityDetectorModule:start()
	if not self._running then
		self._running = true
		self:_scheduleNextScan()
		
		return
	end
end

function SponsoredAdViewabilityDetectorModule:_scheduleNextScan()
	self._scanThread = task.delay(0.2, function()
		-- upvalues: self (copy)
		if not self._running then return end
		self:_scanTick(DateTime.now().UnixTimestampMillis)
		
		if self._running then
			self:_scheduleNextScan()
		end
	end)
end

function SponsoredAdViewabilityDetectorModule:_scanTick(Callbacks)
	-- upvalues: CollectionService (copy), ConstantsModule (copy), measureTile (copy), SponsoredAdViewabilityStateModule (copy)
	local SurfaceScope = self._surfaceScope
	local ViewportBounds = self._viewportBounds
	
	if SurfaceScope == nil or ViewportBounds == nil then return end
	if ViewportBounds.max.X <= ViewportBounds.min.X or ViewportBounds.max.Y <= ViewportBounds.min.Y then return end
	local t = {}
	
	for _, value in CollectionService:GetTagged(ConstantsModule.CandidateTag) do
		local MeasureTileResult = measureTile(value, SurfaceScope, ViewportBounds)
		
		if MeasureTileResult then
			local Metadata = MeasureTileResult.metadata
			local EncryptedAdTrackingData = Metadata.encryptedAdTrackingData
			t[EncryptedAdTrackingData] = true
			local Session = self._sessions[EncryptedAdTrackingData]
			
			if not Session then
				Session = SponsoredAdViewabilityStateModule.new(Callbacks)
				self._sessions[EncryptedAdTrackingData] = Session
				self._callbacks.onSessionStart(Metadata, MeasureTileResult.geometry, Callbacks)
			end
			for _, value1 in Session:advance(Callbacks, MeasureTileResult.ratio, MeasureTileResult.geometry) do
				self._callbacks.onMilestone(Metadata, value1)
			end
		end
	end
	for i, session in self._sessions do
		if not t[i] then
			session:advance(Callbacks, 0, nil)
		end
	end
end

function SponsoredAdViewabilityDetectorModule:reset()
	self._running = false
	local ScanThread = self._scanThread
	
	if ScanThread ~= nil and coroutine.status(ScanThread) == "suspended" then
		task.cancel(ScanThread)
	end
	self._scanThread = nil
	self._sessions = {}
end

return SponsoredAdViewabilityDetectorModule