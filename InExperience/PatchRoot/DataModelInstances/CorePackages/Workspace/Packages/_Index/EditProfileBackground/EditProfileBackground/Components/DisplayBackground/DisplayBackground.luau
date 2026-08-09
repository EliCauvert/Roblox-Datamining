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
local userInputService = game:GetService("UserInputService")
local playersService = game:GetService("Players")
local runService = game:GetService("RunService")
local promiseModule = require(parent.Promise)
local loadableImage = require(parent.UIBlox).App.Loading.LoadableImage

local function _() --[[ line: 26 | named "shouldEnableAnimation" ]]
	-- upvalues: userInputService (ref)
	return userInputService.PreferredInput ~= Enum.PreferredInput.Touch
end

local color = Color3.fromRGB(210, 210, 210)
local color_1 = Color3.fromRGB(250, 250, 250)
local var10 = if fFlagProfilePlatformNewProfileHeader then 6.5 else nil
local var11 = if fFlagProfilePlatformNewProfileHeader then 8 else nil
local var12 = if fFlagProfilePlatformNewProfileHeader then math.rad((if fFlagProfilePlatformNewProfileHeader then 70 else nil) / 2) else nil
local var13 = if fFlagProfilePlatformNewProfileHeader then 2 else nil
local cFrame = CFrame.new(Vector3.new(0, 1000, 0))
local fFlagPPVBackgroundUse2DAsLoadingState = require(parent.SharedFlags).FFlagPPVBackgroundUse2DAsLoadingState
local isGetThrottleFramerateEnabledAvailable = game:DefineFastFlag("PPVBackgroundUnthrottleProfileV2", false) and game:GetEngineFeature("IsGetThrottleFramerateEnabledAvailable")
local fFlagPPVEnable3DBackground = require(parent.SharedFlags).FFlagPPVEnable3DBackground
local fFlagPPVBackgroundPrefetchAvatar = require(parent.SharedFlags).FFlagPPVBackgroundPrefetchAvatar
local var16 = if fFlagPPVBackgroundPrefetchAvatar then require(editProfileBackground.Common.AvatarModelPrefetch) else nil
local getFFlagDisplayBackgroundToolNotInDataModelModule = require(script.Parent.GetFFlagDisplayBackgroundToolNotInDataModel)
local insertService = game:GetService("InsertService")

local function playToolAnimation(p0) --[[ line: 107 ]]
	-- upvalues: getFFlagDisplayBackgroundToolNotInDataModelModule (ref)
	if getFFlagDisplayBackgroundToolNotInDataModelModule() and not p0:IsDescendantOf(game) then return end
	local animate = p0:FindFirstChild("Animate")
	assert(animate ~= nil, "Expected animate to always exist")
	local toolnone = animate:FindFirstChild("toolnone")
	assert(toolnone ~= nil, "Expected tool animation to always exist")
	local var22 = toolnone:GetChildren()[1]
	
	if var22 == nil then
		return
	end
	assert(var22:IsA("Animation"), "Unexpected type for tool animation")
	local humanoid = p0:FindFirstChild("Humanoid")
	assert(humanoid ~= nil, "Expected humanoid to always exist")
	local animator = humanoid:FindFirstChild("Animator")
	assert(animator ~= nil, "Expected Animator to always exist")
	assert(animator:IsA("Animator"), "Animator should be of type Animator")
	local var25 = animator:LoadAnimation(var22)
	var25.Looped = true
	var25:Play()
end

return function(value) --[[ line: 140 | named "BackgroundDisplay" ]]
	-- upvalues: useLocalUserId (ref), useSelectedTheme (ref), reactModule (ref), isGetThrottleFramerateEnabledAvailable (ref), fFlagPPVEnable3DBackground (ref), insertService (ref), getDisplayBackgroundId (ref), color (ref), color_1 (ref), runService (ref), playToolAnimation (ref), promiseModule (ref), fFlagPPVBackgroundPrefetchAvatar (ref), var16 (ref), playersService (ref), cryoModule (ref), errorTypes (ref), cFrame (ref), fFlagProfilePlatformNewProfileHeader (ref), var13 (ref), var12 (ref), var10 (ref), var11 (ref), userInputService (ref), view (ref), fFlagPPVBackgroundUse2DAsLoadingState (ref), loadableImage (ref), loading (ref), iconSize (ref)
	local var26 = useLocalUserId()
	local userId = value.userId or var26 and tonumber(var26)
	local var28 = useSelectedTheme()
	local var29 = reactModule.useRef(nil)
	local var30 = reactModule.useRef(nil)
	local var31 = reactModule.useRef(nil)
	local var32 = reactModule.useRef(nil)
	local var33, var34 = reactModule.useState(true)
	local var35 = if isGetThrottleFramerateEnabledAvailable then reactModule.useRef(nil) else nil
	
	if fFlagPPVEnable3DBackground then
		reactModule.useEffect(function() --[[ line: 154 ]]
			-- upvalues: value (ref), insertService (copy), getDisplayBackgroundId (copy), var28 (ref), var30 (ref), var29 (ref), color (copy), color_1 (copy)
			task.defer(function() --[[ line: 156 ]]
				-- upvalues: value (copy), insertService (copy), getDisplayBackgroundId (copy), var28 (copy), var30 (copy), var29 (copy), color (copy), color_1 (copy)
				if not value.currentBackgroundId then return end
				local ok, status = pcall(function() --[[ line: 161 ]]
					-- upvalues: insertService (copy), getDisplayBackgroundId (copy), value (copy), var28 (copy)
					return insertService:LoadAsset(getDisplayBackgroundId(value.currentBackgroundId, var28))
				end)
				
				if ok and status then
					if var30.current then
						for i, v in pairs(var30.current:GetChildren()) do
							if v.Name ~= "Character" then
								v:Destroy()
							end
						end
					end
					local backgroundModel = Instance.new("Model")
					backgroundModel.Name = "BackgroundModel"
					backgroundModel.Parent = var30.current
					
					for i, v in pairs(status:GetChildren()) do
						v.Parent = backgroundModel
					end
					backgroundModel:PivotTo(CFrame.new(0, 7, -4.5))
					status:Destroy()
					local current = var29.current
					
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
		reactModule.useEffect(function() --[[ line: 198 ]]
			-- upvalues: var35 (ref), runService (copy)
			var35.current = runService:getThrottleFramerateEnabled()
			runService:setThrottleFramerateEnabled(false)
			
			return function() --[[ line: 201 ]]
				-- upvalues: runService (copy), var35 (copy)
				runService:setThrottleFramerateEnabled(var35.current or true)
			end
		end, {})
	end
	local var36 = reactModule.useCallback(function(p1, p2) --[[ line: 207 ]]
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
	local var37 = reactModule.useCallback(function(p3, p4) --[[ line: 244 ]]
		if not p3 or not p4 then return end
		local var43 = p3:FindFirstChild("Right Arm")
		
		if not var43 or not var43:IsA("BasePart") then return end
		local rightGripAttachment = var43:FindFirstChild("RightGripAttachment")
		
		if not rightGripAttachment or not rightGripAttachment:IsA("Attachment") then return end
		local var45 = p3:FindFirstChild("Right Shoulder", true)
		
		if not var45 or not var45:IsA("Motor6D") then return end
		local handle = p4:FindFirstChild("Handle")
		
		if not handle or not handle:IsA("BasePart") then return end
		for i, v in ipairs(p4:GetDescendants()) do
			if v:IsA("Script") or v:IsA("LocalScript") then
				v.Disabled = true
			end
		end
		p4.Parent = p3
		var45.C0 *= CFrame.Angles(0, 0, 1.570796326795)
		handle.CFrame = rightGripAttachment.WorldCFrame
		local var47 = CFrame.new(0, -1, 0) * CFrame.Angles(-1.570796326795, 0, 0)
		local weld = Instance.new("Weld")
		weld.Parent = p4
		weld.Part0 = handle
		weld.Part1 = var43
		weld.C0 = p4.Grip
		weld.C1 = var47
	end, {})
	reactModule.useEffect(function() --[[ line: 281 ]]
		-- upvalues: userId (ref), var34 (ref), promiseModule (copy), fFlagPPVBackgroundPrefetchAvatar (copy), var16 (copy), playersService (copy), insertService (copy), cryoModule (copy), value (ref), errorTypes (copy), var30 (ref), cFrame (copy), var32 (ref), var36 (ref), var37 (ref), fFlagProfilePlatformNewProfileHeader (copy), var31 (ref), var13 (copy), var12 (copy), var10 (copy), var11 (copy), isGetThrottleFramerateEnabledAvailable (copy), userInputService (copy)
		task.defer(function() --[[ line: 283 ]]
			-- upvalues: userId (copy), var34 (copy), promiseModule (copy), fFlagPPVBackgroundPrefetchAvatar (copy), var16 (copy), playersService (copy), insertService (copy), cryoModule (copy), value (copy), errorTypes (copy), var30 (copy), cFrame (copy), var32 (copy), var36 (copy), var37 (copy), fFlagProfilePlatformNewProfileHeader (copy), var31 (copy), var13 (copy), var12 (copy), var10 (copy), var11 (copy), isGetThrottleFramerateEnabledAvailable (copy), userInputService (copy)
			if not userId then return end
			var34(true)
			local var49 = promiseModule.resolve(nil)
			local var50 = promiseModule.resolve(nil)
			local var51, var52 = promiseModule.all({
				if fFlagPPVBackgroundPrefetchAvatar then var16.get(userId) else promiseModule.new(function(p5, p6) --[[ line: 294 ]]
					-- upvalues: playersService (copy), userId (copy)
					local ok, status = pcall(function() --[[ line: 295 ]]
						-- upvalues: playersService (copy), userId (copy)
						return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then playersService:CreateHumanoidModelFromUserIdAsync(userId) else game.Players:CreateHumanoidModelFromUserId(userId)
					end)
					
					if ok and status then
						p5(status)
						
						return
					end
					p6("CharacterModelCreationFailed")
				end),
				promiseModule.new(function(p7) --[[ line: 309 ]]
					-- upvalues: userId (copy), var49 (write), promiseModule (copy), insertService (copy), cryoModule (copy), var50 (write)
					local ok, status = pcall(function() --[[ line: 310 ]]
						-- upvalues: userId (copy)
						return game.Players:GetCharacterAppearanceInfoAsync(userId)
					end)
					
					if ok and status then
						if status.emotes and #status.emotes > 0 then
							var49 = promiseModule.new(function(p8) --[[ line: 315 ]]
								-- upvalues: insertService (copy), status (ref)
								local ok, status_1 = pcall(function() --[[ line: 316 ]]
									-- upvalues: insertService (copy), status (copy)
									return insertService:LoadAsset(status.emotes[1].assetId):FindFirstChildOfClass("Animation")
								end)
								p8(if ok then status_1 else nil)
							end)
						end
						if status.assets then
							local var60 = cryoModule.List.findWhere(status.assets, function(p9) --[[ line: 325 ]]
								return p9.assetType.name == "Gear"
							end)
							
							if var60 then
								local var61 = status.assets[var60]
								var50 = promiseModule.new(function(p10) --[[ line: 330 ]]
									-- upvalues: insertService (copy), var61 (ref)
									local ok, status = pcall(function() --[[ line: 331 ]]
										-- upvalues: insertService (copy), var61 (copy)
										return insertService:LoadAsset(var61.id):FindFirstChildOfClass("Tool")
									end)
									p10(if ok and status and status:IsA("Tool") then status else nil)
								end)
							end
						end
					end
					p7(if ok then status else nil)
				end):catch(function() --[[ line: 350 ]]
					return nil
				end)
			}):await()
			
			if var51 then
				local character = var52[1]
				local var54 = var52[2]
				
				if fFlagPPVBackgroundPrefetchAvatar then
					var16.clear(userId)
				end
				character.Name = "Character"
				character.Parent = var30.current
				
				if character.PrimaryPart then
					character.PrimaryPart.CFrame = cFrame
				end
				var32.current = character
				
				if var54 then
					local _, var55 = var50:await()
					
					if var55 then
						local playerAvatarType = var54.playerAvatarType
						
						if playerAvatarType == "R15" then
							var36(character, var55)
						elseif playerAvatarType == "R6" then
							var37(character, var55)
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
						
						if fFlagProfilePlatformNewProfileHeader and var31.current then
							local boundingBox, boundingBox_1 = character:GetBoundingBox()
							var31.current.CFrame = CFrame.lookAt(Vector3.new(0, 0, -math.clamp((boundingBox_1.Y + var13) / (math.tan(var12) * 2), var10, var11)), Vector3.new(0, boundingBox.Position.Y, 10))
						end
					end
				end
				var34(false)
				
				if isGetThrottleFramerateEnabledAvailable or userInputService.PreferredInput ~= Enum.PreferredInput.Touch then
					local ok, _ = pcall(function() --[[ line: 438 ]]
						-- upvalues: var49 (write), character (ref)
						local _, var62 = var49:await()
						local animation1 = character:FindFirstChild("Animate"):FindFirstChild("idle"):FindFirstChild("Animation1")
						local animator = character:FindFirstChild("Humanoid"):FindFirstChild("Animator")
						
						if animation1 and animator and animator:IsA("Animator") then
							local var65 = animator:LoadAnimation(animation1)
							
							if var62 then
								local var66 = animator:LoadAnimation(var62)
								var66.Looped = false
								var66:Play()
								var66.Stopped:Connect(function() --[[ line: 453 ]]
									-- upvalues: var65 (ref)
									var65:Play()
								end)
								
								return
							end
							var65:Play()
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
			var34(false)
		end)
	end, { userId })
	reactModule.useEffect(function() --[[ line: 474 ]]
		-- upvalues: var29 (ref), var31 (ref)
		if var29.current and var31.current then
			var29.current.CurrentCamera = var31.current
		end
	end)
	
	return reactModule.createElement(view, { ZIndex = 2, Size = UDim2.new(1, 0, 0, value.height) }, {
		Background = reactModule.createElement("ViewportFrame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ref = var29,
			Ambient = color,
			LightColor = color_1
		}, {
			WorldModel = reactModule.createElement("WorldModel", { ref = var30 }),
			Camera = reactModule.createElement("Camera", {
				CameraType = Enum.CameraType.Scriptable,
				CFrame = CFrame.lookAt(Vector3.new(0, 0, -8), Vector3.new(0, 1, 10)),
				ref = var31
			})
		}),
		LoadingFrame = var33 and reactModule.createElement(view, { tag = "size-full-full", ZIndex = 2 }, {
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