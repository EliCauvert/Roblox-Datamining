local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local Parent = script:FindFirstAncestor("AvatarSwitcher").Parent
local ReactModule = require(Parent.React)
local EventConnection = require(Parent.ReactUtils).EventConnection
local FoundationModule = require(Parent.Foundation)
local OutfitViewportUtilsModule = require(script.Parent.OutfitViewportUtils)
local UseOutfitViewportInteractionsModule = require(script.Parent.useOutfitViewportInteractions)
local AvatarSwitcherPlayRandomEmote = game:DefineFastFlag("AvatarSwitcherPlayRandomEmote", false)
local FFlagAvatarSwitcherAccurateAvatarWarning = require(Parent.AvatarExperienceFlags).FFlagAvatarSwitcherAccurateAvatarWarning
local _Color3 = Color3.fromRGB(218, 203, 173)

return ReactModule.memo(function(p1) --[[ Line: 37 | Named "OutfitViewport" ]]
	-- upvalues: ReactModule (copy), UseOutfitViewportInteractionsModule (copy), HttpService (copy), FFlagAvatarSwitcherAccurateAvatarWarning (copy), OutfitViewportUtilsModule (copy), AvatarSwitcherPlayRandomEmote (copy), _Color3 (copy), FoundationModule (copy), EventConnection (copy), UserInputService (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local UseRefResult3 = ReactModule.useRef("")
	local UseRefResult4 = ReactModule.useRef(0)
	local NoUseStateResult = not UseStateResult
	local UseOutfitViewportInteractionsModuleResult = UseOutfitViewportInteractionsModule({ defaultCameraDistanceRef = UseRefResult4 })
	local UseResult = ReactModule.useCallback(function(p2, p3) --[[ Line: 50 ]]
		-- upvalues: UseStateResult2 (copy), UseRefResult (copy), HttpService (upval), UseRefResult3 (copy), FFlagAvatarSwitcherAccurateAvatarWarning (upval), OutfitViewportUtilsModule (upval), p1 (copy), UseRefResult4 (copy), AvatarSwitcherPlayRandomEmote (upval)
		UseStateResult2(true)
		
		if UseRefResult.current then
			UseRefResult.current:ClearAllChildren()
		end
		if not p2 or not p3 then return end
		local Guid = HttpService:GenerateGUID(false)
		UseRefResult3.current = Guid
		local Result = nil
		local RootPart = nil
		
		if FFlagAvatarSwitcherAccurateAvatarWarning then
			local Success, Result3
			Success, Result, Result3 = pcall(function() --[[ Line: 71 ]]
				-- upvalues: OutfitViewportUtilsModule (upval), p2 (copy), p3 (copy)
				return OutfitViewportUtilsModule.buildOutfitModel(p2, p3)
			end)
			
			if Success and Result and Result3 then
				local Humanoid = Result:WaitForChild("Humanoid", 10)
				RootPart = Humanoid and Humanoid.RootPart
				
				if Humanoid and RootPart then
					if UseRefResult3.current ~= Guid then
						Result:Destroy()
						
						return
					end
					if p1.onLoaded then
						p1.onLoaded(Humanoid, Result3)
					end
				else
					if p1.onLoadingFailed then
						p1.onLoadingFailed()
					end
					return
				end
			else
				if p1.onLoadingFailed then
					p1.onLoadingFailed()
				end
				return
			end
		else
			local Success1, Result1 = pcall(function() --[[ Line: 99 ]]
				-- upvalues: OutfitViewportUtilsModule (upval), p2 (copy), p3 (copy)
				return OutfitViewportUtilsModule.buildOutfitModel(p2, p3)
			end)
			
			if Success1 and Result1 then
				Result = Result1
				RootPart = Result:WaitForChild("HumanoidRootPart", 10)
				
				if RootPart then
					if UseRefResult3.current ~= Guid then
						Result:Destroy()
						
						return
					end
				else
					if p1.onLoadingFailed then
						p1.onLoadingFailed()
					end
					return
				end
			else
				if p1.onLoadingFailed then
					p1.onLoadingFailed()
				end
				return
			end
		end
		Result.Parent = UseRefResult.current
		local BoundingCFrame, _ = Result:GetBoundingBox()
		RootPart.CFrame = CFrame.new(RootPart.CFrame.Position - BoundingCFrame.Position)
		UseRefResult4.current = OutfitViewportUtilsModule.getCameraDistance(Result, 50)
		
		if AvatarSwitcherPlayRandomEmote then
			OutfitViewportUtilsModule.playRandomEmote(Result)
		else
			local IdleAnimationForAvatar = OutfitViewportUtilsModule.loadIdleAnimationForAvatar(Result)
			
			if IdleAnimationForAvatar then
				IdleAnimationForAvatar:Play()
			end
		end
		UseStateResult2(false)
	end, { p1.onLoadingFailed })
	ReactModule.useEffect(function() --[[ Line: 143 ]]
		-- upvalues: UseResult (copy), p1 (copy)
		task.spawn(function() --[[ Line: 144 ]]
			-- upvalues: UseResult (upval), p1 (upval)
			UseResult(p1.outfitId, p1.rigType)
		end)
	end, { p1.outfitId, p1.rigType, UseResult })
	ReactModule.useLayoutEffect(function() --[[ Line: 150 ]]
		-- upvalues: UseRefResult2 (copy), UseRefResult1 (copy)
		if UseRefResult2.current then
			UseRefResult2.current.CurrentCamera = UseRefResult1.current
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function(Interactable) --[[ Line: 159 ]]
		-- upvalues: UseRefResult2 (copy)
		local ScreenGui = UseRefResult2.current and UseRefResult2.current:FindFirstAncestorOfClass("ScreenGui")
		local InputWrapper = ScreenGui and ScreenGui:FindFirstChild("InputWrapper", true)
		
		if InputWrapper and InputWrapper:IsA("Frame") then
			InputWrapper.Interactable = Interactable
		end
	end, {})
	
	return ReactModule.createElement("ViewportFrame", {
		Size = UDim2.fromScale(1, 1),
		LightColor = _Color3,
		LightDirection = vector.create(-1, -1, 2),
		BackgroundTransparency = 1,
		ref = UseRefResult2,
		[ReactModule.Event.InputBegan] = if NoUseStateResult then UseOutfitViewportInteractionsModuleResult.onInputBegan else nil,
		[ReactModule.Event.MouseEnter] = function() --[[ Line: 176 ]]
			-- upvalues: UseResult1 (copy)
			UseResult1(false)
		end,
		[ReactModule.Event.MouseLeave] = function() --[[ Line: 179 ]]
			-- upvalues: UseResult1 (copy)
			UseResult1(true)
		end
	}, {
		WorldModel = ReactModule.createElement("WorldModel", { ref = UseRefResult }),
		Camera = ReactModule.createElement("Camera", {
			FieldOfView = 50,
			CameraType = Enum.CameraType.Scriptable,
			CFrame = UseOutfitViewportInteractionsModuleResult.cameraCFrame,
			ref = UseRefResult1
		}),
		LoadingSpinner = UseStateResult and ReactModule.createElement(FoundationModule.Loading, {
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5)
		}),
		InputChangedConnection = NoUseStateResult and ReactModule.createElement(EventConnection, {
			event = UserInputService.InputChanged,
			callback = UseOutfitViewportInteractionsModuleResult.onInputChanged
		}),
		InputEndedConnection = NoUseStateResult and ReactModule.createElement(EventConnection, {
			event = UserInputService.InputEnded,
			callback = UseOutfitViewportInteractionsModuleResult.onInputEnded
		})
	})
end)