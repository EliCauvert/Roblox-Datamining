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
		local var21 = reactModule.useRef({})
		reactModule.useEffect(function()
			-- upvalues: p9 (ref), p11 (ref), runService (copy), p12 (ref), userInputService (copy), p13 (ref), var21 (ref), tileVisibilityModule (copy), isCoveredAt (copy), var13 (ref), var8 (ref), var9 (ref), var3 (ref), marqueeEligibilityModule (copy), var7 (ref), publishIndex (ref), var6 (ref), scrollPauseModule (copy), var5 (ref)
			local current = p9.current
			
			if current == nil then return end
			local p15 = p11 or runService.Heartbeat
			local p16 = p12 or userInputService
			local p17 = p13 or function(p18, p19)
				-- upvalues: current (ref)
				local basePlayerGui = current:FindFirstAncestorWhichIsA("BasePlayerGui")
				
				return if basePlayerGui == nil then {} else basePlayerGui:GetGuiObjectsAtPosition(p18, p19)
			end
			local var22 = nil
			local current_1 = var21.current
			local t = { current = next(current_1) ~= nil }
			local _ = nil
			local apply = nil
			
			local function _()
				-- upvalues: var22 (write)
				if var22 then
					var22:Disconnect()
					var22 = nil
				end
			end
			
			local function verticalPage()
				-- upvalues: current (ref)
				local var23 = nil
				local var24 = 0
				local parent = current.Parent
				while parent ~= nil do
					if parent:IsA("ScrollingFrame") then
						local var25 = parent.CanvasSize.Y.Offset + parent.CanvasSize.Y.Scale * parent.AbsoluteSize.Y - parent.AbsoluteSize.Y
						
						if var24 < var25 then
							var23 = parent
							var24 = var25
						end
					end
					parent = parent.Parent
				end
				return var23
			end
			
			local _ = function()
				-- upvalues: verticalPage (ref)
				local var26 = verticalPage()
				
				return if var26 == nil then nil else var26.CanvasPosition.Y
			end
			
			local function rowIsVerticallyEligible()
				-- upvalues: verticalPage (ref), current (ref), tileVisibilityModule (copy), isCoveredAt (copy), p17 (ref)
				local var26 = verticalPage()
				
				if var26 == nil then
					return true
				end
				local y = current.AbsolutePosition.Y
				local y_1 = current.AbsoluteSize.Y
				local y_2 = var26.AbsolutePosition.Y
				local y_3 = var26.AbsoluteSize.Y
				
				if not tileVisibilityModule.isAtLeast70PercentVerticallyVisible(y, y_1, y_2, y_3) then
					return false
				end
				local var27 = current.AbsolutePosition.X + current.AbsoluteSize.X / 2
				local var28 = 0
				
				for i = 1, 20 do
					local var29 = y + (i - 0.5) * y_1 / 20
					
					if (y_2 <= var29 and var29 <= y_2 + y_3) and not isCoveredAt(current, p17, var27, var29) then
						var28 += 1
					end
				end
				return tileVisibilityModule.MIN_VISIBLE_FRACTION <= var28 / 20
			end
			
			local function publish(p18)
				-- upvalues: var13 (copy), var8 (copy), var9 (copy), var3 (copy), marqueeEligibilityModule (copy), var7 (copy), publishIndex (copy)
				local current = var13.current
				
				if current.idleSequenceEnabled == true then
					local var30
					local tiles = current.tiles or {}
					local var31 = marqueeEligibilityModule.resolveActiveTileId(tiles, {
						interacting = false,
						direction = current.direction or Enum.TextDirection.LeftToRight,
						reducedMotion = current.reducedMotion == true,
						loopsRemaining = var7.current,
						canvasX = p18,
						containerWidth = current.containerWidth,
						tileWidth = current.tileWidth,
						gap = current.columnGap
					}, var8.current)
					var8.current = var31
					
					if var31 == nil then
						var30 = nil
					else
						for i, v in ipairs(tiles) do
							if v.id == var31 then
								var30 = i
							end
						end
						var30 = nil
					end
					publishIndex(var30)
					
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
				-- upvalues: var22 (write), p15 (ref), var6 (copy), apply (write)
				if var22 then
					return
				end
				var22 = p15:Connect(function(p19)
					-- upvalues: var6 (copy), apply (copy)
					local canvasX = var6.current.canvasX
					
					if canvasX == nil then
						return
					end
					apply(canvasX, p19)
				end)
			end
			
			apply = function(p19, p20, p21)
				-- upvalues: var6 (copy), scrollPauseModule (copy), t (ref), verticalPage (ref), var5 (copy), startHeartbeat (write), var22 (write), rowIsVerticallyEligible (ref), var8 (copy), var9 (copy), var3 (copy), publish (ref)
				local current = var6.current
				local var32 = verticalPage()
				local var33 = scrollPauseModule.advance(current, p19, p20, t.current, if var32 == nil then nil else var32.CanvasPosition.Y)
				var6.current = var33
				
				if var33.interacting then
					var5(true)
					startHeartbeat()
					
					return
				elseif var22 then
					var22:Disconnect()
					var22 = nil
				end
				if rowIsVerticallyEligible() then
					if current.interacting or p21 or var9.current == nil then
						var5(false)
						publish(p19)
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
			
			local function onInputBegan(p19)
				-- upvalues: scrollPauseModule (copy), verticalPage (ref), current (ref), current_1 (ref), t (ref), apply (write)
				if not scrollPauseModule.isPointerHold(p19.UserInputType) then return end
				local var32 = verticalPage()
				
				if scrollPauseModule.pointerIsInside(if var32 ~= nil then current.AbsolutePosition else var32.AbsolutePosition, if var32 ~= nil then current.AbsoluteSize else var32.AbsoluteSize, Vector2.new(p19.Position.X, p19.Position.Y)) then
					current_1[p19] = true
					t.current = true
					apply(current.CanvasPosition.X, 0)
					
					return
				end
			end
			
			local _ = function(p19)
				-- upvalues: current_1 (ref), t (ref), apply (write), current (ref)
				if p19 == nil then
					table.clear(current_1)
				elseif current_1[p19] == nil then return end
				current_1[p19] = nil
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
			local var32 = verticalPage()
			local var33 = if var32 then var32:GetPropertyChangedSignal("CanvasPosition"):Connect(onCanvasPositionChanged) else nil
			local var34 = current:GetPropertyChangedSignal("CanvasPosition"):Connect(onCanvasPositionChanged)
			local inputBeganConnection = p16.InputBegan:Connect(onInputBegan)
			local inputEndedConnection = p16.InputEnded:Connect(function(p19)
				-- upvalues: current_1 (ref), t (ref), apply (write), current (ref)
				if p19 == nil then
					table.clear(current_1)
				elseif current_1[p19] == nil then return end
				current_1[p19] = nil
				t.current = next(current_1) ~= nil
				apply(current.CanvasPosition.X, 0)
			end)
			local var35 = if p16.WindowFocusReleased then p16.WindowFocusReleased:Connect(function()
				-- upvalues: current_1 (ref), t (ref), apply (write), current (ref)
				table.clear(current_1)
				t.current = next(current_1) ~= nil
				apply(current.CanvasPosition.X, 0)
			end) else nil
			
			return function()
				-- upvalues: var22 (write), var34 (ref), var33 (ref), inputBeganConnection (ref), inputEndedConnection (ref), var35 (ref)
				if var22 then
					var22:Disconnect()
					var22 = nil
				end
				var34:Disconnect()
				
				if var33 then
					var33:Disconnect()
				end
				inputBeganConnection:Disconnect()
				inputEndedConnection:Disconnect()
				
				if var35 then
					var35:Disconnect()
				end
			end
		end, {
			p9, p11, p12, p13, p10.tileCount, p10.containerWidth, p10.tileWidth,
			p10.columnGap, p10.tiles, p10.direction, p10.reducedMotion,
			p10.idleSequenceEnabled
		})
		
		return {
			activeByIndex = var2,
			isPaused = var4,
			loopsRemainingRef = var7,
			onMarqueeFinished = var14,
			marqueeRunId = var10
		}
	end
}