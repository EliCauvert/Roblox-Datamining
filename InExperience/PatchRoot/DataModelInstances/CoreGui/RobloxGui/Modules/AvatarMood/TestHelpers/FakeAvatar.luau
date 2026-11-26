local FakeInstanceModule = require(script.Parent.FakeInstance)
local CreateFakeSignalModule = require(script.Parent.createFakeSignal)
local FakeAvatarModule = {
	createTrack = function(Animation, p1)
		-- upvalues: CreateFakeSignalModule (copy)
		local P1 = p1 or {}
		
		return {
			Priority = nil,
			IsPlaying = false,
			destroyed = false,
			playCount = 0,
			stopCount = 0,
			Animation = Animation,
			Looped = P1.looped or false,
			Stopped = CreateFakeSignalModule(),
			KeyframeReached = CreateFakeSignalModule(),
			_className = P1.className or "AnimationTrack",
			IsA = function(p2, ClassName): boolean
				return ClassName == p2._className
			end,
			Play = function(Track)
				Track.IsPlaying = true
				Track.playCount += 1
			end,
			Stop = function(Track)
				Track.IsPlaying = false
				Track.stopCount += 1
			end,
			Destroy = function(p2)
				p2.destroyed = true
			end,
			finish = function(Track)
				Track.IsPlaying = false
				Track.Stopped:Fire()
			end
		}
	end
}

function FakeAvatarModule.createAnimator()
	-- upvalues: FakeInstanceModule (copy), CreateFakeSignalModule (copy), FakeAvatarModule (copy)
	local Animator = FakeInstanceModule.new("Animator")
	Animator.loadedTracks = {}
	Animator.coreScriptTracks = {}
	Animator.AnimationStreamTrackPlayed = CreateFakeSignalModule()
	
	function Animator.LoadAnimation(p1, Animation)
		-- upvalues: FakeAvatarModule (upval)
		local Track = FakeAvatarModule.createTrack(Animation)
		table.insert(p1.loadedTracks, Track)
		
		return Track
	end
	
	function Animator.GetPlayingAnimationTracksCoreScript(p1)
		return table.clone(p1.coreScriptTracks)
	end
	
	return Animator
end

function FakeAvatarModule.createHumanoid()
	-- upvalues: FakeInstanceModule (copy), CreateFakeSignalModule (copy)
	local Humanoid = FakeInstanceModule.new("Humanoid")
	Humanoid.EmoteTriggered = CreateFakeSignalModule()
	Humanoid.playingTracks = {}
	
	function Humanoid.GetPlayingAnimationTracks(p1)
		return table.clone(p1.playingTracks)
	end
	
	return Humanoid
end

function FakeAvatarModule.createChatEmoteTrack(Text)
	-- upvalues: FakeInstanceModule (copy), FakeAvatarModule (copy)
	local Animation = FakeInstanceModule.new("Animation", Text .. "Anim")
	Animation:setParent((FakeInstanceModule.new("StringValue", Text)))
	local Track = FakeAvatarModule.createTrack(Animation)
	Track.IsPlaying = true
	
	return Track
end

function FakeAvatarModule.createMoodFolder(Mood)
	-- upvalues: FakeInstanceModule (copy)
	local StringValue = FakeInstanceModule.new("StringValue", "mood")
	local Animation = nil
	
	if Mood then
		Animation = FakeInstanceModule.new("Animation", Mood)
		Animation:setParent(StringValue)
	end
	return StringValue, Animation
end

function FakeAvatarModule.createCharacter(p1)
	-- upvalues: FakeInstanceModule (copy), FakeAvatarModule (copy)
	local P14 = p1 or {}
	local Model = FakeInstanceModule.new("Model", "Character")
	local config = {
		model = Model,
		head = FakeInstanceModule.new("MeshPart", "Head")
	}
	
	if P14.faceControls ~= false then
		config.faceControls = FakeInstanceModule.new("FaceControls")
		config.faceControls:setParent(config.head)
	end
	config.head:setParent(Model)
	
	if P14.humanoid ~= false then
		config.humanoid = FakeAvatarModule.createHumanoid()
		
		if P14.animator ~= false then
			config.animator = FakeAvatarModule.createAnimator()
			config.animator:setParent(config.humanoid)
		end
		config.humanoid:setParent(Model)
	end
	if P14.animate ~= false then
		config.animate = FakeInstanceModule.new("LocalScript", "Animate")
		
		if P14.moodsEnabled then
			FakeInstanceModule.new("BoolValue", "MoodsEnabled"):setParent(config.animate)
		end
		if P14.mood ~= false then
			config.moodFolder, config.moodAnimation = FakeAvatarModule.createMoodFolder(P14.mood or "Mood")
			config.moodFolder:setParent(config.animate)
		end
		config.animate:setParent(Model)
	end
	return config
end

function FakeAvatarModule.createLocalPlayer()
	return { UserId = 1, Name = "LocalPlayer", Character = nil }
end

return FakeAvatarModule