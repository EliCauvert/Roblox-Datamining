local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local reactModule = require(script:FindFirstAncestor("SocialCarousel").Parent.React)
local marqueeEligibilityModule = require(script.Parent.marqueeEligibility)
local scrollPauseModule = require(script.Parent.scrollPause)
local tileVisibilityModule = require(script.Parent.tileVisibility)

local function drawsOnTop(p1)
	return not (not p1:IsA("GuiObject") or not p1.Visible) and (p1.BackgroundTransparency < 0.95 or (not (not p1:IsA("ImageLabel") and not p1:IsA("ImageButton")) and (p1.Image ~= "" and p1.ImageTransparency < 0.95)))
end

local function isCoveredAt(p1, p2, p3, p4)
	-- upvalues: drawsOnTop (ref)
	for i, v in p2(p3, p4) do
		if v ~= p1 and not v:IsDescendantOf(p1) then
			if not p1:IsDescendantOf(v) and drawsOnTop(v) then
				return true
			end
		end
		return false
	end
	return false
end

local function _(p5, p6)
	for i, v in ipairs(p5) do
		if v.id == p6 then
			return i
		end
	end
	return nil
end

local function lastLocationFor(p7, p8)
	for i, v in ipairs(p7) do
		if v.id == p8 then
			local presence = v.presence
			local var1 = if presence ~= nil then nil else presence.lastLocation
			
			return if var1 == nil or var1 == "" then nil else var1
		end
	end
	return nil
end

return {
	useMarqueeActiveTiles = function(p9, p10, p11, p12, p13)
		-- upvalues: reactModule (ref), scrollPauseModule (ref), lastLocationFor (ref), marqueeEligibilityModule (ref), runService (ref), userInputService (ref), tileVisibilityModule (ref), isCoveredAt (ref)
		local var2, var3 = reactModule.useState({})
		local var4, var5 = reactModule.useState(false)
		local var6 = reactModule.useRef(scrollPauseModule.initialState())
		local var7 = reactModule.useRef({})
		local var8 = reactModule.useRef(nil)
		local var9 = reactModule.useRef(nil)
		local var10, var11 = reactModule.useState(0)
		local var12 = reactModule.useRef(0)
		local var13 = reactModule.useRef(p10)
		var13.current = p10
		
		local function publishIndex(p14)
			-- upvalues: var9 (ref), var3 (ref)
			if var9.current == p14 then return end
			var9.current = p14
			
			if p14 == nil then
				var3({})
				
				return
			end
			var3({ [p14] = true })
		end
		
		local var14 = reactModule.useCallback(function(p14)
			-- upvalues: var13 (ref), lastLocationFor (copy), marqueeEligibilityModule (copy), var7 (ref), var6 (ref), var8 (ref), publishIndex (ref), var12 (ref), var11 (ref)
			local current = var13.current
			
			if current.idleSequenceEnabled ~= true then return end
			local tiles = current.tiles or {}
			local var15 = lastLocationFor(tiles, p14)
			
			if var15 == nil then return end
			marqueeEligibilityModule.recordFinishedLoop(var7.current, p14, var15)
			local t = {
				interacting = false,
				direction = current.direction or Enum.TextDirection.LeftToRight,
				reducedMotion = current.reducedMotion == true,
				loopsRemaining = var7.current,
				canvasX = var6.current.canvasX or 0,
				containerWidth = current.containerWidth,
				tileWidth = current.tileWidth,
				gap = current.columnGap
			}
			local var16 = marqueeEligibilityModule.resolveActiveTileId(tiles, t, p14)
			
			if var16 ~= p14 then
				var16 = marqueeEligibilityModule.nextEligibleAfter(tiles, p14, t)
			end
			local var17
			var8.current = var16
			
			if var16 == nil then
				var17 = nil
			else
				local var18 = var16
				
				for i, v in ipairs(tiles) do
					if v.id == var18 then
						var17 = i
					end
				end
				var17 = nil
			end
			publishIndex(var17)
			
			if var16 == nil then return end
			local var19 = lastLocationFor(tiles, var16)
			
			if var19 == nil then return end
			local var20 = var7.current[marqueeEligibilityModule.loopKey(var16, var19)]
			
			if var20 ~= nil and var20 < marqueeEligibilityModule.DEFAULT_LOOPS then
				var12.current += 1
				var11(var12.current)
			end
		end, {})
		
		local function _(p15, p16)
			for i, v in ipairs(p15) do
				if v.id == p16 then
					return v
				end
			end
			return nil
		end
		
		local var21 = reactModule.useCallback(function(p17)
			-- upvalues: var13 (ref), marqueeEligibilityModule (copy), var8 (ref), publishIndex (ref), var12 (ref), var11 (ref)
			local current = var13.current
			
			if current.hoverEnabled ~= true or current.reducedMotion == true then return end
			local var22
			local tiles = current.tiles or {}
			
			for i, v in ipairs(tiles) do
				if v.id == p17 then
					var22 = v
					if var22 == nil or not marqueeEligibilityModule.isHoverEligible(var22) then return end
					local var23
					var8.current = p17
					
					for i_1, v_1 in ipairs(tiles) do
						if v_1.id == p17 then
							var23 = i_1
							publishIndex(var23)
							var12.current += 1
							var11(var12.current)
							
							return
						end
					end
					var23 = nil
				end
			end
			var22 = nil
		end, {})
		local var24 = reactModule.useCallback(function(p18)
			-- upvalues: var13 (ref), var8 (ref), var9 (ref), var3 (ref)
			if var13.current.hoverEnabled ~= true then return end
			if var8.current ~= p18 then return end
			var8.current = nil
			
			if var9.current == nil then
				return
			end
			var9.current = nil
			var3({})
		end, {})
		local var25 = reactModule.useRef({})
		reactModule.useEffect(function()
			-- upvalues: p9 (ref), p11 (ref), runService (copy), p12 (ref), userInputService (copy), p13 (ref), var25 (ref), tileVisibilityModule (copy), isCoveredAt (copy), var13 (ref), var8 (ref), var9 (ref), var3 (ref), marqueeEligibilityModule (copy), publishIndex (ref), var7 (ref), var6 (ref), scrollPauseModule (copy), var5 (ref)
			local current = p9.current
			
			if current == nil then return end
			local p18 = p11 or runService.Heartbeat
			local p19 = p12 or userInputService
			local p20 = p13 or function(p21, p22)
				-- upvalues: current (ref)
				local basePlayerGui = current:FindFirstAncestorWhichIsA("BasePlayerGui")
				
				return if basePlayerGui == nil then {} else basePlayerGui:GetGuiObjectsAtPosition(p21, p22)
			end
			local var26 = nil
			local current_1 = var25.current
			local t = { current = next(current_1) ~= nil }
			local _ = nil
			local apply = nil
			
			local function _()
				-- upvalues: var26 (write)
				if var26 then
					var26:Disconnect()
					var26 = nil
				end
			end
			
			local function verticalPage()
				-- upvalues: current (ref)
				local var27 = nil
				local var28 = 0
				local parent = current.Parent
				while parent ~= nil do
					if parent:IsA("ScrollingFrame") then
						local var29 = parent.CanvasSize.Y.Offset + parent.CanvasSize.Y.Scale * parent.AbsoluteSize.Y - parent.AbsoluteSize.Y
						
						if var28 < var29 then
							var27 = parent
							var28 = var29
						end
					end
					parent = parent.Parent
				end
				return var27
			end
			
			local _ = function()
				-- upvalues: verticalPage (ref)
				local var30 = verticalPage()
				
				return if var30 == nil then nil else var30.CanvasPosition.Y
			end
			
			local function rowIsVerticallyEligible()
				-- upvalues: verticalPage (ref), current (ref), tileVisibilityModule (copy), isCoveredAt (copy), p20 (ref)
				local var30 = verticalPage()
				
				if var30 == nil then
					return true
				end
				local y = current.AbsolutePosition.Y
				local y_1 = current.AbsoluteSize.Y
				local y_2 = var30.AbsolutePosition.Y
				local y_3 = var30.AbsoluteSize.Y
				
				if not tileVisibilityModule.isAtLeast70PercentVerticallyVisible(y, y_1, y_2, y_3) then
					return false
				end
				local var31 = current.AbsolutePosition.X + current.AbsoluteSize.X / 2
				local var32 = 0
				
				for i = 1, 20 do
					local var33 = y + (i - 0.5) * y_1 / 20
					
					if (y_2 <= var33 and var33 <= y_2 + y_3) and not isCoveredAt(current, p20, var31, var33) then
						var32 += 1
					end
				end
				return tileVisibilityModule.MIN_VISIBLE_FRACTION <= var32 / 20
			end
			
			local function publish(p21)
				-- upvalues: var13 (copy), var8 (copy), var9 (copy), var3 (copy), marqueeEligibilityModule (copy), publishIndex (copy), var7 (copy)
				local current_1, var34
				local current = var13.current
				
				if current.hoverEnabled == true then
					local tiles = current.tiles or {}
					current_1 = var8.current
					
					if current_1 == nil then
						var34 = nil
					else
						for i, v in ipairs(tiles) do
							if v.id == current_1 then
								var34 = v
							end
						end
						var34 = nil
					end
					if var34 == nil or current.reducedMotion == true then
						var8.current = nil
						
						if var9.current == nil then
							return
						end
						var9.current = nil
						var3({})
						
						return
					elseif marqueeEligibilityModule.isHoverEligible(var34) then
						local var35
						local var36 = publishIndex
						
						for i, v_1 in ipairs(tiles) do
							if v_1.id == current_1 then
								var35 = i
								var36(var35)
								
								return
							end
						end
						var35 = nil
					else
						var8.current = nil
						
						if var9.current == nil then
							return
						end
						var9.current = nil
						var3({})
						
						return
					end
				elseif current.idleSequenceEnabled == true then
					local tiles = current.tiles or {}
					current_1 = marqueeEligibilityModule.resolveActiveTileId(tiles, {
						interacting = false,
						direction = current.direction or Enum.TextDirection.LeftToRight,
						reducedMotion = current.reducedMotion == true,
						loopsRemaining = var7.current,
						canvasX = p21,
						containerWidth = current.containerWidth,
						tileWidth = current.tileWidth,
						gap = current.columnGap
					}, var8.current)
					var8.current = current_1
					
					if current_1 == nil then
						var34 = nil
					else
						for i, v in ipairs(tiles) do
							if v.id == current_1 then
								var34 = i
							end
						end
						var34 = nil
					end
					publishIndex(var34)
					
					return
				else
					var8.current = nil
					
					if var9.current == nil then
						return
					end
					var9.current = nil
					var3({})
				end
			end
			
			local function startHeartbeat()
				-- upvalues: var26 (write), p18 (ref), var6 (copy), apply (write)
				if var26 then
					return
				end
				var26 = p18:Connect(function(p22)
					-- upvalues: var6 (copy), apply (copy)
					local canvasX = var6.current.canvasX
					
					if canvasX == nil then
						return
					end
					apply(canvasX, p22)
				end)
			end
			
			apply = function(p22, p23, p24)
				-- upvalues: var6 (copy), scrollPauseModule (copy), t (ref), verticalPage (ref), var5 (copy), startHeartbeat (write), var26 (write), rowIsVerticallyEligible (ref), var8 (copy), var9 (copy), var3 (copy), publish (ref)
				local current = var6.current
				local var37 = verticalPage()
				local var38 = scrollPauseModule.advance(current, p22, p23, t.current, if var37 == nil then nil else var37.CanvasPosition.Y)
				var6.current = var38
				
				if var38.interacting then
					var5(true)
					startHeartbeat()
					
					return
				elseif var26 then
					var26:Disconnect()
					var26 = nil
				end
				if rowIsVerticallyEligible() then
					if current.interacting or p24 or var9.current == nil then
						var5(false)
						publish(p22)
					end
					return
				else
					var5(false)
					var8.current = nil
					
					if var9.current == nil then
						return
					end
					var9.current = nil
					var3({})
				end
			end
			
			local function onInputBegan(p22)
				-- upvalues: scrollPauseModule (copy), verticalPage (ref), current (ref), current_1 (ref), t (ref), apply (write)
				if not scrollPauseModule.isPointerHold(p22.UserInputType) then return end
				local var37 = verticalPage()
				
				if scrollPauseModule.pointerIsInside(if var37 ~= nil then current.AbsolutePosition else var37.AbsolutePosition, if var37 ~= nil then current.AbsoluteSize else var37.AbsoluteSize, Vector2.new(p22.Position.X, p22.Position.Y)) then
					current_1[p22] = true
					t.current = true
					apply(current.CanvasPosition.X, 0)
					
					return
				end
			end
			
			local _ = function(p22)
				-- upvalues: current_1 (ref), t (ref), apply (write), current (ref)
				if p22 == nil then
					table.clear(current_1)
				elseif current_1[p22] == nil then return end
				current_1[p22] = nil
				t.current = next(current_1) ~= nil
				apply(current.CanvasPosition.X, 0)
			end
			
			local function onCanvasPositionChanged()
				-- upvalues: apply (write), current (ref)
				apply(current.CanvasPosition.X, 0)
			end
			
			apply(current.CanvasPosition.X, 0, true)
			
			if var6.current.interacting then
				startHeartbeat()
			end
			local var37 = verticalPage()
			local var38 = if var37 then var37:GetPropertyChangedSignal("CanvasPosition"):Connect(onCanvasPositionChanged) else nil
			local var39 = current:GetPropertyChangedSignal("CanvasPosition"):Connect(onCanvasPositionChanged)
			local inputBeganConnection = p19.InputBegan:Connect(onInputBegan)
			local inputEndedConnection = p19.InputEnded:Connect(function(p22)
				-- upvalues: current_1 (ref), t (ref), apply (write), current (ref)
				if p22 == nil then
					table.clear(current_1)
				elseif current_1[p22] == nil then return end
				current_1[p22] = nil
				t.current = next(current_1) ~= nil
				apply(current.CanvasPosition.X, 0)
			end)
			local var40 = if p19.WindowFocusReleased then p19.WindowFocusReleased:Connect(function()
				-- upvalues: current_1 (ref), t (ref), apply (write), current (ref)
				table.clear(current_1)
				t.current = next(current_1) ~= nil
				apply(current.CanvasPosition.X, 0)
			end) else nil
			
			return function()
				-- upvalues: var26 (write), var39 (ref), var38 (ref), inputBeganConnection (ref), inputEndedConnection (ref), var40 (ref)
				if var26 then
					var26:Disconnect()
					var26 = nil
				end
				var39:Disconnect()
				
				if var38 then
					var38:Disconnect()
				end
				inputBeganConnection:Disconnect()
				inputEndedConnection:Disconnect()
				
				if var40 then
					var40:Disconnect()
				end
			end
		end, {
			p9, p11, p12, p13, p10.tileCount, p10.containerWidth, p10.tileWidth,
			p10.columnGap, p10.tiles, p10.direction, p10.reducedMotion,
			p10.idleSequenceEnabled, p10.hoverEnabled
		})
		
		return {
			activeByIndex = var2,
			isPaused = var4,
			loopsRemainingRef = var7,
			onMarqueeFinished = var14,
			onMarqueeHover = var21,
			onMarqueeHoverEnd = var24,
			marqueeRunId = var10
		}
	end
}