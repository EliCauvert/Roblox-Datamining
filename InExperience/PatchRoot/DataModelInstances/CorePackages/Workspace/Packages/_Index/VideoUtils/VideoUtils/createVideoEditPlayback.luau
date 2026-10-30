local CreateVideoEditMusicModule = require(script.Parent.createVideoEditMusic)
local GetVideoEditsModule = require(script.Parent.getVideoEdits)

return function(Sound: Sound, p1, p2, Callback, p3)
	-- upvalues: CreateVideoEditMusicModule (copy), GetVideoEditsModule (copy)
	local Step = if p3 then p3.step else game:GetService("RunService").RenderStepped
	local CreateMusic = if p3 then p3.createMusic else CreateVideoEditMusicModule
	local List = {}
	local v1 = nil
	local Muted = true
	local Flag = false
	local Flag1 = false
	local Flag2 = false
	local TimePosition = 0
	local TimePosition1 = 0
	
	local function musicPosition(): number
		-- upvalues: p1 (copy), Sound (copy), TimePosition (ref)
		return (if p1.music then p1.music.startTime else 0) + math.max(0, Sound.TimePosition - TimePosition)
	end
	
	local function _()
		-- upvalues: v1 (ref), p1 (copy), Sound (copy), TimePosition (ref)
		if v1 then
			v1.setPosition((if p1.music then p1.music.startTime else 0) + math.max(0, Sound.TimePosition - TimePosition))
		end
	end
	
	local function updateMusic()
		-- upvalues: Muted (ref), Flag (ref), Sound (copy), Flag1 (ref), p1 (copy), v1 (ref), CreateMusic (copy), musicPosition (copy), TimePosition (ref)
		if not Muted and Flag and Sound.Playing and not Flag1 and p1.music and v1 == nil then
			v1 = CreateMusic(p1.music.assetId, musicPosition)
			
			if v1 then
				v1.setPosition((if p1.music then p1.music.startTime else 0) + math.max(0, Sound.TimePosition - TimePosition))
			end
		end
		if v1 then
			v1.setPlaying(not Muted and (Flag and (Sound.Playing and not Flag1)))
		end
	end
	
	local _ = function()
		-- upvalues: Flag1 (ref), Sound (copy), updateMusic (copy), Callback (copy)
		if Flag1 then return end
		Flag1 = true
		Sound:Pause()
		updateMusic()
		local OnEndedFunction: () -> () = Callback().onEnded
		
		if OnEndedFunction then
			OnEndedFunction()
		end
	end
	
	local function onLooped()
		-- upvalues: v1 (ref), p1 (copy), Sound (copy), TimePosition (ref), updateMusic (copy), Callback (copy)
		if v1 then
			v1.setPosition((if p1.music then p1.music.startTime else 0) + math.max(0, Sound.TimePosition - TimePosition))
		end
		updateMusic()
		local OnLoopedFunction: () -> () = Callback().onLooped
		
		if OnLoopedFunction then
			OnLoopedFunction()
		end
	end
	
	table.insert(List, Sound.Loaded:Connect(function()
		-- upvalues: Flag (ref), TimePosition (ref), TimePosition1 (ref), GetVideoEditsModule (upval), Sound (copy), p1 (copy), Flag1 (ref), updateMusic (copy), Callback (copy)
		if Flag then return end
		Flag = true
		TimePosition, TimePosition1 = GetVideoEditsModule.getPlaybackRange(Sound.TimeLength, p1.trim)
		Sound.TimePosition = TimePosition
		
		if TimePosition1 > TimePosition then
			Sound:Play()
		elseif Flag1 then return end
		Flag1 = true
		Sound:Pause()
		updateMusic()
		local OnEndedFunction: () -> () = Callback().onEnded
		
		if OnEndedFunction then
			OnEndedFunction()
			
			return
		end
	end))
	table.insert(List, Sound.Played:Connect(function()
		-- upvalues: Flag1 (ref), Sound (copy), TimePosition (ref), v1 (ref), p1 (copy), updateMusic (copy)
		if Flag1 then
			Flag1 = false
			Sound.TimePosition = TimePosition
		end
		if v1 then
			v1.setPosition((if p1.music then p1.music.startTime else 0) + math.max(0, Sound.TimePosition - TimePosition))
		end
		updateMusic()
	end))
	table.insert(List, Sound.Paused:Connect(updateMusic))
	table.insert(List, Sound.Ended:Connect(function()
		-- upvalues: p2 (copy), p1 (copy), TimePosition1 (ref), TimePosition (ref), Flag1 (ref), Sound (copy), v1 (ref), updateMusic (copy), Callback (copy)
		if p2 and p1.trim and TimePosition < TimePosition1 and not Flag1 then
			Sound.TimePosition = TimePosition
			
			if v1 then
				v1.setPosition((if p1.music then p1.music.startTime else 0) + math.max(0, Sound.TimePosition - TimePosition))
			end
			updateMusic()
			local OnLoopedFunction: () -> () = Callback().onLooped
			
			if OnLoopedFunction then
				OnLoopedFunction()
			end
			Sound:Play()
			
			return
		elseif Flag1 then return end
		Flag1 = true
		Sound:Pause()
		updateMusic()
		local OnEndedFunction: () -> () = Callback().onEnded
		
		if OnEndedFunction then
			OnEndedFunction()
		end
	end))
	table.insert(List, Sound.DidLoop:Connect(onLooped))
	table.insert(List, Step:Connect(function()
		-- upvalues: Flag (ref), Sound (copy), Flag1 (ref), p1 (copy), TimePosition1 (ref), p2 (copy), TimePosition (ref), v1 (ref), updateMusic (copy), Callback (copy)
		if Flag and Sound.Playing and not Flag1 and p1.trim and TimePosition1 <= Sound.TimePosition then
			if p2 then
				Sound.TimePosition = TimePosition
				
				if v1 then
					v1.setPosition((if p1.music then p1.music.startTime else 0) + math.max(0, Sound.TimePosition - TimePosition))
				end
				updateMusic()
				local OnLoopedFunction: () -> () = Callback().onLooped
				
				if OnLoopedFunction then
					OnLoopedFunction()
					
					return
				end
			else
				Sound.TimePosition = TimePosition1
				
				if Flag1 then return end
				Flag1 = true
				Sound:Pause()
				updateMusic()
				local OnEndedFunction: () -> () = Callback().onEnded
				
				if OnEndedFunction then
					OnEndedFunction()
				end
			end
		end
	end))
	
	if Sound.IsLoaded and not Flag then
		Flag = true
		local PlaybackRange2
		TimePosition, PlaybackRange2 = GetVideoEditsModule.getPlaybackRange(Sound.TimeLength, p1.trim)
		Sound.TimePosition = TimePosition
		
		if PlaybackRange2 <= TimePosition then
			if not Flag1 then
				Flag1 = true
				Sound:Pause()
				updateMusic()
				local OnEndedFunction: () -> () = Callback().onEnded
				
				if OnEndedFunction then
					OnEndedFunction()
				end
			end
		else
			Sound:Play()
		end
	end
	return {
		setMuted = function(Value)
			-- upvalues: Muted (ref), v1 (ref), p1 (copy), Sound (copy), TimePosition (ref), updateMusic (copy)
			Muted = Value
			
			if not Muted and v1 then
				v1.setPosition((if p1.music then p1.music.startTime else 0) + math.max(0, Sound.TimePosition - TimePosition))
			end
			updateMusic()
		end,
		destroy = function()
			-- upvalues: Flag2 (ref), List (copy), Sound (copy), v1 (ref)
			if Flag2 then return end
			Flag2 = true
			
			for _, Connection in List do
				Connection:Disconnect()
			end
			Sound:Pause()
			
			if v1 then
				v1.destroy()
			end
		end
	}
end