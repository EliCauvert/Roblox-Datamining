local Players = game:GetService("Players")
local InsertService = game:GetService("InsertService")
local EmoteSkinningDisableUseClassLookup = game:DefineFastFlag("EmoteSkinningDisableUseClassLookup", false)
local EmoteSkinningDisableCleanupCharacterConnections = game:DefineFastFlag("EmoteSkinningDisableCleanupCharacterConnections", false)
local ScaledUGCEmoteSkinningDisableTranslationThresholdMillistuds = game:DefineFastInt("UGCEmoteSkinningDisableTranslationThresholdMillistuds", 100) * 0.001
local t = {}

local function getClipMetadata(AnimationId)
	-- upvalues: t (copy), InsertService (copy)
	if t[AnimationId] then
		return t[AnimationId]
	end
	local Number: number? = tonumber(AnimationId:match("%d+"))
	
	if not Number then
		return nil
	end
	local Success, Result = pcall(function()
		-- upvalues: InsertService (upval), Number (copy)
		return InsertService:LoadAsset(Number)
	end)
	
	if not Success or not Result then
		return nil
	end
	local AnimationClip = Result:FindFirstChildWhichIsA("AnimationClip", true)
	
	if AnimationClip then
		local IsUGCEmoteAttribute = AnimationClip:GetAttribute("isUGCEmote")
		local MaxPartTranslationAttribute = AnimationClip:GetAttribute("maxPartTranslation")
		Result:Destroy()
		local config = {
			isUGCEmote = IsUGCEmoteAttribute == true,
			maxTranslation = typeof(MaxPartTranslationAttribute) == "number" and MaxPartTranslationAttribute or 0
		}
		t[AnimationId] = config
		
		return config
	else
		Result:Destroy()
		
		return nil
	end
end

local function setAllJointsSkinning(Key, EnableSkinning)
	for _, descendant in Key:GetDescendants() do
		if descendant:IsA("Motor6D") or descendant:IsA("AnimationConstraint") or descendant:IsA("BallSocketConstraint") or descendant:IsA("Weld") or descendant:IsA("RigidConstraint") then
			descendant.EnableSkinning = EnableSkinning
		end
	end
end

local StoppedConnections = {}
local AnimationPlayedConnections = {}

local function _(Key)
	-- upvalues: StoppedConnections (copy)
	if StoppedConnections[Key] then
		StoppedConnections[Key]:Disconnect()
		StoppedConnections[Key] = nil
	end
end

local _ = function(Key)
	-- upvalues: AnimationPlayedConnections (copy)
	if AnimationPlayedConnections[Key] then
		AnimationPlayedConnections[Key]:Disconnect()
		AnimationPlayedConnections[Key] = nil
	end
end

local function onCharacterRemoving(Character)
	-- upvalues: StoppedConnections (copy), EmoteSkinningDisableCleanupCharacterConnections (copy), AnimationPlayedConnections (copy)
	if StoppedConnections[Character] then
		StoppedConnections[Character]:Disconnect()
		StoppedConnections[Character] = nil
	end
	if EmoteSkinningDisableCleanupCharacterConnections and AnimationPlayedConnections[Character] then
		AnimationPlayedConnections[Character]:Disconnect()
		AnimationPlayedConnections[Character] = nil
	end
end

local _ = function(p1, p2)
	-- upvalues: getClipMetadata (copy), ScaledUGCEmoteSkinningDisableTranslationThresholdMillistuds (copy), StoppedConnections (copy), setAllJointsSkinning (copy)
	local Animation = p2.Animation
	
	if not Animation then return end
	local AnimationId = Animation.AnimationId
	
	if AnimationId ~= "" then
		task.spawn(function()
			-- upvalues: getClipMetadata (upval), AnimationId (copy), ScaledUGCEmoteSkinningDisableTranslationThresholdMillistuds (upval), p2 (copy), p1 (copy), StoppedConnections (upval), setAllJointsSkinning (upval)
			local v1 = getClipMetadata(AnimationId)
			
			if not v1 or not v1.isUGCEmote then return end
			if v1.maxTranslation <= ScaledUGCEmoteSkinningDisableTranslationThresholdMillistuds then return end
			if not p2.IsPlaying then return end
			if StoppedConnections[p1] then
				StoppedConnections[p1]:Disconnect()
				StoppedConnections[p1] = nil
			end
			setAllJointsSkinning(p1, false)
			StoppedConnections[p1] = p2.Stopped:Connect(function()
				-- upvalues: setAllJointsSkinning (upval), p1 (upval), StoppedConnections (upval)
				setAllJointsSkinning(p1, true)
				
				if StoppedConnections[p1] then
					StoppedConnections[p1]:Disconnect()
					StoppedConnections[p1] = nil
				end
			end)
		end)
		
		return
	end
end

local function onCharacterAdded(Character)
	-- upvalues: EmoteSkinningDisableUseClassLookup (copy), getClipMetadata (copy), ScaledUGCEmoteSkinningDisableTranslationThresholdMillistuds (copy), StoppedConnections (copy), setAllJointsSkinning (copy), EmoteSkinningDisableCleanupCharacterConnections (copy), AnimationPlayedConnections (copy)
	local Animator = nil
	if EmoteSkinningDisableUseClassLookup then
		local Humanoid = Character:FindFirstChildOfClass("Humanoid")
		
		if not Humanoid then return end
		Animator = Humanoid:FindFirstChildOfClass("Animator")
		
		if not Animator then return end
	else
		Animator = Character:WaitForChild("Humanoid"):WaitForChild("Animator")
	end
	local AnimationPlayedConnection = Animator.AnimationPlayed:Connect(function(AnimationTrack)
		-- upvalues: Character (copy), getClipMetadata (upval), ScaledUGCEmoteSkinningDisableTranslationThresholdMillistuds (upval), StoppedConnections (upval), setAllJointsSkinning (upval)
		local Animation = AnimationTrack.Animation
		
		if not Animation then return end
		local AnimationId = Animation.AnimationId
		
		if AnimationId ~= "" then
			task.spawn(function()
				-- upvalues: getClipMetadata (upval), AnimationId (copy), ScaledUGCEmoteSkinningDisableTranslationThresholdMillistuds (upval), AnimationTrack (copy), Character (copy), StoppedConnections (upval), setAllJointsSkinning (upval)
				local v1 = getClipMetadata(AnimationId)
				
				if not v1 or not v1.isUGCEmote then return end
				if v1.maxTranslation <= ScaledUGCEmoteSkinningDisableTranslationThresholdMillistuds then return end
				if not AnimationTrack.IsPlaying then return end
				if StoppedConnections[Character] then
					StoppedConnections[Character]:Disconnect()
					StoppedConnections[Character] = nil
				end
				setAllJointsSkinning(Character, false)
				StoppedConnections[Character] = AnimationTrack.Stopped:Connect(function()
					-- upvalues: setAllJointsSkinning (upval), Character (upval), StoppedConnections (upval)
					setAllJointsSkinning(Character, true)
					
					if StoppedConnections[Character] then
						StoppedConnections[Character]:Disconnect()
						StoppedConnections[Character] = nil
					end
				end)
			end)
			
			return
		end
	end)
	
	if EmoteSkinningDisableCleanupCharacterConnections then
		if AnimationPlayedConnections[Character] then
			AnimationPlayedConnections[Character]:Disconnect()
			AnimationPlayedConnections[Character] = nil
		end
		AnimationPlayedConnections[Character] = AnimationPlayedConnection
	end
end

local function onPlayerAdded(Player: Player)
	-- upvalues: onCharacterAdded (copy), onCharacterRemoving (copy)
	if Player.Character then
		onCharacterAdded(Player.Character)
	end
	Player.CharacterAdded:Connect(onCharacterAdded)
	Player.CharacterRemoving:Connect(onCharacterRemoving)
end

for _, player in Players:GetPlayers() do
	task.spawn(onPlayerAdded, player)
end
Players.PlayerAdded:Connect(onPlayerAdded)