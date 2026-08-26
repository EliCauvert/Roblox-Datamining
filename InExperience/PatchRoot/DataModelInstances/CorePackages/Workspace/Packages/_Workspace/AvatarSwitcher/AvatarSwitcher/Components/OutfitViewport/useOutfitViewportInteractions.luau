local httpService = game:GetService("HttpService")
local runService = game:GetService("RunService")
local parent = script:FindFirstAncestor("AvatarSwitcher").Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)

local function _(vectorA)
	return -vectorA.X * 1
end

return function(p1)
	-- upvalues: reactModule (ref), reactOtterModule (ref), httpService (ref), runService (ref)
	local var1 = reactModule.useRef(false)
	local var2 = reactModule.useRef(Vector3.new())
	local var3, var4 = reactOtterModule.useAnimatedBinding(0)
	local var5 = reactModule.useRef(0)
	local var6 = reactModule.useRef(0)
	local var7 = reactModule.useRef(nil)
	local var8, var9 = reactModule.useBinding(CFrame.new())
	reactModule.useEffect(function()
		-- upvalues: httpService (copy), var7 (ref), runService (copy), var1 (ref), var4 (ref), reactOtterModule (copy), var3 (ref), var5 (ref), var6 (ref), p1 (ref), var9 (ref)
		local var10 = 0
		local text = "OutfitVewportSpin_" .. httpService:GenerateGUID(false)
		local current = var7.current
		runService:BindToRenderStep(text, Enum.RenderPriority.Camera.Value + 1, function(p2)
			-- upvalues: var1 (copy), var7 (copy), current (write), var4 (copy), reactOtterModule (copy), var10 (write), var3 (copy), var5 (copy), var6 (copy), p1 (copy), var9 (copy)
			if var1.current then
				var4(reactOtterModule.instant(-(if var7.current and current then (var7.current - current) / p2 else Vector2.new(0, 0)).X * 1))
			else
				var10 += p2 * var3:getValue()
			end
			current = var7.current
			local cframe = CFrame.Angles(0, math.rad(var10) + math.rad(var5.current) + math.rad(var6.current), 0)
			var9(CFrame.lookAt(cframe.LookVector * p1.defaultCameraDistanceRef.current, Vector3.new(0, 0, 0), cframe.UpVector))
		end)
		
		return function()
			-- upvalues: runService (copy), text (ref)
			runService:UnbindFromRenderStep(text)
		end
	end, { var4, p1.defaultCameraDistanceRef, var9 })
	local var10 = reactModule.useCallback(function(p2)
		-- upvalues: var5 (ref), var2 (ref), var1 (ref), var7 (ref), var6 (ref), p1 (ref), var4 (ref), reactOtterModule (copy)
		var5.current += -(p2 - var2.current).X * 1
		var1.current = false
		var7.current = nil
		var6.current = 0
		
		if p1.onInteractionChanged then
			p1.onInteractionChanged(false)
		end
		var4(reactOtterModule.spring(0, { frequency = 1 }))
	end, { p1.onInteractionChanged, var4 })
	
	return {
		onInputBegan = reactModule.useCallback(function(_, p2)
			-- upvalues: var1 (ref), var2 (ref), var7 (ref), p1 (ref)
			if (if p2.UserInputType ~= Enum.UserInputType.MouseButton1 then p2.UserInputType == Enum.UserInputType.Touch else true) and not var1.current then
				var1.current = true
				var2.current = p2.Position
				var7.current = p2.Position
				
				if p1.onInteractionChanged then
					p1.onInteractionChanged(true)
				end
			end
		end, { p1.onInteractionChanged }),
		onInputChanged = reactModule.useCallback(function(p2)
			-- upvalues: var1 (ref), var6 (ref), var2 (ref), var7 (ref)
			if var1.current and (if p2.UserInputType ~= Enum.UserInputType.MouseMovement then p2.UserInputType == Enum.UserInputType.Touch else true) then
				var6.current = -(p2.Position - var2.current).X * 1
				var7.current = p2.Position
			end
		end, {}),
		onInputEnded = reactModule.useCallback(function(p2)
			-- upvalues: var1 (ref), var10 (ref)
			if (if p2.UserInputType ~= Enum.UserInputType.MouseButton1 then p2.UserInputType == Enum.UserInputType.Touch else true) and var1.current then
				var10(p2.Position)
			end
		end, { var10 }),
		cameraCFrame = var8
	}
end