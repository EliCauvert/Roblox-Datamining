local corePackagesService = game:GetService("CorePackages")
local modelUtilsModule = require(script.Parent.Parent.Utils.ModelUtils)
local userInputService = game:GetService("UserInputService")
local faceAnimatorService = game:FindService("FaceAnimatorService")
local characterUtility = require(corePackagesService.Packages.Thumbnailing).CharacterUtility
local cFrameUtility = require(corePackagesService.Packages.Thumbnailing).CFrameUtility
local animatorAndADFRefactorEngineFeature = game:GetEngineFeature("AnimatorAndADFRefactor")
local playerViewRemoteEventSupportEngineFeature = game:GetEngineFeature("PlayerViewRemoteEventSupport")
local var1 = nil
local var2 = nil
local selfViewNewPoseSynchronization = game:DefineFastFlag("SelfViewNewPoseSynchronization", false)
local debugSelfViewPerfBenchmark = game:DefineFastFlag("DebugSelfViewPerfBenchmark", false)
local getFFlagSelfViewVisibilityFix = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagSelfViewVisibilityFix
local runService = game:GetService("RunService")
local var3 = 1.31
local var4 = 0
local var5 = nil
local var6 = nil
local t = {}
local t_1 = {}
local var7 = nil
local t_2 = {}
local t_3 = {}
local var8 = nil
local var9 = nil
local var10 = nil
local var11 = nil
local var12 = Vector3.new(1.172099947929, 1.181100010872, 1.157799959183)
local var13 = nil
local var14 = nil
local var15 = nil
local var16 = nil
local var17 = nil
local var18 = nil
local var19 = nil
local var20 = nil
local var21 = nil
local var22 = false
local var23 = 0
local t_4 = {}
local t_5 = {
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
local playersService = game:GetService("Players")

if not playersService.LocalPlayer then
	warn("Players.LocalPlayer does not exist")
end
local localPlayer = playersService.LocalPlayer
local var24 = false

function setCloneDirty(value)
	-- upvalues: var4 (write)
	if value then
		var4 = 0.35
		
		return
	end
	var4 = 0
end

function createCloneAnchor()
	-- upvalues: var13 (write), var10 (write)
	if var13 ~= nil then
		var13:Destroy()
		var13 = nil
	end
	local worldModel = Instance.new("WorldModel")
	worldModel.Parent = var10
	var13 = worldModel
end

local function _(p1)
	-- upvalues: t_4 (ref)
	if t_4[p1] then
		t_4[p1]:Disconnect()
		t_4[p1] = nil
	end
end

function clearCloneCharacter()
	-- upvalues: var14 (write), var13 (write)
	if var14 then
		var14:Destroy()
		var14 = nil
	end
	if not var13 then
		warn("cloneAnchor is nil, this shouldn't be possible")
		
		return
	end
	assert(var13 ~= nil)
	local selfAvatar = var13:FindFirstChild("SelfAvatar")
	
	if selfAvatar then
		selfAvatar:Destroy()
	end
	createCloneAnchor()
end

local function clearClone()
	-- upvalues: t_4 (ref), t_2 (write), var2 (write), var7 (write)
	stopRenderStepped()
	
	if t_4.AnimationPlayed then
		t_4.AnimationPlayed:Disconnect()
		t_4.AnimationPlayed = nil
	end
	if t_4.AnimationPlayedCoreScript then
		t_4.AnimationPlayedCoreScript:Disconnect()
		t_4.AnimationPlayedCoreScript = nil
	end
	for i, v in t_2 do
		if v then
			v:Stop(0)
		end
	end
	if var2 then
		var2:Stop(0)
		var2 = nil
	end
	var7 = nil
	t_2 = {}
	clearCloneCharacter()
end

local function syncTrack(p1, p2)
	-- upvalues: var2 (write), var1 (write), localPlayer (ref), t (ref)
	if not p1 or not p2.Animation then return end
	local var25 = nil
	
	if not p2.Animation or not p2.Animation:IsA("Animation") then
		if p2.Animation and p2.Animation:IsA("TrackerStreamAnimation") then
			if var2 then
				var2:Stop(0)
			end
			var1 = Instance.new("TrackerStreamAnimation")
			assert(var1 ~= nil)
			var2 = if game:GetEngineFeature("UseNewLoadStreamAnimationAPI") then p1:LoadStreamAnimationV2(var1, localPlayer, false, false) else p1:LoadStreamAnimationForSelfieView_deprecated(var1, localPlayer)
			var25 = var2
		else
			warn("No animation to clone in SelfView")
		end
	end
	if var25 then
		var25:Play()
		var25.Priority = p2.Priority
		t[p2] = p2.Stopped:Connect(function()
			-- upvalues: var25 (write), t (copy), p2 (ref)
			var25:Stop(0)
			
			if t[p2] then
				t[p2]:Disconnect()
			end
		end)
	end
end

local function updateClone(p1)
	-- upvalues: clearClone (ref), modelUtilsModule (ref), var14 (write), t_1 (ref), var13 (write), var11 (write), cFrameUtility (ref), characterUtility (ref), var12 (write), var3 (write), var16 (write), var17 (write), var18 (write), var7 (write), animatorAndADFRefactorEngineFeature (ref), selfViewNewPoseSynchronization (ref), var1 (write), syncTrack (ref), t_4 (ref)
	clearClone()
	
	if not p1 then return end
	assert(p1 ~= nil)
	startRenderStepped(p1)
	local _ = p1.Character
	
	if not p1 or not p1.Character then return end
	local character = p1.Character
	
	if not character then return end
	assert(character ~= nil)
	local animator = modelUtilsModule.getAnimator(character, 10)
	clearCloneCharacter()
	local archivable = character.Archivable
	character.Archivable = true
	local head = modelUtilsModule.getHead(character)
	
	if not head then return end
	var14 = character:Clone()
	
	if var14 == nil then return end
	assert(var14 ~= nil)
	modelUtilsModule.resetPartOrientation(var14)
	modelUtilsModule.updateTransparency(var14, t_1)
	modelUtilsModule.removeTags(var14)
	var14.Name = "SelfAvatar"
	modelUtilsModule.removeScripts(var14)
	modelUtilsModule.sanitizeCharacter(var14)
	character.Archivable = archivable
	var14.Parent = var13
	local humanoidRootPart = var14:FindFirstChild("HumanoidRootPart")
	
	if humanoidRootPart then
		humanoidRootPart.CFrame = CFrame.new(Vector3.new(0, 0, 0))
		assert(var11 ~= nil)
		
		if head then
			local head_1 = modelUtilsModule.getHead(var14)
			
			if head_1 then
				assert(head_1 ~= nil)
				local var25, var26 = characterUtility.CalculateHeadExtents(var14, cFrameUtility.CalculateTargetCFrame(head_1.CFrame))
				var12 = Vector3.new(var26.X, var26.Y, var26.Z) - Vector3.new(var25.X, var25.Y, var25.Z)
				assert(var12 ~= nil)
				var3 = head_1.Size.Y
				local _ = math.min(var12.X, var12.Y)
				local minValue = math.min(var12.X, var12.Z)
				local model = Instance.new("Model")
				model.Parent = var14
				head_1 = modelUtilsModule.getHead(var14)
				character.Archivable = true
				var16 = head_1:Clone()
				assert(var16 ~= nil)
				var16.CanCollide = false
				var16.Parent = model
				var17 = modelUtilsModule.getNeck(var14, var16)
				var18 = var16.CFrame
				var16:Destroy()
				assert(var18 ~= nil)
				var11.CFrame = CFrame.lookAt(var18.Position + var18.LookVector * (minValue * 2) + Vector3.new(0, 0.104999996722, -0.25), var18.Position)
				var11.Focus = var18
				character.Archivable = archivable
				model:Destroy()
			end
		else
			var11.CFrame = CFrame.lookAt(humanoidRootPart.Position + humanoidRootPart.CFrame.LookVector * 2.5 + Vector3.new(0, 1.5, 0), humanoidRootPart.Position)
			var11.CFrame = CFrame.new(var11.CFrame.Position) * CFrame.Angles(-0.000698131701, 3.14159265359, 0)
		end
	end
	if var14 == nil then return end
	local _ = nil
	local humanoid = var14:FindFirstChildWhichIsA("Humanoid")
	
	if humanoid then
		humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	end
	var7 = modelUtilsModule.getAnimator(var14, 0)
	
	if var7 then
		if not animatorAndADFRefactorEngineFeature or not selfViewNewPoseSynchronization then
			local playingAnimationTracksCoreScript = var7:GetPlayingAnimationTracksCoreScript()
			
			for i, v in ipairs(var7:GetPlayingAnimationTracks()) do
				if v ~= nil then
					v:Stop(0)
					v:Destroy()
				end
			end
			for i_1, v_1 in ipairs(playingAnimationTracksCoreScript) do
				if v_1 ~= nil then
					v_1:Stop(0)
					v_1:Destroy()
				end
			end
			if var1 then
				var1:Destroy()
				var1 = nil
			end
		end
		if not animator then return end
		if animatorAndADFRefactorEngineFeature and selfViewNewPoseSynchronization then
			var7:SynchronizeWith(animator)
		else
			for i, v in ipairs(animator:GetPlayingAnimationTracksCoreScript()) do
				syncTrack(var7, v)
			end
			t_4.AnimationPlayedCoreScript = animator.AnimationPlayedCoreScript:Connect(function(p2)
				-- upvalues: syncTrack (copy), var7 (copy)
				syncTrack(var7, p2)
			end)
		end
		setCloneDirty(false)
		
		return
	end
end

local _ = function(p2, p3)
	local _ = p2[p3]
end

function updateCachedHeadColor(p2)
	-- upvalues: var8 (write), var9 (write)
	if p2 == nil then return end
	assert(p2 ~= nil)
	
	if pcall(function()
		-- upvalues: p2 (ref)
		local _ = p2.Color
	end) then
		var8 = p2.Color
		
		if pcall(function()
			-- upvalues: p2 (ref)
			local _ = p2.Size
		end) then
			var9 = p2.Size
		end
	end
end

local _ = function(p2)
	-- upvalues: t_4 (ref)
	if not p2 then return end
	if not t_4.HumanoidStateChanged then
		t_4.HumanoidStateChanged = p2.StateChanged:Connect(function(p3, p4)
			if p3 == Enum.HumanoidStateType.PlatformStanding and p4 == Enum.HumanoidStateType.Running then
				setCloneDirty(true)
			end
			if p4 == Enum.HumanoidStateType.GettingUp then
				setCloneDirty(true)
			end
		end)
	end
end

local _ = function(p2)
	-- upvalues: t_4 (ref)
	if not t_4.FaceControlsChanged then
		t_4.FaceControlsChanged = p2.InternalFacsOverrideChanged:Connect(function()
			setCloneDirty(true)
		end)
	end
end

local function characterAdded(p2)
	-- upvalues: var10 (write), var19 (write), var15 (write), modelUtilsModule (ref), t_4 (ref), t_5 (ref), var22 (write)
	if var10 == nil or var19 == nil then return end
	if not p2 then return end
	var15 = modelUtilsModule.getHead(p2)
	updateCachedHeadColor(var15)
	
	if t_4.DescendantAdded then
		t_4.DescendantAdded:Disconnect()
		t_4.DescendantAdded = nil
	end
	if t_4.DescendantRemoving then
		t_4.DescendantRemoving:Disconnect()
		t_4.DescendantRemoving = nil
	end
	if t_4.HeadSize then
		t_4.HeadSize:Disconnect()
		t_4.HeadSize = nil
	end
	if t_4.Color then
		t_4.Color:Disconnect()
		t_4.Color = nil
	end
	local _ = nil
	local humanoid = p2:FindFirstChildWhichIsA("Humanoid")
	
	if humanoid then
		humanoid = humanoid
		
		if humanoid and not t_4[t_5.HumanoidStateChanged] then
			t_4[t_5.HumanoidStateChanged] = humanoid.StateChanged:Connect(function(p3, p4)
				if p3 == Enum.HumanoidStateType.PlatformStanding and p4 == Enum.HumanoidStateType.Running then
					setCloneDirty(true)
				end
				if p4 == Enum.HumanoidStateType.GettingUp then
					setCloneDirty(true)
				end
			end)
		end
	end
	local faceControls = p2:FindFirstChildWhichIsA("FaceControls", true)
	
	if faceControls and not t_4[t_5.FaceControlsChanged] then
		t_4[t_5.FaceControlsChanged] = faceControls.InternalFacsOverrideChanged:Connect(function()
			setCloneDirty(true)
		end)
	end
	t_4.DescendantAdded = p2.DescendantAdded:Connect(function(p3)
		-- upvalues: var10 (copy), var19 (copy), var15 (copy), modelUtilsModule (copy), p2 (ref), t_4 (copy), t_5 (copy)
		if var10 == nil or var19 == nil then return end
		if p3.Name == "Head" then
			var15 = modelUtilsModule.getHead(p2)
			updateCachedHeadColor(var15)
		end
		if p3:IsA("Humanoid") and p3 and not t_4[t_5.HumanoidStateChanged] then
			t_4[t_5.HumanoidStateChanged] = p3.StateChanged:Connect(function(p4, p5)
				if p4 == Enum.HumanoidStateType.PlatformStanding and p5 == Enum.HumanoidStateType.Running then
					setCloneDirty(true)
				end
				if p5 == Enum.HumanoidStateType.GettingUp then
					setCloneDirty(true)
				end
			end)
		end
		if p3:IsA("FaceControls") and not t_4[t_5.FaceControlsChanged] then
			t_4[t_5.FaceControlsChanged] = p3.InternalFacsOverrideChanged:Connect(function()
				setCloneDirty(true)
			end)
		end
		if modelUtilsModule.shouldMarkCloneDirtyForDescendant(p3) then
			setCloneDirty(true)
		end
	end)
	t_4.DescendantRemoving = p2.DescendantRemoving:Connect(function(p3)
		-- upvalues: var10 (copy), var19 (copy), modelUtilsModule (copy)
		if var10 == nil or var19 == nil then return end
		if p3 and (p3:IsA("MeshPart") or p3:IsA("Accessory")) then
			if p3:IsA("MeshPart") and p3.MeshId == "" then return end
			if modelUtilsModule.shouldMarkCloneDirtyForDescendant(p3) then
				setCloneDirty(true)
			end
		end
	end)
	setCloneDirty(true)
	var22 = true
end

local function createViewport()
	-- upvalues: var10 (write), var19 (write), var11 (write)
	if var10 then
		var10:Destroy()
	end
	var10 = Instance.new("ViewportFrame")
	var10.Position = UDim2.new(0, 0, 0, 0)
	var10.Size = UDim2.new(1, 0, 1, 0)
	var10.BackgroundTransparency = 1
	var10.Parent = var19
	var10.Ambient = Color3.new(0.7529411765, 0.7098039216, 0.7137254902)
	var10.LightColor = Color3.new(1, 0.9960784314, 0.9960784314)
	var10.LightDirection = Vector3.new(9.5, -12, 7.5)
	var10.IsMirrored = true
	local _ = Instance.new("UICorner")
	Instance.new("UICorner").Parent = var10
	createCloneAnchor()
	
	if var19 then
		var19.Destroying:Connect(clearViewportFrame)
	end
	var11 = Instance.new("Camera")
	assert(var11 ~= nil)
	var11.FieldOfView = 70
	var10.CurrentCamera = var11
	var11.Parent = var10
end

function ReInit(p2)
	-- upvalues: getFFlagSelfViewVisibilityFix (ref), var21 (write), var24 (write), var15 (write), modelUtilsModule (ref), t_4 (ref), clearClone (ref), createViewport (ref)
	assert(p2.Character ~= nil)
	
	if getFFlagSelfViewVisibilityFix() and var21 and not var21.Visible then
		var24 = false
		
		return
	end
	var15 = modelUtilsModule.getHead(p2.Character)
	updateCachedHeadColor(var15)
	setCloneDirty(false)
	
	if t_4.CharacterAdded then
		t_4.CharacterAdded:Disconnect()
		t_4.CharacterAdded = nil
	end
	if t_4.CharacterRemoving then
		t_4.CharacterRemoving:Disconnect()
		t_4.CharacterRemoving = nil
	end
	clearClone()
	createViewport()
	playerAdded(p2)
	startRenderStepped(p2)
end

local function onCharacterAdded(p2)
	-- upvalues: var6 (write), var22 (write), characterAdded (ref), localPlayer (ref), t_4 (ref), t_5 (ref)
	if var6 then
		var6:Disconnect()
	end
	if var22 then
		ReInit(localPlayer)
	else
		characterAdded(p2)
	end
	if t_4.HumanoidStateChanged then
		t_4.HumanoidStateChanged:Disconnect()
		t_4.HumanoidStateChanged = nil
	end
	local _ = nil
	local humanoid = p2:FindFirstChildWhichIsA("Humanoid")
	
	if humanoid then
		humanoid = humanoid
		
		if not humanoid then return end
		if not t_4[t_5.HumanoidStateChanged] then
			t_4[t_5.HumanoidStateChanged] = humanoid.StateChanged:Connect(function(p3, p4)
				if p3 == Enum.HumanoidStateType.PlatformStanding and p4 == Enum.HumanoidStateType.Running then
					setCloneDirty(true)
				end
				if p4 == Enum.HumanoidStateType.GettingUp then
					setCloneDirty(true)
				end
			end)
		end
	end
end

local _ = function(p2)
	-- upvalues: var19 (write)
	if not p2 then
		return nil
	elseif var19 then
		assert(var19 ~= nil, "Wrapper Frame cannot be nil")
		assert(p2 ~= nil, "Frame name cannot be nil ")
		
		return var19:FindFirstAncestor(p2)
	end
	return nil
end

function clearViewportFrame()
	-- upvalues: var10 (write), var19 (write)
	if var10 then
		var10:Destroy()
	end
	var19 = nil
	stopRenderStepped()
end

local function onOuterContainerVisibilityChanged()
	-- upvalues: var21 (write), var22 (write), var24 (write)
	if var21 then
		if var21.Visible then
			if var22 then
				var24 = true
				
				return
			end
			return
		else
			var24 = false
		end
	end
end

function playerAdded(p2)
	-- upvalues: localPlayer (ref), var6 (write), t_4 (ref), onCharacterAdded (ref), characterAdded (ref), clearClone (ref)
	if p2 ~= nil and p2 == localPlayer then
		if var6 ~= nil then
			var6:Disconnect()
			var6 = nil
			
			if t_4.CharacterAdded then
				t_4.CharacterAdded:Disconnect()
				t_4.CharacterAdded = nil
			end
		end
		local _ = p2.Character
		local character = p2.Character
		var6 = p2.CharacterAdded:Connect(onCharacterAdded)
		
		if character then
			characterAdded(character)
		end
		t_4.CharacterAdded = p2.CharacterAdded:Connect(characterAdded)
		t_4.CharacterRemoving = p2.CharacterRemoving:Connect(function()
			-- upvalues: t_4 (copy), clearClone (copy)
			if t_4.DescendantAdded then
				t_4.DescendantAdded:Disconnect()
				t_4.DescendantAdded = nil
			end
			if t_4.DescendantRemoving then
				t_4.DescendantRemoving:Disconnect()
				t_4.DescendantRemoving = nil
			end
			if t_4.HeadSize then
				t_4.HeadSize:Disconnect()
				t_4.HeadSize = nil
			end
			if t_4.Color then
				t_4.Color:Disconnect()
				t_4.Color = nil
			end
			clearClone()
			
			if t_4.CharacterRemoving then
				t_4.CharacterRemoving:Disconnect()
				t_4.CharacterRemoving = nil
			end
		end)
	end
end

function stopRenderStepped()
	-- upvalues: var5 (write)
	if var5 then
		var5:Disconnect()
		var5 = nil
	end
end

function updateClonePartsColor(p2)
	-- upvalues: var15 (write), var8 (write), localPlayer (ref), var14 (write)
	if pcall(function()
		-- upvalues: var15 (copy)
		local _ = var15.Color
	end) and var15 and var15.Color ~= var8 then
		local character = localPlayer.Character
		
		if not character then return end
		assert(character ~= nil)
		
		if not var14 then return end
		assert(var14 ~= nil)
		
		for i, v in pairs(character:GetChildren()) do
			if v:IsA("MeshPart") then
				local name = var14:FindFirstChild(v.Name)
				
				if name and name:IsA("MeshPart") and (name.Color and v.Color) then
					name.Color = v.Color
				end
			end
		end
	end
	var8 = p2
end

function startRenderStepped(p3)
	-- upvalues: debugSelfViewPerfBenchmark (ref), runService (ref), var5 (write), getFFlagSelfViewVisibilityFix (ref), var14 (write), var21 (write), var24 (write), var7 (write), localPlayer (ref), var15 (write), modelUtilsModule (ref), t_3 (write), t_2 (write), userInputService (ref), var23 (write), var16 (write), var17 (write), var18 (write), var11 (write), var12 (write), faceAnimatorService (ref), playerViewRemoteEventSupportEngineFeature (ref), var3 (write), var9 (write), var8 (write), var4 (write), updateClone (ref)
	stopRenderStepped()
	var5 = (if debugSelfViewPerfBenchmark then runService.Heartbeat else runService.RenderStepped):Connect(function(p4)
		-- upvalues: debugSelfViewPerfBenchmark (copy), getFFlagSelfViewVisibilityFix (copy), var14 (copy), var21 (copy), var24 (copy), var7 (copy), localPlayer (copy), var15 (copy), modelUtilsModule (copy), t_3 (copy), t_2 (copy), userInputService (copy), var23 (copy), var16 (copy), var17 (copy), var18 (copy), var11 (copy), var12 (copy), faceAnimatorService (copy), playerViewRemoteEventSupportEngineFeature (copy), var3 (copy), var9 (copy), var8 (copy), var4 (copy), updateClone (copy), p3 (ref)
		if debugSelfViewPerfBenchmark then
			debug.profilebegin("faceclone")
		end
		if getFFlagSelfViewVisibilityFix() and var14 and (var21 and not var24) then
			if var7 ~= nil then
				for i, v in pairs(var7:GetPlayingAnimationTracks()) do
					if v ~= nil then
						v:Stop(0)
					end
				end
			end
			return
		elseif localPlayer then
			local character = localPlayer.Character
			
			if not character or character.Parent == nil then return end
			assert(character ~= nil)
			
			if var15 == nil or var15.Parent ~= character then
				var15 = modelUtilsModule.getHead(character)
			end
			if var15 then
				local animator = modelUtilsModule.getAnimator(character, 0)
				
				if var7 ~= nil and animator ~= nil then
					assert(var7 ~= nil)
					
					for i, v in pairs(var7:GetPlayingAnimationTracks()) do
						if v ~= nil then
							v:Stop(0)
						end
					end
					local playingAnimationTracks = animator:GetPlayingAnimationTracks()
					local _ = nil
					t_3 = {}
					
					for i_1, v_1 in ipairs(playingAnimationTracks) do
						local animation = v_1.Animation
						
						if animation and animation:IsA("Animation") and animation.AnimationId ~= "" then
							t_3[animation.AnimationId] = v_1
							
							if not t_2[animation.AnimationId] then
								t_2[animation.AnimationId] = var7:LoadAnimation(animation)
							end
							local animationId = t_2[animation.AnimationId]
							assert(animationId ~= nil)
							animationId:Play()
							animationId.TimePosition = v_1.TimePosition
							animationId.Priority = v_1.Priority
							animationId:AdjustWeight(v_1.WeightCurrent, 0.1)
						end
					end
					for i_2 in t_2 do
						local var27 = t_2[i_2]
						
						if var27 then
							local animation = var27.Animation
							
							if animation and not t_3[animation.AnimationId] then
								local animationId = t_2[animation.AnimationId]
								
								if animationId ~= nil then
									animationId:Stop(0)
								end
								t_2[animation.AnimationId] = nil
							end
						end
					end
					for i_3, v_2 in ipairs(animator:GetPlayingAnimationTracksCoreScript()) do
						for i_4, v_3 in pairs(var7:GetPlayingAnimationTracksCoreScript()) do
							if v_3.Animation:IsA("TrackerStreamAnimation") then
								v_3.Priority = v_2.Priority
								v_3:AdjustWeight(v_2.WeightCurrent, 0)
							end
						end
					end
				end
			end
			local var28 = nil
			local platform = userInputService:GetPlatform()
			
			if (platform == Enum.Platform.IOS or platform == Enum.Platform.Android) and var7 ~= nil then
				for i, v in pairs(var7:GetPlayingAnimationTracksCoreScript()) do
					if v.Animation:IsA("TrackerStreamAnimation") then
						local _ = nil
						local _, trackerData, trackerData_1 = v:GetTrackerData()
						var28 = trackerData
						local _ = trackerData_1
					end
				end
			end
			var23 += 1
			
			if var23 == 1 then
				var23 = 0
				
				if var14 then
					if not var16 then
						var16 = modelUtilsModule.getHead(var14)
						
						if var16 then
							var17 = modelUtilsModule.getNeck(var14, var16)
						end
					end
					if var16 then
						var18 = var16.CFrame
					end
				end
				if var11 and var16 then
					local position = var16.Position
					local position_1 = var16.Position
					local _ = var16.CFrame
					
					if var17 then
						local part0 = var17.Part0
						local _ = var17.Part1
						local c0 = var17.C0
						local c1 = var17.C1
						local transform = var17.Transform
						
						if part0 and c0 then
							local var29 = part0.CFrame * c0 * transform * c1:Inverse()
							position_1 = Vector3.new(var29.Position.X * 0.25, (var16.CFrame.Position.Y + var29.Position.Y + var29.Position.Y * 0.75) * 0.33333, var29.Position.Z)
							position = Vector3.new(var29.Position.X * 0.6, (var16.CFrame.Position.Y + var29.Position.Y + var29.Position.Y * 0.75) * 0.33333, var29.Position.Z)
						end
					end
					if not var12 then
						warn("boundsSize is nil, this shouldn't be possible")
					end
					assert(var12 ~= nil)
					
					if not faceAnimatorService or not faceAnimatorService.VideoAnimationEnabled or var28 == nil and not playerViewRemoteEventSupportEngineFeature then
						local vector3 = Vector3.new(0, var3 * 0.25 - 1.25, -(var12.Z + 1) + 0.125)
						
						if character then
							local head = character:FindFirstChild("Head")
							
							if head then
								local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
								
								if humanoidRootPart then
									local var30 = humanoidRootPart.CFrame:Inverse() * head.CFrame
									var11.CFrame = CFrame.lookAt(position + vector3 + Vector3.new(var30.Position.X * 0.15 + 0.125, var30.Position.Y, var30.Position.Z * 0.05), position_1)
									var11.Focus = var16.CFrame
								end
							end
						end
					elseif playerViewRemoteEventSupportEngineFeature then
						local deviceCameraCFrameForSelfView = game:GetService("PlayerViewService"):GetDeviceCameraCFrameForSelfView()
						local position_2 = deviceCameraCFrameForSelfView.Position
						local var31, var32, var33 = deviceCameraCFrameForSelfView:ToEulerAnglesYXZ()
						local var34 = -(var12.Z + 1)
						var11.CFrame = var11.CFrame:Lerp(CFrame.lookAt(CFrame.fromEulerAnglesYXZ(var31, var32, var33) * (position + Vector3.new(0, 0.105, math.floor((var34 + (if position_2.Z > 0 then math.clamp(0.5 - position_2.Z * 3, -0.5, 0.5) else 0) * var34) * 100) / 100)), position_1), 0.5)
					elseif var28 then
						local vector3 = Vector3.new(0, 0.105, -(var12.Z + 1))
						local var35, var36, var37 = var28:ToEulerAnglesXYZ()
						var11.CFrame = CFrame.lookAt(CFrame.Angles(-var35 * 0.5, -var36 * 0.5, -var37 * 0.5) * (position + vector3), position_1)
					end
				end
			end
			if var15 then
				if var15.Size ~= var9 then
					var9 = var15.Size
					setCloneDirty(true)
				end
				if pcall(function()
					-- upvalues: var15 (copy)
					local _ = var15.Color
				end) and var15.Color ~= var8 then
					updateClonePartsColor(var15.Color)
				end
			end
		end
		if var4 > 0 then
			var4 -= p4
			
			if var4 <= 0 then
				updateClone(p3)
				var4 = 0
			end
		end
		if debugSelfViewPerfBenchmark then
			debug.profileend()
		end
	end)
end

return function(p5, p6, p7)
	-- upvalues: var19 (write), getFFlagSelfViewVisibilityFix (ref), var20 (write), var21 (write), onOuterContainerVisibilityChanged (ref), createViewport (ref), playersService (ref), localPlayer (ref), t_4 (ref), clearClone (ref)
	if p6 then
		var19 = p6
	else
		return
	end
	if getFFlagSelfViewVisibilityFix() and p7 then
		local var38
		var20 = p7
		local var39 = var20
		
		if not var39 then
			var38 = nil
		elseif var19 then
			assert(var19 ~= nil, "Wrapper Frame cannot be nil")
			assert(var39 ~= nil, "Frame name cannot be nil ")
			var38 = var19:FindFirstAncestor(var39)
		else
			var38 = nil
		end
		var21 = var38
		
		if var21 then
			var21:GetPropertyChangedSignal("Visible"):Connect(onOuterContainerVisibilityChanged)
		end
	end
	createViewport()
	playerAdded(p5)
	playersService.PlayerAdded:Connect(playerAdded)
	playersService.PlayerRemoving:Connect(function(p8)
		-- upvalues: localPlayer (copy), t_4 (copy), clearClone (copy)
		if p8 == localPlayer then
			if t_4.HumanoidStateChanged then
				t_4.HumanoidStateChanged:Disconnect()
				t_4.HumanoidStateChanged = nil
			end
			if t_4.CharacterAdded then
				t_4.CharacterAdded:Disconnect()
				t_4.CharacterAdded = nil
			end
			if t_4.CharacterRemoving then
				t_4.CharacterRemoving:Disconnect()
				t_4.CharacterRemoving = nil
			end
			if t_4.FaceControlsChanged then
				t_4.FaceControlsChanged:Disconnect()
				t_4.FaceControlsChanged = nil
			end
			clearClone()
		end
	end)
	startRenderStepped(p5)
	
	return clearClone
end