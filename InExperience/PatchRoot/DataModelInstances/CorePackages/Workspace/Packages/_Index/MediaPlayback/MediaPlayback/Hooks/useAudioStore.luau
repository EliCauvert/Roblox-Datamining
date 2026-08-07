local mediaPlayback = script:FindFirstAncestor("MediaPlayback")
local reactModule = require(mediaPlayback.Parent.React)
local _ = require(mediaPlayback.Stores.getAudioPlaybackStore.types)
local getAudioPlaybackStoreModule = require(mediaPlayback.Stores.getAudioPlaybackStore)
local useEffect = reactModule.useEffect
local useMemo = reactModule.useMemo

return function(p0, p1) --[[ line: 11 | named "useAudioStore" ]]
	-- upvalues: useMemo (ref), getAudioPlaybackStoreModule (ref), useEffect (ref)
	p0 = p0 or "-1"
	local var4 = useMemo(function() --[[ line: 14 ]]
		-- upvalues: getAudioPlaybackStoreModule (copy), p0 (ref), p1 (ref)
		return getAudioPlaybackStoreModule(false).getOrCreateAudioStore(p0, p1)
	end, { p0, p1 })
	useEffect(function() --[[ line: 19 ]]
		-- upvalues: getAudioPlaybackStoreModule (copy), p0 (ref), p1 (ref)
		return function() --[[ line: 20 ]]
			-- upvalues: getAudioPlaybackStoreModule (copy), p0 (copy), p1 (copy)
			getAudioPlaybackStoreModule(false).destroyAudioStore(p0, p1)
		end
	end, { p0, p1 })
	
	return var4
end