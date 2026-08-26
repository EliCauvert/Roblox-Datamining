local collectionService = game:GetService("CollectionService")
local sharedFlagsModule = require(script:FindFirstAncestor("SponsoredAdViewability").Parent.SharedFlags)
local constantsModule = require(script.Parent.Constants)
local calculateIntersectionRatioModule = require(script.Parent.calculateIntersectionRatio)
local sponsoredAdViewabilityRegistryModule = require(script.Parent.sponsoredAdViewabilityRegistry)
local sponsoredAdViewabilityStateModule = require(script.Parent.sponsoredAdViewabilityState)
local _ = require(script.Parent.sponsoredAdViewabilityTypes)
local fFlagLuaAppSponsoredAdVideoViewabilityEnabled = sharedFlagsModule.FFlagLuaAppSponsoredAdVideoViewabilityEnabled
local t = {
	SurfaceTeardown = "SurfaceTeardown",
	FeedRefresh = "FeedRefresh"
}

local function invokeCallback(p1, p2, ...)
	local var1 = nil
	
	if not xpcall(p2, function(p3)
		-- upvalues: var1 (write)
		var1 = p3
	end, ...) then
		warn(`SponsoredAdViewability {p1} failed`, var1)
	end
end

local var1 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then table.freeze({}) else nil
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		_surfaceScope = nil,
		_viewportBounds = nil,
		_running = false,
		_paused = false,
		_scanThread = nil,
		_callbacks = p1,
		_sessions = {}
	}, t_1)
end

local function _(p1)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	return fFlagLuaAppSponsoredAdVideoViewabilityEnabled and p1.mediaType == "video"
end

local _ = function(p1)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	if not fFlagLuaAppSponsoredAdVideoViewabilityEnabled or p1.mediaType ~= "video" then
		return nil
	end
	local videoPlaybackStateRef = p1.videoPlaybackStateRef
	local var2 = if videoPlaybackStateRef then videoPlaybackStateRef.current else nil
	
	if var2 == nil then
		return nil
	end
	local ok, status = pcall(var2)
	
	return if ok then status else nil
end

local function getLayerCollectorAndVisibility(p1)
	local var2 = p1
	local var3 = true
	while var2 do
		if var2:IsA("GuiObject") and not var2.Visible then
			var3 = false
		end
		if not var2:IsA("LayerCollector") then
			var2 = var2.Parent
			continue
		end
		return var2, var3 and var2.Enabled
	end
	return nil, false
end

local function getRegisteredTile(p2, p3)
	-- upvalues: constantsModule (ref), sponsoredAdViewabilityRegistryModule (ref)
	if not p2:IsA("GuiObject") then
		return nil, nil, nil
	end
	local viewabilityTargetIdAttribute = p2:GetAttribute(constantsModule.ViewabilityTargetIdAttribute)
	
	if typeof(viewabilityTargetIdAttribute) ~= "string" then
		return nil, nil, nil
	end
	local var4 = sponsoredAdViewabilityRegistryModule.get(viewabilityTargetIdAttribute)
	
	if var4 == nil then
		return nil, nil, nil
	elseif var4.isFullscreen == true or p2:IsDescendantOf(p3) then
		return p2, viewabilityTargetIdAttribute, var4
	end
	return nil, nil, nil
end

local function measureRegisteredTile(p2, p3, p4, p5)
	-- upvalues: getLayerCollectorAndVisibility (ref), calculateIntersectionRatioModule (ref), fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	local var4 = p4.isFullscreen == true
	local var5 = nil
	local var6 = nil
	local var7 = p5
	
	if not pcall(function()
		-- upvalues: var4 (ref), getLayerCollectorAndVisibility (copy), p2 (ref), var7 (write), var5 (write), var6 (write)
		if var4 then
			local var8, var9 = getLayerCollectorAndVisibility(p2)
			
			if var8 == nil or not var9 then return end
			var7 = {
				min = var8.AbsolutePosition,
				max = var8.AbsolutePosition + var8.AbsoluteSize
			}
		end
		var5 = p2.AbsolutePosition
		var6 = p2.AbsoluteSize
	end) or var5 == nil or var6 == nil then
		return nil
	end
	local var8
	local t = {
		metadata = p4,
		geometry = { adSize = var6, viewportBounds = var7 },
		ratio = calculateIntersectionRatioModule(var5, var6, var7),
		viewabilityTargetId = p3
	}
	
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and p4.mediaType == "video" then
		local videoPlaybackStateRef = p4.videoPlaybackStateRef
		local var9 = if videoPlaybackStateRef then videoPlaybackStateRef.current else nil
		
		if var9 == nil then
			var8 = nil
		else
			local ok, status = pcall(var9)
			var8 = if ok then status else nil
		end
	else
		var8 = nil
	end
	t.videoStateSnapshot = var8
	t.isFullscreen = var4
	
	return t
end

local function measureTile_deprecated(p2, p3, p4)
	-- upvalues: constantsModule (ref), sponsoredAdViewabilityRegistryModule (ref), calculateIntersectionRatioModule (ref)
	if not p2:IsA("GuiObject") then
		return nil
	elseif not p2:IsDescendantOf(p3) then
		return nil
	end
	local viewabilityTargetIdAttribute = p2:GetAttribute(constantsModule.ViewabilityTargetIdAttribute)
	
	if typeof(viewabilityTargetIdAttribute) ~= "string" then
		return nil
	end
	local var4 = sponsoredAdViewabilityRegistryModule.get(viewabilityTargetIdAttribute)
	
	if var4 == nil then
		return nil
	end
	local absoluteSize = p2.AbsoluteSize
	
	return {
		metadata = var4,
		geometry = { adSize = absoluteSize, viewportBounds = p4 },
		ratio = calculateIntersectionRatioModule(p2.AbsolutePosition, absoluteSize, p4)
	}
end

local function shouldReplaceCandidate(p2, p3)
	if p2.isFullscreen == p3.isFullscreen then
		if p2.ratio ~= p3.ratio then
			return p2.ratio < p3.ratio
		elseif p2.videoStateSnapshot ~= nil ~= (p3.videoStateSnapshot ~= nil) then
			return p3.videoStateSnapshot ~= nil
		end
		local var4 = tonumber(p3.viewabilityTargetId)
		local var5 = tonumber(p2.viewabilityTargetId)
		
		return if var4 == nil or var5 == nil then var4 ~= nil else var5 < var4
	else
		return if p2.videoStateSnapshot ~= nil == (p3.videoStateSnapshot ~= nil) then p3.isFullscreen else p3.videoStateSnapshot ~= nil
	end
end

local _ = function(p2, p3)
	-- upvalues: shouldReplaceCandidate (ref)
	local encryptedAdTrackingData = p3.metadata.encryptedAdTrackingData
	local var4 = p2[encryptedAdTrackingData]
	
	if var4 ~= nil and var4.metadata.mediaType ~= p3.metadata.mediaType then return end
	if var4 == nil or shouldReplaceCandidate(var4, p3) then
		p2[encryptedAdTrackingData] = p3
	end
end

local _ = function(p2, p3)
	return if p2.isFullscreen then p3 ~= nil and p3.video ~= nil else not p2.isFullscreen
end

local _ = function(p2)
	return p2.min.X < p2.max.X and p2.min.Y < p2.max.Y
end

local _ = function(p2)
	for i, v in p2 do
		if v.video ~= nil then
			return true
		end
	end
	return false
end

function t_1:_advanceSession(p3, p4, p5, p6, p7, p8, p9)
	-- upvalues: invokeCallback (ref)
	local var4, var5 = p3.state:advance(p4, p5, p6, p7, p8)
	p9 = p9 or p3.metadata
	
	for i, v in var4 do
		invokeCallback("onMilestone", self._callbacks.onMilestone, p9, v)
	end
	local onVideoProgress = self._callbacks.onVideoProgress
	
	if onVideoProgress ~= nil and var5 ~= nil then
		for i_1, v_1 in var5 do
			invokeCallback("onVideoProgress", onVideoProgress, p9, v_1)
		end
	end
end

function t_1:_processMeasurement(p10, p11, p12)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), sponsoredAdViewabilityStateModule (ref), invokeCallback (ref)
	local metadata = p11.metadata
	local var6 = fFlagLuaAppSponsoredAdVideoViewabilityEnabled and metadata.mediaType == "video"
	local var7 = self._sessions[p10]
	
	if not var7 then
		var7 = {
			state = sponsoredAdViewabilityStateModule.new(p12, var6),
			metadata = metadata,
			video = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and var6 then {
				viewabilityTargetId = p11.viewabilityTargetId,
				isFullscreen = p11.isFullscreen
			} else nil
		}
		self._sessions[p10] = var7
		invokeCallback("onSessionStart", self._callbacks.onSessionStart, metadata, p11.geometry, p12, p11.videoStateSnapshot)
	end
	if var6 then
		self:_applySelectedVideoMeasurement(var7, p11, p12)
		
		return
	elseif var7.video == nil then
		self:_advanceSession(var7, p12, p11.ratio, p11.geometry, nil, false, metadata)
		
		return
	end
end

function t_1:_applySelectedVideoMeasurement(p10, p11, p12)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	local video = p10.video
	
	if video == nil then return end
	if p11 == nil then
		self:_advanceSession(p10, p12, 0, nil, nil, video.isFullscreen)
		
		return
	end
	local metadata = p11.metadata
	
	if not fFlagLuaAppSponsoredAdVideoViewabilityEnabled or metadata.mediaType ~= "video" then return end
	if video.viewabilityTargetId ~= p11.viewabilityTargetId then
		p10.state:transitionVideoSource(p12, video.isFullscreen ~= p11.isFullscreen)
	end
	p10.metadata = metadata
	video.viewabilityTargetId = p11.viewabilityTargetId
	video.isFullscreen = p11.isFullscreen
	self:_advanceSession(p10, p12, p11.ratio, p11.geometry, p11.videoStateSnapshot, p11.isFullscreen)
end

function t_1:_collectCurrentVideoMeasurements()
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), var1 (ref), collectionService (ref), constantsModule (ref), getRegisteredTile (ref), measureRegisteredTile (ref), shouldReplaceCandidate (ref)
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
		local var6
		for i, v in self._sessions do
			if v.video ~= nil then
				var6 = true
				if not var6 then
					return var1
				end
				local t = {}
				local surfaceScope = self._surfaceScope
				local viewportBounds = self._viewportBounds
				
				if surfaceScope == nil or viewportBounds == nil or not (viewportBounds.min.X < viewportBounds.max.X and viewportBounds.min.Y < viewportBounds.max.Y) then
					return t
				end
				for v, v in collectionService:GetTagged(constantsModule.CandidateTag) do
					local var7, var8, var9 = getRegisteredTile(v, surfaceScope)
					
					if var7 ~= nil and var8 ~= nil and (var9 ~= nil and (fFlagLuaAppSponsoredAdVideoViewabilityEnabled and var9.mediaType == "video")) then
						local var10 = measureRegisteredTile(var7, var8, var9, viewportBounds)
						
						if var10 ~= nil then
							local encryptedAdTrackingData = self._sessions[var9.encryptedAdTrackingData]
							local var11 = if var10.isFullscreen then encryptedAdTrackingData ~= nil and encryptedAdTrackingData.video ~= nil else not var10.isFullscreen
							
							if var11 then
								var11 = var10.metadata.encryptedAdTrackingData
								encryptedAdTrackingData = t[var11]
								
								if (encryptedAdTrackingData == nil or encryptedAdTrackingData.metadata.mediaType == var10.metadata.mediaType) and (encryptedAdTrackingData == nil or shouldReplaceCandidate(encryptedAdTrackingData, var10)) then
									t[var11] = var10
								end
							end
						end
					end
				end
				return t
			end
		end
		var6 = false
	end
end

function t_1:setSurfaceScope(p10)
	self._surfaceScope = p10
end

function t_1:setViewportBounds(p10)
	self._viewportBounds = p10
end

function t_1:start()
	if self._running then return end
	self._running = true
	
	if not self._paused then
		self:_scheduleNextScan()
	end
end

function t_1:_cancelScheduledScan()
	local scanThread = self._scanThread
	
	if scanThread ~= nil and coroutine.status(scanThread) == "suspended" then
		task.cancel(scanThread)
	end
	self._scanThread = nil
end

function t_1:_scheduleNextScan()
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
		if self._scanThread == nil then
			self._scanThread = task.delay(0.2, function()
				-- upvalues: self (ref), fFlagLuaAppSponsoredAdVideoViewabilityEnabled (copy)
				self._scanThread = nil
				
				if not self._running or self._paused then return end
				if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
					local ok, status = pcall(self._scanTick, self, DateTime.now().UnixTimestampMillis)
					
					if ok then
						if self._running and not self._paused then
							self:_scheduleNextScan()
						end
						return
					else
						warn("SponsoredAdViewability scan failed; disabling detector", status)
						self._running = false
						self._sessions = {}
						
						return
					end
				else
					self:_scanTick(DateTime.now().UnixTimestampMillis)
				end
			end)
			
			return
		else
			return
		end
	else
		assert(self._scanThread == nil, "scan is already scheduled")
	end
end

function t_1:_scanTick(p10)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), collectionService (ref), constantsModule (ref), getRegisteredTile (ref), measureRegisteredTile (ref), shouldReplaceCandidate (ref)
	if not fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
		self:_scanTick_deprecated(p10)
		
		return
	end
	local surfaceScope = self._surfaceScope
	local viewportBounds = self._viewportBounds
	
	if surfaceScope == nil or viewportBounds == nil then return end
	if not (viewportBounds.min.X < viewportBounds.max.X and viewportBounds.min.Y < viewportBounds.max.Y) then return end
	local var12
	local t = {}
	local t_1 = {}
	local t_2 = {}
	
	for i, v in collectionService:GetTagged(constantsModule.CandidateTag) do
		local var13, var14, var15 = getRegisteredTile(v, surfaceScope)
		
		if var13 ~= nil and var14 ~= nil and var15 ~= nil then
			local encryptedAdTrackingData = var15.encryptedAdTrackingData
			local var16 = measureRegisteredTile(var13, var14, var15, viewportBounds)
			
			if var16 == nil then
				local var17 = self._sessions[encryptedAdTrackingData]
				
				if var15.isFullscreen == true and (fFlagLuaAppSponsoredAdVideoViewabilityEnabled and var15.mediaType == "video") and (var17 ~= nil and var17.video ~= nil) then
					t_1[encryptedAdTrackingData] = true
				end
			else
				var12 = self._sessions[encryptedAdTrackingData]
				local var18 = if var16.isFullscreen then var12 ~= nil and var12.video ~= nil else not var16.isFullscreen
				
				if var18 then
					t[encryptedAdTrackingData] = true
					var18 = var16.metadata.encryptedAdTrackingData
					var12 = t_2[var18]
					
					if (var12 == nil or var12.metadata.mediaType == var16.metadata.mediaType) and (var12 == nil or shouldReplaceCandidate(var12, var16)) then
						t_2[var18] = var16
					end
				end
			end
		end
	end
	for i_1, v_1 in t_2 do
		if not t_1[i_1] or v_1.isFullscreen then
			self:_processMeasurement(i_1, v_1, p10)
		end
	end
	for i_1, v_2 in self._sessions do
		if not t[i_1] and not t_1[i_1] then
			local video = v_2.video
			var12 = nil
			self:_advanceSession(v_2, p10, 0, var12, nil, video ~= nil and video.isFullscreen)
		end
	end
end

function t_1:_scanTick_deprecated(p11)
	-- upvalues: collectionService (ref), constantsModule (ref), measureTile_deprecated (ref), sponsoredAdViewabilityStateModule (ref)
	local surfaceScope = self._surfaceScope
	local viewportBounds = self._viewportBounds
	
	if surfaceScope == nil or viewportBounds == nil then return end
	if viewportBounds.max.X <= viewportBounds.min.X or viewportBounds.max.Y <= viewportBounds.min.Y then return end
	local t = {}
	
	for i, v in collectionService:GetTagged(constantsModule.CandidateTag) do
		local var19 = measureTile_deprecated(v, surfaceScope, viewportBounds)
		
		if var19 then
			local metadata = var19.metadata
			local encryptedAdTrackingData = metadata.encryptedAdTrackingData
			t[encryptedAdTrackingData] = true
			local var20 = self._sessions[encryptedAdTrackingData]
			
			if not var20 then
				var20 = {
					state = sponsoredAdViewabilityStateModule.new(p11),
					metadata = metadata
				}
				self._sessions[encryptedAdTrackingData] = var20
				self._callbacks.onSessionStart(metadata, var19.geometry, p11)
			end
			for i_1, v_1 in var20.state:advance(p11, var19.ratio, var19.geometry) do
				self._callbacks.onMilestone(metadata, v_1)
			end
		end
	end
	for i_1, v_1 in self._sessions do
		if not t[i_1] then
			v_1.state:advance(p11, 0, nil)
		end
	end
end

function t_1:pause(p12)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	if self._paused then return end
	p12 = p12 or DateTime.now().UnixTimestampMillis
	
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
		local var21 = self:_collectCurrentVideoMeasurements()
		
		for i, v in self._sessions do
			if v.video ~= nil then
				self:_applySelectedVideoMeasurement(v, var21[i], p12)
			end
			v.state:pause(p12)
		end
	else
		for i, v in self._sessions do
			v.state:pause(p12)
		end
	end
	self._paused = true
	self:_cancelScheduledScan()
end

function t_1:resume(p13)
	if not self._paused then return end
	p13 = p13 or DateTime.now().UnixTimestampMillis
	
	for i, v in self._sessions do
		v.state:resume(p13)
	end
	self._paused = false
	
	if self._running then
		self:_scheduleNextScan()
	end
end

function t_1:_terminateAllSessions(b, p14)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), invokeCallback (ref)
	local sessions = self._sessions
	
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
		local var22 = if self._paused then {} else self:_collectCurrentVideoMeasurements()
		self._sessions = {}
		
		for i, v in sessions do
			if not self._paused and v.video ~= nil then
				self:_applySelectedVideoMeasurement(v, var22[i], b)
			end
			invokeCallback("onUnload", self._callbacks.onUnload, v.metadata, v.state:finalize(b), p14)
		end
		return
	else
		self._sessions = {}
		
		for i, v in sessions do
			self._callbacks.onUnload(v.metadata, v.state:finalize(b), p14)
		end
	end
end

function t_1:onFeedRefresh(p15)
	-- upvalues: t (ref)
	self:_terminateAllSessions(p15 or DateTime.now().UnixTimestampMillis, t.FeedRefresh)
end

function t_1:reset(p15)
	-- upvalues: t (ref)
	self._running = false
	self:_cancelScheduledScan()
	self:_terminateAllSessions(p15 or DateTime.now().UnixTimestampMillis, t.SurfaceTeardown)
end

t_1.TerminalReason = t

return t_1