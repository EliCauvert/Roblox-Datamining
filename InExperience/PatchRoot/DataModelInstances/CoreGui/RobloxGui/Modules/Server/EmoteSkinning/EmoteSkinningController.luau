local Flags = script.Parent.Parent.Parent.Common.Flags
local FFlagEmoteSkinningDisableUseClassLookupModule = require(Flags.FFlagEmoteSkinningDisableUseClassLookup)
local FFlagEmoteSkinningDisableCleanupCharacterConnectionsModule = require(Flags.FFlagEmoteSkinningDisableCleanupCharacterConnections)
local FIntUGCEmoteSkinningDisableTranslationThresholdMillistudsModule = require(Flags.FIntUGCEmoteSkinningDisableTranslationThresholdMillistuds)

return {
	new = function(p1)
		-- upvalues: FIntUGCEmoteSkinningDisableTranslationThresholdMillistudsModule (copy), FFlagEmoteSkinningDisableCleanupCharacterConnectionsModule (copy), FFlagEmoteSkinningDisableUseClassLookupModule (copy)
		local Players = p1.Players
		local InsertService = p1.InsertService
		local Spawn = p1.spawn or task.spawn
		local TranslationThreshold = p1.translationThreshold or FIntUGCEmoteSkinningDisableTranslationThresholdMillistudsModule * 0.001
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
			-- upvalues: StoppedConnections (copy), FFlagEmoteSkinningDisableCleanupCharacterConnectionsModule (upval), AnimationPlayedConnections (copy)
			if StoppedConnections[Character] then
				StoppedConnections[Character]:Disconnect()
				StoppedConnections[Character] = nil
			end
			if FFlagEmoteSkinningDisableCleanupCharacterConnectionsModule and AnimationPlayedConnections[Character] then
				AnimationPlayedConnections[Character]:Disconnect()
				AnimationPlayedConnections[Character] = nil
			end
		end
		
		local _ = function(p2, p3)
			-- upvalues: Spawn (copy), getClipMetadata (copy), TranslationThreshold (copy), StoppedConnections (copy), setAllJointsSkinning (copy)
			local Animation = p3.Animation
			
			if not Animation then return end
			local AnimationId = Animation.AnimationId
			
			if AnimationId ~= "" then
				Spawn(function()
					-- upvalues: getClipMetadata (upval), AnimationId (copy), TranslationThreshold (upval), p3 (copy), p2 (copy), StoppedConnections (upval), setAllJointsSkinning (upval)
					local v1 = getClipMetadata(AnimationId)
					
					if not v1 or not v1.isUGCEmote then return end
					if v1.maxTranslation <= TranslationThreshold then return end
					if not p3.IsPlaying then return end
					if StoppedConnections[p2] then
						StoppedConnections[p2]:Disconnect()
						StoppedConnections[p2] = nil
					end
					setAllJointsSkinning(p2, false)
					StoppedConnections[p2] = p3.Stopped:Connect(function()
						-- upvalues: setAllJointsSkinning (upval), p2 (upval), StoppedConnections (upval)
						setAllJointsSkinning(p2, true)
						
						if StoppedConnections[p2] then
							StoppedConnections[p2]:Disconnect()
							StoppedConnections[p2] = nil
						end
					end)
				end)
				
				return
			end
		end
		
		local function onCharacterAdded(Character)
			-- upvalues: FFlagEmoteSkinningDisableUseClassLookupModule (upval), Spawn (copy), getClipMetadata (copy), TranslationThreshold (copy), StoppedConnections (copy), setAllJointsSkinning (copy), FFlagEmoteSkinningDisableCleanupCharacterConnectionsModule (upval), AnimationPlayedConnections (copy)
			local Animator = nil
			if FFlagEmoteSkinningDisableUseClassLookupModule then
				local Humanoid = Character:FindFirstChildOfClass("Humanoid")
				
				if not Humanoid then return end
				Animator = Humanoid:FindFirstChildOfClass("Animator")
				
				if not Animator then return end
			else
				Animator = Character:WaitForChild("Humanoid"):WaitForChild("Animator")
			end
			local AnimationPlayedConnection = Animator.AnimationPlayed:Connect(function(AnimationTrack)
				-- upvalues: Character (copy), Spawn (upval), getClipMetadata (upval), TranslationThreshold (upval), StoppedConnections (upval), setAllJointsSkinning (upval)
				local Animation = AnimationTrack.Animation
				
				if not Animation then return end
				local AnimationId = Animation.AnimationId
				
				if AnimationId ~= "" then
					Spawn(function()
						-- upvalues: getClipMetadata (upval), AnimationId (copy), TranslationThreshold (upval), AnimationTrack (copy), Character (copy), StoppedConnections (upval), setAllJointsSkinning (upval)
						local v1 = getClipMetadata(AnimationId)
						
						if not v1 or not v1.isUGCEmote then return end
						if v1.maxTranslation <= TranslationThreshold then return end
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
			
			if FFlagEmoteSkinningDisableCleanupCharacterConnectionsModule then
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
		
		return {
			start = function()
				-- upvalues: Players (copy), Spawn (copy), onPlayerAdded (copy)
				for _, player in Players:GetPlayers() do
					Spawn(onPlayerAdded, player)
				end
				Players.PlayerAdded:Connect(onPlayerAdded)
			end,
			onPlayerAdded = onPlayerAdded,
			onCharacterAdded = onCharacterAdded,
			onCharacterRemoving = onCharacterRemoving,
			getClipMetadata = getClipMetadata,
			hasActiveEmote = function(p2): boolean
				-- upvalues: StoppedConnections (copy)
				return StoppedConnections[p2] ~= nil
			end,
			hasAnimationPlayedConnection = function(p2): boolean
				-- upvalues: AnimationPlayedConnections (copy)
				return AnimationPlayedConnections[p2] ~= nil
			end
		}
	end
}