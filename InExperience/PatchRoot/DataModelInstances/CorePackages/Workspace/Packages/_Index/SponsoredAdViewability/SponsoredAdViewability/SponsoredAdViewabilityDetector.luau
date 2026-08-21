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
local var7 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then table.freeze({}) else nil
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 99 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		_surfaceScope = nil,
		_viewportBounds = nil,
		_running = false,
		_paused = false,
		_scanThread = nil,
		_callbacks = p0,
		_sessions = {}
	}, t_1)
end

local function _(p1) --[[ line: 111 | named "isVideoMetadata" ]]
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	return fFlagLuaAppSponsoredAdVideoViewabilityEnabled and p1.mediaType == "video"
end

local _ = function(p2) --[[ line: 115 | named "readVideoPlaybackState" ]]
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	if not fFlagLuaAppSponsoredAdVideoViewabilityEnabled or p2.mediaType ~= "video" then
		return nil
	end
	local videoPlaybackStateRef = p2.videoPlaybackStateRef
	local var12 = if videoPlaybackStateRef then videoPlaybackStateRef.current else nil
	
	if var12 == nil then
		return nil
	end
	local ok, status = pcall(var12)
	
	return if ok then status else nil
end

local function getRegisteredTile(p3, p4) --[[ line: 128 ]]
	-- upvalues: constantsModule (ref), sponsoredAdViewabilityRegistryModule (ref)
	if not p3:IsA("GuiObject") then
		return nil, nil, nil
	elseif not p3:IsDescendantOf(p4) then
		return nil, nil, nil
	end
	local viewabilityTargetIdAttribute = p3:GetAttribute(constantsModule.ViewabilityTargetIdAttribute)
	
	if typeof(viewabilityTargetIdAttribute) ~= "string" then
		return nil, nil, nil
	end
	local var14 = sponsoredAdViewabilityRegistryModule.get(viewabilityTargetIdAttribute)
	
	if var14 == nil then
		return nil, nil, nil
	end
	return p3, viewabilityTargetIdAttribute, var14
end

local function measureRegisteredTile(p5, p6, p7, p8) --[[ line: 149 ]]
	-- upvalues: calculateIntersectionRatioModule (ref), fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	local ok, status, var15 = pcall(function() --[[ line: 155 ]]
		-- upvalues: p5 (ref)
		return p5.AbsolutePosition, p5.AbsoluteSize
	end)
	
	if not ok then
		return nil
	end
	local var17
	local t = {
		metadata = p7,
		geometry = { adSize = var15, viewportBounds = p8 },
		ratio = calculateIntersectionRatioModule(status, var15, p8),
		viewabilityTargetId = p6
	}
	
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and p7.mediaType == "video" then
		local videoPlaybackStateRef = p7.videoPlaybackStateRef
		local var18 = if videoPlaybackStateRef then videoPlaybackStateRef.current else nil
		
		if var18 == nil then
			var17 = nil
		else
			local ok_1, status_1 = pcall(var18)
			var17 = if ok_1 then status_1 else nil
		end
	else
		var17 = nil
	end
	t.videoStateSnapshot = var17
	
	return t
end

local _ = function(p9, p10, p11) --[[ line: 170 | named "measureVideoTile" ]]
	-- upvalues: getRegisteredTile (ref), measureRegisteredTile (ref)
	local var19, var20, var21 = getRegisteredTile(p9, p10)
	
	return if var19 == nil or var20 == nil or var21 == nil then nil else measureRegisteredTile(var19, var20, var21, p11)
end

local function measureTile_deprecated(p12, p13, p14) --[[ line: 178 ]]
	-- upvalues: constantsModule (ref), sponsoredAdViewabilityRegistryModule (ref), calculateIntersectionRatioModule (ref)
	if not p12:IsA("GuiObject") then
		return nil
	elseif not p12:IsDescendantOf(p13) then
		return nil
	end
	local viewabilityTargetIdAttribute = p12:GetAttribute(constantsModule.ViewabilityTargetIdAttribute)
	
	if typeof(viewabilityTargetIdAttribute) ~= "string" then
		return nil
	end
	local var23 = sponsoredAdViewabilityRegistryModule.get(viewabilityTargetIdAttribute)
	
	if var23 == nil then
		return nil
	end
	local absoluteSize = p12.AbsoluteSize
	
	return {
		metadata = var23,
		geometry = { adSize = absoluteSize, viewportBounds = p14 },
		ratio = calculateIntersectionRatioModule(p12.AbsolutePosition, absoluteSize, p14)
	}
end

local _ = function(p15, p16) --[[ line: 210 | named "shouldReplaceCandidate" ]]
	return if p15.ratio == p16.ratio then if p15.videoStateSnapshot ~= nil == (p16.videoStateSnapshot ~= nil) then assert(tonumber(p15.viewabilityTargetId), "registry id must be numeric") < assert(tonumber(p16.viewabilityTargetId), "registry id must be numeric") else p16.videoStateSnapshot ~= nil else p15.ratio < p16.ratio
end

local _ = function(p17, p18) --[[ line: 223 | named "selectBetterMeasurement" ]]
	local encryptedAdTrackingData = p18.metadata.encryptedAdTrackingData
	local var24 = p17[encryptedAdTrackingData]
	
	if var24 ~= nil then
		assert(var24.metadata.mediaType == p18.metadata.mediaType, "ad media type must match within one scan")
	end
	if var24 ~= nil then
		local var25
		if var24.ratio ~= p18.ratio then
			local _ = var24.ratio < p18.ratio
		elseif var24.videoStateSnapshot ~= nil == (p18.videoStateSnapshot ~= nil) then
			var25 = assert(tonumber(var24.viewabilityTargetId), "registry id must be numeric") < assert(tonumber(p18.viewabilityTargetId), "registry id must be numeric")
		else
			var25 = p18.videoStateSnapshot ~= nil
			var25 = nil
		end
		if var25 then
			p17[encryptedAdTrackingData] = p18
		end
	end
end

local _ = function(p19) --[[ line: 234 | named "canMeasureViewport" ]]
	return p19.min.X < p19.max.X and p19.min.Y < p19.max.Y
end

local _ = function(p20) --[[ line: 238 | named "hasVideoSession" ]]
	for i, v in p20 do
		if v.video ~= nil then
			return true
		end
	end
	return false
end

function t_1:_advanceSession(p21, p22, p23, p24, p25, p26) --[[ line: 247 ]]
	local var26, var27 = p21.state:advance(p22, p23, p24, p25)
	p26 = p26 or p21.metadata
	
	for i, v in var26 do
		self._callbacks.onMilestone(p26, v)
	end
	local onVideoProgress = self._callbacks.onVideoProgress
	
	if onVideoProgress ~= nil and var27 ~= nil then
		for i_1, v_1 in var27 do
			onVideoProgress(p26, v_1)
		end
	end
end

function t_1:_processMeasurement(p27, p28, p29) --[[ line: 269 ]]
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), sponsoredAdViewabilityStateModule (ref)
	local metadata = p28.metadata
	local var29 = fFlagLuaAppSponsoredAdVideoViewabilityEnabled and metadata.mediaType == "video"
	local var30 = self._sessions[p27]
	
	if not var30 then
		var30 = {
			state = sponsoredAdViewabilityStateModule.new(p29, var29),
			metadata = metadata,
			video = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and var29 then { viewabilityTargetId = p28.viewabilityTargetId } else nil
		}
		self._sessions[p27] = var30
		self._callbacks.onSessionStart(metadata, p28.geometry, p29, p28.videoStateSnapshot)
	end
	assert(var30.video ~= nil == var29, "ad media type must not change within a session")
	
	if var29 then
		self:_applySelectedVideoMeasurement(var30, p28, p29)
		
		return
	end
	self:_advanceSession(var30, p29, p28.ratio, p28.geometry, nil, metadata)
end

function t_1:_applySelectedVideoMeasurement(p30, p31, p32) --[[ line: 299 ]]
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	if p31 == nil then
		self:_advanceSession(p30, p32, 0, nil, nil)
		
		return
	end
	local metadata = p31.metadata
	assert(fFlagLuaAppSponsoredAdVideoViewabilityEnabled and metadata.mediaType == "video", "selected video must have video metadata")
	local var31 = assert(p30.video, "selected video must have a video session")
	
	if var31.viewabilityTargetId ~= p31.viewabilityTargetId then
		p30.state:transitionVideoSource(p32)
	end
	p30.metadata = metadata
	var31.viewabilityTargetId = p31.viewabilityTargetId
	self:_advanceSession(p30, p32, p31.ratio, p31.geometry, p31.videoStateSnapshot)
end

function t_1:_collectCurrentVideoMeasurements() --[[ line: 322 ]]
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), var7 (ref), collectionService (ref), constantsModule (ref), getRegisteredTile (ref), measureRegisteredTile (ref)
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
		local var32
		for i, v in self._sessions do
			if v.video ~= nil then
				var32 = true
				if not var32 then
					return var7
				end
				local t = {}
				local surfaceScope = self._surfaceScope
				local viewportBounds = self._viewportBounds
				
				if surfaceScope == nil or viewportBounds == nil or not (viewportBounds.min.X < viewportBounds.max.X and viewportBounds.min.Y < viewportBounds.max.Y) then
					return t
				end
				for v, v in collectionService:GetTagged(constantsModule.CandidateTag) do
					local var34, var35, var36 = getRegisteredTile(v, surfaceScope)
					
					if var34 ~= nil and var35 ~= nil and (var36 ~= nil and (fFlagLuaAppSponsoredAdVideoViewabilityEnabled and var36.mediaType == "video")) then
						local var37 = measureRegisteredTile(var34, var35, var36, viewportBounds)
						
						if var37 ~= nil then
							local encryptedAdTrackingData = var37.metadata.encryptedAdTrackingData
							local var38 = t[encryptedAdTrackingData]
							
							if var38 ~= nil then
								assert(var38.metadata.mediaType == var37.metadata.mediaType, "ad media type must match within one scan")
							end
							if var38 ~= nil then
								local var39
								if var38.ratio ~= var37.ratio then
									local _ = var38.ratio < var37.ratio
								elseif var38.videoStateSnapshot ~= nil == (var37.videoStateSnapshot ~= nil) then
									var39 = assert(tonumber(var38.viewabilityTargetId), "registry id must be numeric") < assert(tonumber(var37.viewabilityTargetId), "registry id must be numeric")
								else
									var39 = var37.videoStateSnapshot ~= nil
									var39 = nil
								end
								if var39 then
									t[encryptedAdTrackingData] = var37
								end
							end
						end
					end
				end
				return t
			end
		end
		var32 = false
	end
end

function t_1:setSurfaceScope(p33) --[[ line: 348 ]]
	self._surfaceScope = p33
end

function t_1:setViewportBounds(p34) --[[ line: 352 ]]
	self._viewportBounds = p34
end

function t_1:start() --[[ line: 359 ]]
	if self._running then return end
	self._running = true
	
	if not self._paused then
		self:_scheduleNextScan()
	end
end

function t_1:_cancelScheduledScan() --[[ line: 369 ]]
	local scanThread = self._scanThread
	
	if scanThread ~= nil and coroutine.status(scanThread) == "suspended" then
		task.cancel(scanThread)
	end
	self._scanThread = nil
end

function t_1:_scheduleNextScan() --[[ line: 377 ]]
	assert(self._scanThread == nil, "scan is already scheduled")
	self._scanThread = task.delay(0.2, function() --[[ line: 379 ]]
		-- upvalues: self (ref)
		self._scanThread = nil
		
		if not self._running or self._paused then return end
		self:_scanTick(DateTime.now().UnixTimestampMillis)
		
		if self._running and not self._paused then
			self:_scheduleNextScan()
		end
	end)
end

function t_1:_scanTick(p35) --[[ line: 393 ]]
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), collectionService (ref), constantsModule (ref), getRegisteredTile (ref), measureRegisteredTile (ref)
	if not fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
		self:_scanTick_deprecated(p35)
		
		return
	end
	local surfaceScope = self._surfaceScope
	local viewportBounds = self._viewportBounds
	
	if surfaceScope == nil or viewportBounds == nil then return end
	if not (viewportBounds.min.X < viewportBounds.max.X and viewportBounds.min.Y < viewportBounds.max.Y) then return end
	local t = {}
	local t_1 = {}
	
	for i, v in collectionService:GetTagged(constantsModule.CandidateTag) do
		local var42, var43, var44 = getRegisteredTile(v, surfaceScope)
		local var45 = if var42 == nil or var43 == nil or var44 == nil then nil else measureRegisteredTile(var42, var43, var44, viewportBounds)
		
		if var45 then
			t[var45.metadata.encryptedAdTrackingData] = true
			var43 = var45.metadata.encryptedAdTrackingData
			var44 = t_1[var43]
			
			if var44 ~= nil then
				assert(var44.metadata.mediaType == var45.metadata.mediaType, "ad media type must match within one scan")
			end
			if var44 ~= nil then
				local var46
				if var44.ratio ~= var45.ratio then
					local _ = var44.ratio < var45.ratio
				elseif var44.videoStateSnapshot ~= nil == (var45.videoStateSnapshot ~= nil) then
					var46 = assert(tonumber(var44.viewabilityTargetId), "registry id must be numeric") < assert(tonumber(var45.viewabilityTargetId), "registry id must be numeric")
				else
					var46 = var45.videoStateSnapshot ~= nil
					var46 = nil
				end
				if var46 then
					t_1[var43] = var45
				end
			end
		end
	end
	for i_1, v_1 in t_1 do
		self:_processMeasurement(i_1, v_1, p35)
	end
	for i_2, v_2 in self._sessions do
		if not t[i_2] then
			self:_advanceSession(v_2, p35, 0, nil, nil)
		end
	end
end

function t_1:_scanTick_deprecated(p36) --[[ line: 434 ]]
	-- upvalues: collectionService (ref), constantsModule (ref), measureTile_deprecated (ref), sponsoredAdViewabilityStateModule (ref)
	local surfaceScope = self._surfaceScope
	local viewportBounds = self._viewportBounds
	
	if surfaceScope == nil or viewportBounds == nil then return end
	if viewportBounds.max.X <= viewportBounds.min.X or viewportBounds.max.Y <= viewportBounds.min.Y then return end
	local t = {}
	
	for i, v in collectionService:GetTagged(constantsModule.CandidateTag) do
		local var48 = measureTile_deprecated(v, surfaceScope, viewportBounds)
		
		if var48 then
			local metadata = var48.metadata
			local encryptedAdTrackingData = metadata.encryptedAdTrackingData
			t[encryptedAdTrackingData] = true
			local var49 = self._sessions[encryptedAdTrackingData]
			
			if not var49 then
				var49 = {
					state = sponsoredAdViewabilityStateModule.new(p36),
					metadata = metadata
				}
				self._sessions[encryptedAdTrackingData] = var49
				self._callbacks.onSessionStart(metadata, var48.geometry, p36)
			end
			for i_1, v_1 in var49.state:advance(p36, var48.ratio, var48.geometry) do
				self._callbacks.onMilestone(metadata, v_1)
			end
		end
	end
	for i_1, v_1 in self._sessions do
		if not t[i_1] then
			v_1.state:advance(p36, 0, nil)
		end
	end
end

function t_1:pause(p37) --[[ line: 475 ]]
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	if self._paused then return end
	p37 = p37 or DateTime.now().UnixTimestampMillis
	
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
		local var51 = self:_collectCurrentVideoMeasurements()
		
		for i, v in self._sessions do
			if v.video ~= nil then
				self:_applySelectedVideoMeasurement(v, var51[i], p37)
			end
			v.state:pause(p37)
		end
	else
		for i, v in self._sessions do
			v.state:pause(p37)
		end
	end
	self._paused = true
	self:_cancelScheduledScan()
end

function t_1:resume(p38) --[[ line: 497 ]]
	if not self._paused then return end
	p38 = p38 or DateTime.now().UnixTimestampMillis
	
	for i, v in self._sessions do
		v.state:resume(p38)
	end
	self._paused = false
	
	if self._running then
		self:_scheduleNextScan()
	end
end

function t_1:_terminateAllSessions(b, p39) --[[ line: 512 ]]
	-- upvalues: fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref)
	local sessions = self._sessions
	
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
		local var53 = if self._paused then {} else self:_collectCurrentVideoMeasurements()
		self._sessions = {}
		
		for i, v in sessions do
			if not self._paused and v.video ~= nil then
				self:_applySelectedVideoMeasurement(v, var53[i], b)
			end
			self._callbacks.onUnload(v.metadata, v.state:finalize(b), p39)
		end
		return
	else
		self._sessions = {}
		
		for i, v in sessions do
			self._callbacks.onUnload(v.metadata, v.state:finalize(b), p39)
		end
	end
end

function t_1:onFeedRefresh(p40) --[[ line: 540 ]]
	-- upvalues: t (ref)
	self:_terminateAllSessions(p40 or DateTime.now().UnixTimestampMillis, t.FeedRefresh)
end

function t_1:reset(p41) --[[ line: 545 ]]
	-- upvalues: t (ref)
	self._running = false
	self:_cancelScheduledScan()
	self:_terminateAllSessions(p41 or DateTime.now().UnixTimestampMillis, t.SurfaceTeardown)
end

t_1.TerminalReason = t

return t_1