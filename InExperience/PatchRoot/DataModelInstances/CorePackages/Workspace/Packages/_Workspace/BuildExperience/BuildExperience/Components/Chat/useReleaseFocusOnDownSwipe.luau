local userInputService = game:GetService("UserInputService")
local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local _ = require(buildExperience.Chat.useChatSessionCore)

local function _(p0) --[[ line: 17 | named "getInputPosition" ]]
	return Vector2.new(p0.Position.X, p0.Position.Y)
end

local _ = function(p1, p2) --[[ line: 21 | named "isPositionHorizontallyInsideGuiObject" ]]
	local var4 = p1.X - p2.AbsolutePosition.X
	
	return var4 >= 0 and var4 <= p2.AbsoluteSize.X
end

local _ = function(p3) --[[ line: 26 | named "isDownSwipe" ]]
	return p3.Y >= 24 and math.abs(p3.X) < p3.Y
end

local function didDownSwipeCrossGuiObject(vectorA, vectorB, p4) --[[ line: 30 ]]
	local var5 = vectorB - vectorA
	
	if var5.Y >= 24 and math.abs(var5.X) < var5.Y then
		local x = p4.AbsolutePosition.X
		local y = p4.AbsolutePosition.Y
		
		return x <= math.max(vectorA.X, vectorB.X) and (math.min(vectorA.X, vectorB.X) <= x + p4.AbsoluteSize.X and (vectorA.Y <= y + p4.AbsoluteSize.Y and y <= vectorB.Y))
	end
	return false
end

return function(p5, p6) --[[ line: 53 | named "useReleaseFocusOnDownSwipe" ]]
	-- upvalues: reactModule (ref), didDownSwipeCrossGuiObject (ref), userInputService (ref)
	local var6 = reactModule.useRef(nil)
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useCallback(function() --[[ line: 58 ]]
		-- upvalues: var8 (ref), var6 (ref), var7 (ref)
		if var8.current then
			var8.current:Disconnect()
			var8.current = nil
		end
		var6.current = nil
		var7.current = nil
	end, {})
	local var10 = reactModule.useCallback(function() --[[ line: 67 ]]
		-- upvalues: p6 (ref)
		local var11 = if p6 then p6.current else nil
		
		if var11 then
			var11.releaseFocus()
		end
	end, { p6 })
	reactModule.useEffect(function() --[[ line: 74 ]]
		-- upvalues: var7 (ref), var6 (ref), p5 (ref), didDownSwipeCrossGuiObject (copy), var9 (ref), var10 (ref), userInputService (copy), p6 (ref), var8 (ref)
		local function _(p7) --[[ line: 75 | named "maybeReleaseFocus" ]]
			-- upvalues: var7 (copy), var6 (copy), p5 (copy), didDownSwipeCrossGuiObject (copy), var9 (copy), var10 (copy)
			local current = var7.current
			
			if var6.current ~= p7 or current == nil then
				return false
			end
			local current_1 = p5.current
			
			if current_1 == nil or not didDownSwipeCrossGuiObject(current, Vector2.new(p7.Position.X, p7.Position.Y), current_1) then
				return false
			end
			var9()
			var10()
			
			return true
		end
		
		local _ = function(p8) --[[ line: 93 | named "handleInputChanged" ]]
			-- upvalues: var7 (copy), var6 (copy), p5 (copy), didDownSwipeCrossGuiObject (copy), var9 (copy), var10 (copy)
			local var14
			local current = var7.current
			
			if var6.current == p8 and current ~= nil then
				local current_1 = p5.current
				
				if current_1 == nil or not didDownSwipeCrossGuiObject(current, Vector2.new(p8.Position.X, p8.Position.Y), current_1) then
					var14 = false
				else
					var9()
					var10()
					var14 = true
				end
			else
				var14 = false
			end
			if var14 then return end
			if p8.UserInputState == Enum.UserInputState.End or p8.UserInputState == Enum.UserInputState.Cancel then
				var9()
			end
		end
		
		local touchStartedConnection = userInputService.TouchStarted:Connect(function(p9) --[[ line: 104 ]]
			-- upvalues: var9 (copy), p5 (copy), p6 (copy), var6 (copy), var7 (copy), var8 (copy), didDownSwipeCrossGuiObject (copy), var10 (copy)
			var9()
			local current = p5.current
			
			if current == nil or (if p6 then p6.current else nil) == nil then return end
			local vector2 = Vector2.new(p9.Position.X, p9.Position.Y)
			local var16 = vector2.X - current.AbsolutePosition.X
			
			if (var16 >= 0 and var16 <= current.AbsoluteSize.X) and current.AbsolutePosition.Y + current.AbsoluteSize.Y >= vector2.Y then
				var6.current = p9
				var7.current = vector2
				var8.current = p9.Changed:Connect(function() --[[ line: 123 ]]
					-- upvalues: p9 (ref), var7 (copy), var6 (copy), p5 (copy), didDownSwipeCrossGuiObject (copy), var9 (copy), var10 (copy)
					local var17
					local current = var7.current
					
					if var6.current == p9 and current ~= nil then
						local current_1 = p5.current
						
						if current_1 == nil or not didDownSwipeCrossGuiObject(current, Vector2.new(p9.Position.X, p9.Position.Y), current_1) then
							var17 = false
						else
							var9()
							var10()
							var17 = true
						end
					else
						var17 = false
					end
					if var17 then return end
					if p9.UserInputState == Enum.UserInputState.End or p9.UserInputState == Enum.UserInputState.Cancel then
						var9()
					end
				end)
				
				return
			end
		end)
		local touchEndedConnection = userInputService.TouchEnded:Connect(function(p10) --[[ line: 128 ]]
			-- upvalues: var6 (copy), var7 (copy), p5 (copy), didDownSwipeCrossGuiObject (copy), var9 (copy), var10 (copy)
			if var6.current == p10 then
				local var18
				local current = var7.current
				
				if var6.current == p10 and current ~= nil then
					local current_1 = p5.current
					
					if current_1 == nil or not didDownSwipeCrossGuiObject(current, Vector2.new(p10.Position.X, p10.Position.Y), current_1) then
						var18 = false
					else
						var9()
						var10()
						var18 = true
					end
				else
					var18 = false
				end
				if not var18 then
					var9()
				end
			end
		end)
		
		return function() --[[ line: 136 ]]
			-- upvalues: touchStartedConnection (ref), touchEndedConnection (ref), var9 (copy)
			touchStartedConnection:Disconnect()
			touchEndedConnection:Disconnect()
			var9()
		end
	end, { p5, p6, var9, var10 })
end