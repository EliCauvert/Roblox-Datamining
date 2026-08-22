local parent = script:FindFirstAncestor("BuildExperience").Parent
local mediaPlaybackModule = require(parent.MediaPlayback)
local navigationModule = require(parent.Navigation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(script.Parent.AssetLibraryAudioPlayerView)

return function(value) --[[ line: 21 | named "useAssetLibraryAudioPlayerViewModel" ]]
	-- upvalues: mediaPlaybackModule (ref), navigationModule (ref), signalsReactModule (ref), reactModule (ref)
	local var4 = mediaPlaybackModule.useAudioStore(`rbxassetid://{value.assetId}`, false)
	local var5 = navigationModule.useNavigationFocus()
	local var6 = signalsReactModule.useSignalState(var4.getIsPlaying)
	local var7 = signalsReactModule.useSignalState(var4.getIsLoaded)
	local var8 = signalsReactModule.useSignalState(var4.getDuration)
	local var9 = signalsReactModule.useSignalBinding(var4.getElapsed)
	local var10, var11 = reactModule.useState(false)
	local var12 = reactModule.useCallback(function() --[[ line: 30 ]]
		-- upvalues: mediaPlaybackModule (copy), var4 (ref)
		mediaPlaybackModule.getAudioPlaybackStore(false).pauseAll()
		var4.play()
	end, { var4 })
	local var13 = reactModule.useCallback(function() --[[ line: 35 ]]
		-- upvalues: var6 (ref), var11 (ref), var4 (ref), var7 (ref), var12 (ref)
		if var6 then
			var11(false)
			var4.pause()
			
			return
		elseif var7 then
			var12()
			
			return
		end
		var11(true)
	end, { var4, var7, var6, var12 })
	reactModule.useEffect(function() --[[ line: 46 ]]
		-- upvalues: var10 (ref), var7 (ref), var11 (ref), var12 (ref)
		if var10 and var7 then
			var11(false)
			var12()
		end
	end, { var7, var10, var12 })
	reactModule.useEffect(function() --[[ line: 53 ]]
		-- upvalues: var5 (ref), var11 (ref), var4 (ref)
		if not var5 then
			var11(false)
			var4.stop()
		end
	end, { var4.stop, var5 })
	reactModule.useEffect(function() --[[ line: 60 ]]
		-- upvalues: var4 (ref)
		return function() --[[ line: 61 ]]
			-- upvalues: var4 (copy)
			var4.stop()
		end
	end, { var4 })
	
	return {
		title = value.title,
		artist = value.artist,
		thumbnail = value.thumbnail,
		isPlaying = var6,
		elapsed = var9,
		duration = var8,
		onTogglePlayback = var13,
		LayoutOrder = value.LayoutOrder
	}
end