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
local getFFlagMomentsRenderPostAssetsModule = require(momentsCommon.Flags.GetFFlagMomentsRenderPostAssets)
local createSignal = signalsModule.createSignal
local createEffect = signalsModule.createEffect

local function _(p1, p2, p3)
	return p2 - p3.back <= p1 and p1 <= p2 + p3.forward
end

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: getFFlagMomentsRenderPostAssetsModule (ref), defaultMediaNodeRegistryModule (ref), createMomentMediaControllerModule (ref), createSignal (ref), fFlagMomentsAutoplayAmpPolicy (ref), createEffect (ref)
	p6 = p6 or {}
	local var1 = getFFlagMomentsRenderPostAssetsModule()
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
	local var2 = nil
	local var3 = nil
	local var4 = false
	local var5, var6 = createSignal({})
	
	local function _()
		-- upvalues: t (ref), var6 (ref)
		local t_1 = {}
		
		for i, v in t do
			t_1[i] = v.controller
		end
		var6(t_1)
	end
	
	local function scheduleDecodeRetry(p7, p8)
		-- upvalues: p2 (ref), var4 (write), t (ref), var3 (write), p1 (ref), scheduleDecodeRetry (ref)
		if p8.retryScheduled or p2.maxDecodeRetries <= p8.decodeRetries then
			return
		end
		p8.retryScheduled = true
		task.delay(p2.decodeRetryDelayMs / 1000, function()
			-- upvalues: p8 (ref), var4 (copy), t (copy), p7 (ref), var3 (copy), p1 (copy), scheduleDecodeRetry (copy)
			p8.retryScheduled = false
			
			if var4 or t[p7] ~= p8 or (var3 ~= p7 or not p8.decoded) then return end
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
		-- upvalues: p1 (ref), fFlagMomentsAutoplayAmpPolicy (copy), var3 (write), p2 (ref), var1 (ref), t (ref), var2 (write), createController (ref), var4 (write), scheduleDecodeRetry (ref), var6 (ref), now (ref), p3 (ref)
		local v_2, i
		local items = p1.getItems(p7)
		local activeIndex = p1.getActiveIndex(p7)
		local playbackActive = p1.getPlaybackActive(p7)
		local var7 = if fFlagMomentsAutoplayAmpPolicy then p1.getCanAutoPlay(p7) else nil
		local var8 = items[activeIndex]
		local var9 = if var8 ~= nil then nil else var8.momentId
		var3 = var9
		local t_1 = {}
		local t_2 = {}
		local t_3 = {}
		
		for i, v in items do
			v_2 = p2.downloadWindow
			
			if activeIndex - v_2.back <= i and i <= activeIndex + v_2.forward then
				local var10 = if var1 and v.resolve ~= nil then v.resolve(p7) or v else v
				t_1[var10.momentId] = true
				t_3[var10.momentId] = var10
				local decodeWindow = p2.decodeWindow
				
				if activeIndex - decodeWindow.back <= i and i <= activeIndex + decodeWindow.forward then
					t_2[var10.momentId] = true
				end
			end
		end
		local var11 = false
		
		for i_1, v_1 in t do
			v_2 = t_3[i_1]
			
			if not t_1[i_1] or var1 and v_2 ~= nil and v_1.sourceKey ~= v_2.sourceKey then
				if var2 == i_1 then
					var2 = nil
				end
				v_1.controller.dispose()
				t[i_1] = nil
				var11 = true
			end
		end
		for i_2 in t_1 do
			if t[i_2] == nil then
				v_2 = createController(t_3[i_2])
				local t_4 = {
					active = nil,
					decoded = false,
					recordedTtff = false,
					decodeStartedAt = nil,
					decodeRetries = 0,
					retryScheduled = false,
					controller = v_2,
					sourceKey = if var1 then t_3[i_2].sourceKey else nil
				}
				t[i_2] = t_4
				var11 = true
				task.spawn(function()
					-- upvalues: var4 (copy), t (copy), i_2 (ref), t_4 (ref), v_2 (ref), p2 (copy), var3 (copy), p1 (copy), scheduleDecodeRetry (copy)
					if var4 or t[i_2] ~= t_4 then return end
					v_2.download()
					
					if not var4 and t[i_2] == t_4 then
						local var12 = i_2
						local var13 = t_4
						
						if not var13.retryScheduled then
							if p2.maxDecodeRetries <= var13.decodeRetries then return end
							var13.retryScheduled = true
							task.delay(p2.decodeRetryDelayMs / 1000, function()
								-- upvalues: var13 (ref), var4 (copy), t (copy), var12 (ref), var3 (copy), p1 (copy), scheduleDecodeRetry (copy)
								var13.retryScheduled = false
								
								if var4 or t[var12] ~= var13 or (var3 ~= var12 or not var13.decoded) then return end
								if not p1.getPlaybackActive(false) then return end
								local readiness = var13.controller.getState(false).readiness
								
								if readiness == "Ready" or readiness == "Failed" then
									return
								end
								var13.decodeRetries += 1
								var13.controller.releaseDecoder()
								var13.controller.decode()
								scheduleDecodeRetry(var12, var13)
							end)
						end
					end
				end)
			end
		end
		if var11 then
			local t_4 = {}
			
			for i_3, v_2 in t do
				t_4[i_3] = v_2.controller
			end
			var6(t_4)
		end
		for i_3, v_3 in t do
			v_2 = t_2[i_3] == true
			
			if v_2 and not v_3.decoded then
				v_3.decodeStartedAt = now()
				v_3.controller.decode()
				v_3.decoded = true
			elseif not v_2 and v_3.decoded then
				v_3.controller.releaseDecoder()
				v_3.decoded = false
			end
		end
		for i_4, v_4 in t do
			v_2 = i_4 == var9
			
			if v_4.active ~= v_2 then
				v_4.controller.setActive(v_2)
				v_4.active = v_2
			end
		end
		local var12 = if var9 ~= nil then nil else t[var9]
		local var13 = var12 ~= nil and var12.controller.getState(p7).readiness == "Ready"
		
		if fFlagMomentsAutoplayAmpPolicy then
			if var2 ~= nil and var2 ~= var9 then
				if t[var2] ~= nil then
					t[var2].controller.pause()
				end
				var2 = nil
			end
			i = var12 ~= nil and var12.controller.getState(p7).isPlaying
			
			if i then
				var2 = var9
			end
		end
		if playbackActive and var12 ~= nil and var13 then
			if (not fFlagMomentsAutoplayAmpPolicy or var7) and var2 ~= var9 then
				if var2 ~= nil and t[var2] ~= nil then
					t[var2].controller.pause()
				end
				var2 = var9
				var12.controller.play()
				
				if not var12.recordedTtff then
					var12.recordedTtff = true
					i = var12.decodeStartedAt
					
					if i == nil or var9 == nil then
						return
					else
						p3.recordTimeToFirstFrame({ momentId = var9, durationSeconds = now() - i })
						
						return
					end
				end
			end
		elseif var2 ~= nil then
			if t[var2] ~= nil then
				t[var2].controller.pause()
			end
			var2 = nil
		end
	end
	
	local var14 = createEffect(function(p8)
		-- upvalues: var4 (write), reconcile (ref)
		if var4 then
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
		getControllerMap = var5,
		dispose = function()
			-- upvalues: var4 (write), var14 (ref), t (ref), var2 (write), var6 (ref)
			if var4 then return end
			var4 = true
			var14()
			
			for i, v in t do
				v.controller.dispose()
			end
			table.clear(t)
			var2 = nil
			var6({})
		end
	}
end