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

local function _(p0, p1, p2) --[[ line: 88 | named "indexInWindow" ]]
	return p1 - p2.back <= p0 and p0 <= p1 + p2.forward
end

return function(p3, p4, p5, p6, p7, p8) --[[ line: 92 | named "createMediaPreloadCoordinator" ]]
	-- upvalues: defaultMediaNodeRegistryModule (ref), createMomentMediaControllerModule (ref), createSignal (ref), fFlagMomentsAutoplayAmpPolicy (ref), createEffect (ref)
	p8 = p8 or {}
	local now = p7.now or os.clock
	local registry = p8.registry or defaultMediaNodeRegistryModule()
	local createController = p8.createController or function(p9) --[[ line: 107 ]]
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
	local var10 = false
	local var11, var12 = createSignal({})
	
	local function _() --[[ line: 125 | named "publishControllerMap" ]]
		-- upvalues: t (ref), var12 (ref)
		local t_1 = {}
		
		for i, v in t do
			t_1[i] = v.controller
		end
		var12(t_1)
	end
	
	local function reconcile(p10) --[[ line: 133 ]]
		-- upvalues: p3 (ref), fFlagMomentsAutoplayAmpPolicy (copy), p4 (ref), t (ref), var9 (write), createController (ref), var10 (write), var12 (ref), now (ref), p5 (ref)
		local items = p3.getItems(p10)
		local activeIndex = p3.getActiveIndex(p10)
		local playbackActive = p3.getPlaybackActive(p10)
		local var19 = if fFlagMomentsAutoplayAmpPolicy then p3.getCanAutoPlay(p10) else nil
		local var20 = items[activeIndex]
		local var21 = if var20 ~= nil then nil else var20.momentId
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
		local var25 = false
		
		for i_1, v_1 in t do
			if not t_1[i_1] then
				if var9 == i_1 then
					var9 = nil
				end
				v_1.controller.dispose()
				t[i_1] = nil
				var25 = true
			end
		end
		for i_2 in t_1 do
			if t[i_2] == nil then
				local var30 = createController(t_3[i_2])
				local t_4 = {
					active = nil,
					decoded = false,
					recordedTtff = false,
					decodeStartedAt = nil,
					controller = var30
				}
				t[i_2] = t_4
				var25 = true
				task.spawn(function() --[[ line: 189 ]]
					-- upvalues: var10 (copy), t (copy), i_2 (ref), t_4 (ref), var30 (ref)
					if var10 or t[i_2] ~= t_4 then
						return
					end
					var30.download()
				end)
			end
		end
		if var25 then
			local t_4 = {}
			
			for i_3, v_2 in t do
				t_4[i_3] = v_2.controller
			end
			var12(t_4)
		end
		local var29
		for i_3, v_2 in t do
			var29 = t_2[i_3] == true
			
			if var29 and not v_2.decoded then
				v_2.decodeStartedAt = now()
				v_2.controller.decode()
				v_2.decoded = true
			elseif not var29 and v_2.decoded then
				v_2.controller.releaseDecoder()
				v_2.decoded = false
			end
		end
		for i_4, v_3 in t do
			var29 = i_4 == var21
			
			if v_3.active ~= var29 then
				v_3.controller.setActive(var29)
				v_3.active = var29
			end
		end
		local var27 = if var21 ~= nil then nil else t[var21]
		local var28 = var27 ~= nil and var27.controller.getState(p10).readiness == "Ready"
		
		if fFlagMomentsAutoplayAmpPolicy then
			if var9 ~= nil and var9 ~= var21 then
				if t[var9] ~= nil then
					t[var9].controller.pause()
				end
				var9 = nil
			end
			if var27 ~= nil and var27.controller.getState(p10).isPlaying then
				var9 = var21
			end
		end
		if playbackActive and var27 ~= nil and var28 then
			if (not fFlagMomentsAutoplayAmpPolicy or var19) and var9 ~= var21 then
				if var9 ~= nil and t[var9] ~= nil then
					t[var9].controller.pause()
				end
				var9 = var21
				var27.controller.play()
				
				if not var27.recordedTtff then
					var27.recordedTtff = true
					local decodeStartedAt = var27.decodeStartedAt
					
					if decodeStartedAt == nil or var21 == nil then
						return
					else
						p5.recordTimeToFirstFrame({
							momentId = var21,
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
	
	local var14 = createEffect(function(p11) --[[ line: 280 ]]
		-- upvalues: var10 (write), reconcile (ref)
		if var10 then
			return
		end
		reconcile(p11)
	end)
	
	return {
		getControllerFor = function(p12) --[[ line: 287 ]]
			-- upvalues: t (ref)
			local var32 = t[p12]
			
			return if var32 == nil then nil else var32.controller
		end,
		getControllerMap = var11,
		dispose = function() --[[ line: 292 ]]
			-- upvalues: var10 (write), var14 (ref), t (ref), var9 (write), var12 (ref)
			if var10 then return end
			var10 = true
			var14()
			
			for i, v in t do
				v.controller.dispose()
			end
			table.clear(t)
			var9 = nil
			var12({})
		end
	}
end