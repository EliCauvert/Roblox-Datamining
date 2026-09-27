local runService = game:GetService("RunService")
local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local motionModule = require(parent.Motion)
local reactModule = require(parent.React)
local worldCutoutTransitionModule = require(script.Parent.WorldCutoutTransition)
local userGameSettingsService = UserSettings():GetService("UserGameSettings")

local function _(p1)
	return if p1 == nil or p1.AbsoluteSize.X <= 1 or p1.AbsoluteSize.Y <= 1 then nil else Rect.new(p1.AbsolutePosition, p1.AbsolutePosition + p1.AbsoluteSize)
end

return function(p1)
	-- upvalues: foundationModule (ref), userGameSettingsService (ref), reactModule (ref), worldCutoutTransitionModule (ref), motionModule (ref), runService (ref)
	local reducedMotion = foundationModule.Hooks.usePreferences().reducedMotion or userGameSettingsService.ReducedMotion
	local var1 = reactModule.useRef(worldCutoutTransitionModule.initialState)
	local var2, var3 = reactModule.useState(var1.current.phase)
	local var4, var5 = reactModule.useState(false)
	local var6, var7 = reactModule.useBinding(nil)
	local var8, var9 = reactModule.useBinding(nil)
	local var10, var11 = motionModule.useMotion({ progress = 0 })
	local progress = var10.progress
	local var12 = reactModule.useRef(var11)
	var12.current = var11
	local var13 = reactModule.useRef(p1)
	var13.current = p1
	local var14 = p1.isAvailable and (p1.isHome and (p1.isOpen and var2 == "Home"))
	local var15 = reactModule.useRef(var14)
	var15.current = var14
	local var16 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), worldCutoutTransitionModule (copy), var3 (ref)
		local current = var1.current
		var1.current = worldCutoutTransitionModule.reduce(current, p2)
		
		if var1.current.phase ~= current.phase then
			var3(var1.current.phase)
		end
		return var1.current
	end, {})
	local var17 = reactModule.useRef(nil)
	local var18 = reactModule.useRef(nil)
	local var19 = reactModule.useRef(nil)
	local var20 = reactModule.useCallback(function()
		-- upvalues: var18 (ref), var9 (ref), var17 (ref), var7 (ref), var5 (ref), var15 (ref), var13 (ref)
		local current = var18.current
		local var21 = if current == nil or current.AbsoluteSize.X <= 1 or current.AbsoluteSize.Y <= 1 then nil else Rect.new(current.AbsolutePosition, current.AbsolutePosition + current.AbsoluteSize)
		
		if var21 ~= nil then
			var9(var21)
		end
		local current_1 = var17.current
		current = if current_1 == nil or current_1.AbsoluteSize.X <= 1 or current_1.AbsoluteSize.Y <= 1 then nil else Rect.new(current_1.AbsolutePosition, current_1.AbsolutePosition + current_1.AbsoluteSize)
		
		if current == nil then return end
		var7(current)
		var5(true)
		
		if var15.current then
			var13.current.onViewportRectChanged(current)
		end
	end, { var7, var9 })
	local var21 = reactModule.useCallback(function()
		-- upvalues: var20 (ref), var19 (ref)
		var20()
		
		if var19.current == nil then
			var19.current = task.defer(function()
				-- upvalues: var19 (copy), var20 (copy)
				var19.current = nil
				var20()
			end)
		end
	end, { var20 })
	reactModule.useEffect(function()
		-- upvalues: var19 (ref)
		return function()
			-- upvalues: var19 (copy)
			if var19.current ~= nil then
				task.cancel(var19.current)
				var19.current = nil
			end
		end
	end, {})
	local var22 = reactModule.useCallback(function(p2)
		-- upvalues: var17 (ref), var21 (ref)
		var17.current = p2
		var21()
	end, { var21 })
	local var23 = reactModule.useCallback(function(p2)
		-- upvalues: var18 (ref), var21 (ref)
		var18.current = p2
		var21()
	end, { var21 })
	local var24 = reactModule.useCallback(function()
		-- upvalues: var13 (ref), var1 (ref), var16 (ref)
		local current = var13.current
		local phase = var1.current.phase
		
		if current.isAvailable and current.isHome and current.isOpen and (phase == "Home" or phase == "Collapsing") then
			var16({ type = "Expand" })
			
			return true
		end
		return false
	end, { var16 })
	local var25 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), var16 (ref)
		local phase = var1.current.phase
		
		if phase == "World" or phase == "Expanding" then
			var16({ type = "Collapse" })
			
			return true
		end
		return false
	end, { var16 })
	reactModule.useEffect(function()
		-- upvalues: var14 (ref), var6 (ref), p1 (ref), var2 (ref)
		if var14 then
			local value = var6:getValue()
			
			if value == nil then
				return
			else
				p1.onViewportRectChanged(value)
				
				return
			end
		elseif p1.isAvailable and p1.isOpen and var2 == "Home" then
			p1.onViewportRectChanged(nil)
		end
	end, {
		var14, var2, p1.isAvailable, p1.isOpen, p1.onViewportRectChanged, var6
	})
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), p1 (ref), var16 (ref)
		if var2 ~= "Home" and (not p1.isAvailable or not p1.isHome or var2 == "World" and p1.isOpen) then
			var16({ type = "Reset" })
		end
	end, {
		var2,
		p1.isAvailable,
		p1.isHome,
		p1.isOpen,
		var16
	})
	reactModule.useEffect(function()
		-- upvalues: worldCutoutTransitionModule (copy), var2 (ref), runService (copy), var16 (ref), progress (ref), var6 (ref), var8 (ref), var13 (ref), var12 (ref), motionModule (copy), reducedMotion (ref), var1 (ref)
		local var26 = worldCutoutTransitionModule.isTransitioning(var2)
		local var27 = false
		local var28 = if var26 then runService.Heartbeat:Connect(function()
			-- upvalues: var16 (copy), progress (copy), var6 (copy), var8 (copy), worldCutoutTransitionModule (copy), var13 (copy)
			local var29 = var16({ type = "Progress", progress = progress:getValue() })
			local value = var6:getValue()
			local value_1 = var8:getValue()
			
			if worldCutoutTransitionModule.isTransitioning(var29.phase) and value ~= nil and value_1 ~= nil then
				var13.current.onViewportRectChanged(worldCutoutTransitionModule.interpolateRect(value, value_1, var29.progress))
			end
		end) else nil
		var12.current(motionModule.createState({ progress = worldCutoutTransitionModule.getTarget(var2) }, {
			default = motionModule.transition({
				duration = if reducedMotion or not var26 then 0 else 0.3,
				easingStyle = Enum.EasingStyle.Quad
			})
		}), {
			onAnimationComplete = function(p2)
				-- upvalues: var27 (write), var1 (copy), var2 (copy), var16 (copy)
				if p2 == true and not var27 and var1.current.phase == var2 then
					var16({ type = "Settle" })
				end
			end
		})
		
		return function()
			-- upvalues: var27 (write), var28 (write)
			var27 = true
			
			if var28 ~= nil then
				var28:Disconnect()
			end
		end
	end, {
		var2, reducedMotion, progress, var6, var8, var16
	})
	local var26 = worldCutoutTransitionModule.isTransitioning(var2)
	
	return {
		phase = var2,
		isMeasured = var4,
		enter = var24,
		exit = var25,
		onCellRectChanged = var22,
		view = if p1.isAvailable then {
			isTransitioning = var26,
			showHole = var26 or p1.isHome and var2 == "Home",
			progress = progress,
			hole = reactModule.useMemo(function()
				-- upvalues: reactModule (copy), progress (ref), var6 (ref), var8 (ref), worldCutoutTransitionModule (copy)
				return reactModule.joinBindings({ progress = progress, cell = var6, content = var8 }):map(function(p2)
					-- upvalues: worldCutoutTransitionModule (copy)
					if p2.cell == nil or p2.content == nil then
						return nil
					end
					local var27 = worldCutoutTransitionModule.interpolateRect(p2.cell, p2.content, p2.progress)
					local min = p2.content.Min
					
					return Rect.new(var27.Min - min, var27.Max - min)
				end)
			end, { progress, var6, var8 }),
			onContentRectChanged = var23
		} else nil
	}
end