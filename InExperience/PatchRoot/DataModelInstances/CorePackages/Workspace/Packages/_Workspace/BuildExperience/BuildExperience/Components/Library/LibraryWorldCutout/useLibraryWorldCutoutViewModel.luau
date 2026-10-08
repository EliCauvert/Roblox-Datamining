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

local _ = function(p1, p2)
	local scrollingFrame = p1:FindFirstAncestorWhichIsA("ScrollingFrame")
	
	return if scrollingFrame == nil then p2 else Rect.new(p2.Min + scrollingFrame.CanvasPosition, p2.Max + scrollingFrame.CanvasPosition)
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
	local var20 = reactModule.useRef(nil)
	local var21 = reactModule.useCallback(function()
		-- upvalues: var19 (ref), var9 (ref), var17 (ref), var7 (ref), var5 (ref), var18 (ref), var15 (ref), var13 (ref)
		local current = var19.current
		local var22 = if current == nil or current.AbsoluteSize.X <= 1 or current.AbsoluteSize.Y <= 1 then nil else Rect.new(current.AbsolutePosition, current.AbsolutePosition + current.AbsoluteSize)
		
		if var22 ~= nil then
			var9(var22)
		end
		current = var17.current
		local var23 = if current == nil or current.AbsoluteSize.X <= 1 or current.AbsoluteSize.Y <= 1 then nil else Rect.new(current.AbsolutePosition, current.AbsolutePosition + current.AbsoluteSize)
		
		if current == nil or var23 == nil then return end
		var7(var23)
		var5(true)
		local scrollingFrame = current:FindFirstAncestorWhichIsA("ScrollingFrame")
		var18.current = if scrollingFrame == nil then var23 else Rect.new(var23.Min + scrollingFrame.CanvasPosition, var23.Max + scrollingFrame.CanvasPosition)
		
		if var15.current then
			var13.current.onViewportRectChanged(var18.current)
		end
	end, { var7, var9 })
	local var22 = reactModule.useCallback(function()
		-- upvalues: var21 (ref), var20 (ref)
		var21()
		
		if var20.current == nil then
			var20.current = task.defer(function()
				-- upvalues: var20 (copy), var21 (copy)
				var20.current = nil
				var21()
			end)
		end
	end, { var21 })
	reactModule.useEffect(function()
		-- upvalues: var20 (ref)
		return function()
			-- upvalues: var20 (copy)
			if var20.current ~= nil then
				task.cancel(var20.current)
				var20.current = nil
			end
		end
	end, {})
	local var23 = reactModule.useCallback(function(p2)
		-- upvalues: var17 (ref), var22 (ref)
		var17.current = p2
		var22()
	end, { var22 })
	local var24 = reactModule.useCallback(function(p2)
		-- upvalues: var19 (ref), var22 (ref)
		var19.current = p2
		var22()
	end, { var22 })
	local var25 = reactModule.useCallback(function()
		-- upvalues: var13 (ref), var1 (ref), var16 (ref)
		local current = var13.current
		local phase = var1.current.phase
		
		if current.isAvailable and current.isHome and current.isOpen and (phase == "Home" or phase == "Collapsing") then
			var16({ type = "Expand" })
			
			return true
		end
		return false
	end, { var16 })
	local var26 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), var16 (ref)
		local phase = var1.current.phase
		
		if phase == "World" or phase == "Expanding" then
			var16({ type = "Collapse" })
			
			return true
		end
		return false
	end, { var16 })
	reactModule.useEffect(function()
		-- upvalues: var14 (ref), var18 (ref), p1 (ref), var2 (ref)
		if var14 then
			local current = var18.current
			
			if current == nil then
				return
			else
				p1.onViewportRectChanged(current)
				
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
		local var27 = worldCutoutTransitionModule.isTransitioning(var2)
		local var28 = false
		local var29 = if var27 then runService.Heartbeat:Connect(function()
			-- upvalues: var16 (copy), progress (copy), var6 (copy), var8 (copy), worldCutoutTransitionModule (copy), var13 (copy)
			local var30 = var16({ type = "Progress", progress = progress:getValue() })
			local value = var6:getValue()
			local value_1 = var8:getValue()
			
			if worldCutoutTransitionModule.isTransitioning(var30.phase) and value ~= nil and value_1 ~= nil then
				var13.current.onViewportRectChanged(worldCutoutTransitionModule.interpolateRect(value, value_1, var30.progress))
			end
		end) else nil
		var12.current(motionModule.createState({ progress = worldCutoutTransitionModule.getTarget(var2) }, {
			default = motionModule.transition({
				duration = if reducedMotion or not var27 then 0 else 0.3,
				easingStyle = Enum.EasingStyle.Quad
			})
		}), {
			onAnimationComplete = function(p2)
				-- upvalues: var28 (write), var1 (copy), var2 (copy), var16 (copy)
				if p2 == true and not var28 and var1.current.phase == var2 then
					var16({ type = "Settle" })
				end
			end
		})
		
		return function()
			-- upvalues: var28 (write), var29 (write)
			var28 = true
			
			if var29 ~= nil then
				var29:Disconnect()
			end
		end
	end, {
		var2, reducedMotion, progress, var6, var8, var16
	})
	local var27 = worldCutoutTransitionModule.isTransitioning(var2)
	
	return {
		phase = var2,
		isMeasured = var4,
		enter = var25,
		exit = var26,
		onCellRectChanged = var23,
		view = if p1.isAvailable then {
			isTransitioning = var27,
			showHole = var27 or p1.isHome and var2 == "Home",
			progress = progress,
			hole = reactModule.useMemo(function()
				-- upvalues: reactModule (copy), progress (ref), var6 (ref), var8 (ref), worldCutoutTransitionModule (copy)
				return reactModule.joinBindings({ progress = progress, cell = var6, content = var8 }):map(function(p2)
					-- upvalues: worldCutoutTransitionModule (copy)
					if p2.cell == nil or p2.content == nil then
						return nil
					end
					local var28 = worldCutoutTransitionModule.interpolateRect(p2.cell, p2.content, p2.progress)
					local min = p2.content.Min
					
					return Rect.new(var28.Min - min, var28.Max - min)
				end)
			end, { progress, var6, var8 }),
			onContentRectChanged = var24
		} else nil
	}
end