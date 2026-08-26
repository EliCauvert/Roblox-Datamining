local t = {
	EMOTE_LOOP_TRANSITION_WAIT_TIME = 0.3,
	EMOTE_LOOP_WAIT_TIMEOUT = 5,
	LegacyDefaultEmotes = {
		wave = true,
		point = true,
		dance = true,
		dance2 = true,
		dance3 = true,
		laugh = true,
		cheer = true
	}
}
local name = require(game:GetService("CorePackages").Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)

local function _(p1)
	if p1 then
		p1:Disconnect()
	end
end

function t.getAnyActiveDefaultChatTriggeredEmoteTrack(p1)
	-- upvalues: t (ref)
	if not p1.Character then
		return nil
	end
	local humanoid = p1.Character:FindFirstChildOfClass("Humanoid")
	
	if not humanoid then
		return nil
	end
	local animator = humanoid:FindFirstChildOfClass("Animator")
	
	if not animator then
		return nil
	end
	for i, v in pairs(animator:GetPlayingAnimationTracks()) do
		if v.Animation and v.Animation.Parent and (v:IsA("AnimationTrack") and t.LegacyDefaultEmotes[v.Animation.Parent.Name]) and v.IsPlaying then
			return v
		end
	end
	return nil
end

local function waitForEmoteEventInternal(p2, p3, p4, p5)
	-- upvalues: name (ref), t (ref), waitForEmoteEventInternal (ref)
	local bindableEvent = Instance.new("BindableEvent")
	local processTime = os.clock()
	local var1 = true
	
	local _ = function()
		-- upvalues: var1 (write), bindableEvent (ref)
		if var1 and bindableEvent then
			var1 = false
			bindableEvent:Fire()
		end
	end
	
	local stoppedConnection = p3.Stopped:Connect(function()
		-- upvalues: name (copy), var1 (write), bindableEvent (ref)
		name:trace("EmoteHelper.waitForEmoteEventInternal: Stopped")
		
		if var1 and bindableEvent then
			var1 = false
			bindableEvent:Fire()
		end
	end)
	local keyframeReachedConnection = p3.KeyframeReached:Connect(function(p6)
		-- upvalues: p3 (ref), p4 (ref), name (copy), var1 (write), bindableEvent (ref), processTime (write)
		if p6 == "End" and (not p3.Looped or p4) then
			name:trace("EmoteHelper.waitForEmoteEventInternal: KeyframeReached")
			
			if var1 and bindableEvent then
				var1 = false
				bindableEvent:Fire()
				
				return
			end
		else
			processTime = os.clock()
		end
	end)
	task.spawn(function()
		-- upvalues: processTime (write), var1 (write), t (copy), name (copy), bindableEvent (ref)
		local var2 = os.clock() - processTime
		while var1 and var2 < t.EMOTE_LOOP_WAIT_TIMEOUT do
			wait(t.EMOTE_LOOP_WAIT_TIMEOUT - var2)
			var2 = os.clock() - processTime
		end
		if var1 then
			name:trace("EmoteHelper.waitForEmoteEventInternal: Timeout!")
			
			if var1 and bindableEvent then
				var1 = false
				bindableEvent:Fire()
			end
		end
	end)
	bindableEvent.Event:Wait()
	bindableEvent:Destroy()
	
	if stoppedConnection then
		stoppedConnection:Disconnect()
	end
	if keyframeReachedConnection then
		keyframeReachedConnection:Disconnect()
	end
	if p4 then
		wait(t.EMOTE_LOOP_TRANSITION_WAIT_TIME)
		local anyActiveDefaultChatTriggeredEmoteTrack = t.getAnyActiveDefaultChatTriggeredEmoteTrack(p2)
		
		if anyActiveDefaultChatTriggeredEmoteTrack then
			waitForEmoteEventInternal(p2, anyActiveDefaultChatTriggeredEmoteTrack, p4, p5)
		elseif p5 then
			p5()
		end
	elseif p5 then
		p5()
	end
end

function t.createEmoteFinishEvent(p6, p7, p8)
	-- upvalues: waitForEmoteEventInternal (ref)
	local bindableEvent = Instance.new("BindableEvent")
	task.spawn(waitForEmoteEventInternal, p6, p7, p8, function()
		-- upvalues: bindableEvent (ref)
		bindableEvent:Fire()
		bindableEvent:Destroy()
	end)
	
	return bindableEvent.Event
end

return t