local MediaPlayback = script:FindFirstAncestor("MediaPlayback")
local ReactModule = require(MediaPlayback.Parent.React)
local _ = require(MediaPlayback.Stores.getAudioPlaybackStore.types)
local GetAudioPlaybackStoreModule = require(MediaPlayback.Stores.getAudioPlaybackStore)
local UseEffectFunction = ReactModule.useEffect
local UseMemoFunction = ReactModule.useMemo

return function(p1, p2)
	-- upvalues: UseMemoFunction (copy), GetAudioPlaybackStoreModule (copy), UseEffectFunction (copy)
	local P0 = p1 or "-1"
	local UseMemoResult = UseMemoFunction(function()
		-- upvalues: GetAudioPlaybackStoreModule (upval), P0 (copy), p2 (copy)
		return GetAudioPlaybackStoreModule(false).getOrCreateAudioStore(P0, p2)
	end, { P0, p2 })
	UseEffectFunction(function()
		-- upvalues: GetAudioPlaybackStoreModule (upval), P0 (copy), p2 (copy)
		return function()
			-- upvalues: GetAudioPlaybackStoreModule (upval), P0 (upval), p2 (upval)
			GetAudioPlaybackStoreModule(false).destroyAudioStore(P0, p2)
		end
	end, { P0, p2 })
	
	return UseMemoResult
end