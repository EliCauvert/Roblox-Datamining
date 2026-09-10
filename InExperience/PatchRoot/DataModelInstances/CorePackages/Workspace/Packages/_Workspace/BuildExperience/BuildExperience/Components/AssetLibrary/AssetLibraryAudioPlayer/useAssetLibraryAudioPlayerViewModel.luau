local parent = script:FindFirstAncestor("BuildExperience").Parent
local mediaPlaybackModule = require(parent.MediaPlayback)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(script.Parent.AssetLibraryAudioPlayerView)

return function(value)
	-- upvalues: mediaPlaybackModule (ref), signalsReactModule (ref), reactModule (ref)
	local var1 = mediaPlaybackModule.useAudioStore(`rbxassetid://{value.assetId}`, false)
	local var2 = signalsReactModule.useSignalState(var1.getIsPlaying)
	local var3 = signalsReactModule.useSignalState(var1.getIsLoaded)
	local var4 = signalsReactModule.useSignalState(var1.getDuration)
	local var5 = signalsReactModule.useSignalBinding(var1.getElapsed)
	local var6, var7 = reactModule.useState(false)
	local var8 = reactModule.useCallback(function()
		-- upvalues: mediaPlaybackModule (copy), var1 (ref)
		mediaPlaybackModule.getAudioPlaybackStore(false).pauseAll()
		var1.play()
	end, { var1 })
	local var9 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), var7 (ref), var1 (ref), var3 (ref), var8 (ref)
		if var2 then
			var7(false)
			var1.pause()
			
			return
		elseif var3 then
			var8()
			
			return
		end
		var7(true)
	end, { var1, var3, var2, var8 })
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var3 (ref), var7 (ref), var8 (ref)
		if var6 and var3 then
			var7(false)
			var8()
		end
	end, { var3, var6, var8 })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref)
		return function()
			-- upvalues: var1 (copy)
			var1.stop()
		end
	end, { var1 })
	
	return {
		title = value.title,
		artist = value.artist,
		thumbnail = value.thumbnail,
		isPlaying = var2,
		elapsed = var5,
		duration = var4,
		onTogglePlayback = var9,
		LayoutOrder = value.LayoutOrder
	}
end