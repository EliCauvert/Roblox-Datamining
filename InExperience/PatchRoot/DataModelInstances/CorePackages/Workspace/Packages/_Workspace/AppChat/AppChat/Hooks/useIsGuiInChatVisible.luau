local coreGuiService = game:GetService("CoreGui")
local parent = script:FindFirstAncestor("AppChat").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local useChatIsVisibleModule = require(script.Parent.useChatIsVisible)
local setTimeout = require(parent.LuauPolyfill).setTimeout
local var4 = game:DefineFastInt("AppChat.GuiVisibleBatchUpdateIntervalMs", 1000)

local function getGuiObjectIsObscuredAtPosition(p0, p1, p2) --[[ line: 24 ]]
	-- upvalues: coreGuiService (ref)
	for i, v in coreGuiService:GetGuiObjectsAtPosition(p1, p2) do
		if v:IsA("GuiObject") then
			if v ~= p0 then
				if v.Visible ~= false and v.BackgroundTransparency <= 0.95 and not v:IsDescendantOf(p0) then
					return true
				end
			end
			return false
		end
	end
	return false
end

local function getGuiObjectIsObscured(p3) --[[ line: 42 ]]
	-- upvalues: getGuiObjectIsObscuredAtPosition (ref)
	local absolutePosition = p3.AbsolutePosition
	local absoluteSize = p3.AbsoluteSize
	local var7 = absolutePosition + absoluteSize * 0.5
	local var8 = absolutePosition + absoluteSize
	local var9 = absolutePosition + Vector2.new(absoluteSize.X, 0)
	local var10 = absolutePosition + Vector2.new(0, absoluteSize.Y)
	local var11 = 1
	local UICorner = p3:FindFirstChildOfClass("UICorner")
	
	if UICorner and UICorner:IsA("UICorner") then
		local offset = UICorner.CornerRadius.Offset
		
		if offset > 0 then
			var11 = math.ceil(offset * 0.3) + 1
		end
	end
	return getGuiObjectIsObscuredAtPosition(p3, var7.X, var7.Y) or (getGuiObjectIsObscuredAtPosition(p3, absolutePosition.X + var11, absolutePosition.Y + var11) or (getGuiObjectIsObscuredAtPosition(p3, var10.X + var11, var10.Y - var11) or (getGuiObjectIsObscuredAtPosition(p3, var9.X - var11, var9.Y + var11) or getGuiObjectIsObscuredAtPosition(p3, var8.X - var11, var8.Y - var11))))
end

return function(p4, p5) --[[ line: 82 | named "useIsGuiInChatVisible" ]]
	-- upvalues: useChatIsVisibleModule (ref), reactModule (ref), getGuiObjectIsObscured (ref), setTimeout (ref), var4 (ref), cryoModule (ref)
	local var13 = useChatIsVisibleModule()
	local var14, var15 = reactModule.useState(false)
	local var16 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 92 ]]
		-- upvalues: p4 (ref), getGuiObjectIsObscured (copy), var15 (ref), var16 (ref), setTimeout (copy), var4 (copy), var13 (ref)
		local function _() --[[ line: 93 | named "updateIsGuiVisible" ]]
			-- upvalues: p4 (copy), getGuiObjectIsObscured (copy), var15 (copy)
			if p4.current and p4.current:IsA("GuiObject") then
				var15(p4.current.IsNotOccluded and not getGuiObjectIsObscured(p4.current))
				
				return
			end
			var15(false)
		end
		
		local function queueUpdateIsGuiVisible() --[[ line: 103 ]]
			-- upvalues: var16 (copy), setTimeout (copy), p4 (copy), getGuiObjectIsObscured (copy), var15 (copy), var4 (copy)
			if var16.current then
				return
			end
			var16.current = setTimeout(function() --[[ line: 107 ]]
				-- upvalues: var16 (copy), p4 (copy), getGuiObjectIsObscured (copy), var15 (copy)
				var16.current = nil
				
				if p4.current and p4.current:IsA("GuiObject") then
					var15(p4.current.IsNotOccluded and not getGuiObjectIsObscured(p4.current))
					
					return
				end
				var15(false)
			end, var4)
		end
		
		local function onDescendantEvent(p6) --[[ line: 112 ]]
			-- upvalues: var16 (copy), setTimeout (copy), p4 (copy), getGuiObjectIsObscured (copy), var15 (copy), var4 (copy)
			if not p6:IsA("GuiObject") then return end
			if var16.current then
				return
			end
			var16.current = setTimeout(function() --[[ line: 107 ]]
				-- upvalues: var16 (copy), p4 (copy), getGuiObjectIsObscured (copy), var15 (copy)
				var16.current = nil
				
				if p4.current and p4.current:IsA("GuiObject") then
					var15(p4.current.IsNotOccluded and not getGuiObjectIsObscured(p4.current))
					
					return
				end
				var15(false)
			end, var4)
		end
		
		if not var16.current then
			var16.current = setTimeout(function() --[[ line: 107 ]]
				-- upvalues: var16 (copy), p4 (copy), getGuiObjectIsObscured (copy), var15 (copy)
				var16.current = nil
				
				if p4.current and p4.current:IsA("GuiObject") then
					var15(p4.current.IsNotOccluded and not getGuiObjectIsObscured(p4.current))
					
					return
				end
				var15(false)
			end, var4)
		end
		local t = {}
		
		if p4.current and p4.current:IsA("GuiObject") and var13 then
			table.insert(t, p4.current:GetPropertyChangedSignal("IsNotOccluded"):Connect(queueUpdateIsGuiVisible))
			local layerCollector = p4.current:FindFirstAncestorWhichIsA("LayerCollector")
			
			if layerCollector then
				table.insert(t, layerCollector.DescendantAdded:Connect(onDescendantEvent))
				table.insert(t, layerCollector.DescendantRemoving:Connect(onDescendantEvent))
			end
		end
		return function() --[[ line: 133 ]]
			-- upvalues: t (ref)
			for i, v in t do
				v:Disconnect()
			end
		end
	end, cryoModule.List.join(p5, { var13 }))
	
	return var13 and var14
end