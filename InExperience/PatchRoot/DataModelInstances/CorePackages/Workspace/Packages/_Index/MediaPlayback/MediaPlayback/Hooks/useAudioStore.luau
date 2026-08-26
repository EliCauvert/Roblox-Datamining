local mediaPlayback = script:FindFirstAncestor("MediaPlayback")
local reactModule = require(mediaPlayback.Parent.React)
local _ = require(mediaPlayback.Stores.getAudioPlaybackStore.types)
local getAudioPlaybackStoreModule = require(mediaPlayback.Stores.getAudioPlaybackStore)
local useEffect = reactModule.useEffect
local useMemo = reactModule.useMemo

return function(p1, p2)
	-- upvalues: useMemo (ref), getAudioPlaybackStoreModule (ref), useEffect (ref)
	p1 = p1 or "-1"
	local var1 = useMemo(function()
		-- upvalues: getAudioPlaybackStoreModule (copy), p1 (ref), p2 (ref)
		return getAudioPlaybackStoreModule(false).getOrCreateAudioStore(p1, p2)
	end, { p1, p2 })
	useEffect(function()
		-- upvalues: getAudioPlaybackStoreModule (copy), p1 (ref), p2 (ref)
		return function()
			-- upvalues: getAudioPlaybackStoreModule (copy), p1 (copy), p2 (copy)
			getAudioPlaybackStoreModule(false).destroyAudioStore(p1, p2)
		end
	end, { p1, p2 })
	
	return var1
end