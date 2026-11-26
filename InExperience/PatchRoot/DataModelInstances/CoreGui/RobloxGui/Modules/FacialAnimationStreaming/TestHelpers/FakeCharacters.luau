local FakeInstanceModule = require(script.Parent.FakeInstance)
local CreateFakeSignalModule = require(script.Parent.createFakeSignal)
local FakeCharactersModule = {
	createStreamTrack = function()
		return {
			Priority = nil,
			weight = nil,
			playing = false,
			paused = false,
			destroyed = false,
			stopCount = 0,
			adjustWeightCalls = {},
			Play = function(StreamTrack, _, Weight)
				StreamTrack.playing = true
				StreamTrack.weight = Weight
			end,
			Stop = function(StreamTrack)
				StreamTrack.playing = false
				StreamTrack.stopCount += 1
			end,
			AdjustWeight = function(StreamTrack, Weight)
				StreamTrack.weight = Weight
				table.insert(StreamTrack.adjustWeightCalls, Weight)
			end,
			TogglePause = function(p1, Paused)
				p1.paused = Paused
			end,
			Destroy = function(p1)
				p1.destroyed = true
			end
		}
	end
}

function FakeCharactersModule.createAnimator()
	-- upvalues: FakeInstanceModule (copy), FakeCharactersModule (copy)
	local Animator = FakeInstanceModule.new("Animator")
	Animator.loadedTracks = {}
	
	local function _()
		-- upvalues: FakeCharactersModule (upval), Animator (copy)
		local StreamTrack = FakeCharactersModule.createStreamTrack()
		table.insert(Animator.loadedTracks, StreamTrack)
		
		return StreamTrack
	end
	
	function Animator:LoadStreamAnimation(_)
		-- upvalues: FakeCharactersModule (upval), Animator (copy)
		local StreamTrack = FakeCharactersModule.createStreamTrack()
		table.insert(Animator.loadedTracks, StreamTrack)
		
		return StreamTrack
	end
	
	function Animator:LoadStreamAnimationV2(_, _)
		-- upvalues: FakeCharactersModule (upval), Animator (copy)
		local StreamTrack = FakeCharactersModule.createStreamTrack()
		table.insert(Animator.loadedTracks, StreamTrack)
		
		return StreamTrack
	end
	
	return Animator
end

function FakeCharactersModule.createHumanoid()
	-- upvalues: FakeInstanceModule (copy), CreateFakeSignalModule (copy)
	local Humanoid = FakeInstanceModule.new("Humanoid")
	Humanoid.EmoteTriggered = CreateFakeSignalModule()
	Humanoid.Died = CreateFakeSignalModule()
	
	return Humanoid
end

function FakeCharactersModule.createCharacter(p1)
	-- upvalues: FakeInstanceModule (copy), FakeCharactersModule (copy)
	local P14 = p1 or {}
	local Model = FakeInstanceModule.new("Model", "Character")
	local MeshPart = FakeInstanceModule.new("MeshPart", "Head")
	MeshPart:setParent(Model)
	local FaceControls = nil
	
	if P14.faceControls then
		FaceControls = FakeInstanceModule.new("FaceControls")
		FaceControls:setParent(MeshPart)
	end
	local Humanoid = nil
	local Animator = nil
	
	if P14.humanoid ~= false then
		Humanoid = FakeCharactersModule.createHumanoid()
		Humanoid:setParent(Model)
		
		if P14.animator ~= false then
			Animator = FakeCharactersModule.createAnimator()
			Animator:setParent(Humanoid)
		end
	end
	return {
		model = Model,
		head = MeshPart,
		faceControls = FaceControls,
		humanoid = Humanoid,
		animator = Animator
	}
end

function FakeCharactersModule.createPlayer(UserId, p1)
	-- upvalues: CreateFakeSignalModule (copy)
	return {
		Character = nil,
		UserId = UserId,
		Name = p1 or "Player" .. tostring(UserId),
		CharacterAdded = CreateFakeSignalModule(),
		CharacterRemoving = CreateFakeSignalModule(),
		Chatted = CreateFakeSignalModule()
	}
end

function FakeCharactersModule.spawn(Player: Player, p1, p2)
	p1.model:setParent(p2)
	Player.Character = p1.model
	Player.CharacterAdded:Fire(p1.model)
end

function FakeCharactersModule.despawn(Player: Player)
	local Character = Player.Character
	
	if Character then
		Player.CharacterRemoving:Fire(Character)
		Player.Character = nil
		Character:setParent(nil)
	end
end

function FakeCharactersModule.createPlayersService()
	-- upvalues: CreateFakeSignalModule (copy)
	return {
		LocalPlayer = nil,
		_players = {},
		PlayerAdded = CreateFakeSignalModule(),
		PlayerRemoving = CreateFakeSignalModule(),
		GetPlayers = function(p1)
			return table.clone(p1._players)
		end,
		addPlayer = function(PlayersService, p1)
			table.insert(PlayersService._players, p1)
			PlayersService.PlayerAdded:Fire(p1)
		end,
		removePlayer = function(PlayersService, Value)
			PlayersService.PlayerRemoving:Fire(Value)
			local FoundIndex: number? = table.find(PlayersService._players, Value)
			
			if FoundIndex then
				table.remove(PlayersService._players, FoundIndex)
			end
		end
	}
end

return FakeCharactersModule