local parent = script:FindFirstAncestor("BuildExperience").Parent
local mediaPlaybackModule = require(parent.MediaPlayback)
local navigationModule = require(parent.Navigation)
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(script.Parent.LibraryAudioPlayerView)

return function(p1)
	-- upvalues: mediaPlaybackModule (ref), navigationModule (ref), reactModule (ref), roactNavigationModule (ref), signalsReactModule (ref)
	local var1 = mediaPlaybackModule.useAudioStore(p1.soundId, false)
	local var2 = navigationModule.useNavigation()
	local useState = reactModule.useState
	local var3 = if var2 ~= nil then var2.isFocused() else true
	useState, var7 = useState(var3)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var2 (ref), roactNavigationModule (copy)
		var3(if var2 ~= nil then var2.isFocused() else true)
		
		if var2 == nil then
			return nil
		end
		local var4 = var2.addListener(roactNavigationModule.Events.WillFocus, function()
			-- upvalues: var3 (copy)
			var3(true)
		end)
		local var5 = var2.addListener(roactNavigationModule.Events.WillBlur, function()
			-- upvalues: var3 (copy)
			var3(false)
		end)
		
		return function()
			-- upvalues: var4 (ref), var5 (ref)
			var4.remove()
			var5.remove()
		end
	end, { var2 or false })
	local var4 = signalsReactModule.useSignalState(var1.getIsPlaying)
	local var5 = signalsReactModule.useSignalState(var1.getIsLoaded)
	local var6 = signalsReactModule.useSignalState(var1.getDuration)
	local var7 = signalsReactModule.useSignalBinding(var1.getElapsed)
	local var8, var9 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), var5 (ref)
		var9(false)
		
		if var5 then
			return nil
		end
		local delayedThread = task.delay(15, function()
			-- upvalues: var9 (copy)
			var9(true)
		end)
		
		return function()
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { var1, var5 })
	local var10 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), useState (ref), var4 (ref), var1 (ref), mediaPlaybackModule (copy)
		if not var5 or not useState then return end
		if var4 then
			var1.pause()
			
			return
		end
		mediaPlaybackModule.getAudioPlaybackStore(false).pauseAll()
		var1.play()
	end, { var1, var5, var4, useState })
	reactModule.useEffect(function()
		-- upvalues: useState (ref), var1 (ref)
		if not useState then
			var1.stop()
		end
	end, { var1, useState })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref)
		return function()
			-- upvalues: var1 (copy)
			var1.stop()
		end
	end, { var1 })
	
	return {
		artist = "Sound",
		title = p1.title,
		isPlaying = var4,
		elapsed = var7,
		duration = var6,
		onTogglePlayback = var10,
		status = if var5 then "Ready" elseif var8 then "Failed" else "Loading"
	}
end