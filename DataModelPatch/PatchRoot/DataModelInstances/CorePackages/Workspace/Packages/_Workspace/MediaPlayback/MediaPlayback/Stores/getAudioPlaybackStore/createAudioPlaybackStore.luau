local MediaPlayback = script:FindFirstAncestor("MediaPlayback")
local CryoModule = require(MediaPlayback.Parent.Cryo)
local SignalsModule = require(MediaPlayback.Parent.Signals)
local SignalsExperimentalModule = require(MediaPlayback.Parent.SignalsExperimental)
local CreateConsumerCounterStoreModule = require(MediaPlayback.Stores.getAudioPlaybackStore.createConsumerCounterStore)
local CreateAudioStoreModule = require(MediaPlayback.Stores.getAudioPlaybackStore.createAudioStore)
local CreatePlaylistStoreModule = require(MediaPlayback.Stores.getAudioPlaybackStore.createPlaylistStore)
local CreateVolumeStoreModule = require(MediaPlayback.Stores.getAudioPlaybackStore.createVolumeStore)
local _ = require(MediaPlayback.Stores.getAudioPlaybackStore.types)
local GetFFlagAudioPreviewLuaModule = require(MediaPlayback.Flags.getFFlagAudioPreviewLua)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed

local function _(p1, p2)
	-- upvalues: SignalsExperimentalModule (copy), SignalsModule (copy)
	SignalsExperimentalModule.onDisposed(p1, SignalsModule.createEffect(p2))
end

local _ = function(p1, p2): string
	-- upvalues: GetFFlagAudioPreviewLuaModule (copy)
	return if GetFFlagAudioPreviewLuaModule() and p2 then tostring(p1) .. ":preview" else tostring(p1)
end

return function(p1)
	-- upvalues: CreateSignalFunction (copy), CreateConsumerCounterStoreModule (copy), CreateVolumeStoreModule (copy), CreatePlaylistStoreModule (copy), GetFFlagAudioPreviewLuaModule (copy), CreateAudioStoreModule (copy), CryoModule (copy), CreateComputedFunction (copy), SignalsExperimentalModule (copy), SignalsModule (copy)
	local Signal, Signal2 = CreateSignalFunction({})
	local ConsumerCounterStoreModule = CreateConsumerCounterStoreModule()
	local VolumeStoreModule = CreateVolumeStoreModule()
	local PlaylistStoreModule = CreatePlaylistStoreModule()
	
	local function getOrCreateAudioStore(Next, p2)
		-- upvalues: GetFFlagAudioPreviewLuaModule (upval), Signal (copy), CreateAudioStoreModule (upval), Signal2 (copy), CryoModule (upval), ConsumerCounterStoreModule (copy)
		local Text: string = if GetFFlagAudioPreviewLuaModule() and p2 then tostring(Next) .. ":preview" else tostring(Next)
		local SignalResultEntry = Signal(false)[Text]
		
		if not SignalResultEntry then
			SignalResultEntry = CreateAudioStoreModule(Next, p2)
			Signal2(function(p3)
				-- upvalues: CryoModule (upval), Text (copy), SignalResultEntry (ref)
				return CryoModule.Dictionary.join(p3, { [Text] = SignalResultEntry })
			end)
		end
		ConsumerCounterStoreModule.subscribe(Text)
		
		return SignalResultEntry
	end
	
	local Signal1, Signal2_1 = CreateSignalFunction({})
	local v1 = nil
	local Computed = CreateComputedFunction(function(p2)
		-- upvalues: Signal1 (copy), v1 (ref)
		local SignalResult = Signal1(p2)
		local SignalResultEntry = SignalResult[#SignalResult]
		
		if SignalResultEntry then
			v1 = SignalResultEntry
		end
		return v1
	end)
	
	local function _()
		-- upvalues: Computed (copy), PlaylistStoreModule (copy), getOrCreateAudioStore (copy)
		local ComputedResult = Computed(false)
		
		if ComputedResult then
			local Next = PlaylistStoreModule.getNext(ComputedResult.assetId)
			
			if Next then
				return (getOrCreateAudioStore(Next))
			end
		end
		return nil
	end
	
	local Computed1 = CreateComputedFunction(function(p2): boolean
		-- upvalues: Computed (copy), PlaylistStoreModule (copy)
		local ComputedResult = Computed(p2)
		
		return if ComputedResult then PlaylistStoreModule.getNext(ComputedResult.assetId) ~= nil else false
	end)
	local Computed2 = CreateComputedFunction(function(p2): boolean
		-- upvalues: Computed (copy), PlaylistStoreModule (copy)
		local ComputedResult = Computed(p2)
		
		return if ComputedResult then PlaylistStoreModule.getPrev(ComputedResult.assetId) ~= nil else false
	end)
	
	local function stopAll()
		-- upvalues: Signal (copy)
		for _, value in Signal(false) do
			value.stop()
		end
	end
	
	local function pauseAll()
		-- upvalues: Signal (copy)
		for _, value in Signal(false) do
			value.pause()
		end
	end
	
	local function playNextSong()
		-- upvalues: Computed (copy), PlaylistStoreModule (copy), getOrCreateAudioStore (copy)
		local ComputedResult = Computed(false)
		
		if ComputedResult then
			local Next = PlaylistStoreModule.getNext(ComputedResult.assetId)
			
			if Next then
				local OrCreateAudioStore = getOrCreateAudioStore(Next)
				ComputedResult.stop()
				OrCreateAudioStore.play()
			end
		end
	end
	
	local function playPrevSong()
		-- upvalues: Computed (copy), PlaylistStoreModule (copy), getOrCreateAudioStore (copy)
		local ComputedResult = Computed(false)
		
		if ComputedResult then
			local Prev = PlaylistStoreModule.getPrev(ComputedResult.assetId)
			
			if Prev then
				local OrCreateAudioStore = getOrCreateAudioStore(Prev)
				ComputedResult.stop()
				OrCreateAudioStore.play()
			end
		end
	end
	
	local function destroyByKey(p2)
		-- upvalues: Signal (copy), ConsumerCounterStoreModule (copy), Signal2 (copy), CryoModule (upval)
		local SignalResultEntry = Signal(false)[p2]
		
		if SignalResultEntry then
			if ConsumerCounterStoreModule.unsubscribe(p2) > 0 then return end
			SignalResultEntry.destroy()
			Signal2(function(p3)
				-- upvalues: CryoModule (upval), p2 (copy)
				return CryoModule.Dictionary.join(p3, { [p2] = CryoModule.None })
			end)
		end
	end
	
	local function destroyAudioStore(p2, p3)
		-- upvalues: destroyByKey (copy), GetFFlagAudioPreviewLuaModule (upval)
		destroyByKey(if GetFFlagAudioPreviewLuaModule() and p3 then tostring(p2) .. ":preview" else tostring(p2))
	end
	
	local function destroy()
		-- upvalues: Signal (copy), Signal2 (copy), Signal2_1 (copy)
		for _, value in Signal(false) do
			value.destroy()
		end
		Signal2({})
		Signal2_1({})
	end
	
	SignalsExperimentalModule.onDisposed(p1, SignalsModule.createEffect(function(p2)
		-- upvalues: ConsumerCounterStoreModule (copy), destroyByKey (copy)
		for i, value in ConsumerCounterStoreModule.getConsumerCounts(p2) do
			if value <= 0 then
				destroyByKey(i)
			end
		end
	end))
	SignalsExperimentalModule.onDisposed(p1, SignalsModule.createEffect(function(p3)
		-- upvalues: Signal (copy), destroyByKey (copy)
		for i, value in Signal(p3) do
			if value.getIsDestroyed(p3) then
				destroyByKey(i)
			end
		end
	end))
	SignalsExperimentalModule.onDisposed(p1, SignalsModule.createEffect(function(p4)
		-- upvalues: Signal (copy), CryoModule (upval), Signal1 (copy), Signal2_1 (copy)
		for _, value in Signal(p4) do
			local IsPlaying = value.getIsPlaying(p4)
			local FindResult = CryoModule.List.find(Signal1(p4), value)
			local HasFindResult = FindResult ~= nil
			
			if HasFindResult and not IsPlaying then
				Signal2_1(function(p5)
					-- upvalues: CryoModule (upval), FindResult (copy)
					return CryoModule.List.removeIndex(p5, FindResult)
				end)
			elseif IsPlaying and not HasFindResult then
				Signal2_1(function(p5)
					-- upvalues: CryoModule (upval), value (copy)
					return CryoModule.List.join(p5, { value })
				end)
			end
		end
	end))
	SignalsExperimentalModule.onDisposed(p1, SignalsModule.createEffect(function(p5)
		-- upvalues: VolumeStoreModule (copy), Signal (copy)
		local Volume = VolumeStoreModule.getVolume(p5)
		
		for _, value in Signal(p5) do
			value.setVolume(Volume)
		end
	end))
	SignalsExperimentalModule.onDisposed(p1, SignalsModule.createEffect(function(p6)
		-- upvalues: Computed (copy), Computed1 (copy), PlaylistStoreModule (copy), getOrCreateAudioStore (copy)
		local ComputedResult = Computed(p6)
		
		if ComputedResult and ComputedResult.getIsElapsed(p6) and Computed1(p6) then
			local ComputedResult1 = Computed(false)
			local v2 = nil
			repeat
				if ComputedResult1 then
					local Next = PlaylistStoreModule.getNext(ComputedResult1.assetId)
					
					if Next then
						v2 = getOrCreateAudioStore(Next)
						break
					end
				end
				v2 = nil
			until true
			if v2 then
				v2.play()
			end
		end
	end))
	
	return {
		getAudioStores = Signal,
		stopAll = stopAll,
		pauseAll = pauseAll,
		getLastPlayedAudioStore = Computed,
		getOrCreateAudioStore = getOrCreateAudioStore,
		getPlayingAudioStores = Signal1,
		destroyAudioStore = destroyAudioStore,
		destroy = destroy,
		getGlobalVolume = VolumeStoreModule.getVolume,
		setGlobalVolume = VolumeStoreModule.setVolume,
		mute = VolumeStoreModule.mute,
		unmute = VolumeStoreModule.unmute,
		getIsMuted = VolumeStoreModule.getIsMuted,
		hasNextSong = Computed1,
		hasPrevSong = Computed2,
		playNextSong = playNextSong,
		playPrevSong = playPrevSong,
		setPlaylist = PlaylistStoreModule.set
	}
end