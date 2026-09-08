local parent = script:FindFirstAncestor("BuildExperience").Parent
local mediaPlaybackModule = require(parent.MediaPlayback)
local navigationModule = require(parent.Navigation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(script.Parent.AssetLibraryAudioPlayerView)

return function(value)
	-- upvalues: mediaPlaybackModule (ref), navigationModule (ref), signalsReactModule (ref), reactModule (ref)
	local var1 = mediaPlaybackModule.useAudioStore(`rbxassetid://{value.assetId}`, false)
	local var2 = navigationModule.useNavigationFocus()
	local var3 = signalsReactModule.useSignalState(var1.getIsPlaying)
	local var4 = signalsReactModule.useSignalState(var1.getIsLoaded)
	local var5 = signalsReactModule.useSignalState(var1.getDuration)
	local var6 = signalsReactModule.useSignalBinding(var1.getElapsed)
	local var7, var8 = reactModule.useState(false)
	local var9 = reactModule.useCallback(function()
		-- upvalues: mediaPlaybackModule (copy), var1 (ref)
		mediaPlaybackModule.getAudioPlaybackStore(false).pauseAll()
		var1.play()
	end, { var1 })
	local var10 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var8 (ref), var1 (ref), var4 (ref), var9 (ref)
		if var3 then
			var8(false)
			var1.pause()
			
			return
		elseif var4 then
			var9()
			
			return
		end
		var8(true)
	end, { var1, var4, var3, var9 })
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), var4 (ref), var8 (ref), var9 (ref)
		if var7 and var4 then
			var8(false)
			var9()
		end
	end, { var4, var7, var9 })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var8 (ref), var1 (ref)
		if not var2 then
			var8(false)
			var1.stop()
		end
	end, { var1.stop, var2 })
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
		isPlaying = var3,
		elapsed = var6,
		duration = var5,
		onTogglePlayback = var10,
		LayoutOrder = value.LayoutOrder
	}
end