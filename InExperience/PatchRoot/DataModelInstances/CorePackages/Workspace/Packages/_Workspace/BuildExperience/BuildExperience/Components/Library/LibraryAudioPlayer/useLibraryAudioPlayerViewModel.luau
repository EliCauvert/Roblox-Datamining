local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local mediaPlaybackModule = require(parent.MediaPlayback)
local navigationModule = require(parent.Navigation)
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(script.Parent.LibraryAudioPlayerView)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)

return function(p1)
	-- upvalues: mediaPlaybackModule (ref), navigationModule (ref), reactModule (ref), roactNavigationModule (ref), signalsReactModule (ref), sendBuildExperienceEventModule (ref)
	local var1 = p1.isActive ~= false
	local var2 = mediaPlaybackModule.useAudioStore(p1.soundId, false)
	local var3 = navigationModule.useNavigation()
	local useState = reactModule.useState
	local var4 = if var3 ~= nil then var3.isFocused() else true
	useState, var10 = useState(var4)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var3 (ref), roactNavigationModule (copy)
		var4(if var3 ~= nil then var3.isFocused() else true)
		
		if var3 == nil then
			return nil
		end
		local var5 = var3.addListener(roactNavigationModule.Events.WillFocus, function()
			-- upvalues: var4 (copy)
			var4(true)
		end)
		local var6 = var3.addListener(roactNavigationModule.Events.WillBlur, function()
			-- upvalues: var4 (copy)
			var4(false)
		end)
		
		return function()
			-- upvalues: var5 (ref), var6 (ref)
			var5.remove()
			var6.remove()
		end
	end, { var3 or false })
	local var5 = signalsReactModule.useSignalState(var2.getIsPlaying)
	local var6 = signalsReactModule.useSignalState(var2.getIsLoaded)
	local var7 = signalsReactModule.useSignalState(var2.getDuration)
	local var8 = signalsReactModule.useSignalBinding(var2.getElapsed)
	local var9, var10 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), var6 (ref), sendBuildExperienceEventModule (copy)
		var10(false)
		
		if var6 then
			return nil
		end
		local delayedThread = task.delay(15, function()
			-- upvalues: var10 (copy), sendBuildExperienceEventModule (copy)
			var10(true)
			sendBuildExperienceEventModule("LIBRARY_FETCH_FAILED", { universeId = game.GameId, placeId = game.PlaceId }, {
				surface = "Detail",
				kind = "Sound",
				reason = "audio_load_timeout"
			})
		end)
		
		return function()
			-- upvalues: delayedThread (ref)
			task.cancel(delayedThread)
		end
	end, { var2, var6 })
	local var11 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), useState (ref), var1 (ref), var5 (ref), var2 (ref), mediaPlaybackModule (copy), sendBuildExperienceEventModule (copy)
		if not var6 or not useState or not var1 then return end
		if var5 then
			var2.pause()
		else
			mediaPlaybackModule.getAudioPlaybackStore(false).pauseAll()
			var2.play()
		end
		sendBuildExperienceEventModule("LIBRARY_ASSET_CLICK", { universeId = game.GameId, placeId = game.PlaceId }, {
			surface = "Detail",
			kind = "Sound",
			action = if var5 then "pause" else "play"
		})
	end, {
		var2,
		var6,
		var5,
		useState,
		var1
	})
	local var12 = reactModule.useRef(false)
	local var13 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), var6 (ref), var1 (ref), useState (ref), var5 (ref), var2 (ref)
		var12.current = var6 and (var1 and (useState and var5))
		var2.pause()
	end, {
		var2,
		var6,
		var1,
		useState,
		var5
	})
	local var14 = reactModule.useCallback(function(p2)
		-- upvalues: var6 (ref), var1 (ref), useState (ref), var2 (ref), var7 (ref)
		if var6 and var1 and useState then
			var2.seek(math.clamp(p2, 0, 1) * var7)
		end
	end, {
		var2,
		var7,
		var6,
		var1,
		useState
	})
	local var15 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), var1 (ref), useState (ref), var2 (ref)
		if var12.current and var1 and useState then
			var2.play()
		end
		var12.current = false
	end, { var2, var1, useState })
	reactModule.useEffect(function()
		-- upvalues: useState (ref), var2 (ref), var1 (ref)
		if not useState then
			var2.stop()
			
			return
		elseif not var1 then
			var2.pause()
		end
	end, { var2, useState, var1 })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref)
		return function()
			-- upvalues: var2 (copy)
			var2.stop()
		end
	end, { var2 })
	
	return {
		isCompact = p1.isCompact,
		title = p1.title,
		artist = p1.soundLabel or "",
		isPlaying = var5,
		elapsed = var8,
		duration = var7,
		onTogglePlayback = var11,
		onSeek = var14,
		onSeekStarted = var13,
		onSeekEnded = var15,
		unavailableText = p1.unavailableText,
		status = if var6 then "Ready" elseif var9 then "Failed" else "Loading"
	}
end