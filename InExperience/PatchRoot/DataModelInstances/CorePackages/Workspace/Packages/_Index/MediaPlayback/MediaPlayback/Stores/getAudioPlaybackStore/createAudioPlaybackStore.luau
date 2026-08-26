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

local function _(p1, p2)
	-- upvalues: signalsExperimentalModule (ref), signalsModule (ref)
	signalsExperimentalModule.onDisposed(p1, signalsModule.createEffect(p2))
end

local _ = function(p1, p2)
	-- upvalues: getFFlagAudioPreviewLuaModule (ref)
	return if getFFlagAudioPreviewLuaModule() and p2 then tostring(p1) .. ":preview" else tostring(p1)
end

return function(p1)
	-- upvalues: createSignal (ref), createConsumerCounterStoreModule (ref), createVolumeStoreModule (ref), createPlaylistStoreModule (ref), getFFlagAudioPreviewLuaModule (ref), createAudioStoreModule (ref), cryoModule (ref), createComputed (ref), signalsExperimentalModule (ref), signalsModule (ref)
	local var1, var2 = createSignal({})
	local var3 = createConsumerCounterStoreModule()
	local var4 = createVolumeStoreModule()
	local var5 = createPlaylistStoreModule()
	
	local function getOrCreateAudioStore(p2, p3)
		-- upvalues: getFFlagAudioPreviewLuaModule (copy), var1 (ref), createAudioStoreModule (copy), var2 (ref), cryoModule (copy), var3 (ref)
		local var6 = if getFFlagAudioPreviewLuaModule() and p3 then tostring(p2) .. ":preview" else tostring(p2)
		local var7 = var1(false)[var6]
		
		if not var7 then
			var7 = createAudioStoreModule(p2, p3)
			var2(function(p4)
				-- upvalues: cryoModule (copy), var6 (ref), var7 (write)
				return cryoModule.Dictionary.join(p4, { [var6] = var7 })
			end)
		end
		var3.subscribe(var6)
		
		return var7
	end
	
	local var6, var7 = createSignal({})
	local var8 = nil
	local var9 = createComputed(function(p2)
		-- upvalues: var6 (ref), var8 (write)
		local var10 = var6(p2)
		local var11 = var10[#var10]
		
		if var11 then
			var8 = var11
		end
		return var8
	end)
	
	local function _()
		-- upvalues: var9 (ref), var5 (ref), getOrCreateAudioStore (ref)
		local var10 = var9(false)
		
		if var10 then
			local next = var5.getNext(var10.assetId)
			
			return if next then getOrCreateAudioStore(next) else nil
		end
	end
	
	local var10 = createComputed(function(p2)
		-- upvalues: var9 (ref), var5 (ref)
		local var11 = var9(p2)
		
		return if var11 then var5.getNext(var11.assetId) ~= nil else false
	end)
	local var11 = createComputed(function(p2)
		-- upvalues: var9 (ref), var5 (ref)
		local var12 = var9(p2)
		
		return if var12 then var5.getPrev(var12.assetId) ~= nil else false
	end)
	
	local function stopAll()
		-- upvalues: var1 (ref)
		for i, v in var1(false) do
			v.stop()
		end
	end
	
	local function pauseAll()
		-- upvalues: var1 (ref)
		for i, v in var1(false) do
			v.pause()
		end
	end
	
	local function playNextSong()
		-- upvalues: var9 (ref), var5 (ref), getOrCreateAudioStore (ref)
		local var12 = var9(false)
		
		if var12 then
			local next = var5.getNext(var12.assetId)
			
			if next then
				local var13 = getOrCreateAudioStore(next)
				var12.stop()
				var13.play()
			end
		end
	end
	
	local function playPrevSong()
		-- upvalues: var9 (ref), var5 (ref), getOrCreateAudioStore (ref)
		local var12 = var9(false)
		
		if var12 then
			local prev = var5.getPrev(var12.assetId)
			
			if prev then
				local var13 = getOrCreateAudioStore(prev)
				var12.stop()
				var13.play()
			end
		end
	end
	
	local function destroyByKey(p2)
		-- upvalues: var1 (ref), var3 (ref), var2 (ref), cryoModule (copy)
		local var12 = var1(false)[p2]
		
		if var12 then
			if var3.unsubscribe(p2) > 0 then return end
			var12.destroy()
			var2(function(p3)
				-- upvalues: cryoModule (copy), p2 (ref)
				return cryoModule.Dictionary.join(p3, { [p2] = cryoModule.None })
			end)
		end
	end
	
	local function destroyAudioStore(p2, p3)
		-- upvalues: destroyByKey (ref), getFFlagAudioPreviewLuaModule (copy)
		destroyByKey(if getFFlagAudioPreviewLuaModule() and p3 then tostring(p2) .. ":preview" else tostring(p2))
	end
	
	local function destroy()
		-- upvalues: var1 (ref), var2 (ref), var7 (ref)
		for i, v in var1(false) do
			v.destroy()
		end
		var2({})
		var7({})
	end
	
	signalsExperimentalModule.onDisposed(p1, signalsModule.createEffect(function(p2)
		-- upvalues: var3 (ref), destroyByKey (ref)
		for i, v in var3.getConsumerCounts(p2) do
			if v <= 0 then
				destroyByKey(i)
			end
		end
	end))
	signalsExperimentalModule.onDisposed(p1, signalsModule.createEffect(function(p3)
		-- upvalues: var1 (ref), destroyByKey (ref)
		for i, v in var1(p3) do
			if v.getIsDestroyed(p3) then
				destroyByKey(i)
			end
		end
	end))
	signalsExperimentalModule.onDisposed(p1, signalsModule.createEffect(function(p4)
		-- upvalues: var1 (ref), cryoModule (copy), var6 (ref), var7 (ref)
		for i, v in var1(p4) do
			local isPlaying = v.getIsPlaying(p4)
			local var12 = cryoModule.List.find(var6(p4), v)
			local var13 = var12 ~= nil
			
			if var13 and not isPlaying then
				var7(function(p5)
					-- upvalues: cryoModule (copy), var12 (ref)
					return cryoModule.List.removeIndex(p5, var12)
				end)
			elseif isPlaying and not var13 then
				var7(function(p5)
					-- upvalues: cryoModule (copy), v (ref)
					return cryoModule.List.join(p5, { v })
				end)
			end
		end
	end))
	signalsExperimentalModule.onDisposed(p1, signalsModule.createEffect(function(p5)
		-- upvalues: var4 (ref), var1 (ref)
		local volume = var4.getVolume(p5)
		
		for i, v in var1(p5) do
			v.setVolume(volume)
		end
	end))
	signalsExperimentalModule.onDisposed(p1, signalsModule.createEffect(function(p6)
		-- upvalues: var9 (ref), var10 (ref), var5 (ref), getOrCreateAudioStore (ref)
		local var14 = var9(p6)
		
		if var14 and var14.getIsElapsed(p6) and var10(p6) then
			local var15
			local var16 = var9(false)
			
			if var16 then
				local next = var5.getNext(var16.assetId)
				var15 = if next then getOrCreateAudioStore(next) else nil
			end
			if var15 then
				var15.play()
			end
		end
	end))
	
	return {
		getAudioStores = var1,
		stopAll = stopAll,
		pauseAll = pauseAll,
		getLastPlayedAudioStore = var9,
		getOrCreateAudioStore = getOrCreateAudioStore,
		getPlayingAudioStores = var6,
		destroyAudioStore = destroyAudioStore,
		destroy = destroy,
		getGlobalVolume = var4.getVolume,
		setGlobalVolume = var4.setVolume,
		mute = var4.mute,
		unmute = var4.unmute,
		getIsMuted = var4.getIsMuted,
		hasNextSong = var10,
		hasPrevSong = var11,
		playNextSong = playNextSong,
		playPrevSong = playPrevSong,
		setPlaylist = var5.set
	}
end