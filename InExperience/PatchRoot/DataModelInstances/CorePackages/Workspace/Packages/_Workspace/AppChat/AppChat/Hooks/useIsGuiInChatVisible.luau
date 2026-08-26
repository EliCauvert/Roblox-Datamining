local coreGuiService = game:GetService("CoreGui")
local parent = script:FindFirstAncestor("AppChat").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local useChatIsVisibleModule = require(script.Parent.useChatIsVisible)
local setTimeout = require(parent.LuauPolyfill).setTimeout
local var1 = game:DefineFastInt("AppChat.GuiVisibleBatchUpdateIntervalMs", 1000)

local function getGuiObjectIsObscuredAtPosition(p1, p2, p3)
	-- upvalues: coreGuiService (ref)
	for i, v in coreGuiService:GetGuiObjectsAtPosition(p2, p3) do
		if v:IsA("GuiObject") then
			if v ~= p1 then
				if v.Visible ~= false and v.BackgroundTransparency <= 0.95 and not v:IsDescendantOf(p1) then
					return true
				end
			end
			return false
		end
	end
	return false
end

local function getGuiObjectIsObscured(p4)
	-- upvalues: getGuiObjectIsObscuredAtPosition (ref)
	local absolutePosition = p4.AbsolutePosition
	local absoluteSize = p4.AbsoluteSize
	local var2 = absolutePosition + absoluteSize * 0.5
	local var3 = absolutePosition + absoluteSize
	local var4 = absolutePosition + Vector2.new(absoluteSize.X, 0)
	local var5 = absolutePosition + Vector2.new(0, absoluteSize.Y)
	local var6 = 1
	local UICorner = p4:FindFirstChildOfClass("UICorner")
	
	if UICorner and UICorner:IsA("UICorner") then
		local offset = UICorner.CornerRadius.Offset
		
		if offset > 0 then
			var6 = math.ceil(offset * 0.3) + 1
		end
	end
	return getGuiObjectIsObscuredAtPosition(p4, var2.X, var2.Y) or (getGuiObjectIsObscuredAtPosition(p4, absolutePosition.X + var6, absolutePosition.Y + var6) or (getGuiObjectIsObscuredAtPosition(p4, var5.X + var6, var5.Y - var6) or (getGuiObjectIsObscuredAtPosition(p4, var4.X - var6, var4.Y + var6) or getGuiObjectIsObscuredAtPosition(p4, var3.X - var6, var3.Y - var6))))
end

return function(p4, p5)
	-- upvalues: useChatIsVisibleModule (ref), reactModule (ref), getGuiObjectIsObscured (ref), setTimeout (ref), var1 (ref), cryoModule (ref)
	local var2 = useChatIsVisibleModule()
	local var3, var4 = reactModule.useState(false)
	local var5 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: p4 (ref), getGuiObjectIsObscured (copy), var4 (ref), var5 (ref), setTimeout (copy), var1 (copy), var2 (ref)
		local function _()
			-- upvalues: p4 (copy), getGuiObjectIsObscured (copy), var4 (copy)
			if p4.current and p4.current:IsA("GuiObject") then
				var4(p4.current.IsNotOccluded and not getGuiObjectIsObscured(p4.current))
				
				return
			end
			var4(false)
		end
		
		local function queueUpdateIsGuiVisible()
			-- upvalues: var5 (copy), setTimeout (copy), p4 (copy), getGuiObjectIsObscured (copy), var4 (copy), var1 (copy)
			if var5.current then
				return
			end
			var5.current = setTimeout(function()
				-- upvalues: var5 (copy), p4 (copy), getGuiObjectIsObscured (copy), var4 (copy)
				var5.current = nil
				
				if p4.current and p4.current:IsA("GuiObject") then
					var4(p4.current.IsNotOccluded and not getGuiObjectIsObscured(p4.current))
					
					return
				end
				var4(false)
			end, var1)
		end
		
		local function onDescendantEvent(p6)
			-- upvalues: var5 (copy), setTimeout (copy), p4 (copy), getGuiObjectIsObscured (copy), var4 (copy), var1 (copy)
			if not p6:IsA("GuiObject") then return end
			if var5.current then
				return
			end
			var5.current = setTimeout(function()
				-- upvalues: var5 (copy), p4 (copy), getGuiObjectIsObscured (copy), var4 (copy)
				var5.current = nil
				
				if p4.current and p4.current:IsA("GuiObject") then
					var4(p4.current.IsNotOccluded and not getGuiObjectIsObscured(p4.current))
					
					return
				end
				var4(false)
			end, var1)
		end
		
		if not var5.current then
			var5.current = setTimeout(function()
				-- upvalues: var5 (copy), p4 (copy), getGuiObjectIsObscured (copy), var4 (copy)
				var5.current = nil
				
				if p4.current and p4.current:IsA("GuiObject") then
					var4(p4.current.IsNotOccluded and not getGuiObjectIsObscured(p4.current))
					
					return
				end
				var4(false)
			end, var1)
		end
		local t = {}
		
		if p4.current and p4.current:IsA("GuiObject") and var2 then
			table.insert(t, p4.current:GetPropertyChangedSignal("IsNotOccluded"):Connect(queueUpdateIsGuiVisible))
			local layerCollector = p4.current:FindFirstAncestorWhichIsA("LayerCollector")
			
			if layerCollector then
				table.insert(t, layerCollector.DescendantAdded:Connect(onDescendantEvent))
				table.insert(t, layerCollector.DescendantRemoving:Connect(onDescendantEvent))
			end
		end
		return function()
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, cryoModule.List.join(p5, { var2 }))
	
	return var2 and var3
end