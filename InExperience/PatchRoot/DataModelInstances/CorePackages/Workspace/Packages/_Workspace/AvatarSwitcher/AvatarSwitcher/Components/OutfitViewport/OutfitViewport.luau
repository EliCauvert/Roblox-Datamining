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

return reactModule.memo(function(p0) --[[ line: 37 | named "OutfitViewport" ]]
	-- upvalues: reactModule (ref), useOutfitViewportInteractionsModule (ref), httpService (ref), fFlagAvatarSwitcherAccurateAvatarWarning (ref), outfitViewportUtilsModule (ref), avatarSwitcherPlayRandomEmote (ref), color (ref), foundationModule (ref), eventConnection (ref), userInputService (ref)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.useRef(nil)
	local var11, var12 = reactModule.useState(true)
	local var13 = reactModule.useRef("")
	local var14 = reactModule.useRef(0)
	local var15 = not var11
	local var16 = useOutfitViewportInteractionsModule({ defaultCameraDistanceRef = var14 })
	local var17 = reactModule.useCallback(function(p1, p2) --[[ line: 50 ]]
		-- upvalues: var12 (ref), var8 (ref), httpService (copy), var13 (ref), fFlagAvatarSwitcherAccurateAvatarWarning (copy), outfitViewportUtilsModule (copy), p0 (ref), var14 (ref), avatarSwitcherPlayRandomEmote (copy)
		var12(true)
		
		if var8.current then
			var8.current:ClearAllChildren()
		end
		if not p1 or not p2 then return end
		local ok, var22, humanoid, rootPart
		local var19 = httpService:GenerateGUID(false)
		var13.current = var19
		local _ = nil
		local _ = nil
		
		if fFlagAvatarSwitcherAccurateAvatarWarning then
			local _ = nil
			local _ = nil
			local ok, status, var20 = pcall(function() --[[ line: 71 ]]
				-- upvalues: outfitViewportUtilsModule (copy), p1 (ref), p2 (ref)
				return outfitViewportUtilsModule.buildOutfitModel(p1, p2)
			end)
			ok = ok
			var22 = status
			local var23 = var20
			
			if ok and var22 and var23 then
				humanoid = var22:WaitForChild("Humanoid", 10)
				rootPart = humanoid and humanoid.RootPart
				
				if humanoid and rootPart then
					if var13.current ~= var19 then
						var22:Destroy()
						
						return
					elseif p0.onLoaded then
						p0.onLoaded(humanoid, var23)
					end
				elseif p0.onLoadingFailed then
					p0.onLoadingFailed()
				end
				return
			elseif p0.onLoadingFailed then
				p0.onLoadingFailed()
			end
			return
		else
			ok, status = pcall(function() --[[ line: 99 ]]
				-- upvalues: outfitViewportUtilsModule (copy), p1 (ref), p2 (ref)
				return outfitViewportUtilsModule.buildOutfitModel(p1, p2)
			end)
			
			if ok and status then
				var22 = status
				rootPart = var22:WaitForChild("HumanoidRootPart", 10)
				
				if rootPart then
					if var13.current ~= var19 then
						var22:Destroy()
						
						return
					end
				elseif p0.onLoadingFailed then
					p0.onLoadingFailed()
				end
				return
			elseif p0.onLoadingFailed then
				p0.onLoadingFailed()
			end
			return
		end
		var22.Parent = var8.current
		ok, _ = var22:GetBoundingBox()
		rootPart.CFrame = CFrame.new(rootPart.CFrame.Position - ok.Position)
		var14.current = outfitViewportUtilsModule.getCameraDistance(var22, 50)
		
		if avatarSwitcherPlayRandomEmote then
			outfitViewportUtilsModule.playRandomEmote(var22)
		else
			humanoid = outfitViewportUtilsModule.loadIdleAnimationForAvatar(var22)
			
			if humanoid then
				humanoid:Play()
			end
		end
		var12(false)
	end, { p0.onLoadingFailed })
	reactModule.useEffect(function() --[[ line: 143 ]]
		-- upvalues: var17 (ref), p0 (ref)
		task.spawn(function() --[[ line: 144 ]]
			-- upvalues: var17 (copy), p0 (copy)
			var17(p0.outfitId, p0.rigType)
		end)
	end, { p0.outfitId, p0.rigType, var17 })
	reactModule.useLayoutEffect(function() --[[ line: 150 ]]
		-- upvalues: var10 (ref), var9 (ref)
		if var10.current then
			var10.current.CurrentCamera = var9.current
		end
	end, {})
	local var18 = reactModule.useCallback(function(p3) --[[ line: 159 ]]
		-- upvalues: var10 (ref)
		local screenGui = var10.current and var10.current:FindFirstAncestorOfClass("ScreenGui")
		local inputWrapper = screenGui and screenGui:FindFirstChild("InputWrapper", true)
		
		if inputWrapper and inputWrapper:IsA("Frame") then
			inputWrapper.Interactable = p3
		end
	end, {})
	
	return reactModule.createElement("ViewportFrame", {
		Size = UDim2.fromScale(1, 1),
		LightColor = color,
		LightDirection = Vector3.new(-1, -1, 2),
		BackgroundTransparency = 1,
		ref = var10,
		[reactModule.Event.InputBegan] = if var15 then var16.onInputBegan else nil,
		[reactModule.Event.MouseEnter] = function() --[[ line: 176 ]]
			-- upvalues: var18 (ref)
			var18(false)
		end,
		[reactModule.Event.MouseLeave] = function() --[[ line: 179 ]]
			-- upvalues: var18 (ref)
			var18(true)
		end
	}, {
		WorldModel = reactModule.createElement("WorldModel", { ref = var8 }),
		Camera = reactModule.createElement("Camera", {
			FieldOfView = 50,
			CameraType = Enum.CameraType.Scriptable,
			CFrame = var16.cameraCFrame,
			ref = var9
		}),
		LoadingSpinner = var11 and reactModule.createElement(foundationModule.Loading, {
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5)
		}),
		InputChangedConnection = var15 and reactModule.createElement(eventConnection, {
			event = userInputService.InputChanged,
			callback = var16.onInputChanged
		}),
		InputEndedConnection = var15 and reactModule.createElement(eventConnection, {
			event = userInputService.InputEnded,
			callback = var16.onInputEnded
		})
	})
end)