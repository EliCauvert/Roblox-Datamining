local editProfileBackground = script:FindFirstAncestor("EditProfileBackground")
local parent = editProfileBackground.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local iconSize = foundationModule.Enums.IconSize
local loading = foundationModule.Loading
local view = foundationModule.View
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useSelectedTheme = require(parent.RoactUtils).Hooks.useSelectedTheme
local getDisplayBackgroundId = require(editProfileBackground.Common.BackgroundUtils).getDisplayBackgroundId
local errorTypes = require(editProfileBackground.Analytics).ErrorTypes
local fFlagProfilePlatformNewProfileHeader = require(parent.SharedFlags).FFlagProfilePlatformNewProfileHeader
local fFlagProfilePlatformMeTabMobileProfileHero = require(parent.SharedFlags).FFlagProfilePlatformMeTabMobileProfileHero
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local promiseModule = require(parent.Promise)
local loadableImage = require(parent.UIBlox).App.Loading.LoadableImage

local function _()
	-- upvalues: userInputService (ref)
	return userInputService.PreferredInput ~= Enum.PreferredInput.Touch
end

local color = Color3.fromRGB(210, 210, 210)
local color_1 = Color3.fromRGB(250, 250, 250)
local var1 = if fFlagProfilePlatformNewProfileHeader then 6.5 else nil
local var2 = if fFlagProfilePlatformNewProfileHeader then 8 else nil
local var3 = if fFlagProfilePlatformNewProfileHeader then math.rad((if fFlagProfilePlatformNewProfileHeader then 70 else nil) / 2) else nil

local _ = function(p1, p2)
	-- upvalues: var3 (ref), var1 (ref), var2 (ref)
	return math.clamp(p1 / (math.tan(var3) * 2) * p2, var1 * p2, var2 * p2)
end

local var4 = if fFlagProfilePlatformNewProfileHeader then 2 else nil
local cFrame = CFrame.new(Vector3.new(0, 1000, 0))
local fFlagPPVBackgroundUse2DAsLoadingState = require(parent.SharedFlags).FFlagPPVBackgroundUse2DAsLoadingState
local isGetThrottleFramerateEnabledAvailable = game:DefineFastFlag("PPVBackgroundUnthrottleProfileV2", false) and game:GetEngineFeature("IsGetThrottleFramerateEnabledAvailable")
local PPVBackgroundUnthrottleRefCount = game:DefineFastFlag("PPVBackgroundUnthrottleRefCount", false)
local fFlagPPVEnable3DBackground = require(parent.SharedFlags).FFlagPPVEnable3DBackground
local avatarModelPrefetchModule = require(editProfileBackground.Common.AvatarModelPrefetch)
local insertService = game:GetService("InsertService")
local var5 = 0
local var6 = nil

local _ = function()
	-- upvalues: var5 (write), var6 (write), runService (ref)
	if var5 == 0 then
		var6 = runService:getThrottleFramerateEnabled()
		runService:setThrottleFramerateEnabled(false)
	end
	var5 += 1
end

local function releaseUnthrottle()
	-- upvalues: var5 (write), runService (ref), var6 (write)
	var5 -= 1
	
	if var5 <= 0 then
		var5 = 0
		runService:setThrottleFramerateEnabled(var6 == true)
		var6 = nil
	end
end

local function playToolAnimation(p1)
	if not p1:IsDescendantOf(game) then return end
	local animate = p1:FindFirstChild("Animate")
	assert(animate ~= nil, "Expected animate to always exist")
	local toolnone = animate:FindFirstChild("toolnone")
	assert(toolnone ~= nil, "Expected tool animation to always exist")
	local var7 = toolnone:GetChildren()[1]
	
	if var7 == nil then
		return
	end
	assert(var7:IsA("Animation"), "Unexpected type for tool animation")
	local humanoid = p1:FindFirstChild("Humanoid")
	assert(humanoid ~= nil, "Expected humanoid to always exist")
	local animator = humanoid:FindFirstChild("Animator")
	assert(animator ~= nil, "Expected Animator to always exist")
	assert(animator:IsA("Animator"), "Animator should be of type Animator")
	local var8 = animator:LoadAnimation(var7)
	var8.Looped = true
	var8:Play()
end

return function(value)
	-- upvalues: useLocalUserId (ref), useSelectedTheme (ref), reactModule (ref), isGetThrottleFramerateEnabledAvailable (ref), fFlagPPVEnable3DBackground (ref), insertService (ref), getDisplayBackgroundId (ref), color (ref), color_1 (ref), PPVBackgroundUnthrottleRefCount (ref), var5 (write), var6 (write), runService (ref), releaseUnthrottle (ref), playToolAnimation (ref), promiseModule (ref), avatarModelPrefetchModule (ref), cryoModule (ref), errorTypes (ref), cFrame (ref), fFlagProfilePlatformNewProfileHeader (ref), var4 (ref), fFlagProfilePlatformMeTabMobileProfileHero (ref), var3 (ref), var1 (ref), var2 (ref), userInputService (ref), view (ref), fFlagPPVBackgroundUse2DAsLoadingState (ref), loadableImage (ref), loading (ref), iconSize (ref)
	local var7 = useLocalUserId()
	local userId = value.userId or var7 and tonumber(var7)
	local var8 = useSelectedTheme()
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.useRef(nil)
	local var11 = reactModule.useRef(nil)
	local var12 = reactModule.useRef(nil)
	local var13, var14 = reactModule.useState(true)
	local var15 = if isGetThrottleFramerateEnabledAvailable then reactModule.useRef(nil) else nil
	
	if fFlagPPVEnable3DBackground then
		reactModule.useEffect(function()
			-- upvalues: value (ref), insertService (copy), getDisplayBackgroundId (copy), var8 (ref), var10 (ref), var9 (ref), color (copy), color_1 (copy)
			task.defer(function()
				-- upvalues: value (copy), insertService (copy), getDisplayBackgroundId (copy), var8 (copy), var10 (copy), var9 (copy), color (copy), color_1 (copy)
				if not value.currentBackgroundId then return end
				local ok, status = pcall(function()
					-- upvalues: insertService (copy), getDisplayBackgroundId (copy), value (copy), var8 (copy)
					return insertService:LoadAsset(getDisplayBackgroundId(value.currentBackgroundId, var8))
				end)
				
				if ok and status then
					if var10.current then
						for i, v in pairs(var10.current:GetChildren()) do
							if v.Name ~= "Character" then
								v:Destroy()
							end
						end
					end
					local backgroundModel = Instance.new("Model")
					backgroundModel.Name = "BackgroundModel"
					backgroundModel.Parent = var10.current
					
					for i, v in pairs(status:GetChildren()) do
						v.Parent = backgroundModel
					end
					backgroundModel:PivotTo(CFrame.new(0, 7, -4.5))
					status:Destroy()
					local current = var9.current
					
					if current then
						current.Ambient = color
						current.LightColor = color_1
						current.LightDirection = Vector3.new(-0.5, 0.20000000298, 0.20000000298)
					end
				end
			end)
		end, { value.currentBackgroundId })
	end
	if isGetThrottleFramerateEnabledAvailable then
		reactModule.useEffect(function()
			-- upvalues: PPVBackgroundUnthrottleRefCount (copy), var5 (copy), var6 (copy), runService (copy), releaseUnthrottle (copy), var15 (ref)
			if not PPVBackgroundUnthrottleRefCount then
				var15.current = runService:getThrottleFramerateEnabled()
				runService:setThrottleFramerateEnabled(false)
				
				return function()
					-- upvalues: runService (copy), var15 (copy)
					runService:setThrottleFramerateEnabled(var15.current or true)
				end
			elseif var5 == 0 then
				var6 = runService:getThrottleFramerateEnabled()
				runService:setThrottleFramerateEnabled(false)
			end
			var5 += 1
			
			return releaseUnthrottle
		end, {})
	end
	local var16 = reactModule.useCallback(function(p1, p2)
		-- upvalues: playToolAnimation (copy)
		if not p1 or not p2 then return end
		local rightHand = p1:FindFirstChild("RightHand")
		
		if not rightHand or not rightHand:IsA("BasePart") then return end
		local rightGripAttachment = rightHand:FindFirstChild("RightGripAttachment")
		
		if not rightGripAttachment or not rightGripAttachment:IsA("Attachment") then return end
		local handle = p2:FindFirstChild("Handle")
		
		if not handle or not handle:IsA("BasePart") then return end
		for i, v in ipairs(p2:GetDescendants()) do
			if v:IsA("Script") or v:IsA("LocalScript") then
				v.Disabled = true
			end
		end
		p2.Parent = p1
		playToolAnimation(p1)
		handle.CFrame = rightGripAttachment.WorldCFrame
		local weld = Instance.new("Weld")
		weld.Parent = p2
		weld.Part0 = handle
		weld.Part1 = rightHand
		weld.C0 = p2.Grip
		weld.C1 = rightGripAttachment.CFrame
	end, {})
	local var17 = reactModule.useCallback(function(p3, p4)
		if not p3 or not p4 then return end
		local var18 = p3:FindFirstChild("Right Arm")
		
		if not var18 or not var18:IsA("BasePart") then return end
		local rightGripAttachment = var18:FindFirstChild("RightGripAttachment")
		
		if not rightGripAttachment or not rightGripAttachment:IsA("Attachment") then return end
		local var19 = p3:FindFirstChild("Right Shoulder", true)
		
		if not var19 or not var19:IsA("Motor6D") then return end
		local handle = p4:FindFirstChild("Handle")
		
		if not handle or not handle:IsA("BasePart") then return end
		for i, v in ipairs(p4:GetDescendants()) do
			if v:IsA("Script") or v:IsA("LocalScript") then
				v.Disabled = true
			end
		end
		p4.Parent = p3
		var19.C0 *= CFrame.Angles(0, 0, 1.570796326795)
		handle.CFrame = rightGripAttachment.WorldCFrame
		local var20 = CFrame.new(0, -1, 0) * CFrame.Angles(-1.570796326795, 0, 0)
		local weld = Instance.new("Weld")
		weld.Parent = p4
		weld.Part0 = handle
		weld.Part1 = var18
		weld.C0 = p4.Grip
		weld.C1 = var20
	end, {})
	reactModule.useEffect(function()
		-- upvalues: userId (ref), var14 (ref), promiseModule (copy), avatarModelPrefetchModule (copy), insertService (copy), cryoModule (copy), value (ref), errorTypes (copy), var10 (ref), cFrame (copy), var12 (ref), var16 (ref), var17 (ref), fFlagProfilePlatformNewProfileHeader (copy), var11 (ref), var4 (copy), fFlagProfilePlatformMeTabMobileProfileHero (copy), var3 (copy), var1 (copy), var2 (copy), isGetThrottleFramerateEnabledAvailable (copy), userInputService (copy)
		task.defer(function()
			-- upvalues: userId (copy), var14 (copy), promiseModule (copy), avatarModelPrefetchModule (copy), insertService (copy), cryoModule (copy), value (copy), errorTypes (copy), var10 (copy), cFrame (copy), var12 (copy), var16 (copy), var17 (copy), fFlagProfilePlatformNewProfileHeader (copy), var11 (copy), var4 (copy), fFlagProfilePlatformMeTabMobileProfileHero (copy), var3 (copy), var1 (copy), var2 (copy), isGetThrottleFramerateEnabledAvailable (copy), userInputService (copy)
			if not userId then return end
			var14(true)
			local var21 = promiseModule.resolve(nil)
			local var22 = promiseModule.resolve(nil)
			local var23, var24 = promiseModule.all({
				avatarModelPrefetchModule.get(userId),
				promiseModule.new(function(p5)
					-- upvalues: userId (copy), var21 (write), promiseModule (copy), insertService (copy), cryoModule (copy), var22 (write)
					local ok, status = pcall(function()
						-- upvalues: userId (copy)
						return game.Players:GetCharacterAppearanceInfoAsync(userId)
					end)
					
					if ok and status then
						if status.emotes and #status.emotes > 0 then
							var21 = promiseModule.new(function(p6)
								-- upvalues: insertService (copy), status (ref)
								local ok, status_1 = pcall(function()
									-- upvalues: insertService (copy), status (copy)
									return insertService:LoadAsset(status.emotes[1].assetId):FindFirstChildOfClass("Animation")
								end)
								p6(if ok then status_1 else nil)
							end)
						end
						if status.assets then
							local var25 = cryoModule.List.findWhere(status.assets, function(p6)
								return p6.assetType.name == "Gear"
							end)
							
							if var25 then
								local var26 = status.assets[var25]
								var22 = promiseModule.new(function(p6)
									-- upvalues: insertService (copy), var26 (ref)
									local ok, status = pcall(function()
										-- upvalues: insertService (copy), var26 (copy)
										return insertService:LoadAsset(var26.id):FindFirstChildOfClass("Tool")
									end)
									p6(if ok and status and status:IsA("Tool") then status else nil)
								end)
							end
						end
					end
					p5(if ok then status else nil)
				end):catch(function()
					return nil
				end)
			}):await()
			
			if var23 then
				local character = var24[1]
				local var25 = var24[2]
				avatarModelPrefetchModule.clear(userId)
				character.Name = "Character"
				character.Parent = var10.current
				
				if character.PrimaryPart then
					character.PrimaryPart.CFrame = cFrame
				end
				var12.current = character
				
				if var25 then
					local _, var26 = var22:await()
					
					if var26 then
						local playerAvatarType = var25.playerAvatarType
						
						if playerAvatarType == "R15" then
							var16(character, var26)
						elseif playerAvatarType == "R6" then
							var17(character, var26)
						end
					end
				end
				local humanoid = character:FindFirstChild("Humanoid")
				
				if humanoid then
					promiseModule.race({
						promiseModule.fromEvent(humanoid.ClusterCompositionFinished),
						promiseModule.delay(3)
					}):await()
				end
				if character.PrimaryPart then
					character.PrimaryPart.CFrame = CFrame.lookAt(Vector3.new(0, 0, 0), Vector3.new(0, 0, -10))
					local rightFoot = character:FindFirstChild("RightFoot") or character:FindFirstChild("Right Leg")
					
					if rightFoot and rightFoot:IsA("BasePart") then
						character.PrimaryPart.CFrame = CFrame.lookAt(Vector3.new(0, character.PrimaryPart.Position.Y + (-3 - (rightFoot.Position.Y - rightFoot.Size.Y / 2)), 0), Vector3.new(0, 0, -10))
						
						if fFlagProfilePlatformNewProfileHeader and var11.current then
							local clampedValue
							local boundingBox, boundingBox_1 = character:GetBoundingBox()
							local var27 = boundingBox_1.Y + var4
							local y = boundingBox.Position.Y
							
							if fFlagProfilePlatformMeTabMobileProfileHero then
								local cameraDistanceScale = value.cameraDistanceScale or 1
								clampedValue = math.clamp(var27 / (math.tan(var3) * 2) * cameraDistanceScale, var1 * cameraDistanceScale, var2 * cameraDistanceScale)
							else
								clampedValue = math.clamp(var27 / (math.tan(var3) * 2), var1, var2)
							end
							var11.current.CFrame = CFrame.lookAt(Vector3.new(0, 0, -clampedValue), Vector3.new(0, y, 10))
						end
					end
				end
				var14(false)
				
				if isGetThrottleFramerateEnabledAvailable or userInputService.PreferredInput ~= Enum.PreferredInput.Touch then
					local ok, _ = pcall(function()
						-- upvalues: var21 (write), character (ref)
						local _, var28 = var21:await()
						local animation1 = character:FindFirstChild("Animate"):FindFirstChild("idle"):FindFirstChild("Animation1")
						local animator = character:FindFirstChild("Humanoid"):FindFirstChild("Animator")
						
						if animation1 and animator and animator:IsA("Animator") then
							local var29 = animator:LoadAnimation(animation1)
							
							if var28 then
								local var30 = animator:LoadAnimation(var28)
								var30.Looped = false
								var30:Play()
								var30.Stopped:Connect(function()
									-- upvalues: var29 (ref)
									var29:Play()
								end)
								
								return
							end
							var29:Play()
						end
					end)
					
					if not ok and value.analytics then
						value.analytics.fireAnalyticsEvent("EditProfileBackgroundFailure", { errorType = errorTypes.CharacterAnimationFailed })
					end
				end
				return
			elseif value.analytics then
				value.analytics.fireAnalyticsEvent("EditProfileBackgroundFailure", { errorType = errorTypes.CharacterModelCreationFailed })
			end
			var14(false)
		end)
	end, {
		userId,
		if fFlagProfilePlatformMeTabMobileProfileHero then value.cameraDistanceScale else nil
	})
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), var11 (ref)
		if var9.current and var11.current then
			var9.current.CurrentCamera = var11.current
		end
	end)
	
	return reactModule.createElement(view, { ZIndex = 2, Size = UDim2.new(1, 0, 0, value.height) }, {
		Background = reactModule.createElement("ViewportFrame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ref = var9,
			Ambient = color,
			LightColor = color_1
		}, {
			WorldModel = reactModule.createElement("WorldModel", { ref = var10 }),
			Camera = reactModule.createElement("Camera", {
				CameraType = Enum.CameraType.Scriptable,
				CFrame = CFrame.lookAt(Vector3.new(0, 0, -8), Vector3.new(0, 1, 10)),
				ref = var11
			})
		}),
		LoadingFrame = var13 and reactModule.createElement(view, { tag = "size-full-full", ZIndex = 2 }, {
			if fFlagPPVBackgroundUse2DAsLoadingState then reactModule.createElement(loadableImage, {
				BackgroundTransparency = 1,
				useShimmerAnimationWhileLoading = true,
				ZIndex = 2,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, -24),
				Size = UDim2.new(1, -48, 1, -48),
				ScaleType = Enum.ScaleType.Fit,
				Image = value.userThumbnail
			}) else reactModule.createElement(loading, {
				size = iconSize.Large,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5)
			})
		})
	})
end