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
local var9 = if fFlagProfilePlatformNewProfileHeader then 6.5 else nil
local var10 = if fFlagProfilePlatformNewProfileHeader then 8 else nil
local var11 = if fFlagProfilePlatformNewProfileHeader then math.rad((if fFlagProfilePlatformNewProfileHeader then 70 else nil) / 2) else nil

local _ = function(p0, p1)
	-- upvalues: var11 (ref), var9 (ref), var10 (ref)
	return math.clamp(p0 / (math.tan(var11) * 2) * p1, var9 * p1, var10 * p1)
end

local var12 = if fFlagProfilePlatformNewProfileHeader then 2 else nil
local cFrame = CFrame.new(Vector3.new(0, 1000, 0))
local fFlagPPVBackgroundUse2DAsLoadingState = require(parent.SharedFlags).FFlagPPVBackgroundUse2DAsLoadingState
local isGetThrottleFramerateEnabledAvailable = game:DefineFastFlag("PPVBackgroundUnthrottleProfileV2", false) and game:GetEngineFeature("IsGetThrottleFramerateEnabledAvailable")
local PPVBackgroundUnthrottleRefCount = game:DefineFastFlag("PPVBackgroundUnthrottleRefCount", false)
local fFlagPPVEnable3DBackground = require(parent.SharedFlags).FFlagPPVEnable3DBackground
local avatarModelPrefetchModule = require(editProfileBackground.Common.AvatarModelPrefetch)
local insertService = game:GetService("InsertService")
local var18 = 0
local var19 = nil

local _ = function()
	-- upvalues: var18 (write), var19 (write), runService (ref)
	if var18 == 0 then
		var19 = runService:getThrottleFramerateEnabled()
		runService:setThrottleFramerateEnabled(false)
	end
	var18 += 1
end

local function releaseUnthrottle()
	-- upvalues: var18 (write), runService (ref), var19 (write)
	var18 -= 1
	
	if var18 <= 0 then
		var18 = 0
		runService:setThrottleFramerateEnabled(var19 == true)
		var19 = nil
	end
end

local function playToolAnimation(p2)
	if not p2:IsDescendantOf(game) then return end
	local animate = p2:FindFirstChild("Animate")
	assert(animate ~= nil, "Expected animate to always exist")
	local toolnone = animate:FindFirstChild("toolnone")
	assert(toolnone ~= nil, "Expected tool animation to always exist")
	local var24 = toolnone:GetChildren()[1]
	
	if var24 == nil then
		return
	end
	assert(var24:IsA("Animation"), "Unexpected type for tool animation")
	local humanoid = p2:FindFirstChild("Humanoid")
	assert(humanoid ~= nil, "Expected humanoid to always exist")
	local animator = humanoid:FindFirstChild("Animator")
	assert(animator ~= nil, "Expected Animator to always exist")
	assert(animator:IsA("Animator"), "Animator should be of type Animator")
	local var27 = animator:LoadAnimation(var24)
	var27.Looped = true
	var27:Play()
end

return function(value)
	-- upvalues: useLocalUserId (ref), useSelectedTheme (ref), reactModule (ref), isGetThrottleFramerateEnabledAvailable (ref), fFlagPPVEnable3DBackground (ref), insertService (ref), getDisplayBackgroundId (ref), color (ref), color_1 (ref), PPVBackgroundUnthrottleRefCount (ref), var18 (write), var19 (write), runService (ref), releaseUnthrottle (ref), playToolAnimation (ref), promiseModule (ref), avatarModelPrefetchModule (ref), cryoModule (ref), errorTypes (ref), cFrame (ref), fFlagProfilePlatformNewProfileHeader (ref), var12 (ref), fFlagProfilePlatformMeTabMobileProfileHero (ref), var11 (ref), var9 (ref), var10 (ref), userInputService (ref), view (ref), fFlagPPVBackgroundUse2DAsLoadingState (ref), loadableImage (ref), loading (ref), iconSize (ref)
	local var28 = useLocalUserId()
	local userId = value.userId or var28 and tonumber(var28)
	local var30 = useSelectedTheme()
	local var31 = reactModule.useRef(nil)
	local var32 = reactModule.useRef(nil)
	local var33 = reactModule.useRef(nil)
	local var34 = reactModule.useRef(nil)
	local var35, var36 = reactModule.useState(true)
	local var37 = if isGetThrottleFramerateEnabledAvailable then reactModule.useRef(nil) else nil
	
	if fFlagPPVEnable3DBackground then
		reactModule.useEffect(function()
			-- upvalues: value (ref), insertService (copy), getDisplayBackgroundId (copy), var30 (ref), var32 (ref), var31 (ref), color (copy), color_1 (copy)
			task.defer(function()
				-- upvalues: value (copy), insertService (copy), getDisplayBackgroundId (copy), var30 (copy), var32 (copy), var31 (copy), color (copy), color_1 (copy)
				if not value.currentBackgroundId then return end
				local ok, status = pcall(function()
					-- upvalues: insertService (copy), getDisplayBackgroundId (copy), value (copy), var30 (copy)
					return insertService:LoadAsset(getDisplayBackgroundId(value.currentBackgroundId, var30))
				end)
				
				if ok and status then
					if var32.current then
						for i, v in pairs(var32.current:GetChildren()) do
							if v.Name ~= "Character" then
								v:Destroy()
							end
						end
					end
					local backgroundModel = Instance.new("Model")
					backgroundModel.Name = "BackgroundModel"
					backgroundModel.Parent = var32.current
					
					for i, v in pairs(status:GetChildren()) do
						v.Parent = backgroundModel
					end
					backgroundModel:PivotTo(CFrame.new(0, 7, -4.5))
					status:Destroy()
					local current = var31.current
					
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
			-- upvalues: PPVBackgroundUnthrottleRefCount (copy), var18 (copy), var19 (copy), runService (copy), releaseUnthrottle (copy), var37 (ref)
			if not PPVBackgroundUnthrottleRefCount then
				var37.current = runService:getThrottleFramerateEnabled()
				runService:setThrottleFramerateEnabled(false)
				
				return function()
					-- upvalues: runService (copy), var37 (copy)
					runService:setThrottleFramerateEnabled(var37.current or true)
				end
			elseif var18 == 0 then
				var19 = runService:getThrottleFramerateEnabled()
				runService:setThrottleFramerateEnabled(false)
			end
			var18 += 1
			
			return releaseUnthrottle
		end, {})
	end
	local var38 = reactModule.useCallback(function(p3, p4)
		-- upvalues: playToolAnimation (copy)
		if not p3 or not p4 then return end
		local rightHand = p3:FindFirstChild("RightHand")
		
		if not rightHand or not rightHand:IsA("BasePart") then return end
		local rightGripAttachment = rightHand:FindFirstChild("RightGripAttachment")
		
		if not rightGripAttachment or not rightGripAttachment:IsA("Attachment") then return end
		local handle = p4:FindFirstChild("Handle")
		
		if not handle or not handle:IsA("BasePart") then return end
		for i, v in ipairs(p4:GetDescendants()) do
			if v:IsA("Script") or v:IsA("LocalScript") then
				v.Disabled = true
			end
		end
		p4.Parent = p3
		playToolAnimation(p3)
		handle.CFrame = rightGripAttachment.WorldCFrame
		local weld = Instance.new("Weld")
		weld.Parent = p4
		weld.Part0 = handle
		weld.Part1 = rightHand
		weld.C0 = p4.Grip
		weld.C1 = rightGripAttachment.CFrame
	end, {})
	local var39 = reactModule.useCallback(function(p5, p6)
		if not p5 or not p6 then return end
		local var45 = p5:FindFirstChild("Right Arm")
		
		if not var45 or not var45:IsA("BasePart") then return end
		local rightGripAttachment = var45:FindFirstChild("RightGripAttachment")
		
		if not rightGripAttachment or not rightGripAttachment:IsA("Attachment") then return end
		local var47 = p5:FindFirstChild("Right Shoulder", true)
		
		if not var47 or not var47:IsA("Motor6D") then return end
		local handle = p6:FindFirstChild("Handle")
		
		if not handle or not handle:IsA("BasePart") then return end
		for i, v in ipairs(p6:GetDescendants()) do
			if v:IsA("Script") or v:IsA("LocalScript") then
				v.Disabled = true
			end
		end
		p6.Parent = p5
		var47.C0 *= CFrame.Angles(0, 0, 1.570796326795)
		handle.CFrame = rightGripAttachment.WorldCFrame
		local var49 = CFrame.new(0, -1, 0) * CFrame.Angles(-1.570796326795, 0, 0)
		local weld = Instance.new("Weld")
		weld.Parent = p6
		weld.Part0 = handle
		weld.Part1 = var45
		weld.C0 = p6.Grip
		weld.C1 = var49
	end, {})
	reactModule.useEffect(function()
		-- upvalues: userId (ref), var36 (ref), promiseModule (copy), avatarModelPrefetchModule (copy), insertService (copy), cryoModule (copy), value (ref), errorTypes (copy), var32 (ref), cFrame (copy), var34 (ref), var38 (ref), var39 (ref), fFlagProfilePlatformNewProfileHeader (copy), var33 (ref), var12 (copy), fFlagProfilePlatformMeTabMobileProfileHero (copy), var11 (copy), var9 (copy), var10 (copy), isGetThrottleFramerateEnabledAvailable (copy), userInputService (copy)
		task.defer(function()
			-- upvalues: userId (copy), var36 (copy), promiseModule (copy), avatarModelPrefetchModule (copy), insertService (copy), cryoModule (copy), value (copy), errorTypes (copy), var32 (copy), cFrame (copy), var34 (copy), var38 (copy), var39 (copy), fFlagProfilePlatformNewProfileHeader (copy), var33 (copy), var12 (copy), fFlagProfilePlatformMeTabMobileProfileHero (copy), var11 (copy), var9 (copy), var10 (copy), isGetThrottleFramerateEnabledAvailable (copy), userInputService (copy)
			if not userId then return end
			var36(true)
			local var51 = promiseModule.resolve(nil)
			local var52 = promiseModule.resolve(nil)
			local var53, var54 = promiseModule.all({
				avatarModelPrefetchModule.get(userId),
				promiseModule.new(function(p7)
					-- upvalues: userId (copy), var51 (write), promiseModule (copy), insertService (copy), cryoModule (copy), var52 (write)
					local ok, status = pcall(function()
						-- upvalues: userId (copy)
						return game.Players:GetCharacterAppearanceInfoAsync(userId)
					end)
					
					if ok and status then
						if status.emotes and #status.emotes > 0 then
							var51 = promiseModule.new(function(p8)
								-- upvalues: insertService (copy), status (ref)
								local ok, status_1 = pcall(function()
									-- upvalues: insertService (copy), status (copy)
									return insertService:LoadAsset(status.emotes[1].assetId):FindFirstChildOfClass("Animation")
								end)
								p8(if ok then status_1 else nil)
							end)
						end
						if status.assets then
							local var65 = cryoModule.List.findWhere(status.assets, function(p9)
								return p9.assetType.name == "Gear"
							end)
							
							if var65 then
								local var66 = status.assets[var65]
								var52 = promiseModule.new(function(p10)
									-- upvalues: insertService (copy), var66 (ref)
									local ok, status = pcall(function()
										-- upvalues: insertService (copy), var66 (copy)
										return insertService:LoadAsset(var66.id):FindFirstChildOfClass("Tool")
									end)
									p10(if ok and status and status:IsA("Tool") then status else nil)
								end)
							end
						end
					end
					p7(if ok then status else nil)
				end):catch(function()
					return nil
				end)
			}):await()
			
			if var53 then
				local character = var54[1]
				local var56 = var54[2]
				avatarModelPrefetchModule.clear(userId)
				character.Name = "Character"
				character.Parent = var32.current
				
				if character.PrimaryPart then
					character.PrimaryPart.CFrame = cFrame
				end
				var34.current = character
				
				if var56 then
					local _, var57 = var52:await()
					
					if var57 then
						local playerAvatarType = var56.playerAvatarType
						
						if playerAvatarType == "R15" then
							var38(character, var57)
						elseif playerAvatarType == "R6" then
							var39(character, var57)
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
						
						if fFlagProfilePlatformNewProfileHeader and var33.current then
							local clampedValue
							local boundingBox, boundingBox_1 = character:GetBoundingBox()
							local var62 = boundingBox_1.Y + var12
							local y = boundingBox.Position.Y
							
							if fFlagProfilePlatformMeTabMobileProfileHero then
								local cameraDistanceScale = value.cameraDistanceScale or 1
								clampedValue = math.clamp(var62 / (math.tan(var11) * 2) * cameraDistanceScale, var9 * cameraDistanceScale, var10 * cameraDistanceScale)
							else
								clampedValue = math.clamp(var62 / (math.tan(var11) * 2), var9, var10)
							end
							var33.current.CFrame = CFrame.lookAt(Vector3.new(0, 0, -clampedValue), Vector3.new(0, y, 10))
						end
					end
				end
				var36(false)
				
				if isGetThrottleFramerateEnabledAvailable or userInputService.PreferredInput ~= Enum.PreferredInput.Touch then
					local ok, _ = pcall(function()
						-- upvalues: var51 (write), character (ref)
						local _, var67 = var51:await()
						local animation1 = character:FindFirstChild("Animate"):FindFirstChild("idle"):FindFirstChild("Animation1")
						local animator = character:FindFirstChild("Humanoid"):FindFirstChild("Animator")
						
						if animation1 and animator and animator:IsA("Animator") then
							local var70 = animator:LoadAnimation(animation1)
							
							if var67 then
								local var71 = animator:LoadAnimation(var67)
								var71.Looped = false
								var71:Play()
								var71.Stopped:Connect(function()
									-- upvalues: var70 (ref)
									var70:Play()
								end)
								
								return
							end
							var70:Play()
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
			var36(false)
		end)
	end, {
		userId,
		if fFlagProfilePlatformMeTabMobileProfileHero then value.cameraDistanceScale else nil
	})
	reactModule.useEffect(function()
		-- upvalues: var31 (ref), var33 (ref)
		if var31.current and var33.current then
			var31.current.CurrentCamera = var33.current
		end
	end)
	
	return reactModule.createElement(view, { ZIndex = 2, Size = UDim2.new(1, 0, 0, value.height) }, {
		Background = reactModule.createElement("ViewportFrame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ref = var31,
			Ambient = color,
			LightColor = color_1
		}, {
			WorldModel = reactModule.createElement("WorldModel", { ref = var32 }),
			Camera = reactModule.createElement("Camera", {
				CameraType = Enum.CameraType.Scriptable,
				CFrame = CFrame.lookAt(Vector3.new(0, 0, -8), Vector3.new(0, 1, 10)),
				ref = var33
			})
		}),
		LoadingFrame = var35 and reactModule.createElement(view, { tag = "size-full-full", ZIndex = 2 }, {
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