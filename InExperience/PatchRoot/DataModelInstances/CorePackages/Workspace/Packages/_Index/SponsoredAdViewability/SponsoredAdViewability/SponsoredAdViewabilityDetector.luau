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

local function invokeCallback(p0, p1, ...)
	local var15 = nil
	
	if not xpcall(p1, function(p2)
		-- upvalues: var15 (write)
		var15 = p2
	end, ...) then
		warn(`SponsoredAdViewability {p0} failed`, var15)
	end
end

local var8 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then table.freeze({}) else nil
local t_1 = {}
t_1.__index = t_1

function t_1.new(p3)
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

local function _(p4)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	return fFlagLuaAppSponsoredAdVideoViewabilityEnabled and p4.mediaType == "video"
end

local _ = function(p5)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	if not fFlagLuaAppSponsoredAdVideoViewabilityEnabled or p5.mediaType ~= "video" then
		return nil
	end
	local videoPlaybackStateRef = p5.videoPlaybackStateRef
	local var16 = if videoPlaybackStateRef then videoPlaybackStateRef.current else nil
	
	if var16 == nil then
		return nil
	end
	local ok, status = pcall(var16)
	
	return if ok then status else nil
end

local function getLayerCollectorAndVisibility(p6)
	local var17 = p6
	local var18 = true
	while var17 do
		if var17:IsA("GuiObject") and not var17.Visible then
			var18 = false
		end
		if not var17:IsA("LayerCollector") then
			var17 = var17.Parent
			continue
		end
		return var17, var18 and var17.Enabled
	end
	return nil, false
end

local function getRegisteredTile(p7, p8)
	-- upvalues: constantsModule (ref), sponsoredAdViewabilityRegistryModule (ref)
	if not p7:IsA("GuiObject") then
		return nil, nil, nil
	end
	local viewabilityTargetIdAttribute = p7:GetAttribute(constantsModule.ViewabilityTargetIdAttribute)
	
	if typeof(viewabilityTargetIdAttribute) ~= "string" then
		return nil, nil, nil
	end
	local var20 = sponsoredAdViewabilityRegistryModule.get(viewabilityTargetIdAttribute)
	
	if var20 == nil then
		return nil, nil, nil
	elseif var20.isFullscreen == true or p7:IsDescendantOf(p8) then
		return p7, viewabilityTargetIdAttribute, var20
	end
	return nil, nil, nil
end

local function measureRegisteredTile(p9, p10, p11, p12)
	-- upvalues: getLayerCollectorAndVisibility (ref), calculateIntersectionRatioModule (ref), fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	local var21 = p11.isFullscreen == true
	local var22 = nil
	local var23 = nil
	local var24 = p12
	
	if not pcall(function()
		-- upvalues: var21 (ref), getLayerCollectorAndVisibility (copy), p9 (ref), var24 (write), var22 (write), var23 (write)
		if var21 then
			local var28, var29 = getLayerCollectorAndVisibility(p9)
			
			if var28 == nil or not var29 then return end
			var24 = {
				min = var28.AbsolutePosition,
				max = var28.AbsolutePosition + var28.AbsoluteSize
			}
		end
		var22 = p9.AbsolutePosition
		var23 = p9.AbsoluteSize
	end) or var22 == nil or var23 == nil then
		return nil
	end
	local var26
	local t = {
		metadata = p11,
		geometry = { adSize = var23, viewportBounds = var24 },
		ratio = calculateIntersectionRatioModule(var22, var23, var24),
		viewabilityTargetId = p10
	}
	
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and p11.mediaType == "video" then
		local videoPlaybackStateRef = p11.videoPlaybackStateRef
		local var27 = if videoPlaybackStateRef then videoPlaybackStateRef.current else nil
		
		if var27 == nil then
			var26 = nil
		else
			local ok, status = pcall(var27)
			var26 = if ok then status else nil
		end
	else
		var26 = nil
	end
	t.videoStateSnapshot = var26
	t.isFullscreen = var21
	
	return t
end

local function measureTile_deprecated(p13, p14, p15)
	-- upvalues: constantsModule (ref), sponsoredAdViewabilityRegistryModule (ref), calculateIntersectionRatioModule (ref)
	if not p13:IsA("GuiObject") then
		return nil
	elseif not p13:IsDescendantOf(p14) then
		return nil
	end
	local viewabilityTargetIdAttribute = p13:GetAttribute(constantsModule.ViewabilityTargetIdAttribute)
	
	if typeof(viewabilityTargetIdAttribute) ~= "string" then
		return nil
	end
	local var31 = sponsoredAdViewabilityRegistryModule.get(viewabilityTargetIdAttribute)
	
	if var31 == nil then
		return nil
	end
	local absoluteSize = p13.AbsoluteSize
	
	return {
		metadata = var31,
		geometry = { adSize = absoluteSize, viewportBounds = p15 },
		ratio = calculateIntersectionRatioModule(p13.AbsolutePosition, absoluteSize, p15)
	}
end

local function shouldReplaceCandidate(p16, p17)
	if p16.isFullscreen == p17.isFullscreen then
		if p16.ratio ~= p17.ratio then
			return p16.ratio < p17.ratio
		elseif p16.videoStateSnapshot ~= nil ~= (p17.videoStateSnapshot ~= nil) then
			return p17.videoStateSnapshot ~= nil
		end
		local var32 = tonumber(p17.viewabilityTargetId)
		local var33 = tonumber(p16.viewabilityTargetId)
		
		return if var32 == nil or var33 == nil then var32 ~= nil else var33 < var32
	else
		return if p16.videoStateSnapshot ~= nil == (p17.videoStateSnapshot ~= nil) then p17.isFullscreen else p17.videoStateSnapshot ~= nil
	end
end

local _ = function(p18, p19)
	-- upvalues: shouldReplaceCandidate (ref)
	local encryptedAdTrackingData = p19.metadata.encryptedAdTrackingData
	local var34 = p18[encryptedAdTrackingData]
	
	if var34 ~= nil and var34.metadata.mediaType ~= p19.metadata.mediaType then return end
	if var34 == nil or shouldReplaceCandidate(var34, p19) then
		p18[encryptedAdTrackingData] = p19
	end
end

local _ = function(p20, p21)
	return if p20.isFullscreen then p21 ~= nil and p21.video ~= nil else not p20.isFullscreen
end

local _ = function(p22)
	return p22.min.X < p22.max.X and p22.min.Y < p22.max.Y
end

local _ = function(p23)
	for i, v in p23 do
		if v.video ~= nil then
			return true
		end
	end
	return false
end

function t_1:_advanceSession(p24, p25, p26, p27, p28, p29, p30)
	-- upvalues: invokeCallback (ref)
	local var35, var36 = p24.state:advance(p25, p26, p27, p28, p29)
	p30 = p30 or p24.metadata
	
	for i, v in var35 do
		invokeCallback("onMilestone", self._callbacks.onMilestone, p30, v)
	end
	local onVideoProgress = self._callbacks.onVideoProgress
	
	if onVideoProgress ~= nil and var36 ~= nil then
		for i_1, v_1 in var36 do
			invokeCallback("onVideoProgress", onVideoProgress, p30, v_1)
		end
	end
end

function t_1:_processMeasurement(p31, p32, p33)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), sponsoredAdViewabilityStateModule (ref), invokeCallback (ref)
	local metadata = p32.metadata
	local var38 = fFlagLuaAppSponsoredAdVideoViewabilityEnabled and metadata.mediaType == "video"
	local var39 = self._sessions[p31]
	
	if not var39 then
		var39 = {
			state = sponsoredAdViewabilityStateModule.new(p33, var38),
			metadata = metadata,
			video = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and var38 then {
				viewabilityTargetId = p32.viewabilityTargetId,
				isFullscreen = p32.isFullscreen
			} else nil
		}
		self._sessions[p31] = var39
		invokeCallback("onSessionStart", self._callbacks.onSessionStart, metadata, p32.geometry, p33, p32.videoStateSnapshot)
	end
	if var38 then
		self:_applySelectedVideoMeasurement(var39, p32, p33)
		
		return
	elseif var39.video == nil then
		self:_advanceSession(var39, p33, p32.ratio, p32.geometry, nil, false, metadata)
		
		return
	end
end

function t_1:_applySelectedVideoMeasurement(p34, p35, p36)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	local video = p34.video
	
	if video == nil then return end
	if p35 == nil then
		self:_advanceSession(p34, p36, 0, nil, nil, video.isFullscreen)
		
		return
	end
	local metadata = p35.metadata
	
	if not fFlagLuaAppSponsoredAdVideoViewabilityEnabled or metadata.mediaType ~= "video" then return end
	if video.viewabilityTargetId ~= p35.viewabilityTargetId then
		p34.state:transitionVideoSource(p36, video.isFullscreen ~= p35.isFullscreen)
	end
	p34.metadata = metadata
	video.viewabilityTargetId = p35.viewabilityTargetId
	video.isFullscreen = p35.isFullscreen
	self:_advanceSession(p34, p36, p35.ratio, p35.geometry, p35.videoStateSnapshot, p35.isFullscreen)
end

function t_1:_collectCurrentVideoMeasurements()
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), var8 (ref), collectionService (ref), constantsModule (ref), getRegisteredTile (ref), measureRegisteredTile (ref), shouldReplaceCandidate (ref)
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
		local var40
		for i, v in self._sessions do
			if v.video ~= nil then
				var40 = true
				if not var40 then
					return var8
				end
				local t = {}
				local surfaceScope = self._surfaceScope
				local viewportBounds = self._viewportBounds
				
				if surfaceScope == nil or viewportBounds == nil or not (viewportBounds.min.X < viewportBounds.max.X and viewportBounds.min.Y < viewportBounds.max.Y) then
					return t
				end
				for v, v in collectionService:GetTagged(constantsModule.CandidateTag) do
					local var42, var43, var44 = getRegisteredTile(v, surfaceScope)
					
					if var42 ~= nil and var43 ~= nil and (var44 ~= nil and (fFlagLuaAppSponsoredAdVideoViewabilityEnabled and var44.mediaType == "video")) then
						local var45 = measureRegisteredTile(var42, var43, var44, viewportBounds)
						
						if var45 ~= nil then
							local encryptedAdTrackingData = self._sessions[var44.encryptedAdTrackingData]
							local var46 = if var45.isFullscreen then encryptedAdTrackingData ~= nil and encryptedAdTrackingData.video ~= nil else not var45.isFullscreen
							
							if var46 then
								var46 = var45.metadata.encryptedAdTrackingData
								encryptedAdTrackingData = t[var46]
								
								if (encryptedAdTrackingData == nil or encryptedAdTrackingData.metadata.mediaType == var45.metadata.mediaType) and (encryptedAdTrackingData == nil or shouldReplaceCandidate(encryptedAdTrackingData, var45)) then
									t[var46] = var45
								end
							end
						end
					end
				end
				return t
			end
		end
		var40 = false
	end
end

function t_1:setSurfaceScope(p37)
	self._surfaceScope = p37
end

function t_1:setViewportBounds(p38)
	self._viewportBounds = p38
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

function t_1:_scanTick(p39)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), collectionService (ref), constantsModule (ref), getRegisteredTile (ref), measureRegisteredTile (ref), shouldReplaceCandidate (ref)
	if not fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
		self:_scanTick_deprecated(p39)
		
		return
	end
	local surfaceScope = self._surfaceScope
	local viewportBounds = self._viewportBounds
	
	if surfaceScope == nil or viewportBounds == nil then return end
	if not (viewportBounds.min.X < viewportBounds.max.X and viewportBounds.min.Y < viewportBounds.max.Y) then return end
	local var50
	local t = {}
	local t_1 = {}
	local t_2 = {}
	
	for i, v in collectionService:GetTagged(constantsModule.CandidateTag) do
		local var51, var52, var53 = getRegisteredTile(v, surfaceScope)
		
		if var51 ~= nil and var52 ~= nil and var53 ~= nil then
			local encryptedAdTrackingData = var53.encryptedAdTrackingData
			local var54 = measureRegisteredTile(var51, var52, var53, viewportBounds)
			
			if var54 == nil then
				local var55 = self._sessions[encryptedAdTrackingData]
				
				if var53.isFullscreen == true and (fFlagLuaAppSponsoredAdVideoViewabilityEnabled and var53.mediaType == "video") and (var55 ~= nil and var55.video ~= nil) then
					t_1[encryptedAdTrackingData] = true
				end
			else
				var50 = self._sessions[encryptedAdTrackingData]
				local var56 = if var54.isFullscreen then var50 ~= nil and var50.video ~= nil else not var54.isFullscreen
				
				if var56 then
					t[encryptedAdTrackingData] = true
					var56 = var54.metadata.encryptedAdTrackingData
					var50 = t_2[var56]
					
					if (var50 == nil or var50.metadata.mediaType == var54.metadata.mediaType) and (var50 == nil or shouldReplaceCandidate(var50, var54)) then
						t_2[var56] = var54
					end
				end
			end
		end
	end
	for i_1, v_1 in t_2 do
		if not t_1[i_1] or v_1.isFullscreen then
			self:_processMeasurement(i_1, v_1, p39)
		end
	end
	for i_1, v_2 in self._sessions do
		if not t[i_1] and not t_1[i_1] then
			local video = v_2.video
			var50 = nil
			self:_advanceSession(v_2, p39, 0, var50, nil, video ~= nil and video.isFullscreen)
		end
	end
end

function t_1:_scanTick_deprecated(p40)
	-- upvalues: collectionService (ref), constantsModule (ref), measureTile_deprecated (ref), sponsoredAdViewabilityStateModule (ref)
	local surfaceScope = self._surfaceScope
	local viewportBounds = self._viewportBounds
	
	if surfaceScope == nil or viewportBounds == nil then return end
	if viewportBounds.max.X <= viewportBounds.min.X or viewportBounds.max.Y <= viewportBounds.min.Y then return end
	local t = {}
	
	for i, v in collectionService:GetTagged(constantsModule.CandidateTag) do
		local var58 = measureTile_deprecated(v, surfaceScope, viewportBounds)
		
		if var58 then
			local metadata = var58.metadata
			local encryptedAdTrackingData = metadata.encryptedAdTrackingData
			t[encryptedAdTrackingData] = true
			local var59 = self._sessions[encryptedAdTrackingData]
			
			if not var59 then
				var59 = {
					state = sponsoredAdViewabilityStateModule.new(p40),
					metadata = metadata
				}
				self._sessions[encryptedAdTrackingData] = var59
				self._callbacks.onSessionStart(metadata, var58.geometry, p40)
			end
			for i_1, v_1 in var59.state:advance(p40, var58.ratio, var58.geometry) do
				self._callbacks.onMilestone(metadata, v_1)
			end
		end
	end
	for i_1, v_1 in self._sessions do
		if not t[i_1] then
			v_1.state:advance(p40, 0, nil)
		end
	end
end

function t_1:pause(p41)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	if self._paused then return end
	p41 = p41 or DateTime.now().UnixTimestampMillis
	
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
		local var61 = self:_collectCurrentVideoMeasurements()
		
		for i, v in self._sessions do
			if v.video ~= nil then
				self:_applySelectedVideoMeasurement(v, var61[i], p41)
			end
			v.state:pause(p41)
		end
	else
		for i, v in self._sessions do
			v.state:pause(p41)
		end
	end
	self._paused = true
	self:_cancelScheduledScan()
end

function t_1:resume(p42)
	if not self._paused then return end
	p42 = p42 or DateTime.now().UnixTimestampMillis
	
	for i, v in self._sessions do
		v.state:resume(p42)
	end
	self._paused = false
	
	if self._running then
		self:_scheduleNextScan()
	end
end

function t_1:_terminateAllSessions(b, p43)
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), invokeCallback (ref)
	local sessions = self._sessions
	
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
		local var63 = if self._paused then {} else self:_collectCurrentVideoMeasurements()
		self._sessions = {}
		
		for i, v in sessions do
			if not self._paused and v.video ~= nil then
				self:_applySelectedVideoMeasurement(v, var63[i], b)
			end
			invokeCallback("onUnload", self._callbacks.onUnload, v.metadata, v.state:finalize(b), p43)
		end
		return
	else
		self._sessions = {}
		
		for i, v in sessions do
			self._callbacks.onUnload(v.metadata, v.state:finalize(b), p43)
		end
	end
end

function t_1:onFeedRefresh(p44)
	-- upvalues: t (ref)
	self:_terminateAllSessions(p44 or DateTime.now().UnixTimestampMillis, t.FeedRefresh)
end

function t_1:reset(p45)
	-- upvalues: t (ref)
	self._running = false
	self:_cancelScheduledScan()
	self:_terminateAllSessions(p45 or DateTime.now().UnixTimestampMillis, t.SurfaceTeardown)
end

t_1.TerminalReason = t

return t_1