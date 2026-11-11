local NewResult = require(game:GetService("CorePackages").Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local EmoteHelper = {
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

local function _(Connection)
	if Connection then
		Connection:Disconnect()
	end
end

function EmoteHelper.getAnyActiveDefaultChatTriggeredEmoteTrack(Player: Player)
	-- upvalues: EmoteHelper (copy)
	if not Player.Character then
		return nil
	end
	local Humanoid = Player.Character:FindFirstChildOfClass("Humanoid")
	
	if not Humanoid then
		return nil
	end
	local Animator = Humanoid:FindFirstChildOfClass("Animator")
	
	if not Animator then
		return nil
	end
	for _, playingAnimationTrack in pairs((Animator:GetPlayingAnimationTracks())) do
		if playingAnimationTrack.Animation and playingAnimationTrack.Animation.Parent and playingAnimationTrack:IsA("AnimationTrack") and EmoteHelper.LegacyDefaultEmotes[playingAnimationTrack.Animation.Parent.Name] and playingAnimationTrack.IsPlaying then
			return playingAnimationTrack
		end
	end
	return nil
end

local function waitForEmoteEventInternal(Player, AnimationTrack, p1, Callback: () -> ())
	-- upvalues: NewResult (copy), EmoteHelper (copy), waitForEmoteEventInternal (copy)
	local BindableEvent = Instance.new("BindableEvent")
	local ClockTime = os.clock()
	local Flag = true
	
	local function _()
		-- upvalues: Flag (ref), BindableEvent (copy)
		if Flag and BindableEvent then
			Flag = false
			BindableEvent:Fire()
		end
	end
	
	local StoppedConnection = AnimationTrack.Stopped:Connect(function()
		-- upvalues: NewResult (upval), Flag (ref), BindableEvent (copy)
		NewResult:trace("EmoteHelper.waitForEmoteEventInternal: Stopped")
		
		if Flag and BindableEvent then
			Flag = false
			BindableEvent:Fire()
		end
	end)
	local KeyframeReachedConnection = AnimationTrack.KeyframeReached:Connect(function(KeyframeName)
		-- upvalues: AnimationTrack (copy), p1 (copy), NewResult (upval), Flag (ref), BindableEvent (copy), ClockTime (ref)
		if KeyframeName == "End" and (not AnimationTrack.Looped or p1) then
			NewResult:trace("EmoteHelper.waitForEmoteEventInternal: KeyframeReached")
			
			if Flag and BindableEvent then
				Flag = false
				BindableEvent:Fire()
				
				return
			end
		else
			ClockTime = os.clock()
		end
	end)
	task.spawn(function()
		-- upvalues: ClockTime (ref), Flag (ref), EmoteHelper (upval), NewResult (upval), BindableEvent (copy)
		local Elapsed = os.clock() - ClockTime
		while Flag and Elapsed < EmoteHelper.EMOTE_LOOP_WAIT_TIMEOUT do
			wait(EmoteHelper.EMOTE_LOOP_WAIT_TIMEOUT - Elapsed)
			Elapsed = os.clock() - ClockTime
		end
		if Flag then
			NewResult:trace("EmoteHelper.waitForEmoteEventInternal: Timeout!")
			
			if Flag and BindableEvent then
				Flag = false
				BindableEvent:Fire()
			end
		end
	end)
	BindableEvent.Event:Wait()
	BindableEvent:Destroy()
	
	if StoppedConnection then
		StoppedConnection:Disconnect()
	end
	if KeyframeReachedConnection then
		KeyframeReachedConnection:Disconnect()
	end
	if p1 then
		wait(EmoteHelper.EMOTE_LOOP_TRANSITION_WAIT_TIME)
		local AnyActiveDefaultChatTriggeredEmoteTrack = EmoteHelper.getAnyActiveDefaultChatTriggeredEmoteTrack(Player)
		
		if AnyActiveDefaultChatTriggeredEmoteTrack then
			waitForEmoteEventInternal(Player, AnyActiveDefaultChatTriggeredEmoteTrack, p1, Callback)
		elseif Callback then
			Callback()
		end
	elseif Callback then
		Callback()
	end
end

function EmoteHelper.createEmoteFinishEvent(p2, p3, p4)
	-- upvalues: waitForEmoteEventInternal (copy)
	local BindableEvent = Instance.new("BindableEvent")
	task.spawn(waitForEmoteEventInternal, p2, p3, p4, function()
		-- upvalues: BindableEvent (copy)
		BindableEvent:Fire()
		BindableEvent:Destroy()
	end)
	
	return BindableEvent.Event
end

return EmoteHelper