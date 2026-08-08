local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local parent = momentsCommon.Parent
local signalsModule = require(parent.Signals)
local fFlagMomentsAutoplayAmpPolicy = require(parent.SharedFlags).FFlagMomentsAutoplayAmpPolicy
local fFlagMomentsCarouselVideoHandoff = require(parent.SharedFlags).FFlagMomentsCarouselVideoHandoff
local _ = require(momentsCommon.Media.MediaTypes)
local _ = require(momentsCommon.Media.Preload.selectPreloadPolicy)
local _ = require(momentsCommon.Media.Telemetry.mediaTelemetry)
local createMomentMediaControllerModule = require(momentsCommon.Media.createMomentMediaController)
local defaultMediaNodeRegistryModule = require(momentsCommon.Media.defaultMediaNodeRegistry)
local _ = require(momentsCommon.Media.mediaNodeRegistry)
local createSignal = signalsModule.createSignal
local createEffect = signalsModule.createEffect

local function _(p0, p1, p2) --[[ line: 97 | named "indexInWindow" ]]
	return p1 - p2.back <= p0 and p0 <= p1 + p2.forward
end

return function(p3, p4, p5, p6, p7, p8) --[[ line: 101 | named "createMediaPreloadCoordinator" ]]
	-- upvalues: defaultMediaNodeRegistryModule (ref), createMomentMediaControllerModule (ref), createSignal (ref), fFlagMomentsAutoplayAmpPolicy (ref), fFlagMomentsCarouselVideoHandoff (ref), createEffect (ref)
	p8 = p8 or {}
	local now = p7.now or os.clock
	local registry = p8.registry or defaultMediaNodeRegistryModule()
	local createController = p8.createController or function(p9) --[[ line: 116 ]]
		-- upvalues: createMomentMediaControllerModule (copy), p7 (ref), p6 (ref), registry (ref), p8 (ref)
		return createMomentMediaControllerModule(p9, {
			services = p7,
			audioDeviceOutput = p6,
			registry = registry,
			parent = p8.parent,
			masterVolume = p8.masterVolume
		})
	end
	local t = {}
	local var9 = nil
	local var10 = nil
	local var11 = false
	local var12, var13 = createSignal({})
	
	local function _() --[[ line: 136 | named "publishControllerMap" ]]
		-- upvalues: t (ref), var13 (ref)
		local t_1 = {}
		
		for i, v in t do
			t_1[i] = v.controller
		end
		var13(t_1)
	end
	
	local function scheduleDecodeRetry(p10, p11) --[[ line: 147 ]]
		-- upvalues: p4 (ref), var11 (write), t (ref), var10 (write), p3 (ref), scheduleDecodeRetry (ref)
		if p11.retryScheduled or p4.maxDecodeRetries <= p11.decodeRetries then
			return
		end
		p11.retryScheduled = true
		task.delay(p4.decodeRetryDelayMs / 1000, function() --[[ line: 152 ]]
			-- upvalues: p11 (ref), var11 (copy), t (copy), p10 (ref), var10 (copy), p3 (copy), scheduleDecodeRetry (copy)
			p11.retryScheduled = false
			
			if var11 or t[p10] ~= p11 or (var10 ~= p10 or not p11.decoded) then return end
			if not p3.getPlaybackActive(false) then return end
			local readiness = p11.controller.getState(false).readiness
			
			if readiness == "Ready" or readiness == "Failed" then
				return
			end
			p11.decodeRetries += 1
			p11.controller.releaseDecoder()
			p11.controller.decode()
			scheduleDecodeRetry(p10, p11)
		end)
	end
	
	local function reconcile(p12) --[[ line: 173 ]]
		-- upvalues: p3 (ref), fFlagMomentsAutoplayAmpPolicy (copy), fFlagMomentsCarouselVideoHandoff (copy), var10 (write), p4 (ref), t (ref), var9 (write), createController (ref), var11 (write), scheduleDecodeRetry (ref), var13 (ref), now (ref), p5 (ref)
		local items = p3.getItems(p12)
		local activeIndex = p3.getActiveIndex(p12)
		local playbackActive = p3.getPlaybackActive(p12)
		local var21 = if fFlagMomentsAutoplayAmpPolicy then p3.getCanAutoPlay(p12) else nil
		local var22 = items[activeIndex]
		local var23 = if var22 ~= nil then nil else var22.momentId
		
		if fFlagMomentsCarouselVideoHandoff then
			var10 = var23
		end
		local t_1 = {}
		local t_2 = {}
		local t_3 = {}
		
		for i, v in items do
			local downloadWindow = p4.downloadWindow
			
			if activeIndex - downloadWindow.back <= i and i <= activeIndex + downloadWindow.forward then
				t_1[v.momentId] = true
				t_3[v.momentId] = v
				downloadWindow = p4.decodeWindow
				
				if activeIndex - downloadWindow.back <= i and i <= activeIndex + downloadWindow.forward then
					t_2[v.momentId] = true
				end
			end
		end
		local var27 = false
		
		for i_1, v_1 in t do
			if not t_1[i_1] then
				if var9 == i_1 then
					var9 = nil
				end
				v_1.controller.dispose()
				t[i_1] = nil
				var27 = true
			end
		end
		for i_2 in t_1 do
			if t[i_2] == nil then
				local var32 = createController(t_3[i_2])
				local t_4 = {
					active = nil,
					decoded = false,
					recordedTtff = false,
					decodeStartedAt = nil,
					decodeRetries = 0,
					retryScheduled = false,
					controller = var32
				}
				t[i_2] = t_4
				var27 = true
				task.spawn(function() --[[ line: 234 ]]
					-- upvalues: var11 (copy), t (copy), i_2 (ref), t_4 (ref), var32 (ref), fFlagMomentsCarouselVideoHandoff (copy), p4 (copy), var10 (copy), p3 (copy), scheduleDecodeRetry (copy)
					if var11 or t[i_2] ~= t_4 then return end
					var32.download()
					
					if fFlagMomentsCarouselVideoHandoff and not var11 and t[i_2] == t_4 then
						local var34 = i_2
						local var35 = t_4
						
						if not var35.retryScheduled then
							if p4.maxDecodeRetries <= var35.decodeRetries then return end
							var35.retryScheduled = true
							task.delay(p4.decodeRetryDelayMs / 1000, function() --[[ line: 152 ]]
								-- upvalues: var35 (ref), var11 (copy), t (copy), var34 (ref), var10 (copy), p3 (copy), scheduleDecodeRetry (copy)
								var35.retryScheduled = false
								
								if var11 or t[var34] ~= var35 or (var10 ~= var34 or not var35.decoded) then return end
								if not p3.getPlaybackActive(false) then return end
								local readiness = var35.controller.getState(false).readiness
								
								if readiness == "Ready" or readiness == "Failed" then
									return
								end
								var35.decodeRetries += 1
								var35.controller.releaseDecoder()
								var35.controller.decode()
								scheduleDecodeRetry(var34, var35)
							end)
						end
					end
				end)
			end
		end
		if var27 then
			local t_4 = {}
			
			for i_3, v_2 in t do
				t_4[i_3] = v_2.controller
			end
			var13(t_4)
		end
		local var31
		for i_3, v_2 in t do
			var31 = t_2[i_3] == true
			
			if var31 and not v_2.decoded then
				v_2.decodeStartedAt = now()
				v_2.controller.decode()
				v_2.decoded = true
			elseif not var31 and v_2.decoded then
				v_2.controller.releaseDecoder()
				v_2.decoded = false
			end
		end
		for i_4, v_3 in t do
			var31 = i_4 == var23
			
			if v_3.active ~= var31 then
				v_3.controller.setActive(var31)
				v_3.active = var31
			end
		end
		local var29 = if var23 ~= nil then nil else t[var23]
		local var30 = var29 ~= nil and var29.controller.getState(p12).readiness == "Ready"
		
		if fFlagMomentsAutoplayAmpPolicy then
			if var9 ~= nil and var9 ~= var23 then
				if t[var9] ~= nil then
					t[var9].controller.pause()
				end
				var9 = nil
			end
			if var29 ~= nil and var29.controller.getState(p12).isPlaying then
				var9 = var23
			end
		end
		if playbackActive and var29 ~= nil and var30 then
			if (not fFlagMomentsAutoplayAmpPolicy or var21) and var9 ~= var23 then
				if var9 ~= nil and t[var9] ~= nil then
					t[var9].controller.pause()
				end
				var9 = var23
				var29.controller.play()
				
				if not var29.recordedTtff then
					var29.recordedTtff = true
					local decodeStartedAt = var29.decodeStartedAt
					
					if decodeStartedAt == nil or var23 == nil then
						return
					else
						p5.recordTimeToFirstFrame({
							momentId = var23,
							durationSeconds = now() - decodeStartedAt
						})
						
						return
					end
				end
			end
		elseif var9 ~= nil then
			if t[var9] ~= nil then
				t[var9].controller.pause()
			end
			var9 = nil
		end
	end
	
	local var16 = createEffect(function(p13) --[[ line: 330 ]]
		-- upvalues: var11 (write), reconcile (ref)
		if var11 then
			return
		end
		reconcile(p13)
	end)
	
	return {
		getControllerFor = function(p14) --[[ line: 337 ]]
			-- upvalues: t (ref)
			local var36 = t[p14]
			
			return if var36 == nil then nil else var36.controller
		end,
		getControllerMap = var12,
		dispose = function() --[[ line: 342 ]]
			-- upvalues: var11 (write), var16 (ref), t (ref), var9 (write), var13 (ref)
			if var11 then return end
			var11 = true
			var16()
			
			for i, v in t do
				v.controller.dispose()
			end
			table.clear(t)
			var9 = nil
			var13({})
		end
	}
end