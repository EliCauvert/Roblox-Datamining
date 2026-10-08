local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local reactModule = require(script:FindFirstAncestor("SocialCarousel").Parent.React)
local scrollPauseModule = require(script.Parent.scrollPause)
local tileVisibilityModule = require(script.Parent.tileVisibility)

local function activeTileMap(p1, p2, p3, p4, p5)
	-- upvalues: tileVisibilityModule (ref)
	local t = {}
	
	if p1 < 1 or p4 <= 0 or p3 <= 0 then
		return t
	end
	for i = 1, p1 do
		if tileVisibilityModule.isAtLeast70PercentVisible(i, p2, p3, p4, p5) then
			t[i] = true
		end
	end
	return t
end

return {
	activeTileMap = activeTileMap,
	useMarqueeActiveTiles = function(p6, p7, p8, p9)
		-- upvalues: reactModule (ref), scrollPauseModule (ref), runService (ref), userInputService (ref), activeTileMap (ref)
		local var1, var2 = reactModule.useState({})
		local var3, var4 = reactModule.useState(false)
		local var5 = reactModule.useRef(scrollPauseModule.initialState())
		local var6 = reactModule.useRef({})
		local var7 = reactModule.useRef(p7)
		var7.current = p7
		reactModule.useEffect(function()
			-- upvalues: p6 (ref), p8 (ref), runService (copy), p9 (ref), userInputService (copy), var6 (ref), var7 (ref), var2 (ref), activeTileMap (copy), var5 (ref), scrollPauseModule (copy), var4 (ref)
			local current = p6.current
			
			if current == nil then return end
			local p10 = p8 or runService.Heartbeat
			local p11 = p9 or userInputService
			local var8 = nil
			local current_1 = var6.current
			local t = { current = next(current_1) ~= nil }
			local _ = nil
			local apply = nil
			
			local function _()
				-- upvalues: var8 (write)
				if var8 then
					var8:Disconnect()
					var8 = nil
				end
			end
			
			local _ = function(p12)
				-- upvalues: var7 (copy), var2 (copy), activeTileMap (copy)
				local current = var7.current
				var2(activeTileMap(current.tileCount, p12, current.containerWidth, current.tileWidth, current.columnGap))
			end
			
			local function startHeartbeat()
				-- upvalues: var8 (write), p10 (ref), var5 (copy), apply (write)
				if var8 then
					return
				end
				var8 = p10:Connect(function(p12)
					-- upvalues: var5 (copy), apply (copy)
					local canvasX = var5.current.canvasX
					
					if canvasX == nil then
						return
					end
					apply(canvasX, p12)
				end)
			end
			
			apply = function(p12, p13, p14)
				-- upvalues: var5 (copy), scrollPauseModule (copy), t (ref), var4 (copy), startHeartbeat (write), var8 (write), var7 (copy), var2 (copy), activeTileMap (copy)
				local current = var5.current
				local var9 = scrollPauseModule.advance(current, p12, p13, t.current)
				var5.current = var9
				
				if var9.interacting and not current.interacting then
					var4(true)
					startHeartbeat()
					
					return
				elseif not var9.interacting and (current.interacting or p14) then
					if var8 then
						var8:Disconnect()
						var8 = nil
					end
					var4(false)
					local current_1 = var7.current
					var2(activeTileMap(current_1.tileCount, p12, current_1.containerWidth, current_1.tileWidth, current_1.columnGap))
				end
			end
			
			local function onInputBegan(p12)
				-- upvalues: scrollPauseModule (copy), current (ref), current_1 (ref), t (ref), apply (write)
				if not scrollPauseModule.isPointerHold(p12.UserInputType) then return end
				if scrollPauseModule.pointerIsInside(current.AbsolutePosition, current.AbsoluteSize, Vector2.new(p12.Position.X, p12.Position.Y)) then
					current_1[p12] = true
					t.current = true
					apply(current.CanvasPosition.X, 0)
					
					return
				end
			end
			
			local _ = function(p12)
				-- upvalues: current_1 (ref), t (ref), apply (write), current (ref)
				if p12 == nil then
					table.clear(current_1)
				elseif current_1[p12] == nil then return end
				current_1[p12] = nil
				t.current = next(current_1) ~= nil
				apply(current.CanvasPosition.X, 0)
			end
			
			local function onCanvasPositionChanged()
				-- upvalues: apply (write), current (ref)
				apply(current.CanvasPosition.X, 0)
			end
			
			apply(current.CanvasPosition.X, 0, true)
			
			if var5.current.interacting then
				startHeartbeat()
			end
			local var9 = current:GetPropertyChangedSignal("CanvasPosition"):Connect(onCanvasPositionChanged)
			local inputBeganConnection = p11.InputBegan:Connect(onInputBegan)
			local inputEndedConnection = p11.InputEnded:Connect(function(p12)
				-- upvalues: current_1 (ref), t (ref), apply (write), current (ref)
				if p12 == nil then
					table.clear(current_1)
				elseif current_1[p12] == nil then return end
				current_1[p12] = nil
				t.current = next(current_1) ~= nil
				apply(current.CanvasPosition.X, 0)
			end)
			local var10 = if p11.WindowFocusReleased then p11.WindowFocusReleased:Connect(function()
				-- upvalues: current_1 (ref), t (ref), apply (write), current (ref)
				table.clear(current_1)
				t.current = next(current_1) ~= nil
				apply(current.CanvasPosition.X, 0)
			end) else nil
			
			return function()
				-- upvalues: var8 (write), var9 (ref), inputBeganConnection (ref), inputEndedConnection (ref), var10 (ref)
				if var8 then
					var8:Disconnect()
					var8 = nil
				end
				var9:Disconnect()
				inputBeganConnection:Disconnect()
				inputEndedConnection:Disconnect()
				
				if var10 then
					var10:Disconnect()
				end
			end
		end, {
			p6, p8, p9, p7.tileCount, p7.containerWidth, p7.tileWidth, p7.columnGap
		})
		
		return { activeByIndex = var1, isPaused = var3 }
	end
}