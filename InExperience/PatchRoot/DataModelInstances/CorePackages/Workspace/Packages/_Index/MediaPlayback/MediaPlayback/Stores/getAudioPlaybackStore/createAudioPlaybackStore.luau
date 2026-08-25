local mediaPlayback = script:FindFirstAncestor("MediaPlayback")
local cryoModule = require(mediaPlayback.Parent.Cryo)
local signalsModule = require(mediaPlayback.Parent.Signals)
local signalsExperimentalModule = require(mediaPlayback.Parent.SignalsExperimental)
local createConsumerCounterStoreModule = require(mediaPlayback.Stores.getAudioPlaybackStore.createConsumerCounterStore)
local createAudioStoreModule = require(mediaPlayback.Stores.getAudioPlaybackStore.createAudioStore)
local createPlaylistStoreModule = require(mediaPlayback.Stores.getAudioPlaybackStore.createPlaylistStore)
local createVolumeStoreModule = require(mediaPlayback.Stores.getAudioPlaybackStore.createVolumeStore)
local _ = require(mediaPlayback.Stores.getAudioPlaybackStore.types)
local getFFlagAudioPreviewLuaModule = require(mediaPlayback.Flags.getFFlagAudioPreviewLua)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed

local function _(p0, p1)
	-- upvalues: signalsExperimentalModule (ref), signalsModule (ref)
	signalsExperimentalModule.onDisposed(p0, signalsModule.createEffect(p1))
end

local _ = function(p2, p3)
	-- upvalues: getFFlagAudioPreviewLuaModule (ref)
	return if getFFlagAudioPreviewLuaModule() and p3 then tostring(p2) .. ":preview" else tostring(p2)
end

return function(p4)
	-- upvalues: createSignal (ref), createConsumerCounterStoreModule (ref), createVolumeStoreModule (ref), createPlaylistStoreModule (ref), getFFlagAudioPreviewLuaModule (ref), createAudioStoreModule (ref), cryoModule (ref), createComputed (ref), signalsExperimentalModule (ref), signalsModule (ref)
	local var9, var10 = createSignal({})
	local var11 = createConsumerCounterStoreModule()
	local var12 = createVolumeStoreModule()
	local var13 = createPlaylistStoreModule()
	
	local function getOrCreateAudioStore(p5, p6)
		-- upvalues: getFFlagAudioPreviewLuaModule (copy), var9 (ref), createAudioStoreModule (copy), var10 (ref), cryoModule (copy), var11 (ref)
		local var28 = if getFFlagAudioPreviewLuaModule() and p6 then tostring(p5) .. ":preview" else tostring(p5)
		local var29 = var9(false)[var28]
		
		if not var29 then
			var29 = createAudioStoreModule(p5, p6)
			var10(function(p7)
				-- upvalues: cryoModule (copy), var28 (ref), var29 (write)
				return cryoModule.Dictionary.join(p7, { [var28] = var29 })
			end)
		end
		var11.subscribe(var28)
		
		return var29
	end
	
	local var15, var16 = createSignal({})
	local var17 = nil
	local var18 = createComputed(function(p8)
		-- upvalues: var15 (ref), var17 (write)
		local var30 = var15(p8)
		local var31 = var30[#var30]
		
		if var31 then
			var17 = var31
		end
		return var17
	end)
	
	local function _()
		-- upvalues: var18 (ref), var13 (ref), getOrCreateAudioStore (ref)
		local var32 = var18(false)
		
		if var32 then
			local next = var13.getNext(var32.assetId)
			
			return if next then getOrCreateAudioStore(next) else nil
		end
	end
	
	local var19 = createComputed(function(p9)
		-- upvalues: var18 (ref), var13 (ref)
		local var34 = var18(p9)
		
		return if var34 then var13.getNext(var34.assetId) ~= nil else false
	end)
	local var20 = createComputed(function(p10)
		-- upvalues: var18 (ref), var13 (ref)
		local var35 = var18(p10)
		
		return if var35 then var13.getPrev(var35.assetId) ~= nil else false
	end)
	
	local function stopAll()
		-- upvalues: var9 (ref)
		for i, v in var9(false) do
			v.stop()
		end
	end
	
	local function pauseAll()
		-- upvalues: var9 (ref)
		for i, v in var9(false) do
			v.pause()
		end
	end
	
	local function playNextSong()
		-- upvalues: var18 (ref), var13 (ref), getOrCreateAudioStore (ref)
		local var36 = var18(false)
		
		if var36 then
			local next = var13.getNext(var36.assetId)
			
			if next then
				local var38 = getOrCreateAudioStore(next)
				var36.stop()
				var38.play()
			end
		end
	end
	
	local function playPrevSong()
		-- upvalues: var18 (ref), var13 (ref), getOrCreateAudioStore (ref)
		local var39 = var18(false)
		
		if var39 then
			local prev = var13.getPrev(var39.assetId)
			
			if prev then
				local var41 = getOrCreateAudioStore(prev)
				var39.stop()
				var41.play()
			end
		end
	end
	
	local function destroyByKey(p11)
		-- upvalues: var9 (ref), var11 (ref), var10 (ref), cryoModule (copy)
		local var42 = var9(false)[p11]
		
		if var42 then
			if var11.unsubscribe(p11) > 0 then return end
			var42.destroy()
			var10(function(p12)
				-- upvalues: cryoModule (copy), p11 (ref)
				return cryoModule.Dictionary.join(p12, { [p11] = cryoModule.None })
			end)
		end
	end
	
	local function destroyAudioStore(p13, p14)
		-- upvalues: destroyByKey (ref), getFFlagAudioPreviewLuaModule (copy)
		destroyByKey(if getFFlagAudioPreviewLuaModule() and p14 then tostring(p13) .. ":preview" else tostring(p13))
	end
	
	local function destroy()
		-- upvalues: var9 (ref), var10 (ref), var16 (ref)
		for i, v in var9(false) do
			v.destroy()
		end
		var10({})
		var16({})
	end
	
	signalsExperimentalModule.onDisposed(p4, signalsModule.createEffect(function(p15)
		-- upvalues: var11 (ref), destroyByKey (ref)
		for i, v in var11.getConsumerCounts(p15) do
			if v <= 0 then
				destroyByKey(i)
			end
		end
	end))
	signalsExperimentalModule.onDisposed(p4, signalsModule.createEffect(function(p16)
		-- upvalues: var9 (ref), destroyByKey (ref)
		for i, v in var9(p16) do
			if v.getIsDestroyed(p16) then
				destroyByKey(i)
			end
		end
	end))
	signalsExperimentalModule.onDisposed(p4, signalsModule.createEffect(function(p17)
		-- upvalues: var9 (ref), cryoModule (copy), var15 (ref), var16 (ref)
		for i, v in var9(p17) do
			local isPlaying = v.getIsPlaying(p17)
			local var44 = cryoModule.List.find(var15(p17), v)
			local var45 = var44 ~= nil
			
			if var45 and not isPlaying then
				var16(function(p18)
					-- upvalues: cryoModule (copy), var44 (ref)
					return cryoModule.List.removeIndex(p18, var44)
				end)
			elseif isPlaying and not var45 then
				var16(function(p19)
					-- upvalues: cryoModule (copy), v (ref)
					return cryoModule.List.join(p19, { v })
				end)
			end
		end
	end))
	signalsExperimentalModule.onDisposed(p4, signalsModule.createEffect(function(p20)
		-- upvalues: var12 (ref), var9 (ref)
		local volume = var12.getVolume(p20)
		
		for i, v in var9(p20) do
			v.setVolume(volume)
		end
	end))
	signalsExperimentalModule.onDisposed(p4, signalsModule.createEffect(function(p21)
		-- upvalues: var18 (ref), var19 (ref), var13 (ref), getOrCreateAudioStore (ref)
		local var47 = var18(p21)
		
		if var47 and var47.getIsElapsed(p21) and var19(p21) then
			local var50
			local var48 = var18(false)
			
			if var48 then
				local next = var13.getNext(var48.assetId)
				var50 = if next then getOrCreateAudioStore(next) else nil
			end
			if var50 then
				var50.play()
			end
		end
	end))
	
	return {
		getAudioStores = var9,
		stopAll = stopAll,
		pauseAll = pauseAll,
		getLastPlayedAudioStore = var18,
		getOrCreateAudioStore = getOrCreateAudioStore,
		getPlayingAudioStores = var15,
		destroyAudioStore = destroyAudioStore,
		destroy = destroy,
		getGlobalVolume = var12.getVolume,
		setGlobalVolume = var12.setVolume,
		mute = var12.mute,
		unmute = var12.unmute,
		getIsMuted = var12.getIsMuted,
		hasNextSong = var19,
		hasPrevSong = var20,
		playNextSong = playNextSong,
		playPrevSong = playPrevSong,
		setPlaylist = var13.set
	}
end