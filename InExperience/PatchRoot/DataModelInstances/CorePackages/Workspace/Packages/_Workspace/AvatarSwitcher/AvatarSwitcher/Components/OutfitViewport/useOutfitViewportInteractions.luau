local httpService = game:GetService("HttpService")
local runService = game:GetService("RunService")
local parent = script:FindFirstAncestor("AvatarSwitcher").Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)

local function _(vectorA) --[[ line: 21 | named "swipeDistanceToRotationAngle" ]]
	return -vectorA.X * 1
end

return function(p0) --[[ line: 30 | named "useOutfitViewportInteractions" ]]
	-- upvalues: reactModule (ref), reactOtterModule (ref), httpService (ref), runService (ref)
	local var4 = reactModule.useRef(false)
	local var5 = reactModule.useRef(Vector3.new())
	local var6, var7 = reactOtterModule.useAnimatedBinding(0)
	local var8 = reactModule.useRef(0)
	local var9 = reactModule.useRef(0)
	local var10 = reactModule.useRef(nil)
	local var11, var12 = reactModule.useBinding(CFrame.new())
	reactModule.useEffect(function() --[[ line: 39 ]]
		-- upvalues: httpService (copy), var10 (ref), runService (copy), var4 (ref), var7 (ref), reactOtterModule (copy), var6 (ref), var8 (ref), var9 (ref), p0 (ref), var12 (ref)
		local var14 = 0
		local text = "OutfitVewportSpin_" .. httpService:GenerateGUID(false)
		local current = var10.current
		runService:BindToRenderStep(text, Enum.RenderPriority.Camera.Value + 1, function(p1) --[[ line: 45 ]]
			-- upvalues: var4 (copy), var10 (copy), current (write), var7 (copy), reactOtterModule (copy), var14 (write), var6 (copy), var8 (copy), var9 (copy), p0 (copy), var12 (copy)
			if var4.current then
				var7(reactOtterModule.instant(-(if var10.current and current then (var10.current - current) / p1 else Vector2.new(0, 0)).X * 1))
			else
				var14 += p1 * var6:getValue()
			end
			current = var10.current
			local cframe = CFrame.Angles(0, math.rad(var14) + math.rad(var8.current) + math.rad(var9.current), 0)
			var12(CFrame.lookAt(cframe.LookVector * p0.defaultCameraDistanceRef.current, Vector3.new(0, 0, 0), cframe.UpVector))
		end)
		
		return function() --[[ line: 68 ]]
			-- upvalues: runService (copy), text (ref)
			runService:UnbindFromRenderStep(text)
		end
	end, { var7, p0.defaultCameraDistanceRef, var12 })
	local var13 = reactModule.useCallback(function(p2) --[[ line: 73 ]]
		-- upvalues: var8 (ref), var5 (ref), var4 (ref), var10 (ref), var9 (ref), p0 (ref), var7 (ref), reactOtterModule (copy)
		var8.current += -(p2 - var5.current).X * 1
		var4.current = false
		var10.current = nil
		var9.current = 0
		
		if p0.onInteractionChanged then
			p0.onInteractionChanged(false)
		end
		var7(reactOtterModule.spring(0, { frequency = 1 }))
	end, { p0.onInteractionChanged, var7 })
	
	return {
		onInputBegan = reactModule.useCallback(function(_, p3) --[[ line: 86 ]]
			-- upvalues: var4 (ref), var5 (ref), var10 (ref), p0 (ref)
			if (if p3.UserInputType ~= Enum.UserInputType.MouseButton1 then p3.UserInputType == Enum.UserInputType.Touch else true) and not var4.current then
				var4.current = true
				var5.current = p3.Position
				var10.current = p3.Position
				
				if p0.onInteractionChanged then
					p0.onInteractionChanged(true)
				end
			end
		end, { p0.onInteractionChanged }),
		onInputChanged = reactModule.useCallback(function(p4) --[[ line: 100 ]]
			-- upvalues: var4 (ref), var9 (ref), var5 (ref), var10 (ref)
			if var4.current and (if p4.UserInputType ~= Enum.UserInputType.MouseMovement then p4.UserInputType == Enum.UserInputType.Touch else true) then
				var9.current = -(p4.Position - var5.current).X * 1
				var10.current = p4.Position
			end
		end, {}),
		onInputEnded = reactModule.useCallback(function(p5) --[[ line: 109 ]]
			-- upvalues: var4 (ref), var13 (ref)
			if (if p5.UserInputType ~= Enum.UserInputType.MouseButton1 then p5.UserInputType == Enum.UserInputType.Touch else true) and var4.current then
				var13(p5.Position)
			end
		end, { var13 }),
		cameraCFrame = var11
	}
end