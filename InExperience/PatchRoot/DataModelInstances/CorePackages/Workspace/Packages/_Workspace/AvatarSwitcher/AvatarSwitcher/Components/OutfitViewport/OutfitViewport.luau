local httpService = game:GetService("HttpService")
local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("AvatarSwitcher").Parent
local reactModule = require(parent.React)
local eventConnection = require(parent.ReactUtils).EventConnection
local foundationModule = require(parent.Foundation)
local outfitViewportUtilsModule = require(script.Parent.OutfitViewportUtils)
local useOutfitViewportInteractionsModule = require(script.Parent.useOutfitViewportInteractions)
local avatarSwitcherPlayRandomEmote = game:DefineFastFlag("AvatarSwitcherPlayRandomEmote", false)
local fFlagAvatarSwitcherAccurateAvatarWarning = require(parent.AvatarExperienceFlags).FFlagAvatarSwitcherAccurateAvatarWarning
local color = Color3.fromRGB(218, 203, 173)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), useOutfitViewportInteractionsModule (ref), httpService (ref), fFlagAvatarSwitcherAccurateAvatarWarning (ref), outfitViewportUtilsModule (ref), avatarSwitcherPlayRandomEmote (ref), color (ref), foundationModule (ref), eventConnection (ref), userInputService (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useRef(nil)
	local var4, var5 = reactModule.useState(true)
	local var6 = reactModule.useRef("")
	local var7 = reactModule.useRef(0)
	local var8 = not var4
	local var9 = useOutfitViewportInteractionsModule({ defaultCameraDistanceRef = var7 })
	local var10 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var5 (ref), var1 (ref), httpService (copy), var6 (ref), fFlagAvatarSwitcherAccurateAvatarWarning (copy), outfitViewportUtilsModule (copy), p1 (ref), var7 (ref), avatarSwitcherPlayRandomEmote (copy)
		var5(true)
		
		if var1.current then
			var1.current:ClearAllChildren()
		end
		if not p2 or not p3 then return end
		local ok, var11, humanoid, rootPart
		local var12 = httpService:GenerateGUID(false)
		var6.current = var12
		local _ = nil
		local _ = nil
		
		if fFlagAvatarSwitcherAccurateAvatarWarning then
			local _ = nil
			local _ = nil
			local ok, status, var13 = pcall(function()
				-- upvalues: outfitViewportUtilsModule (copy), p2 (ref), p3 (ref)
				return outfitViewportUtilsModule.buildOutfitModel(p2, p3)
			end)
			ok = ok
			var11 = status
			local var14 = var13
			
			if ok and var11 and var14 then
				humanoid = var11:WaitForChild("Humanoid", 10)
				rootPart = humanoid and humanoid.RootPart
				
				if humanoid and rootPart then
					if var6.current ~= var12 then
						var11:Destroy()
						
						return
					elseif p1.onLoaded then
						p1.onLoaded(humanoid, var14)
					end
				elseif p1.onLoadingFailed then
					p1.onLoadingFailed()
				end
				return
			elseif p1.onLoadingFailed then
				p1.onLoadingFailed()
			end
			return
		else
			ok, status = pcall(function()
				-- upvalues: outfitViewportUtilsModule (copy), p2 (ref), p3 (ref)
				return outfitViewportUtilsModule.buildOutfitModel(p2, p3)
			end)
			
			if ok and status then
				var11 = status
				rootPart = var11:WaitForChild("HumanoidRootPart", 10)
				
				if rootPart then
					if var6.current ~= var12 then
						var11:Destroy()
						
						return
					end
				elseif p1.onLoadingFailed then
					p1.onLoadingFailed()
				end
				return
			elseif p1.onLoadingFailed then
				p1.onLoadingFailed()
			end
			return
		end
		var11.Parent = var1.current
		ok, _ = var11:GetBoundingBox()
		rootPart.CFrame = CFrame.new(rootPart.CFrame.Position - ok.Position)
		var7.current = outfitViewportUtilsModule.getCameraDistance(var11, 50)
		
		if avatarSwitcherPlayRandomEmote then
			outfitViewportUtilsModule.playRandomEmote(var11)
		else
			humanoid = outfitViewportUtilsModule.loadIdleAnimationForAvatar(var11)
			
			if humanoid then
				humanoid:Play()
			end
		end
		var5(false)
	end, { p1.onLoadingFailed })
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), p1 (ref)
		task.spawn(function()
			-- upvalues: var10 (copy), p1 (copy)
			var10(p1.outfitId, p1.rigType)
		end)
	end, { p1.outfitId, p1.rigType, var10 })
	reactModule.useLayoutEffect(function()
		-- upvalues: var3 (ref), var2 (ref)
		if var3.current then
			var3.current.CurrentCamera = var2.current
		end
	end, {})
	local var11 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref)
		local screenGui = var3.current and var3.current:FindFirstAncestorOfClass("ScreenGui")
		local inputWrapper = screenGui and screenGui:FindFirstChild("InputWrapper", true)
		
		if inputWrapper and inputWrapper:IsA("Frame") then
			inputWrapper.Interactable = p2
		end
	end, {})
	
	return reactModule.createElement("ViewportFrame", {
		Size = UDim2.fromScale(1, 1),
		LightColor = color,
		LightDirection = Vector3.new(-1, -1, 2),
		BackgroundTransparency = 1,
		ref = var3,
		[reactModule.Event.InputBegan] = if var8 then var9.onInputBegan else nil,
		[reactModule.Event.MouseEnter] = function()
			-- upvalues: var11 (ref)
			var11(false)
		end,
		[reactModule.Event.MouseLeave] = function()
			-- upvalues: var11 (ref)
			var11(true)
		end
	}, {
		WorldModel = reactModule.createElement("WorldModel", { ref = var1 }),
		Camera = reactModule.createElement("Camera", {
			FieldOfView = 50,
			CameraType = Enum.CameraType.Scriptable,
			CFrame = var9.cameraCFrame,
			ref = var2
		}),
		LoadingSpinner = var4 and reactModule.createElement(foundationModule.Loading, {
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5)
		}),
		InputChangedConnection = var8 and reactModule.createElement(eventConnection, {
			event = userInputService.InputChanged,
			callback = var9.onInputChanged
		}),
		InputEndedConnection = var8 and reactModule.createElement(eventConnection, {
			event = userInputService.InputEnded,
			callback = var9.onInputEnded
		})
	})
end)