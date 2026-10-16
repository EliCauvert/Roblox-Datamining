local CollectionService = game:GetService("CollectionService")
local ConstantsModule = require(script.Parent.Constants)
local CalculateIntersectionRatioModule = require(script.Parent.calculateIntersectionRatio)
local SponsoredAdViewabilityRegistryModule = require(script.Parent.sponsoredAdViewabilityRegistry)
local SponsoredAdViewabilityStateModule = require(script.Parent.sponsoredAdViewabilityState)
local _ = require(script.Parent.sponsoredAdViewabilityTypes)
local FFlagLuaAppSponsoredAdVideoViewabilityEnabled = require(script:FindFirstAncestor("SponsoredAdViewability").Parent.SharedFlags).FFlagLuaAppSponsoredAdVideoViewabilityEnabled
local TerminalReason = {
	SurfaceTeardown = "SurfaceTeardown",
	FeedRefresh = "FeedRefresh"
}

local function invokeCallback(p1, OnMilestone, ...) --[[ Line: 59 ]]
	local v1 = nil
	
	if not xpcall(OnMilestone, function(Err) --[[ Line: 61 ]]
		-- upvalues: v1 (ref)
		v1 = Err
	end, ...) then
		warn(`SponsoredAdViewability {p1} failed`, v1)
	end
end

local Frozen = if FFlagLuaAppSponsoredAdVideoViewabilityEnabled then table.freeze({}) else nil
local SponsoredAdViewabilityDetectorModule = {}
SponsoredAdViewabilityDetectorModule.__index = SponsoredAdViewabilityDetectorModule

function SponsoredAdViewabilityDetectorModule.new(Callbacks) --[[ Line: 111 ]]
	-- upvalues: SponsoredAdViewabilityDetectorModule (copy)
	return (setmetatable({
		_surfaceScope = nil,
		_viewportBounds = nil,
		_running = false,
		_paused = false,
		_scanThread = nil,
		_callbacks = Callbacks,
		_sessions = {}
	}, SponsoredAdViewabilityDetectorModule))
end

local function _(p1): boolean --[[ Line: 123 | Named "isVideoMetadata" ]]
	-- upvalues: FFlagLuaAppSponsoredAdVideoViewabilityEnabled (copy)
	return FFlagLuaAppSponsoredAdVideoViewabilityEnabled and p1.mediaType == "video"
end

local _ = function(p1) --[[ Line: 127 | Named "readVideoPlaybackState" ]]
	-- upvalues: FFlagLuaAppSponsoredAdVideoViewabilityEnabled (copy)
	if not FFlagLuaAppSponsoredAdVideoViewabilityEnabled or p1.mediaType ~= "video" then
		return nil
	end
	local VideoPlaybackStateRef = p1.videoPlaybackStateRef
	local Current = if VideoPlaybackStateRef then VideoPlaybackStateRef.current else nil
	
	if Current == nil then
		return nil
	else
		local Success, Result = pcall(Current)
		
		return if Success then Result else nil
	end
end

local function getLayerCollectorAndVisibility(Frame) --[[ Line: 140 ]]
	local Parent = Frame
	local Flag = true
	while Parent do
		if Parent:IsA("GuiObject") and not Parent.Visible then
			Flag = false
		end
		if Parent:IsA("LayerCollector") then
			return Parent, Flag and Parent.Enabled
		end
		Parent = Parent.Parent
	end
	return nil, false
end

local function getRegisteredTile(Gui, SurfaceScope) --[[ Line: 155 ]]
	-- upvalues: ConstantsModule (copy), SponsoredAdViewabilityRegistryModule (copy)
	if not Gui:IsA("GuiObject") then
		return nil, nil, nil
	end
	local Attribute = Gui:GetAttribute(ConstantsModule.ViewabilityTargetIdAttribute)
	
	if typeof(Attribute) ~= "string" then
		return nil, nil, nil
	end
	local GetResult = SponsoredAdViewabilityRegistryModule.get(Attribute)
	
	if GetResult == nil then
		return nil, nil, nil
	elseif GetResult.isFullscreen == true or Gui:IsDescendantOf(SurfaceScope) then
		return Gui, Attribute, GetResult
	else
		return nil, nil, nil
	end
end

local function measureRegisteredTile(Frame: Frame, ViewabilityTargetId, Metadata, ViewportBounds) --[[ Line: 177 ]]
	-- upvalues: getLayerCollectorAndVisibility (copy), CalculateIntersectionRatioModule (copy), FFlagLuaAppSponsoredAdVideoViewabilityEnabled (copy)
	local IsIsFullscreen = Metadata.isFullscreen == true
	local AbsolutePosition = nil
	local AbsoluteSize = nil
	local Config = ViewportBounds
	
	if not pcall(function() --[[ Line: 187 ]]
		-- upvalues: IsIsFullscreen (copy), getLayerCollectorAndVisibility (upval), Frame (copy), Config (ref), AbsolutePosition (ref), AbsoluteSize (ref)
		if IsIsFullscreen then
			local LayerCollectorAndVisibility, LayerCollectorAndVisibility2 = getLayerCollectorAndVisibility(Frame)
			
			if LayerCollectorAndVisibility == nil or not LayerCollectorAndVisibility2 then return end
			Config = {
				min = LayerCollectorAndVisibility.AbsolutePosition,
				max = LayerCollectorAndVisibility.AbsolutePosition + LayerCollectorAndVisibility.AbsoluteSize
			}
		end
		AbsolutePosition = Frame.AbsolutePosition
		AbsoluteSize = Frame.AbsoluteSize
	end) or AbsolutePosition == nil or AbsoluteSize == nil then
		return nil
	end
	local config = {
		metadata = Metadata,
		geometry = { adSize = AbsoluteSize, viewportBounds = Config },
		ratio = CalculateIntersectionRatioModule(AbsolutePosition, AbsoluteSize, Config),
		viewabilityTargetId = ViewabilityTargetId
	}
	local VideoStateSnapshot = nil
	
	if FFlagLuaAppSponsoredAdVideoViewabilityEnabled and Metadata.mediaType == "video" then
		local VideoPlaybackStateRef = Metadata.videoPlaybackStateRef
		local Current = if VideoPlaybackStateRef then VideoPlaybackStateRef.current else nil
		
		if Current == nil then
			VideoStateSnapshot = nil
		else
			local Success, Result = pcall(Current)
			VideoStateSnapshot = if Success then Result else nil
		end
	else
		VideoStateSnapshot = nil
	end
	config.videoStateSnapshot = VideoStateSnapshot
	config.isFullscreen = IsIsFullscreen
	
	return config
end

local function measureTile_deprecated(Frame: Frame, SurfaceScope, ViewportBounds) --[[ Line: 215 ]]
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

local function shouldReplaceCandidate(p1, p2) --[[ Line: 247 ]]
	if p1.isFullscreen ~= p2.isFullscreen then
		return if p1.videoStateSnapshot ~= nil == (p2.videoStateSnapshot ~= nil) then p2.isFullscreen else p2.videoStateSnapshot ~= nil
	elseif p1.ratio ~= p2.ratio then
		return p1.ratio < p2.ratio
	elseif p1.videoStateSnapshot ~= nil == (p2.videoStateSnapshot ~= nil) then
		local Number: number? = tonumber(p2.viewabilityTargetId)
		local Number1: number? = tonumber(p1.viewabilityTargetId)
		
		return if Number == nil or Number1 == nil then Number ~= nil else Number1 < Number
	else
		return p2.videoStateSnapshot ~= nil
	end
end

local _ = function(p1, p2) --[[ Line: 271 | Named "selectBetterMeasurement" ]]
	-- upvalues: shouldReplaceCandidate (copy)
	local EncryptedAdTrackingData = p2.metadata.encryptedAdTrackingData
	local v1 = p1[EncryptedAdTrackingData]
	
	if v1 ~= nil and v1.metadata.mediaType ~= p2.metadata.mediaType then return end
	if v1 == nil or shouldReplaceCandidate(v1, p2) then
		p1[EncryptedAdTrackingData] = p2
	end
end

local _ = function(p1, p2): boolean --[[ Line: 283 | Named "canStartOrContinueSession" ]]
	return not p1.isFullscreen or p2 ~= nil and p2.video ~= nil
end

local _ = function(p1): boolean --[[ Line: 287 | Named "canMeasureViewport" ]]
	return p1.min.X < p1.max.X and p1.min.Y < p1.max.Y
end

local _ = function(List): boolean --[[ Line: 291 | Named "hasVideoSession" ]]
	for _, value in List do
		if value.video ~= nil then
			return true
		end
	end
	return false
end

function SponsoredAdViewabilityDetectorModule:_advanceSession(Session, Callbacks, Ratio, Geometry, VideoStateSnapshot, IsFullscreen, Metadata) --[[ Line: 300 ]]
	-- upvalues: invokeCallback (copy)
	local AdvanceResult, AdvanceResult2 = Session.state:advance(Callbacks, Ratio, Geometry, VideoStateSnapshot, IsFullscreen)
	local Metadata1 = Metadata or Session.metadata
	for _, value in AdvanceResult do
		invokeCallback("onMilestone", self._callbacks.onMilestone, Metadata1, value)
	end
	local OnVideoProgress = self._callbacks.onVideoProgress
	
	if OnVideoProgress ~= nil and AdvanceResult2 ~= nil then
		for _, value1 in AdvanceResult2 do
			invokeCallback("onVideoProgress", OnVideoProgress, Metadata1, value1)
		end
	end
end

function SponsoredAdViewabilityDetectorModule:_processMeasurement(p1, p2, Callbacks) --[[ Line: 324 ]]
	-- upvalues: FFlagLuaAppSponsoredAdVideoViewabilityEnabled (copy), SponsoredAdViewabilityStateModule (copy), invokeCallback (copy)
	local Metadata = p2.metadata
	local IsVideo: boolean = FFlagLuaAppSponsoredAdVideoViewabilityEnabled and Metadata.mediaType == "video"
	local Session = self._sessions[p1]
	
	if not Session then
		Session = {
			state = SponsoredAdViewabilityStateModule.new(Callbacks, IsVideo),
			metadata = Metadata,
			video = if FFlagLuaAppSponsoredAdVideoViewabilityEnabled and IsVideo then {
				viewabilityTargetId = p2.viewabilityTargetId,
				isFullscreen = p2.isFullscreen
			} else nil
		}
		self._sessions[p1] = Session
		invokeCallback("onSessionStart", self._callbacks.onSessionStart, Metadata, p2.geometry, Callbacks, p2.videoStateSnapshot)
	end
	if IsVideo then
		self:_applySelectedVideoMeasurement(Session, p2, Callbacks)
		
		return
	end
	if Session.video == nil then
		self:_advanceSession(Session, Callbacks, p2.ratio, p2.geometry, nil, false, Metadata)
		
		return
	end
end

function SponsoredAdViewabilityDetectorModule:_applySelectedVideoMeasurement(Session, p1, Callbacks) --[[ Line: 363 ]]
	-- upvalues: FFlagLuaAppSponsoredAdVideoViewabilityEnabled (copy)
	local Video = Session.video
	
	if Video == nil then return end
	if p1 == nil then
		self:_advanceSession(Session, Callbacks, 0, nil, nil, Video.isFullscreen)
		
		return
	end
	local Metadata = p1.metadata
	
	if not FFlagLuaAppSponsoredAdVideoViewabilityEnabled or Metadata.mediaType ~= "video" then return end
	if Video.viewabilityTargetId ~= p1.viewabilityTargetId then
		Session.state:transitionVideoSource(Callbacks, Video.isFullscreen ~= p1.isFullscreen)
	end
	Session.metadata = Metadata
	Video.viewabilityTargetId = p1.viewabilityTargetId
	Video.isFullscreen = p1.isFullscreen
	self:_advanceSession(Session, Callbacks, p1.ratio, p1.geometry, p1.videoStateSnapshot, p1.isFullscreen)
end

function SponsoredAdViewabilityDetectorModule:_collectCurrentVideoMeasurements() --[[ Line: 400 ]]
	-- upvalues: FFlagLuaAppSponsoredAdVideoViewabilityEnabled (copy), Frozen (copy), CollectionService (copy), ConstantsModule (copy), getRegisteredTile (copy), measureRegisteredTile (copy), shouldReplaceCandidate (copy)
	if FFlagLuaAppSponsoredAdVideoViewabilityEnabled then
		local Flag = false
		
		for _, session in self._sessions do
			if session.video ~= nil then
				Flag = true
				break
			end
		end
		if Flag then
			local t = {}
			local SurfaceScope = self._surfaceScope
			local ViewportBounds = self._viewportBounds
			
			if SurfaceScope == nil or ViewportBounds == nil or (ViewportBounds.min.X >= ViewportBounds.max.X or ViewportBounds.max.Y <= ViewportBounds.min.Y) then
				return t
			end
			for _, value in CollectionService:GetTagged(ConstantsModule.CandidateTag) do
				local RegisteredTile, RegisteredTile2, RegisteredTile3 = getRegisteredTile(value, SurfaceScope)
				
				if RegisteredTile ~= nil and RegisteredTile2 ~= nil and RegisteredTile3 ~= nil and (FFlagLuaAppSponsoredAdVideoViewabilityEnabled and RegisteredTile3.mediaType == "video") then
					local MeasureRegisteredTileResult = measureRegisteredTile(RegisteredTile, RegisteredTile2, RegisteredTile3, ViewportBounds)
					
					if MeasureRegisteredTileResult ~= nil then
						local Session = self._sessions[RegisteredTile3.encryptedAdTrackingData]
						
						if not MeasureRegisteredTileResult.isFullscreen or Session ~= nil and Session.video ~= nil then
							local EncryptedAdTrackingData = MeasureRegisteredTileResult.metadata.encryptedAdTrackingData
							local Entry = t[EncryptedAdTrackingData]
							
							if (Entry == nil or Entry.metadata.mediaType == MeasureRegisteredTileResult.metadata.mediaType) and (Entry == nil or shouldReplaceCandidate(Entry, MeasureRegisteredTileResult)) then
								t[EncryptedAdTrackingData] = MeasureRegisteredTileResult
							end
						end
					end
				end
			end
			return t
		end
	end
	return Frozen
end

function SponsoredAdViewabilityDetectorModule:setSurfaceScope(_surfaceScope) --[[ Line: 429 ]]
	self._surfaceScope = _surfaceScope
end

function SponsoredAdViewabilityDetectorModule:setViewportBounds(_viewportBounds) --[[ Line: 433 ]]
	self._viewportBounds = _viewportBounds
end

function SponsoredAdViewabilityDetectorModule:start() --[[ Line: 440 ]]
	if self._running then return end
	self._running = true
	
	if not self._paused then
		self:_scheduleNextScan()
	end
end

function SponsoredAdViewabilityDetectorModule:_cancelScheduledScan() --[[ Line: 450 ]]
	local ScanThread = self._scanThread
	
	if ScanThread ~= nil and coroutine.status(ScanThread) == "suspended" then
		task.cancel(ScanThread)
	end
	self._scanThread = nil
end

function SponsoredAdViewabilityDetectorModule:_scheduleNextScan() --[[ Line: 458 ]]
	-- upvalues: FFlagLuaAppSponsoredAdVideoViewabilityEnabled (copy)
	if not FFlagLuaAppSponsoredAdVideoViewabilityEnabled then
		assert(self._scanThread == nil, "scan is already scheduled")
	elseif self._scanThread ~= nil then return end
	self._scanThread = task.delay(0.2, function() --[[ Line: 466 ]]
		-- upvalues: self (copy), FFlagLuaAppSponsoredAdVideoViewabilityEnabled (upval)
		self._scanThread = nil
		
		if not self._running or self._paused then return end
		if FFlagLuaAppSponsoredAdVideoViewabilityEnabled then
			local Success, Result = pcall(self._scanTick, self, DateTime.now().UnixTimestampMillis)
			
			if not Success then
				warn("SponsoredAdViewability scan failed; disabling detector", Result)
				self._running = false
				self._sessions = {}
				
				return
			end
		else
			self:_scanTick(DateTime.now().UnixTimestampMillis)
		end
		if self._running and not self._paused then
			self:_scheduleNextScan()
		end
	end)
end

function SponsoredAdViewabilityDetectorModule:_scanTick(UnixTimestampMillis) --[[ Line: 492 ]]
	-- upvalues: FFlagLuaAppSponsoredAdVideoViewabilityEnabled (copy), CollectionService (copy), ConstantsModule (copy), getRegisteredTile (copy), measureRegisteredTile (copy), shouldReplaceCandidate (copy)
	if not FFlagLuaAppSponsoredAdVideoViewabilityEnabled then
		self:_scanTick_deprecated(UnixTimestampMillis)
		
		return
	end
	local SurfaceScope = self._surfaceScope
	local ViewportBounds = self._viewportBounds
	
	if SurfaceScope == nil or ViewportBounds == nil then return end
	if ViewportBounds.min.X >= ViewportBounds.max.X or ViewportBounds.max.Y <= ViewportBounds.min.Y then return end
	local t = {}
	local t1 = {}
	local t2 = {}
	
	for _, value in CollectionService:GetTagged(ConstantsModule.CandidateTag) do
		local RegisteredTile, RegisteredTile2, RegisteredTile3 = getRegisteredTile(value, SurfaceScope)
		
		if RegisteredTile ~= nil and RegisteredTile2 ~= nil and RegisteredTile3 ~= nil then
			local EncryptedAdTrackingData = RegisteredTile3.encryptedAdTrackingData
			local MeasureRegisteredTileResult = measureRegisteredTile(RegisteredTile, RegisteredTile2, RegisteredTile3, ViewportBounds)
			
			if MeasureRegisteredTileResult == nil then
				local Session = self._sessions[EncryptedAdTrackingData]
				
				if RegisteredTile3.isFullscreen == true and (FFlagLuaAppSponsoredAdVideoViewabilityEnabled and RegisteredTile3.mediaType == "video" and Session ~= nil and Session.video ~= nil) then
					t1[EncryptedAdTrackingData] = true
				end
			else
				local Session = self._sessions[EncryptedAdTrackingData]
				
				if not MeasureRegisteredTileResult.isFullscreen or Session ~= nil and Session.video ~= nil then
					t[EncryptedAdTrackingData] = true
					local EncryptedAdTrackingData1 = MeasureRegisteredTileResult.metadata.encryptedAdTrackingData
					local Entry = t2[EncryptedAdTrackingData1]
					
					if (Entry == nil or Entry.metadata.mediaType == MeasureRegisteredTileResult.metadata.mediaType) and (Entry == nil or shouldReplaceCandidate(Entry, MeasureRegisteredTileResult)) then
						t2[EncryptedAdTrackingData1] = MeasureRegisteredTileResult
					end
				end
			end
		end
	end
	for i, value1 in t2 do
		if not t1[i] or value1.isFullscreen then
			self:_processMeasurement(i, value1, UnixTimestampMillis)
		end
	end
	for i1, session in self._sessions do
		if not t[i1] and not t1[i1] then
			local Video = session.video
			self:_advanceSession(session, UnixTimestampMillis, 0, nil, nil, Video ~= nil and Video.isFullscreen)
		end
	end
end

function SponsoredAdViewabilityDetectorModule:_scanTick_deprecated(Callbacks) --[[ Line: 556 ]]
	-- upvalues: CollectionService (copy), ConstantsModule (copy), measureTile_deprecated (copy), SponsoredAdViewabilityStateModule (copy)
	local SurfaceScope = self._surfaceScope
	local ViewportBounds = self._viewportBounds
	
	if SurfaceScope == nil or ViewportBounds == nil then return end
	if ViewportBounds.max.X <= ViewportBounds.min.X or ViewportBounds.max.Y <= ViewportBounds.min.Y then return end
	local t = {}
	
	for _, value in CollectionService:GetTagged(ConstantsModule.CandidateTag) do
		local MeasureTile_deprecatedResult = measureTile_deprecated(value, SurfaceScope, ViewportBounds)
		
		if MeasureTile_deprecatedResult then
			local Metadata = MeasureTile_deprecatedResult.metadata
			local EncryptedAdTrackingData = Metadata.encryptedAdTrackingData
			t[EncryptedAdTrackingData] = true
			local Session = self._sessions[EncryptedAdTrackingData]
			
			if not Session then
				Session = {
					state = SponsoredAdViewabilityStateModule.new(Callbacks),
					metadata = Metadata
				}
				self._sessions[EncryptedAdTrackingData] = Session
				self._callbacks.onSessionStart(Metadata, MeasureTile_deprecatedResult.geometry, Callbacks)
			end
			for _, value1 in Session.state:advance(Callbacks, MeasureTile_deprecatedResult.ratio, MeasureTile_deprecatedResult.geometry) do
				self._callbacks.onMilestone(Metadata, value1)
			end
		end
	end
	for i, session in self._sessions do
		if not t[i] then
			session.state:advance(Callbacks, 0, nil)
		end
	end
end

function SponsoredAdViewabilityDetectorModule:pause(p1) --[[ Line: 597 ]]
	-- upvalues: FFlagLuaAppSponsoredAdVideoViewabilityEnabled (copy)
	if self._paused then return end
	local P53 = p1 or DateTime.now().UnixTimestampMillis
	
	if FFlagLuaAppSponsoredAdVideoViewabilityEnabled then
		local CollectCurrentVideoMeasurementsResult = self:_collectCurrentVideoMeasurements()
		
		for i, session in self._sessions do
			if session.video ~= nil then
				self:_applySelectedVideoMeasurement(session, CollectCurrentVideoMeasurementsResult[i], P53)
			end
			session.state:pause(P53)
		end
	else
		for _, session1 in self._sessions do
			session1.state:pause(P53)
		end
	end
	self._paused = true
	self:_cancelScheduledScan()
end

function SponsoredAdViewabilityDetectorModule:resume(p2) --[[ Line: 619 ]]
	if not self._paused then return end
	local P55 = p2 or DateTime.now().UnixTimestampMillis
	for _, session in self._sessions do
		session.state:resume(P55)
	end
	self._paused = false
	
	if self._running then
		self:_scheduleNextScan()
	end
end

function SponsoredAdViewabilityDetectorModule:_terminateAllSessions(p3, FeedRefresh) --[[ Line: 634 ]]
	-- upvalues: FFlagLuaAppSponsoredAdVideoViewabilityEnabled (copy), invokeCallback (copy)
	local Sessions = self._sessions
	
	if FFlagLuaAppSponsoredAdVideoViewabilityEnabled then
		local T = if self._paused then {} else self:_collectCurrentVideoMeasurements()
		self._sessions = {}
		
		for i, session in Sessions do
			if not self._paused and session.video ~= nil then
				self:_applySelectedVideoMeasurement(session, T[i], p3)
			end
			invokeCallback("onUnload", self._callbacks.onUnload, session.metadata, session.state:finalize(p3), FeedRefresh)
		end
		return
	else
		self._sessions = {}
		
		for _, session1 in Sessions do
			self._callbacks.onUnload(session1.metadata, session1.state:finalize(p3), FeedRefresh)
		end
	end
end

function SponsoredAdViewabilityDetectorModule:onFeedRefresh(p4) --[[ Line: 662 ]]
	-- upvalues: TerminalReason (copy)
	self:_terminateAllSessions(p4 or DateTime.now().UnixTimestampMillis, TerminalReason.FeedRefresh)
end

function SponsoredAdViewabilityDetectorModule:reset(p4) --[[ Line: 667 ]]
	-- upvalues: TerminalReason (copy)
	self._running = false
	self:_cancelScheduledScan()
	self:_terminateAllSessions(p4 or DateTime.now().UnixTimestampMillis, TerminalReason.SurfaceTeardown)
end

SponsoredAdViewabilityDetectorModule.TerminalReason = TerminalReason

return SponsoredAdViewabilityDetectorModule