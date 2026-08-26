local userInputService = game:GetService("UserInputService")
local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local _ = require(buildExperience.Chat.useChatSessionCore)

local function _(p1)
	return Vector2.new(p1.Position.X, p1.Position.Y)
end

local _ = function(p1, p2)
	local var1 = p1.X - p2.AbsolutePosition.X
	
	return var1 >= 0 and var1 <= p2.AbsoluteSize.X
end

local _ = function(p1)
	return p1.Y >= 24 and math.abs(p1.X) < p1.Y
end

local function didDownSwipeCrossGuiObject(vectorA, vectorB, p1)
	local var1 = vectorB - vectorA
	
	if var1.Y >= 24 and math.abs(var1.X) < var1.Y then
		local x = p1.AbsolutePosition.X
		local y = p1.AbsolutePosition.Y
		
		return x <= math.max(vectorA.X, vectorB.X) and (math.min(vectorA.X, vectorB.X) <= x + p1.AbsoluteSize.X and (vectorA.Y <= y + p1.AbsoluteSize.Y and y <= vectorB.Y))
	end
	return false
end

return function(p1, p2)
	-- upvalues: reactModule (ref), didDownSwipeCrossGuiObject (ref), userInputService (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var1 (ref), var2 (ref)
		if var3.current then
			var3.current:Disconnect()
			var3.current = nil
		end
		var1.current = nil
		var2.current = nil
	end, {})
	local var5 = reactModule.useCallback(function()
		-- upvalues: p2 (ref)
		local var6 = if p2 then p2.current else nil
		
		if var6 then
			var6.releaseFocus()
		end
	end, { p2 })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var1 (ref), p1 (ref), didDownSwipeCrossGuiObject (copy), var4 (ref), var5 (ref), userInputService (copy), p2 (ref), var3 (ref)
		local function _(p3)
			-- upvalues: var2 (copy), var1 (copy), p1 (copy), didDownSwipeCrossGuiObject (copy), var4 (copy), var5 (copy)
			local current = var2.current
			
			if var1.current ~= p3 or current == nil then
				return false
			end
			local current_1 = p1.current
			
			if current_1 == nil or not didDownSwipeCrossGuiObject(current, Vector2.new(p3.Position.X, p3.Position.Y), current_1) then
				return false
			end
			var4()
			var5()
			
			return true
		end
		
		local _ = function(p3)
			-- upvalues: var2 (copy), var1 (copy), p1 (copy), didDownSwipeCrossGuiObject (copy), var4 (copy), var5 (copy)
			local var6
			local current = var2.current
			
			if var1.current == p3 and current ~= nil then
				local current_1 = p1.current
				
				if current_1 == nil or not didDownSwipeCrossGuiObject(current, Vector2.new(p3.Position.X, p3.Position.Y), current_1) then
					var6 = false
				else
					var4()
					var5()
					var6 = true
				end
			else
				var6 = false
			end
			if var6 then return end
			if p3.UserInputState == Enum.UserInputState.End or p3.UserInputState == Enum.UserInputState.Cancel then
				var4()
			end
		end
		
		local touchStartedConnection = userInputService.TouchStarted:Connect(function(p3)
			-- upvalues: var4 (copy), p1 (copy), p2 (copy), var1 (copy), var2 (copy), var3 (copy), didDownSwipeCrossGuiObject (copy), var5 (copy)
			var4()
			local current = p1.current
			
			if current == nil or (if p2 then p2.current else nil) == nil then return end
			local vector2 = Vector2.new(p3.Position.X, p3.Position.Y)
			local var6 = vector2.X - current.AbsolutePosition.X
			
			if (var6 >= 0 and var6 <= current.AbsoluteSize.X) and current.AbsolutePosition.Y + current.AbsoluteSize.Y >= vector2.Y then
				var1.current = p3
				var2.current = vector2
				var3.current = p3.Changed:Connect(function()
					-- upvalues: p3 (ref), var2 (copy), var1 (copy), p1 (copy), didDownSwipeCrossGuiObject (copy), var4 (copy), var5 (copy)
					local var7
					local current = var2.current
					
					if var1.current == p3 and current ~= nil then
						local current_1 = p1.current
						
						if current_1 == nil or not didDownSwipeCrossGuiObject(current, Vector2.new(p3.Position.X, p3.Position.Y), current_1) then
							var7 = false
						else
							var4()
							var5()
							var7 = true
						end
					else
						var7 = false
					end
					if var7 then return end
					if p3.UserInputState == Enum.UserInputState.End or p3.UserInputState == Enum.UserInputState.Cancel then
						var4()
					end
				end)
				
				return
			end
		end)
		local touchEndedConnection = userInputService.TouchEnded:Connect(function(p3)
			-- upvalues: var1 (copy), var2 (copy), p1 (copy), didDownSwipeCrossGuiObject (copy), var4 (copy), var5 (copy)
			if var1.current == p3 then
				local var6
				local current = var2.current
				
				if var1.current == p3 and current ~= nil then
					local current_1 = p1.current
					
					if current_1 == nil or not didDownSwipeCrossGuiObject(current, Vector2.new(p3.Position.X, p3.Position.Y), current_1) then
						var6 = false
					else
						var4()
						var5()
						var6 = true
					end
				else
					var6 = false
				end
				if not var6 then
					var4()
				end
			end
		end)
		
		return function()
			-- upvalues: touchStartedConnection (ref), touchEndedConnection (ref), var4 (copy)
			touchStartedConnection:Disconnect()
			touchEndedConnection:Disconnect()
			var4()
		end
	end, { p1, p2, var4, var5 })
end