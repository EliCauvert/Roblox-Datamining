local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local signalsModule = require(parent.Signals)
local fFlagMomentsAutoplayAmpPolicy = require(parent.SharedFlags).FFlagMomentsAutoplayAmpPolicy
local _ = require(momentsCommon.Media.MediaTypes)
local _ = require(momentsCommon.Media.Preload.selectPreloadPolicy)
local _ = require(momentsCommon.Media.Telemetry.mediaTelemetry)
local createMomentMediaControllerModule = require(momentsCommon.Media.createMomentMediaController)
local defaultMediaNodeRegistryModule = require(momentsCommon.Media.defaultMediaNodeRegistry)
local _ = require(momentsCommon.Media.mediaNodeRegistry)
local createSignal = signalsModule.createSignal
local createEffect = signalsModule.createEffect

local function _(p1, p2, p3)
	return p2 - p3.back <= p1 and p1 <= p2 + p3.forward
end

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: defaultMediaNodeRegistryModule (ref), createMomentMediaControllerModule (ref), createSignal (ref), fFlagMomentsAutoplayAmpPolicy (ref), createEffect (ref)
	p6 = p6 or {}
	local now = p5.now or os.clock
	local registry = p6.registry or defaultMediaNodeRegistryModule()
	local createController = p6.createController or function(p7)
		-- upvalues: createMomentMediaControllerModule (copy), p5 (ref), p4 (ref), registry (ref), p6 (ref)
		return createMomentMediaControllerModule(p7, {
			services = p5,
			audioDeviceOutput = p4,
			registry = registry,
			parent = p6.parent,
			masterVolume = p6.masterVolume
		})
	end
	local t = {}
	local var1 = nil
	local var2 = nil
	local var3 = false
	local var4, var5 = createSignal({})
	
	local function _()
		-- upvalues: t (ref), var5 (ref)
		local t_1 = {}
		
		for i, v in t do
			t_1[i] = v.controller
		end
		var5(t_1)
	end
	
	local function scheduleDecodeRetry(p7, p8)
		-- upvalues: p2 (ref), var3 (write), t (ref), var2 (write), p1 (ref), scheduleDecodeRetry (ref)
		if p8.retryScheduled or p2.maxDecodeRetries <= p8.decodeRetries then
			return
		end
		p8.retryScheduled = true
		task.delay(p2.decodeRetryDelayMs / 1000, function()
			-- upvalues: p8 (ref), var3 (copy), t (copy), p7 (ref), var2 (copy), p1 (copy), scheduleDecodeRetry (copy)
			p8.retryScheduled = false
			
			if var3 or t[p7] ~= p8 or (var2 ~= p7 or not p8.decoded) then return end
			if not p1.getPlaybackActive(false) then return end
			local readiness = p8.controller.getState(false).readiness
			
			if readiness == "Ready" or readiness == "Failed" then
				return
			end
			p8.decodeRetries += 1
			p8.controller.releaseDecoder()
			p8.controller.decode()
			scheduleDecodeRetry(p7, p8)
		end)
	end
	
	local function reconcile(p7)
		-- upvalues: p1 (ref), fFlagMomentsAutoplayAmpPolicy (copy), var2 (write), p2 (ref), t (ref), var1 (write), createController (ref), var3 (write), scheduleDecodeRetry (ref), var5 (ref), now (ref), p3 (ref)
		local items = p1.getItems(p7)
		local activeIndex = p1.getActiveIndex(p7)
		local playbackActive = p1.getPlaybackActive(p7)
		local var6 = if fFlagMomentsAutoplayAmpPolicy then p1.getCanAutoPlay(p7) else nil
		local var7 = items[activeIndex]
		local var8 = if var7 ~= nil then nil else var7.momentId
		var2 = var8
		local t_1 = {}
		local t_2 = {}
		local t_3 = {}
		
		for i, v in items do
			local downloadWindow = p2.downloadWindow
			
			if activeIndex - downloadWindow.back <= i and i <= activeIndex + downloadWindow.forward then
				t_1[v.momentId] = true
				t_3[v.momentId] = v
				downloadWindow = p2.decodeWindow
				
				if activeIndex - downloadWindow.back <= i and i <= activeIndex + downloadWindow.forward then
					t_2[v.momentId] = true
				end
			end
		end
		local var9 = false
		
		for i_1, v_1 in t do
			if not t_1[i_1] then
				if var1 == i_1 then
					var1 = nil
				end
				v_1.controller.dispose()
				t[i_1] = nil
				var9 = true
			end
		end
		for i_2 in t_1 do
			if t[i_2] == nil then
				local var10 = createController(t_3[i_2])
				local t_4 = {
					active = nil,
					decoded = false,
					recordedTtff = false,
					decodeStartedAt = nil,
					decodeRetries = 0,
					retryScheduled = false,
					controller = var10
				}
				t[i_2] = t_4
				var9 = true
				task.spawn(function()
					-- upvalues: var3 (copy), t (copy), i_2 (ref), t_4 (ref), var10 (ref), p2 (copy), var2 (copy), p1 (copy), scheduleDecodeRetry (copy)
					if var3 or t[i_2] ~= t_4 then return end
					var10.download()
					
					if not var3 and t[i_2] == t_4 then
						local var11 = i_2
						local var12 = t_4
						
						if not var12.retryScheduled then
							if p2.maxDecodeRetries <= var12.decodeRetries then return end
							var12.retryScheduled = true
							task.delay(p2.decodeRetryDelayMs / 1000, function()
								-- upvalues: var12 (ref), var3 (copy), t (copy), var11 (ref), var2 (copy), p1 (copy), scheduleDecodeRetry (copy)
								var12.retryScheduled = false
								
								if var3 or t[var11] ~= var12 or (var2 ~= var11 or not var12.decoded) then return end
								if not p1.getPlaybackActive(false) then return end
								local readiness = var12.controller.getState(false).readiness
								
								if readiness == "Ready" or readiness == "Failed" then
									return
								end
								var12.decodeRetries += 1
								var12.controller.releaseDecoder()
								var12.controller.decode()
								scheduleDecodeRetry(var11, var12)
							end)
						end
					end
				end)
			end
		end
		if var9 then
			local t_4 = {}
			
			for i_3, v_2 in t do
				t_4[i_3] = v_2.controller
			end
			var5(t_4)
		end
		local var11
		for i_3, v_2 in t do
			var11 = t_2[i_3] == true
			
			if var11 and not v_2.decoded then
				v_2.decodeStartedAt = now()
				v_2.controller.decode()
				v_2.decoded = true
			elseif not var11 and v_2.decoded then
				v_2.controller.releaseDecoder()
				v_2.decoded = false
			end
		end
		for i_4, v_3 in t do
			var11 = i_4 == var8
			
			if v_3.active ~= var11 then
				v_3.controller.setActive(var11)
				v_3.active = var11
			end
		end
		local var12 = if var8 ~= nil then nil else t[var8]
		local var13 = var12 ~= nil and var12.controller.getState(p7).readiness == "Ready"
		
		if fFlagMomentsAutoplayAmpPolicy then
			if var1 ~= nil and var1 ~= var8 then
				if t[var1] ~= nil then
					t[var1].controller.pause()
				end
				var1 = nil
			end
			if var12 ~= nil and var12.controller.getState(p7).isPlaying then
				var1 = var8
			end
		end
		if playbackActive and var12 ~= nil and var13 then
			if (not fFlagMomentsAutoplayAmpPolicy or var6) and var1 ~= var8 then
				if var1 ~= nil and t[var1] ~= nil then
					t[var1].controller.pause()
				end
				var1 = var8
				var12.controller.play()
				
				if not var12.recordedTtff then
					var12.recordedTtff = true
					local decodeStartedAt = var12.decodeStartedAt
					
					if decodeStartedAt == nil or var8 == nil then
						return
					else
						p3.recordTimeToFirstFrame({
							momentId = var8,
							durationSeconds = now() - decodeStartedAt
						})
						
						return
					end
				end
			end
		elseif var1 ~= nil then
			if t[var1] ~= nil then
				t[var1].controller.pause()
			end
			var1 = nil
		end
	end
	
	local var14 = createEffect(function(p8)
		-- upvalues: var3 (write), reconcile (ref)
		if var3 then
			return
		end
		reconcile(p8)
	end)
	
	return {
		getControllerFor = function(p8)
			-- upvalues: t (ref)
			local var15 = t[p8]
			
			return if var15 == nil then nil else var15.controller
		end,
		getControllerMap = var4,
		dispose = function()
			-- upvalues: var3 (write), var14 (ref), t (ref), var1 (write), var5 (ref)
			if var3 then return end
			var3 = true
			var14()
			
			for i, v in t do
				v.controller.dispose()
			end
			table.clear(t)
			var1 = nil
			var5({})
		end
	}
end