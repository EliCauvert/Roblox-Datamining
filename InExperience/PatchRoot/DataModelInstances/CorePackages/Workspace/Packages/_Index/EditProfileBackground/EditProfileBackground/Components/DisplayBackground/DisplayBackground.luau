local EditProfileBackground = script:FindFirstAncestor("EditProfileBackground")
local Parent = EditProfileBackground.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local Loading = FoundationModule.Loading
local View = FoundationModule.View
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseSelectedThemeFunction = require(Parent.RoactUtils).Hooks.useSelectedTheme
local GetDisplayBackgroundIdFunction = require(EditProfileBackground.Common.BackgroundUtils).getDisplayBackgroundId
local ErrorTypes = require(EditProfileBackground.Analytics).ErrorTypes
local FFlagProfilePlatformNewProfileHeader = require(Parent.SharedFlags).FFlagProfilePlatformNewProfileHeader
local FFlagProfilePlatformMeTabMobileProfileHero = require(Parent.SharedFlags).FFlagProfilePlatformMeTabMobileProfileHero
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local PromiseModule = require(Parent.Promise)
local LoadableImage = require(Parent.UIBlox).App.Loading.LoadableImage

local function _(): boolean --[[ Line: 27 | Named "shouldEnableAnimation" ]]
	-- upvalues: UserInputService (copy)
	return UserInputService.PreferredInput ~= Enum.PreferredInput.Touch
end

local _Color3 = Color3.fromRGB(210, 210, 210)
local _Color3_1 = Color3.fromRGB(250, 250, 250)
local MinValue = if FFlagProfilePlatformNewProfileHeader then 6.5 else nil
local MaxValue = if FFlagProfilePlatformNewProfileHeader then 8 else nil
local v1 = if FFlagProfilePlatformNewProfileHeader then 70 else nil
local Radians = if FFlagProfilePlatformNewProfileHeader then math.rad(v1 / 2) else nil

local _ = function(p1, p2): number --[[ Line: 47 | Named "getCameraDistanceForCharacterHeight" ]]
	-- upvalues: Radians (copy), MinValue (copy), MaxValue (copy)
	return (math.clamp(p1 / (math.tan(Radians) * 2) * p2, MinValue * p2, MaxValue * p2))
end

local v2 = if FFlagProfilePlatformNewProfileHeader then 2 else nil
local _CFrame = CFrame.new(vector.create(0, 1000, 0))
local FFlagPPVBackgroundUse2DAsLoadingState = require(Parent.SharedFlags).FFlagPPVBackgroundUse2DAsLoadingState
local IsGetThrottleFramerateEnabledAvailableEngineFeature = game:DefineFastFlag("PPVBackgroundUnthrottleProfileV2", false) and game:GetEngineFeature("IsGetThrottleFramerateEnabledAvailable")
local PPVBackgroundUnthrottleRefCount = game:DefineFastFlag("PPVBackgroundUnthrottleRefCount", false)
local FFlagPPVEnable3DBackground = require(Parent.SharedFlags).FFlagPPVEnable3DBackground
local AvatarModelPrefetchModule = require(EditProfileBackground.Common.AvatarModelPrefetch)
local InsertService = game:GetService("InsertService")
local Count = 0
local Enabled = nil

local _ = function() --[[ Line: 108 | Named "acquireUnthrottle" ]]
	-- upvalues: Count (ref), Enabled (ref), RunService (copy)
	if Count == 0 then
		Enabled = RunService:getThrottleFramerateEnabled()
		RunService:setThrottleFramerateEnabled(false)
	end
	Count += 1
end

local function releaseUnthrottle() --[[ Line: 116 ]]
	-- upvalues: Count (ref), RunService (copy), Enabled (ref)
	Count -= 1
	
	if Count <= 0 then
		Count = 0
		RunService:setThrottleFramerateEnabled(Enabled == true)
		Enabled = nil
	end
end

local function playToolAnimation(Object) --[[ Line: 134 ]]
	if not Object:IsDescendantOf(game) then return end
	local Animate = Object:FindFirstChild("Animate")
	assert(Animate ~= nil, "Expected animate to always exist")
	local Toolnone = Animate:FindFirstChild("toolnone")
	assert(Toolnone ~= nil, "Expected tool animation to always exist")
	local Child = Toolnone:GetChildren()[1]
	
	if Child ~= nil then
		assert(Child:IsA("Animation"), "Unexpected type for tool animation")
		local Humanoid = Object:FindFirstChild("Humanoid")
		assert(Humanoid ~= nil, "Expected humanoid to always exist")
		local Animator = Humanoid:FindFirstChild("Animator")
		assert(Animator ~= nil, "Expected Animator to always exist")
		assert(Animator:IsA("Animator"), "Animator should be of type Animator")
		local AnimationTrack = Animator:LoadAnimation(Child)
		AnimationTrack.Looped = true
		AnimationTrack:Play()
		
		return
	end
end

return function(p1) --[[ Line: 165 | Named "BackgroundDisplay" ]]
	-- upvalues: UseLocalUserIdFunction (copy), UseSelectedThemeFunction (copy), ReactModule (copy), IsGetThrottleFramerateEnabledAvailableEngineFeature (copy), FFlagPPVEnable3DBackground (copy), InsertService (copy), GetDisplayBackgroundIdFunction (copy), _Color3 (copy), _Color3_1 (copy), PPVBackgroundUnthrottleRefCount (copy), Count (ref), Enabled (ref), RunService (copy), releaseUnthrottle (copy), playToolAnimation (copy), PromiseModule (copy), AvatarModelPrefetchModule (copy), CryoModule (copy), ErrorTypes (copy), _CFrame (copy), FFlagProfilePlatformNewProfileHeader (copy), v2 (copy), FFlagProfilePlatformMeTabMobileProfileHero (copy), Radians (copy), MinValue (copy), MaxValue (copy), UserInputService (copy), View (copy), FFlagPPVBackgroundUse2DAsLoadingState (copy), LoadableImage (copy), Loading (copy), IconSize (copy)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UserId = p1.userId or UseLocalUserIdResult and tonumber(UseLocalUserIdResult)
	local UseSelectedThemeResult = UseSelectedThemeFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local UseRefResult4 = if IsGetThrottleFramerateEnabledAvailableEngineFeature then ReactModule.useRef(nil) else nil
	
	if FFlagPPVEnable3DBackground then
		ReactModule.useEffect(function() --[[ Line: 179 ]]
			-- upvalues: p1 (copy), InsertService (upval), GetDisplayBackgroundIdFunction (upval), UseSelectedThemeResult (copy), UseRefResult1 (copy), UseRefResult (copy), _Color3 (upval), _Color3_1 (upval)
			task.defer(function() --[[ Line: 181 ]]
				-- upvalues: p1 (upval), InsertService (upval), GetDisplayBackgroundIdFunction (upval), UseSelectedThemeResult (upval), UseRefResult1 (upval), UseRefResult (upval), _Color3 (upval), _Color3_1 (upval)
				if not p1.currentBackgroundId then return end
				local Success, Result = pcall(function() --[[ Line: 186 ]]
					-- upvalues: InsertService (upval), GetDisplayBackgroundIdFunction (upval), p1 (upval), UseSelectedThemeResult (upval)
					return InsertService:LoadAsset(GetDisplayBackgroundIdFunction(p1.currentBackgroundId, UseSelectedThemeResult))
				end)
				
				if Success and Result then
					if UseRefResult1.current then
						for _, child in pairs(UseRefResult1.current:GetChildren()) do
							if child.Name ~= "Character" then
								child:Destroy()
							end
						end
					end
					local BackgroundModel = Instance.new("Model")
					BackgroundModel.Name = "BackgroundModel"
					BackgroundModel.Parent = UseRefResult1.current
					
					for _, child1 in pairs(Result:GetChildren()) do
						child1.Parent = BackgroundModel
					end
					BackgroundModel:PivotTo(CFrame.new(0, 7, -4.5))
					Result:Destroy()
					local Current = UseRefResult.current
					
					if Current then
						Current.Ambient = _Color3
						Current.LightColor = _Color3_1
						Current.LightDirection = vector.create(-0.5, 0.20000000298023224, 0.20000000298023224)
					end
				end
			end)
		end, { p1.currentBackgroundId })
	end
	if IsGetThrottleFramerateEnabledAvailableEngineFeature then
		ReactModule.useEffect(function() --[[ Line: 223 ]]
			-- upvalues: PPVBackgroundUnthrottleRefCount (upval), Count (upval), Enabled (upval), RunService (upval), releaseUnthrottle (upval), UseRefResult4 (copy)
			if not PPVBackgroundUnthrottleRefCount then
				UseRefResult4.current = RunService:getThrottleFramerateEnabled()
				RunService:setThrottleFramerateEnabled(false)
				
				return function() --[[ Line: 231 ]]
					-- upvalues: RunService (upval), UseRefResult4 (upval)
					RunService:setThrottleFramerateEnabled(UseRefResult4.current or true)
				end
			end
			if Count == 0 then
				Enabled = RunService:getThrottleFramerateEnabled()
				RunService:setThrottleFramerateEnabled(false)
			end
			Count += 1
			
			return releaseUnthrottle
		end, {})
	end
	local UseResult = ReactModule.useCallback(function(Parent, Object) --[[ Line: 238 ]]
		-- upvalues: playToolAnimation (upval)
		if not Parent or not Object then return end
		local RightHand = Parent:FindFirstChild("RightHand")
		
		if not RightHand or not RightHand:IsA("BasePart") then return end
		local RightGripAttachment = RightHand:FindFirstChild("RightGripAttachment")
		
		if not RightGripAttachment or not RightGripAttachment:IsA("Attachment") then return end
		local Handle = Object:FindFirstChild("Handle")
		
		if not Handle or not Handle:IsA("BasePart") then return end
		for _, descendant in ipairs(Object:GetDescendants()) do
			if descendant:IsA("Script") or descendant:IsA("LocalScript") then
				descendant.Disabled = true
			end
		end
		Object.Parent = Parent
		playToolAnimation(Parent)
		Handle.CFrame = RightGripAttachment.WorldCFrame
		local Weld = Instance.new("Weld")
		Weld.Parent = Object
		Weld.Part0 = Handle
		Weld.Part1 = RightHand
		Weld.C0 = Object.Grip
		Weld.C1 = RightGripAttachment.CFrame
	end, {})
	local UseResult1 = ReactModule.useCallback(function(Object, Object1) --[[ Line: 275 ]]
		if not Object or not Object1 then return end
		local RightArm = Object:FindFirstChild("Right Arm")
		
		if not RightArm or not RightArm:IsA("BasePart") then return end
		local RightGripAttachment = RightArm:FindFirstChild("RightGripAttachment")
		
		if not RightGripAttachment or not RightGripAttachment:IsA("Attachment") then return end
		local RightShoulder = Object:FindFirstChild("Right Shoulder", true)
		
		if not RightShoulder or not RightShoulder:IsA("Motor6D") then return end
		local Handle = Object1:FindFirstChild("Handle")
		
		if not Handle or not Handle:IsA("BasePart") then return end
		for _, descendant in ipairs(Object1:GetDescendants()) do
			if descendant:IsA("Script") or descendant:IsA("LocalScript") then
				descendant.Disabled = true
			end
		end
		Object1.Parent = Object
		RightShoulder.C0 *= CFrame.Angles(0, 0, 1.5707963267948966)
		Handle.CFrame = RightGripAttachment.WorldCFrame
		local v3 = CFrame.new(0, -1, 0) * CFrame.Angles(-1.5707963267948966, 0, 0)
		local Weld = Instance.new("Weld")
		Weld.Parent = Object1
		Weld.Part0 = Handle
		Weld.Part1 = RightArm
		Weld.C0 = Object1.Grip
		Weld.C1 = v3
	end, {})
	ReactModule.useEffect(function() --[[ Line: 312 ]]
		-- upvalues: UserId (copy), UseStateResult2 (copy), PromiseModule (upval), AvatarModelPrefetchModule (upval), InsertService (upval), CryoModule (upval), p1 (copy), ErrorTypes (upval), UseRefResult1 (copy), _CFrame (upval), UseRefResult3 (copy), UseResult (copy), UseResult1 (copy), FFlagProfilePlatformNewProfileHeader (upval), UseRefResult2 (copy), v2 (upval), FFlagProfilePlatformMeTabMobileProfileHero (upval), Radians (upval), MinValue (upval), MaxValue (upval), IsGetThrottleFramerateEnabledAvailableEngineFeature (upval), UserInputService (upval)
		task.defer(function() --[[ Line: 314 ]]
			-- upvalues: UserId (upval), UseStateResult2 (upval), PromiseModule (upval), AvatarModelPrefetchModule (upval), InsertService (upval), CryoModule (upval), p1 (upval), ErrorTypes (upval), UseRefResult1 (upval), _CFrame (upval), UseRefResult3 (upval), UseResult (upval), UseResult1 (upval), FFlagProfilePlatformNewProfileHeader (upval), UseRefResult2 (upval), v2 (upval), FFlagProfilePlatformMeTabMobileProfileHero (upval), Radians (upval), MinValue (upval), MaxValue (upval), IsGetThrottleFramerateEnabledAvailableEngineFeature (upval), UserInputService (upval)
			if not UserId then return end
			UseStateResult2(true)
			local ResolveResult = PromiseModule.resolve(nil)
			local ResolveResult1 = PromiseModule.resolve(nil)
			local v4, v5 = PromiseModule.all({
				AvatarModelPrefetchModule.get(UserId),
				PromiseModule.new(function(Callback: (any) -> ()) --[[ Line: 325 ]]
					-- upvalues: UserId (upval), ResolveResult (ref), PromiseModule (upval), InsertService (upval), CryoModule (upval), ResolveResult1 (ref)
					local Success, Result = pcall(function() --[[ Line: 326 ]]
						-- upvalues: UserId (upval)
						return game.Players:GetCharacterAppearanceInfoAsync(UserId)
					end)
					
					if Success and Result then
						if Result.emotes and #Result.emotes > 0 then
							ResolveResult = PromiseModule.new(function(Callback: (any) -> ()) --[[ Line: 331 ]]
								-- upvalues: InsertService (upval), Result (copy)
								local Success, Result1 = pcall(function() --[[ Line: 332 ]]
									-- upvalues: InsertService (upval), Result (upval)
									return (InsertService:LoadAsset(Result.emotes[1].assetId):FindFirstChildOfClass("Animation"))
								end)
								Callback(if Success then Result1 else nil)
							end)
						end
						if Result.assets then
							local Where = CryoModule.List.findWhere(Result.assets, function(p2): boolean --[[ Line: 341 ]]
								return p2.assetType.name == "Gear"
							end)
							
							if Where then
								local Asset = Result.assets[Where]
								ResolveResult1 = PromiseModule.new(function(Callback: (any) -> ()) --[[ Line: 346 ]]
									-- upvalues: InsertService (upval), Asset (copy)
									local Success, Result = pcall(function() --[[ Line: 347 ]]
										-- upvalues: InsertService (upval), Asset (upval)
										return InsertService:LoadAsset(Asset.id):FindFirstChildOfClass("Tool")
									end)
									Callback(if Success and Result and Result:IsA("Tool") then Result else nil)
								end)
							end
						end
					end
					Callback(if Success then Result else nil)
				end):catch(function() --[[ Line: 366 ]]
					return nil
				end)
			}):await()
			
			if v4 then
				local Character = v5[1]
				local v6 = v5[2]
				AvatarModelPrefetchModule.clear(UserId)
				Character.Name = "Character"
				Character.Parent = UseRefResult1.current
				
				if Character.PrimaryPart then
					Character.PrimaryPart.CFrame = _CFrame
				end
				UseRefResult3.current = Character
				
				if v6 then
					local _, v7 = ResolveResult1:await()
					
					if v7 then
						local PlayerAvatarType = v6.playerAvatarType
						
						if PlayerAvatarType == "R15" then
							UseResult(Character, v7)
						elseif PlayerAvatarType == "R6" then
							UseResult1(Character, v7)
						end
					end
				end
				local Humanoid = Character:FindFirstChild("Humanoid")
				
				if Humanoid then
					PromiseModule.race({
						PromiseModule.fromEvent(Humanoid.ClusterCompositionFinished),
						PromiseModule.delay(3)
					}):await()
				end
				if Character.PrimaryPart then
					Character.PrimaryPart.CFrame = CFrame.lookAt(vector.create(0, 0, 0), vector.create(0, 0, -10))
					local RightFoot = Character:FindFirstChild("RightFoot") or Character:FindFirstChild("Right Leg")
					
					if RightFoot and RightFoot:IsA("BasePart") then
						Character.PrimaryPart.CFrame = CFrame.lookAt(Vector3.new(0, Character.PrimaryPart.Position.Y + (-3 - (RightFoot.Position.Y - RightFoot.Size.Y / 2)), 0), vector.create(0, 0, -10))
						
						if FFlagProfilePlatformNewProfileHeader and UseRefResult2.current then
							local BoundingCFrame, BoundingSize = Character:GetBoundingBox()
							local NewY = BoundingSize.Y + v2
							local Y = BoundingCFrame.Position.Y
							local ClampedValue = nil
							
							if FFlagProfilePlatformMeTabMobileProfileHero then
								local CameraDistanceScale = p1.cameraDistanceScale or 1
								ClampedValue = math.clamp(NewY / (math.tan(Radians) * 2) * CameraDistanceScale, MinValue * CameraDistanceScale, MaxValue * CameraDistanceScale)
							else
								ClampedValue = math.clamp(NewY / (math.tan(Radians) * 2), MinValue, MaxValue)
							end
							UseRefResult2.current.CFrame = CFrame.lookAt(Vector3.new(0, 0, -ClampedValue), (Vector3.new(0, Y, 10)))
						end
					end
				end
				UseStateResult2(false)
				
				if IsGetThrottleFramerateEnabledAvailableEngineFeature or UserInputService.PreferredInput ~= Enum.PreferredInput.Touch then
					local Success, _ = pcall(function() --[[ Line: 455 ]]
						-- upvalues: ResolveResult (ref), Character (copy)
						local _, Animation = ResolveResult:await()
						local Animation1 = Character:FindFirstChild("Animate"):FindFirstChild("idle"):FindFirstChild("Animation1")
						local Animator = Character:FindFirstChild("Humanoid"):FindFirstChild("Animator")
						
						if Animation1 and Animator and Animator:IsA("Animator") then
							local AnimationTrack = Animator:LoadAnimation(Animation1)
							
							if Animation then
								local AnimationTrack1 = Animator:LoadAnimation(Animation)
								AnimationTrack1.Looped = false
								AnimationTrack1:Play()
								AnimationTrack1.Stopped:Connect(function() --[[ Line: 470 ]]
									-- upvalues: AnimationTrack (copy)
									AnimationTrack:Play()
								end)
								
								return
							else
								AnimationTrack:Play()
							end
						end
					end)
					
					if not Success and p1.analytics then
						p1.analytics.fireAnalyticsEvent("EditProfileBackgroundFailure", { errorType = ErrorTypes.CharacterAnimationFailed })
					end
				end
				return
			else
				if p1.analytics then
					p1.analytics.fireAnalyticsEvent("EditProfileBackgroundFailure", { errorType = ErrorTypes.CharacterModelCreationFailed })
				end
				UseStateResult2(false)
			end
		end)
	end, {
		UserId,
		if FFlagProfilePlatformMeTabMobileProfileHero then p1.cameraDistanceScale else nil
	})
	ReactModule.useEffect(function() --[[ Line: 491 ]]
		-- upvalues: UseRefResult (copy), UseRefResult2 (copy)
		if UseRefResult.current and UseRefResult2.current then
			UseRefResult.current.CurrentCamera = UseRefResult2.current
		end
	end)
	
	return ReactModule.createElement(View, { ZIndex = 2, Size = UDim2.new(1, 0, 0, p1.height) }, {
		Background = ReactModule.createElement("ViewportFrame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ref = UseRefResult,
			Ambient = _Color3,
			LightColor = _Color3_1
		}, {
			WorldModel = ReactModule.createElement("WorldModel", { ref = UseRefResult1 }),
			Camera = ReactModule.createElement("Camera", {
				CameraType = Enum.CameraType.Scriptable,
				CFrame = CFrame.lookAt(vector.create(0, 0, -8), vector.create(0, 1, 10)),
				ref = UseRefResult2
			})
		}),
		LoadingFrame = UseStateResult and ReactModule.createElement(View, { tag = "size-full-full", ZIndex = 2 }, {
			if FFlagPPVBackgroundUse2DAsLoadingState then ReactModule.createElement(LoadableImage, {
				BackgroundTransparency = 1,
				useShimmerAnimationWhileLoading = true,
				ZIndex = 2,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, -24),
				Size = UDim2.new(1, -48, 1, -48),
				ScaleType = Enum.ScaleType.Fit,
				Image = p1.userThumbnail
			}) else ReactModule.createElement(Loading, {
				size = IconSize.Large,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5)
			})
		})
	})
end