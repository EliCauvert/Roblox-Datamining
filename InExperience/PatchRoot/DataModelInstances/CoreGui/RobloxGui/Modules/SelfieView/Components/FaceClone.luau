local CorePackages = game:GetService("CorePackages")
local ModelUtilsModule = require(script.Parent.Parent.Utils.ModelUtils)
local UserInputService = game:GetService("UserInputService")
local FaceAnimatorService = game:FindService("FaceAnimatorService")
local CharacterUtility = require(CorePackages.Packages.Thumbnailing).CharacterUtility
local CFrameUtility = require(CorePackages.Packages.Thumbnailing).CFrameUtility
local AnimatorAndADFRefactorEngineFeature = game:GetEngineFeature("AnimatorAndADFRefactor")
local PlayerViewRemoteEventSupportEngineFeature = game:GetEngineFeature("PlayerViewRemoteEventSupport")
local TrackerStreamAnimation = nil
local StreamAnimationV2 = nil
local SelfViewNewPoseSynchronization = game:DefineFastFlag("SelfViewNewPoseSynchronization", false)
local DebugSelfViewPerfBenchmark = game:DefineFastFlag("DebugSelfViewPerfBenchmark", false)
local GetFFlagSelfViewVisibilityFixFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagSelfViewVisibilityFix
local RunService = game:GetService("RunService")
local Y = 1.31
local Total = 0
local Connection = nil
local CharacterAddedConnection = nil
local StoppedConnections = {}
local t = {}
local Animator = nil
local AnimationTracks = {}
local AnimationTracks1 = {}
local Color = nil
local Size = nil
local Viewport = nil
local Camera = nil
local VectorDelta: vector = vector.create(1.1720999479293823, 1.1811000108718872, 1.1577999591827393)
local Object = nil
local Copy = nil
local Head = nil
local Copy1 = nil
local Neck = nil
local _CFrame = nil
local Object1 = nil
local v1 = nil
local Object2 = nil
local Flag = false
local Count = 0
local Player = {}
local config = {
	AnimationPlayed = "AnimationPlayed",
	AnimationPlayedCoreScript = "AnimationPlayedCoreScript",
	DescendantAdded = "DescendantAdded",
	DescendantRemoving = "DescendantRemoving",
	HeadSize = "HeadSize",
	Color = "Color",
	CharacterAdded = "CharacterAdded",
	CharacterRemoving = "CharacterRemoving",
	HumanoidStateChanged = "HumanoidStateChanged",
	FaceControlsChanged = "FaceControlsChanged"
}
local Players = game:GetService("Players")

if not Players.LocalPlayer then
	warn("Players.LocalPlayer does not exist")
end
local LocalPlayer = Players.LocalPlayer
local Flag1 = false

function setCloneDirty(p1)
	-- upvalues: Total (ref)
	if p1 then
		Total = 0.35
		
		return
	else
		Total = 0
	end
end

function createCloneAnchor()
	-- upvalues: Object (ref), Viewport (ref)
	if Object ~= nil then
		Object:Destroy()
		Object = nil
	end
	local WorldModel = Instance.new("WorldModel")
	WorldModel.Parent = Viewport
	Object = WorldModel
end

local function _(Key)
	-- upvalues: Player (copy)
	if Player[Key] then
		Player[Key]:Disconnect()
		Player[Key] = nil
	end
end

function clearCloneCharacter()
	-- upvalues: Copy (ref), Object (ref)
	if Copy then
		Copy:Destroy()
		Copy = nil
	end
	if not Object then
		warn("cloneAnchor is nil, this shouldn't be possible")
		
		return
	end
	assert(Object ~= nil)
	local SelfAvatar = Object:FindFirstChild("SelfAvatar")
	
	if SelfAvatar then
		SelfAvatar:Destroy()
	end
	createCloneAnchor()
end

local function clearClone()
	-- upvalues: Player (copy), AnimationTracks (ref), StreamAnimationV2 (ref), Animator (ref)
	stopRenderStepped()
	
	if Player.AnimationPlayed then
		Player.AnimationPlayed:Disconnect()
		Player.AnimationPlayed = nil
	end
	if Player.AnimationPlayedCoreScript then
		Player.AnimationPlayedCoreScript:Disconnect()
		Player.AnimationPlayedCoreScript = nil
	end
	for _, animationTrack in AnimationTracks do
		if animationTrack then
			animationTrack:Stop(0)
		end
	end
	if StreamAnimationV2 then
		StreamAnimationV2:Stop(0)
		StreamAnimationV2 = nil
	end
	Animator = nil
	AnimationTracks = {}
	clearCloneCharacter()
end

local function syncTrack(Animator, Key)
	-- upvalues: StreamAnimationV2 (ref), TrackerStreamAnimation (ref), LocalPlayer (copy), StoppedConnections (copy)
	if not Animator or not Key.Animation then return end
	local v2 = nil
	
	if not Key.Animation or not Key.Animation:IsA("Animation") then
		if Key.Animation and Key.Animation:IsA("TrackerStreamAnimation") then
			if StreamAnimationV2 then
				StreamAnimationV2:Stop(0)
			end
			TrackerStreamAnimation = Instance.new("TrackerStreamAnimation")
			assert(TrackerStreamAnimation ~= nil)
			StreamAnimationV2 = if game:GetEngineFeature("UseNewLoadStreamAnimationAPI") then Animator:LoadStreamAnimationV2(TrackerStreamAnimation, LocalPlayer, false, false) else Animator:LoadStreamAnimationForSelfieView_deprecated(TrackerStreamAnimation, LocalPlayer)
			v2 = StreamAnimationV2
		else
			warn("No animation to clone in SelfView")
		end
	end
	if v2 then
		v2:Play()
		v2.Priority = Key.Priority
		StoppedConnections[Key] = Key.Stopped:Connect(function()
			-- upvalues: v2 (ref), StoppedConnections (upval), Key (copy)
			v2:Stop(0)
			
			if StoppedConnections[Key] then
				StoppedConnections[Key]:Disconnect()
			end
		end)
	end
end

local function updateClone(Player1: Player)
	-- upvalues: clearClone (copy), ModelUtilsModule (copy), Copy (ref), t (copy), Object (ref), Camera (ref), CFrameUtility (copy), CharacterUtility (copy), VectorDelta (ref), Y (ref), Copy1 (ref), Neck (ref), _CFrame (ref), Animator (ref), AnimatorAndADFRefactorEngineFeature (copy), SelfViewNewPoseSynchronization (copy), TrackerStreamAnimation (ref), syncTrack (copy), Player (copy)
	clearClone()
	
	if not Player1 then return end
	assert(Player1 ~= nil)
	startRenderStepped(Player1)
	local _ = Player1.Character
	
	if not Player1 or not Player1.Character then return end
	local Character = Player1.Character
	
	if not Character then return end
	assert(Character ~= nil)
	local Animator1 = ModelUtilsModule.getAnimator(Character, 10)
	clearCloneCharacter()
	local Archivable = Character.Archivable
	Character.Archivable = true
	local Head = ModelUtilsModule.getHead(Character)
	
	if not Head then return end
	Copy = Character:Clone()
	
	if Copy == nil then return end
	assert(Copy ~= nil)
	ModelUtilsModule.resetPartOrientation(Copy)
	ModelUtilsModule.updateTransparency(Copy, t)
	ModelUtilsModule.removeTags(Copy)
	Copy.Name = "SelfAvatar"
	ModelUtilsModule.removeScripts(Copy)
	ModelUtilsModule.sanitizeCharacter(Copy)
	Character.Archivable = Archivable
	Copy.Parent = Object
	local HumanoidRootPart = Copy:FindFirstChild("HumanoidRootPart")
	
	if HumanoidRootPart then
		HumanoidRootPart.CFrame = CFrame.new(vector.create(0, 0, 0))
		assert(Camera ~= nil)
		
		if Head then
			local Head1 = ModelUtilsModule.getHead(Copy)
			
			if Head1 then
				assert(Head1 ~= nil)
				local HeadExtents, HeadExtents2 = CharacterUtility.CalculateHeadExtents(Copy, (CFrameUtility.CalculateTargetCFrame(Head1.CFrame)))
				VectorDelta = Vector3.new(HeadExtents2.X, HeadExtents2.Y, HeadExtents2.Z) - Vector3.new(HeadExtents.X, HeadExtents.Y, HeadExtents.Z)
				assert(VectorDelta ~= nil)
				Y = Head1.Size.Y
				local _ = math.min(VectorDelta.X, VectorDelta.Y)
				local Smallest = math.min(VectorDelta.X, VectorDelta.Z)
				local Model = Instance.new("Model")
				Model.Parent = Copy
				Character.Archivable = true
				Copy1 = ModelUtilsModule.getHead(Copy):Clone()
				assert(Copy1 ~= nil)
				Copy1.CanCollide = false
				Copy1.Parent = Model
				Neck = ModelUtilsModule.getNeck(Copy, Copy1)
				_CFrame = Copy1.CFrame
				Copy1:Destroy()
				assert(_CFrame ~= nil)
				Camera.CFrame = CFrame.lookAt(_CFrame.Position + _CFrame.LookVector * (Smallest * 2) + vector.create(0, 0.10499999672174454, -0.25), _CFrame.Position)
				Camera.Focus = _CFrame
				Character.Archivable = Archivable
				Model:Destroy()
			end
		else
			Camera.CFrame = CFrame.lookAt(HumanoidRootPart.Position + HumanoidRootPart.CFrame.LookVector * 2.5 + vector.create(0, 1.5, 0), HumanoidRootPart.Position)
			Camera.CFrame = CFrame.new(Camera.CFrame.Position) * CFrame.Angles(-0.0006981317007977319, 3.141592653589793, 0)
		end
	end
	if Copy == nil then return end
	local Humanoid = Copy:FindFirstChildWhichIsA("Humanoid")
	
	if Humanoid then
		Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	end
	Animator = ModelUtilsModule.getAnimator(Copy, 0)
	
	if Animator then
		if not AnimatorAndADFRefactorEngineFeature or not SelfViewNewPoseSynchronization then
			local PlayingAnimationTracksCoreScript = Animator:GetPlayingAnimationTracksCoreScript()
			
			for _, playingAnimationTrack in ipairs((Animator:GetPlayingAnimationTracks())) do
				if playingAnimationTrack ~= nil then
					playingAnimationTrack:Stop(0)
					playingAnimationTrack:Destroy()
				end
			end
			for _, value1 in ipairs(PlayingAnimationTracksCoreScript) do
				if value1 ~= nil then
					value1:Stop(0)
					value1:Destroy()
				end
			end
			if TrackerStreamAnimation then
				TrackerStreamAnimation:Destroy()
				TrackerStreamAnimation = nil
			end
		end
		if Animator1 then
			if AnimatorAndADFRefactorEngineFeature and SelfViewNewPoseSynchronization then
				Animator:SynchronizeWith(Animator1)
			else
				for _, value in ipairs(Animator1:GetPlayingAnimationTracksCoreScript()) do
					syncTrack(Animator, value)
				end
				Player.AnimationPlayedCoreScript = Animator1.AnimationPlayedCoreScript:Connect(function(AnimationTrack)
					-- upvalues: syncTrack (upval), Animator (upval)
					syncTrack(Animator, AnimationTrack)
				end)
			end
			setCloneDirty(false)
			
			return
		end
	end
end

local _ = function(p1, p2)
	local _ = p1[p2]
end

function updateCachedHeadColor(p1)
	-- upvalues: Color (ref), Size (ref)
	if p1 == nil then return end
	assert(p1 ~= nil)
	
	if pcall(function()
		-- upvalues: p1 (copy)
		local _ = p1.Color
	end) then
		Color = p1.Color
		
		if pcall(function()
			-- upvalues: p1 (copy)
			local _ = p1.Size
		end) then
			Size = p1.Size
		end
	end
end

local _ = function(Humanoid)
	-- upvalues: Player (copy)
	if not Humanoid then return end
	if not Player.HumanoidStateChanged then
		Player.HumanoidStateChanged = Humanoid.StateChanged:Connect(function(OldState, NewState)
			if OldState == Enum.HumanoidStateType.PlatformStanding and NewState == Enum.HumanoidStateType.Running then
				setCloneDirty(true)
			end
			if NewState == Enum.HumanoidStateType.GettingUp then
				setCloneDirty(true)
			end
		end)
	end
end

local _ = function(FaceControls)
	-- upvalues: Player (copy)
	if not Player.FaceControlsChanged then
		Player.FaceControlsChanged = FaceControls.InternalFacsOverrideChanged:Connect(function()
			setCloneDirty(true)
		end)
	end
end

local function characterAdded(Character)
	-- upvalues: Viewport (ref), Object1 (ref), Head (ref), ModelUtilsModule (copy), Player (copy), config (copy), Flag (ref)
	if Viewport == nil or Object1 == nil then return end
	if not Character then return end
	Head = ModelUtilsModule.getHead(Character)
	updateCachedHeadColor(Head)
	
	if Player.DescendantAdded then
		Player.DescendantAdded:Disconnect()
		Player.DescendantAdded = nil
	end
	if Player.DescendantRemoving then
		Player.DescendantRemoving:Disconnect()
		Player.DescendantRemoving = nil
	end
	if Player.HeadSize then
		Player.HeadSize:Disconnect()
		Player.HeadSize = nil
	end
	if Player.Color then
		Player.Color:Disconnect()
		Player.Color = nil
	end
	local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
	
	if Humanoid and Humanoid and not Player[config.HumanoidStateChanged] then
		Player[config.HumanoidStateChanged] = Humanoid.StateChanged:Connect(function(OldState, NewState)
			if OldState == Enum.HumanoidStateType.PlatformStanding and NewState == Enum.HumanoidStateType.Running then
				setCloneDirty(true)
			end
			if NewState == Enum.HumanoidStateType.GettingUp then
				setCloneDirty(true)
			end
		end)
	end
	local FaceControls = Character:FindFirstChildWhichIsA("FaceControls", true)
	
	if FaceControls and not Player[config.FaceControlsChanged] then
		Player[config.FaceControlsChanged] = FaceControls.InternalFacsOverrideChanged:Connect(function()
			setCloneDirty(true)
		end)
	end
	Player.DescendantAdded = Character.DescendantAdded:Connect(function(Descendant: Humanoid)
		-- upvalues: Viewport (upval), Object1 (upval), Head (upval), ModelUtilsModule (upval), Character (copy), Player (upval), config (upval)
		if Viewport == nil or Object1 == nil then return end
		if Descendant.Name == "Head" then
			Head = ModelUtilsModule.getHead(Character)
			updateCachedHeadColor(Head)
		end
		if Descendant:IsA("Humanoid") and Descendant and not Player[config.HumanoidStateChanged] then
			Player[config.HumanoidStateChanged] = Descendant.StateChanged:Connect(function(OldState, NewState)
				if OldState == Enum.HumanoidStateType.PlatformStanding and NewState == Enum.HumanoidStateType.Running then
					setCloneDirty(true)
				end
				if NewState == Enum.HumanoidStateType.GettingUp then
					setCloneDirty(true)
				end
			end)
		end
		if Descendant:IsA("FaceControls") and not Player[config.FaceControlsChanged] then
			Player[config.FaceControlsChanged] = Descendant.InternalFacsOverrideChanged:Connect(function()
				setCloneDirty(true)
			end)
		end
		if ModelUtilsModule.shouldMarkCloneDirtyForDescendant(Descendant) then
			setCloneDirty(true)
		end
	end)
	Player.DescendantRemoving = Character.DescendantRemoving:Connect(function(Descendant)
		-- upvalues: Viewport (upval), Object1 (upval), ModelUtilsModule (upval)
		if Viewport == nil or Object1 == nil then return end
		if Descendant and (Descendant:IsA("MeshPart") or Descendant:IsA("Accessory")) then
			if Descendant:IsA("MeshPart") and Descendant.MeshId == "" then return end
			if ModelUtilsModule.shouldMarkCloneDirtyForDescendant(Descendant) then
				setCloneDirty(true)
			end
		end
	end)
	setCloneDirty(true)
	Flag = true
end

local function createViewport()
	-- upvalues: Viewport (ref), Object1 (ref), Camera (ref)
	if Viewport then
		Viewport:Destroy()
	end
	Viewport = Instance.new("ViewportFrame")
	Viewport.Position = UDim2.new(0, 0, 0, 0)
	Viewport.Size = UDim2.new(1, 0, 1, 0)
	Viewport.BackgroundTransparency = 1
	Viewport.Parent = Object1
	Viewport.Ambient = Color3.new(0.7529411765, 0.7098039216, 0.7137254902)
	Viewport.LightColor = Color3.new(1, 0.9960784314, 0.9960784314)
	Viewport.LightDirection = vector.create(9.5, -12, 7.5)
	Viewport.IsMirrored = true
	local _ = Instance.new("UICorner")
	Instance.new("UICorner").Parent = Viewport
	createCloneAnchor()
	
	if Object1 then
		Object1.Destroying:Connect(clearViewportFrame)
	end
	Camera = Instance.new("Camera")
	assert(Camera ~= nil)
	Camera.FieldOfView = 70
	Viewport.CurrentCamera = Camera
	Camera.Parent = Viewport
end

function ReInit(Player1: Player)
	-- upvalues: GetFFlagSelfViewVisibilityFixFunction (copy), Object2 (ref), Flag1 (ref), Head (ref), ModelUtilsModule (copy), Player (copy), clearClone (copy), createViewport (copy)
	assert(Player1.Character ~= nil)
	
	if GetFFlagSelfViewVisibilityFixFunction() and Object2 and not Object2.Visible then
		Flag1 = false
		
		return
	end
	Head = ModelUtilsModule.getHead(Player1.Character)
	updateCachedHeadColor(Head)
	setCloneDirty(false)
	
	if Player.CharacterAdded then
		Player.CharacterAdded:Disconnect()
		Player.CharacterAdded = nil
	end
	if Player.CharacterRemoving then
		Player.CharacterRemoving:Disconnect()
		Player.CharacterRemoving = nil
	end
	clearClone()
	createViewport()
	playerAdded(Player1)
	startRenderStepped(Player1)
end

local function onCharacterAdded(Character)
	-- upvalues: CharacterAddedConnection (ref), Flag (ref), characterAdded (copy), LocalPlayer (copy), Player (copy), config (copy)
	if CharacterAddedConnection then
		CharacterAddedConnection:Disconnect()
	end
	if Flag then
		ReInit(LocalPlayer)
	else
		characterAdded(Character)
	end
	if Player.HumanoidStateChanged then
		Player.HumanoidStateChanged:Disconnect()
		Player.HumanoidStateChanged = nil
	end
	local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
	
	if Humanoid then
		if not Humanoid then return end
		if not Player[config.HumanoidStateChanged] then
			Player[config.HumanoidStateChanged] = Humanoid.StateChanged:Connect(function(OldState, NewState)
				if OldState == Enum.HumanoidStateType.PlatformStanding and NewState == Enum.HumanoidStateType.Running then
					setCloneDirty(true)
				end
				if NewState == Enum.HumanoidStateType.GettingUp then
					setCloneDirty(true)
				end
			end)
		end
	end
end

local _ = function(AncestorName)
	-- upvalues: Object1 (ref)
	if not AncestorName then
		return nil
	elseif Object1 then
		assert(Object1 ~= nil, "Wrapper Frame cannot be nil")
		assert(AncestorName ~= nil, "Frame name cannot be nil ")
		
		return Object1:FindFirstAncestor(AncestorName)
	else
		return nil
	end
end

function clearViewportFrame()
	-- upvalues: Viewport (ref), Object1 (ref)
	if Viewport then
		Viewport:Destroy()
	end
	Object1 = nil
	stopRenderStepped()
end

local function onOuterContainerVisibilityChanged()
	-- upvalues: Object2 (ref), Flag (ref), Flag1 (ref)
	if Object2 then
		if not Object2.Visible then
			Flag1 = false
		elseif Flag then
			Flag1 = true
			
			return
		else
			return
		end
	end
end

function playerAdded(Player1: Player)
	-- upvalues: LocalPlayer (copy), CharacterAddedConnection (ref), Player (copy), onCharacterAdded (copy), characterAdded (copy), clearClone (copy)
	if Player1 ~= nil and Player1 == LocalPlayer then
		if CharacterAddedConnection ~= nil then
			CharacterAddedConnection:Disconnect()
			CharacterAddedConnection = nil
			
			if Player.CharacterAdded then
				Player.CharacterAdded:Disconnect()
				Player.CharacterAdded = nil
			end
		end
		local _ = Player1.Character
		local Character = Player1.Character
		CharacterAddedConnection = Player1.CharacterAdded:Connect(onCharacterAdded)
		
		if Character then
			characterAdded(Character)
		end
		Player.CharacterAdded = Player1.CharacterAdded:Connect(characterAdded)
		Player.CharacterRemoving = Player1.CharacterRemoving:Connect(function()
			-- upvalues: Player (upval), clearClone (upval)
			if Player.DescendantAdded then
				Player.DescendantAdded:Disconnect()
				Player.DescendantAdded = nil
			end
			if Player.DescendantRemoving then
				Player.DescendantRemoving:Disconnect()
				Player.DescendantRemoving = nil
			end
			if Player.HeadSize then
				Player.HeadSize:Disconnect()
				Player.HeadSize = nil
			end
			if Player.Color then
				Player.Color:Disconnect()
				Player.Color = nil
			end
			clearClone()
			
			if Player.CharacterRemoving then
				Player.CharacterRemoving:Disconnect()
				Player.CharacterRemoving = nil
			end
		end)
	end
end

function stopRenderStepped()
	-- upvalues: Connection (ref)
	if Connection then
		Connection:Disconnect()
		Connection = nil
	end
end

function updateClonePartsColor(p1)
	-- upvalues: Head (ref), Color (ref), LocalPlayer (copy), Copy (ref)
	if pcall(function()
		-- upvalues: Head (upval)
		local _ = Head.Color
	end) and Head and Head.Color ~= Color then
		local Character = LocalPlayer.Character
		
		if not Character then return end
		assert(Character ~= nil)
		
		if not Copy then return end
		assert(Copy ~= nil)
		
		for _, Part in pairs(Character:GetChildren()) do
			if Part:IsA("MeshPart") then
				local Name = Copy:FindFirstChild(Part.Name)
				
				if Name and Name:IsA("MeshPart") and Name.Color and Part.Color then
					Name.Color = Part.Color
				end
			end
		end
	end
	Color = p1
end

function startRenderStepped(Player)
	-- upvalues: DebugSelfViewPerfBenchmark (copy), RunService (copy), Connection (ref), GetFFlagSelfViewVisibilityFixFunction (copy), Copy (ref), Object2 (ref), Flag1 (ref), Animator (ref), LocalPlayer (copy), Head (ref), ModelUtilsModule (copy), AnimationTracks1 (ref), AnimationTracks (ref), UserInputService (copy), Count (ref), Copy1 (ref), Neck (ref), _CFrame (ref), Camera (ref), VectorDelta (ref), FaceAnimatorService (copy), PlayerViewRemoteEventSupportEngineFeature (copy), Y (ref), Size (ref), Color (ref), Total (ref), updateClone (copy)
	stopRenderStepped()
	Connection = (if DebugSelfViewPerfBenchmark then RunService.Heartbeat else RunService.RenderStepped):Connect(function(Amount: number)
		-- upvalues: DebugSelfViewPerfBenchmark (upval), GetFFlagSelfViewVisibilityFixFunction (upval), Copy (upval), Object2 (upval), Flag1 (upval), Animator (upval), LocalPlayer (upval), Head (upval), ModelUtilsModule (upval), AnimationTracks1 (upval), AnimationTracks (upval), UserInputService (upval), Count (upval), Copy1 (upval), Neck (upval), _CFrame (upval), Camera (upval), VectorDelta (upval), FaceAnimatorService (upval), PlayerViewRemoteEventSupportEngineFeature (upval), Y (upval), Size (upval), Color (upval), Total (upval), updateClone (upval), Player (copy)
		if DebugSelfViewPerfBenchmark then
			debug.profilebegin("faceclone")
		end
		if GetFFlagSelfViewVisibilityFixFunction() and Copy and Object2 and not Flag1 then
			if Animator ~= nil then
				for _, playingAnimationTrack in pairs((Animator:GetPlayingAnimationTracks())) do
					if playingAnimationTrack ~= nil then
						playingAnimationTrack:Stop(0)
					end
				end
			end
			return
		else
			if LocalPlayer then
				local Character = LocalPlayer.Character
				
				if not Character or Character.Parent == nil then return end
				assert(Character ~= nil)
				
				if Head == nil or Head.Parent ~= Character then
					Head = ModelUtilsModule.getHead(Character)
				end
				if Head then
					local Animator1 = ModelUtilsModule.getAnimator(Character, 0)
					
					if Animator ~= nil and Animator1 ~= nil then
						assert(Animator ~= nil)
						
						for _, playingAnimationTrack1 in pairs((Animator:GetPlayingAnimationTracks())) do
							if playingAnimationTrack1 ~= nil then
								playingAnimationTrack1:Stop(0)
							end
						end
						AnimationTracks1 = {}
						
						for _, playingAnimationTrack2 in ipairs((Animator1:GetPlayingAnimationTracks())) do
							local Animation = playingAnimationTrack2.Animation
							
							if Animation and Animation:IsA("Animation") and Animation.AnimationId ~= "" then
								AnimationTracks1[Animation.AnimationId] = playingAnimationTrack2
								
								if not AnimationTracks[Animation.AnimationId] then
									AnimationTracks[Animation.AnimationId] = Animator:LoadAnimation(Animation)
								end
								local AnimationTrack = AnimationTracks[Animation.AnimationId]
								assert(AnimationTrack ~= nil)
								AnimationTrack:Play()
								AnimationTrack.TimePosition = playingAnimationTrack2.TimePosition
								AnimationTrack.Priority = playingAnimationTrack2.Priority
								AnimationTrack:AdjustWeight(playingAnimationTrack2.WeightCurrent, 0.1)
							end
						end
						for animationTrack in AnimationTracks do
							local AnimationTrack = AnimationTracks[animationTrack]
							
							if AnimationTrack then
								local Animation = AnimationTrack.Animation
								
								if Animation and not AnimationTracks1[Animation.AnimationId] then
									local AnimationTrack1 = AnimationTracks[Animation.AnimationId]
									
									if AnimationTrack1 ~= nil then
										AnimationTrack1:Stop(0)
									end
									AnimationTracks[Animation.AnimationId] = nil
								end
							end
						end
						for _, AnimationTrack in ipairs(Animator1:GetPlayingAnimationTracksCoreScript()) do
							for _, AnimationTrack1 in pairs((Animator:GetPlayingAnimationTracksCoreScript())) do
								if AnimationTrack1.Animation:IsA("TrackerStreamAnimation") then
									AnimationTrack1.Priority = AnimationTrack.Priority
									AnimationTrack1:AdjustWeight(AnimationTrack.WeightCurrent, 0)
								end
							end
						end
					end
				end
				local CF = nil
				local Platform = UserInputService:GetPlatform()
				
				if (Platform == Enum.Platform.IOS or Platform == Enum.Platform.Android) and Animator ~= nil then
					for _, value in pairs((Animator:GetPlayingAnimationTracksCoreScript())) do
						if value.Animation:IsA("TrackerStreamAnimation") then
							local _, _
							_, CF, _ = value:GetTrackerData()
						end
					end
				end
				Count += 1
				
				if Count == 1 then
					Count = 0
					
					if Copy then
						if not Copy1 then
							Copy1 = ModelUtilsModule.getHead(Copy)
							
							if Copy1 then
								Neck = ModelUtilsModule.getNeck(Copy, Copy1)
							end
						end
						if Copy1 then
							_CFrame = Copy1.CFrame
						end
					end
					if Camera and Copy1 then
						local Position = Copy1.Position
						local Position1 = Copy1.Position
						local _ = Copy1.CFrame
						
						if Neck then
							local Part0 = Neck.Part0
							local _ = Neck.Part1
							local C0 = Neck.C0
							local C1 = Neck.C1
							local Transform = Neck.Transform
							
							if Part0 and C0 then
								local ScaledC = Part0.CFrame * C0 * Transform * C1:Inverse()
								Position1 = Vector3.new(ScaledC.Position.X * 0.25, (Copy1.CFrame.Position.Y + ScaledC.Position.Y + ScaledC.Position.Y * 0.75) * 0.33333, ScaledC.Position.Z)
								Position = Vector3.new(ScaledC.Position.X * 0.6, (Copy1.CFrame.Position.Y + ScaledC.Position.Y + ScaledC.Position.Y * 0.75) * 0.33333, ScaledC.Position.Z)
							end
						end
						if not VectorDelta then
							warn("boundsSize is nil, this shouldn't be possible")
						end
						assert(VectorDelta ~= nil)
						
						if FaceAnimatorService and FaceAnimatorService.VideoAnimationEnabled and (CF ~= nil or PlayerViewRemoteEventSupportEngineFeature) then
							if PlayerViewRemoteEventSupportEngineFeature then
								local DeviceCameraCFrameForSelfView = game:GetService("PlayerViewService"):GetDeviceCameraCFrameForSelfView()
								local Position2 = DeviceCameraCFrameForSelfView.Position
								local Rx, Ry, Rz = DeviceCameraCFrameForSelfView:ToEulerAnglesYXZ()
								local Negated = -(VectorDelta.Z + 1)
								Camera.CFrame = Camera.CFrame:Lerp(CFrame.lookAt(CFrame.fromEulerAnglesYXZ(Rx, Ry, Rz) * (Position + Vector3.new(0, 0.105, math.floor((Negated + (if Position2.Z > 0 then math.clamp(0.5 - Position2.Z * 3, -0.5, 0.5) else 0) * Negated) * 100) / 100)), Position1), 0.5)
							elseif CF then
								local _Vector3 = Vector3.new(0, 0.105, -(VectorDelta.Z + 1))
								local Rx1, Ry1, Rz1 = CF:ToEulerAnglesXYZ()
								Camera.CFrame = CFrame.lookAt(CFrame.Angles(-Rx1 * 0.5, -Ry1 * 0.5, -Rz1 * 0.5) * (Position + _Vector3), Position1)
							end
						else
							local _Vector3 = Vector3.new(0, Y * 0.25 - 1.25, -(VectorDelta.Z + 1) + 0.125)
							
							if Character then
								local Head1 = Character:FindFirstChild("Head")
								
								if Head1 then
									local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
									
									if HumanoidRootPart then
										local ScaledInverted = HumanoidRootPart.CFrame:Inverse() * Head1.CFrame
										Camera.CFrame = CFrame.lookAt(Position + _Vector3 + Vector3.new(ScaledInverted.Position.X * 0.15 + 0.125, ScaledInverted.Position.Y, ScaledInverted.Position.Z * 0.05), Position1)
										Camera.Focus = Copy1.CFrame
									end
								end
							end
						end
					end
				end
				if Head then
					if Head.Size ~= Size then
						Size = Head.Size
						setCloneDirty(true)
					end
					if pcall(function()
						-- upvalues: Head (upval)
						local _ = Head.Color
					end) and Head.Color ~= Color then
						updateClonePartsColor(Head.Color)
					end
				end
			end
			if Total > 0 then
				Total -= Amount
				
				if Total <= 0 then
					updateClone(Player)
					Total = 0
				end
			end
			if DebugSelfViewPerfBenchmark then
				debug.profileend()
			end
		end
	end)
end

return function(p2, p3, p4)
	-- upvalues: Object1 (ref), GetFFlagSelfViewVisibilityFixFunction (copy), v1 (ref), Object2 (ref), onOuterContainerVisibilityChanged (copy), createViewport (copy), Players (copy), LocalPlayer (copy), Player (copy), clearClone (copy)
	if not p3 then return end
	Object1 = p3
	if GetFFlagSelfViewVisibilityFixFunction() and p4 then
		v1 = p4
		local AncestorName = v1
		local Ancestor = nil
		
		if AncestorName then
			if Object1 then
				assert(Object1 ~= nil, "Wrapper Frame cannot be nil")
				assert(AncestorName ~= nil, "Frame name cannot be nil ")
				Ancestor = Object1:FindFirstAncestor(AncestorName)
			else
				Ancestor = nil
			end
		else
			Ancestor = nil
		end
		Object2 = Ancestor
		
		if Object2 then
			Object2:GetPropertyChangedSignal("Visible"):Connect(onOuterContainerVisibilityChanged)
		end
	end
	createViewport()
	playerAdded(p2)
	Players.PlayerAdded:Connect(playerAdded)
	Players.PlayerRemoving:Connect(function(Player1)
		-- upvalues: LocalPlayer (upval), Player (upval), clearClone (upval)
		if Player1 == LocalPlayer then
			if Player.HumanoidStateChanged then
				Player.HumanoidStateChanged:Disconnect()
				Player.HumanoidStateChanged = nil
			end
			if Player.CharacterAdded then
				Player.CharacterAdded:Disconnect()
				Player.CharacterAdded = nil
			end
			if Player.CharacterRemoving then
				Player.CharacterRemoving:Disconnect()
				Player.CharacterRemoving = nil
			end
			if Player.FaceControlsChanged then
				Player.FaceControlsChanged:Disconnect()
				Player.FaceControlsChanged = nil
			end
			clearClone()
		end
	end)
	startRenderStepped(p2)
	
	return clearClone
end