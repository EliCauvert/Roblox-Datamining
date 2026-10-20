local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local Parent = MomentsCommon.Parent
local SignalsModule = require(Parent.Signals)
local FFlagMomentsAutoplayAmpPolicy = require(Parent.SharedFlags).FFlagMomentsAutoplayAmpPolicy
local _ = require(MomentsCommon.Media.MediaTypes)
local _ = require(MomentsCommon.Media.Preload.selectPreloadPolicy)
local _ = require(MomentsCommon.Media.Telemetry.mediaTelemetry)
local CreateMomentMediaControllerModule = require(MomentsCommon.Media.createMomentMediaController)
local DefaultMediaNodeRegistryModule = require(MomentsCommon.Media.defaultMediaNodeRegistry)
local _ = require(MomentsCommon.Media.mediaNodeRegistry)
local GetFFlagMomentsRenderPostAssetsModule = require(MomentsCommon.Flags.GetFFlagMomentsRenderPostAssets)
local CreateSignalFunction = SignalsModule.createSignal
local CreateEffectFunction = SignalsModule.createEffect

local function _(p1, p2, p3): boolean
	return p2 - p3.back <= p1 and p1 <= p2 + p3.forward
end

return function(p1, p2, p3, AudioDeviceOutput, Services, p4)
	-- upvalues: GetFFlagMomentsRenderPostAssetsModule (copy), DefaultMediaNodeRegistryModule (copy), CreateMomentMediaControllerModule (copy), CreateSignalFunction (copy), FFlagMomentsAutoplayAmpPolicy (copy), CreateEffectFunction (copy)
	local P8 = p4 or {}
	local FFlagMomentsRenderPostAssetsModule = GetFFlagMomentsRenderPostAssetsModule()
	local Now = Services.now or os.clock
	local Registry = P8.registry or DefaultMediaNodeRegistryModule()
	local CreateController = P8.createController or function(p5)
		-- upvalues: CreateMomentMediaControllerModule (upval), Services (copy), AudioDeviceOutput (copy), Registry (copy), P8 (copy)
		return CreateMomentMediaControllerModule(p5, {
			services = Services,
			audioDeviceOutput = AudioDeviceOutput,
			registry = Registry,
			parent = P8.parent,
			masterVolume = P8.masterVolume
		})
	end
	local Tbl = {}
	local MomentId = nil
	local v1 = nil
	local Flag = false
	local Signal, Signal2 = CreateSignalFunction({})
	
	local function _()
		-- upvalues: Tbl (copy), Signal2 (copy)
		local Controllers = {}
		
		for i, value in Tbl do
			Controllers[i] = value.controller
		end
		Signal2(Controllers)
	end
	
	local function scheduleDecodeRetry(p5, p6)
		-- upvalues: p2 (copy), Flag (ref), Tbl (copy), v1 (ref), p1 (copy), scheduleDecodeRetry (copy)
		if not p6.retryScheduled and p2.maxDecodeRetries > p6.decodeRetries then
			p6.retryScheduled = true
			task.delay(p2.decodeRetryDelayMs / 1000, function()
				-- upvalues: p6 (copy), Flag (upval), Tbl (upval), p5 (copy), v1 (upval), p1 (upval), scheduleDecodeRetry (upval)
				p6.retryScheduled = false
				
				if Flag or Tbl[p5] ~= p6 or v1 ~= p5 or not p6.decoded then return end
				if not p1.getPlaybackActive(false) then return end
				local Readiness = p6.controller.getState(false).readiness
				
				if Readiness ~= "Ready" and Readiness ~= "Failed" then
					p6.decodeRetries += 1
					p6.controller.releaseDecoder()
					p6.controller.decode()
					scheduleDecodeRetry(p5, p6)
					
					return
				end
			end)
			
			return
		end
	end
	
	local function reconcile(p5)
		-- upvalues: p1 (copy), FFlagMomentsAutoplayAmpPolicy (upval), v1 (ref), p2 (copy), FFlagMomentsRenderPostAssetsModule (copy), Tbl (copy), MomentId (ref), CreateController (copy), Flag (ref), scheduleDecodeRetry (copy), Signal2 (copy), Now (copy), p3 (copy)
		local Items = p1.getItems(p5)
		local ActiveIndex = p1.getActiveIndex(p5)
		local PlaybackActive = p1.getPlaybackActive(p5)
		local CanAutoPlay = if FFlagMomentsAutoplayAmpPolicy then p1.getCanAutoPlay(p5) else nil
		local Item = Items[ActiveIndex]
		local MomentId1 = if Item == nil then nil else Item.momentId
		v1 = MomentId1
		local t = {}
		local t1 = {}
		local ResolveResults = {}
		
		for i, item in Items do
			local DownloadWindow = p2.downloadWindow
			
			if ActiveIndex - DownloadWindow.back <= i and i <= ActiveIndex + DownloadWindow.forward then
				local ResolveResult = FFlagMomentsRenderPostAssetsModule and item.resolve ~= nil and item.resolve(p5) or item
				t[ResolveResult.momentId] = true
				ResolveResults[ResolveResult.momentId] = ResolveResult
				local DecodeWindow = p2.decodeWindow
				
				if ActiveIndex - DecodeWindow.back <= i and i <= ActiveIndex + DecodeWindow.forward then
					t1[ResolveResult.momentId] = true
				end
			end
		end
		local Flag1 = false
		
		for i1, value in Tbl do
			local ResolveResult = ResolveResults[i1]
			
			if not t[i1] or FFlagMomentsRenderPostAssetsModule and ResolveResult ~= nil and value.sourceKey ~= ResolveResult.sourceKey then
				if MomentId == i1 then
					MomentId = nil
				end
				value.controller.dispose()
				Tbl[i1] = nil
				Flag1 = true
			end
		end
		for i2 in t do
			if Tbl[i2] == nil then
				local Controller = CreateController(ResolveResults[i2])
				local config = {
					active = nil,
					decoded = false,
					recordedTtff = false,
					decodeStartedAt = nil,
					decodeRetries = 0,
					retryScheduled = false,
					controller = Controller,
					sourceKey = if FFlagMomentsRenderPostAssetsModule then ResolveResults[i2].sourceKey else nil
				}
				Tbl[i2] = config
				Flag1 = true
				task.spawn(function()
					-- upvalues: Flag (upval), Tbl (upval), i2 (copy), config (copy), Controller (copy), p2 (upval), v1 (upval), p1 (upval), scheduleDecodeRetry (upval)
					if Flag or Tbl[i2] ~= config then return end
					Controller.download()
					
					if not Flag and Tbl[i2] == config and not config.retryScheduled then
						if p2.maxDecodeRetries <= config.decodeRetries then return end
						config.retryScheduled = true
						task.delay(p2.decodeRetryDelayMs / 1000, function()
							-- upvalues: config (copy), Flag (upval), Tbl (upval), i2 (copy), v1 (upval), p1 (upval), scheduleDecodeRetry (upval)
							config.retryScheduled = false
							
							if Flag or Tbl[i2] ~= config or v1 ~= i2 or not config.decoded then return end
							if not p1.getPlaybackActive(false) then return end
							local Readiness = config.controller.getState(false).readiness
							
							if Readiness ~= "Ready" and Readiness ~= "Failed" then
								config.decodeRetries += 1
								config.controller.releaseDecoder()
								config.controller.decode()
								scheduleDecodeRetry(i2, config)
								
								return
							end
						end)
					end
				end)
			end
		end
		if Flag1 then
			local Controllers = {}
			
			for i3, value1 in Tbl do
				Controllers[i3] = value1.controller
			end
			Signal2(Controllers)
		end
		for i4, value2 in Tbl do
			local IsEntry = t1[i4] == true
			
			if IsEntry and not value2.decoded then
				value2.decodeStartedAt = Now()
				value2.controller.decode()
				value2.decoded = true
			elseif not IsEntry and value2.decoded then
				value2.controller.releaseDecoder()
				value2.decoded = false
			end
		end
		for i5, value3 in Tbl do
			local IsMomentIdMatch = i5 == MomentId1
			
			if value3.active ~= IsMomentIdMatch then
				value3.controller.setActive(IsMomentIdMatch)
				value3.active = IsMomentIdMatch
			end
		end
		local Entry = if MomentId1 == nil then nil else Tbl[MomentId1]
		local IsReady: boolean = Entry ~= nil and Entry.controller.getState(p5).readiness == "Ready"
		
		if FFlagMomentsAutoplayAmpPolicy then
			if MomentId ~= nil and MomentId ~= MomentId1 then
				if Tbl[MomentId] ~= nil then
					Tbl[MomentId].controller.pause()
				end
				MomentId = nil
			end
			if Entry ~= nil and Entry.controller.getState(p5).isPlaying then
				MomentId = MomentId1
			end
		end
		if PlaybackActive and Entry ~= nil and IsReady then
			if (not FFlagMomentsAutoplayAmpPolicy or CanAutoPlay) and MomentId ~= MomentId1 then
				if MomentId ~= nil and Tbl[MomentId] ~= nil then
					Tbl[MomentId].controller.pause()
				end
				MomentId = MomentId1
				Entry.controller.play()
				
				if not Entry.recordedTtff then
					Entry.recordedTtff = true
					local DecodeStartedAt = Entry.decodeStartedAt
					
					if DecodeStartedAt ~= nil and MomentId1 ~= nil then
						p3.recordTimeToFirstFrame({
							momentId = MomentId1,
							durationSeconds = Now() - DecodeStartedAt
						})
						
						return
					end
				end
			end
		elseif MomentId ~= nil then
			if Tbl[MomentId] ~= nil then
				Tbl[MomentId].controller.pause()
			end
			MomentId = nil
		end
	end
	
	local Effect = CreateEffectFunction(function(p6)
		-- upvalues: Flag (ref), reconcile (copy)
		if not Flag then
			reconcile(p6)
			
			return
		end
	end)
	
	return {
		getControllerFor = function(p6)
			-- upvalues: Tbl (copy)
			local Entry = Tbl[p6]
			
			return if Entry == nil then nil else Entry.controller
		end,
		getControllerMap = Signal,
		dispose = function()
			-- upvalues: Flag (ref), Effect (copy), Tbl (copy), MomentId (ref), Signal2 (copy)
			if Flag then return end
			Flag = true
			Effect()
			
			for _, value in Tbl do
				value.controller.dispose()
			end
			table.clear(Tbl)
			MomentId = nil
			Signal2({})
		end
	}
end