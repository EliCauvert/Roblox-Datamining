local corePackagesService = game:GetService("CorePackages")
local modelUtilsModule = require(script.Parent.Parent.Utils.ModelUtils)
local userInputService = game:GetService("UserInputService")
local faceAnimatorService = game:FindService("FaceAnimatorService")
local characterUtility = require(corePackagesService.Packages.Thumbnailing).CharacterUtility
local cFrameUtility = require(corePackagesService.Packages.Thumbnailing).CFrameUtility
local animatorAndADFRefactorEngineFeature = game:GetEngineFeature("AnimatorAndADFRefactor")
local playerViewRemoteEventSupportEngineFeature = game:GetEngineFeature("PlayerViewRemoteEventSupport")
local var6 = nil
local var7 = nil
local selfViewNewPoseSynchronization = game:DefineFastFlag("SelfViewNewPoseSynchronization", false)
local debugSelfViewPerfBenchmark = game:DefineFastFlag("DebugSelfViewPerfBenchmark", false)
local getFFlagSelfViewVisibilityFix = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagSelfViewVisibilityFix
local runService = game:GetService("RunService")
local var11 = 1.31
local var12 = 0
local var13 = nil
local var14 = nil
local t = {}
local t_1 = {}
local var17 = nil
local t_2 = {}
local t_3 = {}
local var20 = nil
local var21 = nil
local var22 = nil
local var23 = nil
local var24 = Vector3.new(1.172099947929, 1.181100010872, 1.157799959183)
local var25 = nil
local var26 = nil
local var27 = nil
local var28 = nil
local var29 = nil
local var30 = nil
local var31 = nil
local var32 = nil
local var33 = nil
local var34 = false
local var35 = 0
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
local var39 = false

function setCloneDirty(value)
	-- upvalues: var12 (write)
	if value then
		var12 = 0.35
		
		return
	end
	var12 = 0
end

function createCloneAnchor()
	-- upvalues: var25 (write), var22 (write)
	if var25 ~= nil then
		var25:Destroy()
		var25 = nil
	end
	local worldModel = Instance.new("WorldModel")
	worldModel.Parent = var22
	var25 = worldModel
end

local function _(p0)
	-- upvalues: t_4 (ref)
	if t_4[p0] then
		t_4[p0]:Disconnect()
		t_4[p0] = nil
	end
end

function clearCloneCharacter()
	-- upvalues: var26 (write), var25 (write)
	if var26 then
		var26:Destroy()
		var26 = nil
	end
	if not var25 then
		warn("cloneAnchor is nil, this shouldn't be possible")
		
		return
	end
	assert(var25 ~= nil)
	local selfAvatar = var25:FindFirstChild("SelfAvatar")
	
	if selfAvatar then
		selfAvatar:Destroy()
	end
	createCloneAnchor()
end

local function clearClone()
	-- upvalues: t_4 (ref), t_2 (write), var7 (write), var17 (write)
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
	if var7 then
		var7:Stop(0)
		var7 = nil
	end
	var17 = nil
	t_2 = {}
	clearCloneCharacter()
end

local function syncTrack(p1, p2)
	-- upvalues: var7 (write), var6 (write), localPlayer (ref), t (ref)
	if not p1 or not p2.Animation then return end
	local var49 = nil
	
	if not p2.Animation or not p2.Animation:IsA("Animation") then
		if p2.Animation and p2.Animation:IsA("TrackerStreamAnimation") then
			if var7 then
				var7:Stop(0)
			end
			var6 = Instance.new("TrackerStreamAnimation")
			assert(var6 ~= nil)
			var7 = if game:GetEngineFeature("UseNewLoadStreamAnimationAPI") then p1:LoadStreamAnimationV2(var6, localPlayer, false, false) else p1:LoadStreamAnimationForSelfieView_deprecated(var6, localPlayer)
			var49 = var7
		else
			warn("No animation to clone in SelfView")
		end
	end
	if var49 then
		var49:Play()
		var49.Priority = p2.Priority
		t[p2] = p2.Stopped:Connect(function()
			-- upvalues: var49 (write), t (copy), p2 (ref)
			var49:Stop(0)
			
			if t[p2] then
				t[p2]:Disconnect()
			end
		end)
	end
end

local function updateClone(p3)
	-- upvalues: clearClone (ref), modelUtilsModule (ref), var26 (write), t_1 (ref), var25 (write), var23 (write), cFrameUtility (ref), characterUtility (ref), var24 (write), var11 (write), var28 (write), var29 (write), var30 (write), var17 (write), animatorAndADFRefactorEngineFeature (ref), selfViewNewPoseSynchronization (ref), var6 (write), syncTrack (ref), t_4 (ref)
	clearClone()
	
	if not p3 then return end
	assert(p3 ~= nil)
	startRenderStepped(p3)
	local _ = p3.Character
	
	if not p3 or not p3.Character then return end
	local character = p3.Character
	
	if not character then return end
	assert(character ~= nil)
	local animator = modelUtilsModule.getAnimator(character, 10)
	clearCloneCharacter()
	local archivable = character.Archivable
	character.Archivable = true
	local head = modelUtilsModule.getHead(character)
	
	if not head then return end
	var26 = character:Clone()
	
	if var26 == nil then return end
	assert(var26 ~= nil)
	modelUtilsModule.resetPartOrientation(var26)
	modelUtilsModule.updateTransparency(var26, t_1)
	modelUtilsModule.removeTags(var26)
	var26.Name = "SelfAvatar"
	modelUtilsModule.removeScripts(var26)
	modelUtilsModule.sanitizeCharacter(var26)
	character.Archivable = archivable
	var26.Parent = var25
	local humanoidRootPart = var26:FindFirstChild("HumanoidRootPart")
	
	if humanoidRootPart then
		humanoidRootPart.CFrame = CFrame.new(Vector3.new(0, 0, 0))
		assert(var23 ~= nil)
		
		if head then
			local head_1 = modelUtilsModule.getHead(var26)
			
			if head_1 then
				assert(head_1 ~= nil)
				local var54, var55 = characterUtility.CalculateHeadExtents(var26, cFrameUtility.CalculateTargetCFrame(head_1.CFrame))
				var24 = Vector3.new(var55.X, var55.Y, var55.Z) - Vector3.new(var54.X, var54.Y, var54.Z)
				assert(var24 ~= nil)
				var11 = head_1.Size.Y
				local _ = math.min(var24.X, var24.Y)
				local minValue = math.min(var24.X, var24.Z)
				local model = Instance.new("Model")
				model.Parent = var26
				head_1 = modelUtilsModule.getHead(var26)
				character.Archivable = true
				var28 = head_1:Clone()
				assert(var28 ~= nil)
				var28.CanCollide = false
				var28.Parent = model
				var29 = modelUtilsModule.getNeck(var26, var28)
				var30 = var28.CFrame
				var28:Destroy()
				assert(var30 ~= nil)
				var23.CFrame = CFrame.lookAt(var30.Position + var30.LookVector * (minValue * 2) + Vector3.new(0, 0.104999996722, -0.25), var30.Position)
				var23.Focus = var30
				character.Archivable = archivable
				model:Destroy()
			end
		else
			var23.CFrame = CFrame.lookAt(humanoidRootPart.Position + humanoidRootPart.CFrame.LookVector * 2.5 + Vector3.new(0, 1.5, 0), humanoidRootPart.Position)
			var23.CFrame = CFrame.new(var23.CFrame.Position) * CFrame.Angles(-0.000698131701, 3.14159265359, 0)
		end
	end
	if var26 == nil then return end
	local _ = nil
	local humanoid = var26:FindFirstChildWhichIsA("Humanoid")
	
	if humanoid then
		humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	end
	var17 = modelUtilsModule.getAnimator(var26, 0)
	
	if var17 then
		if not animatorAndADFRefactorEngineFeature or not selfViewNewPoseSynchronization then
			local playingAnimationTracksCoreScript = var17:GetPlayingAnimationTracksCoreScript()
			
			for i, v in ipairs(var17:GetPlayingAnimationTracks()) do
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
			if var6 then
				var6:Destroy()
				var6 = nil
			end
		end
		if not animator then return end
		if animatorAndADFRefactorEngineFeature and selfViewNewPoseSynchronization then
			var17:SynchronizeWith(animator)
		else
			for i, v in ipairs(animator:GetPlayingAnimationTracksCoreScript()) do
				syncTrack(var17, v)
			end
			t_4.AnimationPlayedCoreScript = animator.AnimationPlayedCoreScript:Connect(function(p4)
				-- upvalues: syncTrack (copy), var17 (copy)
				syncTrack(var17, p4)
			end)
		end
		setCloneDirty(false)
		
		return
	end
end

local _ = function(p5, p6)
	local _ = p5[p6]
end

function updateCachedHeadColor(p7)
	-- upvalues: var20 (write), var21 (write)
	if p7 == nil then return end
	assert(p7 ~= nil)
	
	if pcall(function()
		-- upvalues: p7 (ref)
		local _ = p7.Color
	end) then
		var20 = p7.Color
		
		if pcall(function()
			-- upvalues: p7 (ref)
			local _ = p7.Size
		end) then
			var21 = p7.Size
		end
	end
end

local _ = function(p8)
	-- upvalues: t_4 (ref)
	if not p8 then return end
	if not t_4.HumanoidStateChanged then
		t_4.HumanoidStateChanged = p8.StateChanged:Connect(function(p9, p10)
			if p9 == Enum.HumanoidStateType.PlatformStanding and p10 == Enum.HumanoidStateType.Running then
				setCloneDirty(true)
			end
			if p10 == Enum.HumanoidStateType.GettingUp then
				setCloneDirty(true)
			end
		end)
	end
end

local _ = function(p11)
	-- upvalues: t_4 (ref)
	if not t_4.FaceControlsChanged then
		t_4.FaceControlsChanged = p11.InternalFacsOverrideChanged:Connect(function()
			setCloneDirty(true)
		end)
	end
end

local function characterAdded(p12)
	-- upvalues: var22 (write), var31 (write), var27 (write), modelUtilsModule (ref), t_4 (ref), t_5 (ref), var34 (write)
	if var22 == nil or var31 == nil then return end
	if not p12 then return end
	var27 = modelUtilsModule.getHead(p12)
	updateCachedHeadColor(var27)
	
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
	local humanoid = p12:FindFirstChildWhichIsA("Humanoid")
	
	if humanoid then
		humanoid = humanoid
		
		if humanoid and not t_4[t_5.HumanoidStateChanged] then
			t_4[t_5.HumanoidStateChanged] = humanoid.StateChanged:Connect(function(p13, p14)
				if p13 == Enum.HumanoidStateType.PlatformStanding and p14 == Enum.HumanoidStateType.Running then
					setCloneDirty(true)
				end
				if p14 == Enum.HumanoidStateType.GettingUp then
					setCloneDirty(true)
				end
			end)
		end
	end
	local faceControls = p12:FindFirstChildWhichIsA("FaceControls", true)
	
	if faceControls and not t_4[t_5.FaceControlsChanged] then
		t_4[t_5.FaceControlsChanged] = faceControls.InternalFacsOverrideChanged:Connect(function()
			setCloneDirty(true)
		end)
	end
	t_4.DescendantAdded = p12.DescendantAdded:Connect(function(p15)
		-- upvalues: var22 (copy), var31 (copy), var27 (copy), modelUtilsModule (copy), p12 (ref), t_4 (copy), t_5 (copy)
		if var22 == nil or var31 == nil then return end
		if p15.Name == "Head" then
			var27 = modelUtilsModule.getHead(p12)
			updateCachedHeadColor(var27)
		end
		if p15:IsA("Humanoid") and p15 and not t_4[t_5.HumanoidStateChanged] then
			t_4[t_5.HumanoidStateChanged] = p15.StateChanged:Connect(function(p16, p17)
				if p16 == Enum.HumanoidStateType.PlatformStanding and p17 == Enum.HumanoidStateType.Running then
					setCloneDirty(true)
				end
				if p17 == Enum.HumanoidStateType.GettingUp then
					setCloneDirty(true)
				end
			end)
		end
		if p15:IsA("FaceControls") and not t_4[t_5.FaceControlsChanged] then
			t_4[t_5.FaceControlsChanged] = p15.InternalFacsOverrideChanged:Connect(function()
				setCloneDirty(true)
			end)
		end
		if modelUtilsModule.shouldMarkCloneDirtyForDescendant(p15) then
			setCloneDirty(true)
		end
	end)
	t_4.DescendantRemoving = p12.DescendantRemoving:Connect(function(p18)
		-- upvalues: var22 (copy), var31 (copy), modelUtilsModule (copy)
		if var22 == nil or var31 == nil then return end
		if p18 and (p18:IsA("MeshPart") or p18:IsA("Accessory")) then
			if p18:IsA("MeshPart") and p18.MeshId == "" then return end
			if modelUtilsModule.shouldMarkCloneDirtyForDescendant(p18) then
				setCloneDirty(true)
			end
		end
	end)
	setCloneDirty(true)
	var34 = true
end

local function createViewport()
	-- upvalues: var22 (write), var31 (write), var23 (write)
	if var22 then
		var22:Destroy()
	end
	var22 = Instance.new("ViewportFrame")
	var22.Position = UDim2.new(0, 0, 0, 0)
	var22.Size = UDim2.new(1, 0, 1, 0)
	var22.BackgroundTransparency = 1
	var22.Parent = var31
	var22.Ambient = Color3.new(0.7529411765, 0.7098039216, 0.7137254902)
	var22.LightColor = Color3.new(1, 0.9960784314, 0.9960784314)
	var22.LightDirection = Vector3.new(9.5, -12, 7.5)
	var22.IsMirrored = true
	local _ = Instance.new("UICorner")
	Instance.new("UICorner").Parent = var22
	createCloneAnchor()
	
	if var31 then
		var31.Destroying:Connect(clearViewportFrame)
	end
	var23 = Instance.new("Camera")
	assert(var23 ~= nil)
	var23.FieldOfView = 70
	var22.CurrentCamera = var23
	var23.Parent = var22
end

function ReInit(p19)
	-- upvalues: getFFlagSelfViewVisibilityFix (ref), var33 (write), var39 (write), var27 (write), modelUtilsModule (ref), t_4 (ref), clearClone (ref), createViewport (ref)
	assert(p19.Character ~= nil)
	
	if getFFlagSelfViewVisibilityFix() and var33 and not var33.Visible then
		var39 = false
		
		return
	end
	var27 = modelUtilsModule.getHead(p19.Character)
	updateCachedHeadColor(var27)
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
	playerAdded(p19)
	startRenderStepped(p19)
end

local function onCharacterAdded(p20)
	-- upvalues: var14 (write), var34 (write), characterAdded (ref), localPlayer (ref), t_4 (ref), t_5 (ref)
	if var14 then
		var14:Disconnect()
	end
	if var34 then
		ReInit(localPlayer)
	else
		characterAdded(p20)
	end
	if t_4.HumanoidStateChanged then
		t_4.HumanoidStateChanged:Disconnect()
		t_4.HumanoidStateChanged = nil
	end
	local _ = nil
	local humanoid = p20:FindFirstChildWhichIsA("Humanoid")
	
	if humanoid then
		humanoid = humanoid
		
		if not humanoid then return end
		if not t_4[t_5.HumanoidStateChanged] then
			t_4[t_5.HumanoidStateChanged] = humanoid.StateChanged:Connect(function(p21, p22)
				if p21 == Enum.HumanoidStateType.PlatformStanding and p22 == Enum.HumanoidStateType.Running then
					setCloneDirty(true)
				end
				if p22 == Enum.HumanoidStateType.GettingUp then
					setCloneDirty(true)
				end
			end)
		end
	end
end

local _ = function(p23)
	-- upvalues: var31 (write)
	if not p23 then
		return nil
	elseif var31 then
		assert(var31 ~= nil, "Wrapper Frame cannot be nil")
		assert(p23 ~= nil, "Frame name cannot be nil ")
		
		return var31:FindFirstAncestor(p23)
	end
	return nil
end

function clearViewportFrame()
	-- upvalues: var22 (write), var31 (write)
	if var22 then
		var22:Destroy()
	end
	var31 = nil
	stopRenderStepped()
end

local function onOuterContainerVisibilityChanged()
	-- upvalues: var33 (write), var34 (write), var39 (write)
	if var33 then
		if var33.Visible then
			if var34 then
				var39 = true
				
				return
			end
			return
		else
			var39 = false
		end
	end
end

function playerAdded(p24)
	-- upvalues: localPlayer (ref), var14 (write), t_4 (ref), onCharacterAdded (ref), characterAdded (ref), clearClone (ref)
	if p24 ~= nil and p24 == localPlayer then
		if var14 ~= nil then
			var14:Disconnect()
			var14 = nil
			
			if t_4.CharacterAdded then
				t_4.CharacterAdded:Disconnect()
				t_4.CharacterAdded = nil
			end
		end
		local _ = p24.Character
		local character = p24.Character
		var14 = p24.CharacterAdded:Connect(onCharacterAdded)
		
		if character then
			characterAdded(character)
		end
		t_4.CharacterAdded = p24.CharacterAdded:Connect(characterAdded)
		t_4.CharacterRemoving = p24.CharacterRemoving:Connect(function()
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
	-- upvalues: var13 (write)
	if var13 then
		var13:Disconnect()
		var13 = nil
	end
end

function updateClonePartsColor(p25)
	-- upvalues: var27 (write), var20 (write), localPlayer (ref), var26 (write)
	if pcall(function()
		-- upvalues: var27 (copy)
		local _ = var27.Color
	end) and var27 and var27.Color ~= var20 then
		local character = localPlayer.Character
		
		if not character then return end
		assert(character ~= nil)
		
		if not var26 then return end
		assert(var26 ~= nil)
		
		for i, v in pairs(character:GetChildren()) do
			if v:IsA("MeshPart") then
				local name = var26:FindFirstChild(v.Name)
				
				if name and name:IsA("MeshPart") and (name.Color and v.Color) then
					name.Color = v.Color
				end
			end
		end
	end
	var20 = p25
end

function startRenderStepped(p26)
	-- upvalues: debugSelfViewPerfBenchmark (ref), runService (ref), var13 (write), getFFlagSelfViewVisibilityFix (ref), var26 (write), var33 (write), var39 (write), var17 (write), localPlayer (ref), var27 (write), modelUtilsModule (ref), t_3 (write), t_2 (write), userInputService (ref), var35 (write), var28 (write), var29 (write), var30 (write), var23 (write), var24 (write), faceAnimatorService (ref), playerViewRemoteEventSupportEngineFeature (ref), var11 (write), var21 (write), var20 (write), var12 (write), updateClone (ref)
	stopRenderStepped()
	var13 = (if debugSelfViewPerfBenchmark then runService.Heartbeat else runService.RenderStepped):Connect(function(p27)
		-- upvalues: debugSelfViewPerfBenchmark (copy), getFFlagSelfViewVisibilityFix (copy), var26 (copy), var33 (copy), var39 (copy), var17 (copy), localPlayer (copy), var27 (copy), modelUtilsModule (copy), t_3 (copy), t_2 (copy), userInputService (copy), var35 (copy), var28 (copy), var29 (copy), var30 (copy), var23 (copy), var24 (copy), faceAnimatorService (copy), playerViewRemoteEventSupportEngineFeature (copy), var11 (copy), var21 (copy), var20 (copy), var12 (copy), updateClone (copy), p26 (ref)
		if debugSelfViewPerfBenchmark then
			debug.profilebegin("faceclone")
		end
		if getFFlagSelfViewVisibilityFix() and var26 and (var33 and not var39) then
			if var17 ~= nil then
				for i, v in pairs(var17:GetPlayingAnimationTracks()) do
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
			
			if var27 == nil or var27.Parent ~= character then
				var27 = modelUtilsModule.getHead(character)
			end
			if var27 then
				local animator = modelUtilsModule.getAnimator(character, 0)
				
				if var17 ~= nil and animator ~= nil then
					assert(var17 ~= nil)
					
					for i, v in pairs(var17:GetPlayingAnimationTracks()) do
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
								t_2[animation.AnimationId] = var17:LoadAnimation(animation)
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
						local var66 = t_2[i_2]
						
						if var66 then
							local animation = var66.Animation
							
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
						for i_4, v_3 in pairs(var17:GetPlayingAnimationTracksCoreScript()) do
							if v_3.Animation:IsA("TrackerStreamAnimation") then
								v_3.Priority = v_2.Priority
								v_3:AdjustWeight(v_2.WeightCurrent, 0)
							end
						end
					end
				end
			end
			local var67 = nil
			local platform = userInputService:GetPlatform()
			
			if (platform == Enum.Platform.IOS or platform == Enum.Platform.Android) and var17 ~= nil then
				for i, v in pairs(var17:GetPlayingAnimationTracksCoreScript()) do
					if v.Animation:IsA("TrackerStreamAnimation") then
						local _ = nil
						local _, trackerData, trackerData_1 = v:GetTrackerData()
						var67 = trackerData
						local _ = trackerData_1
					end
				end
			end
			var35 += 1
			
			if var35 == 1 then
				var35 = 0
				
				if var26 then
					if not var28 then
						var28 = modelUtilsModule.getHead(var26)
						
						if var28 then
							var29 = modelUtilsModule.getNeck(var26, var28)
						end
					end
					if var28 then
						var30 = var28.CFrame
					end
				end
				if var23 and var28 then
					local position = var28.Position
					local position_1 = var28.Position
					local _ = var28.CFrame
					
					if var29 then
						local part0 = var29.Part0
						local _ = var29.Part1
						local c0 = var29.C0
						local c1 = var29.C1
						local transform = var29.Transform
						
						if part0 and c0 then
							local var71 = part0.CFrame * c0 * transform * c1:Inverse()
							position_1 = Vector3.new(var71.Position.X * 0.25, (var28.CFrame.Position.Y + var71.Position.Y + var71.Position.Y * 0.75) * 0.33333, var71.Position.Z)
							position = Vector3.new(var71.Position.X * 0.6, (var28.CFrame.Position.Y + var71.Position.Y + var71.Position.Y * 0.75) * 0.33333, var71.Position.Z)
						end
					end
					if not var24 then
						warn("boundsSize is nil, this shouldn't be possible")
					end
					assert(var24 ~= nil)
					
					if not faceAnimatorService or not faceAnimatorService.VideoAnimationEnabled or var67 == nil and not playerViewRemoteEventSupportEngineFeature then
						local vector3 = Vector3.new(0, var11 * 0.25 - 1.25, -(var24.Z + 1) + 0.125)
						
						if character then
							local head = character:FindFirstChild("Head")
							
							if head then
								local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
								
								if humanoidRootPart then
									local var75 = humanoidRootPart.CFrame:Inverse() * head.CFrame
									var23.CFrame = CFrame.lookAt(position + vector3 + Vector3.new(var75.Position.X * 0.15 + 0.125, var75.Position.Y, var75.Position.Z * 0.05), position_1)
									var23.Focus = var28.CFrame
								end
							end
						end
					elseif playerViewRemoteEventSupportEngineFeature then
						local deviceCameraCFrameForSelfView = game:GetService("PlayerViewService"):GetDeviceCameraCFrameForSelfView()
						local position_2 = deviceCameraCFrameForSelfView.Position
						local var77, var78, var79 = deviceCameraCFrameForSelfView:ToEulerAnglesYXZ()
						local var80 = -(var24.Z + 1)
						var23.CFrame = var23.CFrame:Lerp(CFrame.lookAt(CFrame.fromEulerAnglesYXZ(var77, var78, var79) * (position + Vector3.new(0, 0.105, math.floor((var80 + (if position_2.Z > 0 then math.clamp(0.5 - position_2.Z * 3, -0.5, 0.5) else 0) * var80) * 100) / 100)), position_1), 0.5)
					elseif var67 then
						local vector3 = Vector3.new(0, 0.105, -(var24.Z + 1))
						local var82, var83, var84 = var67:ToEulerAnglesXYZ()
						var23.CFrame = CFrame.lookAt(CFrame.Angles(-var82 * 0.5, -var83 * 0.5, -var84 * 0.5) * (position + vector3), position_1)
					end
				end
			end
			if var27 then
				if var27.Size ~= var21 then
					var21 = var27.Size
					setCloneDirty(true)
				end
				if pcall(function()
					-- upvalues: var27 (copy)
					local _ = var27.Color
				end) and var27.Color ~= var20 then
					updateClonePartsColor(var27.Color)
				end
			end
		end
		if var12 > 0 then
			var12 -= p27
			
			if var12 <= 0 then
				updateClone(p26)
				var12 = 0
			end
		end
		if debugSelfViewPerfBenchmark then
			debug.profileend()
		end
	end)
end

return function(p28, p29, p30)
	-- upvalues: var31 (write), getFFlagSelfViewVisibilityFix (ref), var32 (write), var33 (write), onOuterContainerVisibilityChanged (ref), createViewport (ref), playersService (ref), localPlayer (ref), t_4 (ref), clearClone (ref)
	if p29 then
		var31 = p29
	else
		return
	end
	if getFFlagSelfViewVisibilityFix() and p30 then
		local var86
		var32 = p30
		local var85 = var32
		
		if not var85 then
			var86 = nil
		elseif var31 then
			assert(var31 ~= nil, "Wrapper Frame cannot be nil")
			assert(var85 ~= nil, "Frame name cannot be nil ")
			var86 = var31:FindFirstAncestor(var85)
		else
			var86 = nil
		end
		var33 = var86
		
		if var33 then
			var33:GetPropertyChangedSignal("Visible"):Connect(onOuterContainerVisibilityChanged)
		end
	end
	createViewport()
	playerAdded(p28)
	playersService.PlayerAdded:Connect(playerAdded)
	playersService.PlayerRemoving:Connect(function(p31)
		-- upvalues: localPlayer (copy), t_4 (copy), clearClone (copy)
		if p31 == localPlayer then
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
	startRenderStepped(p28)
	
	return clearClone
end