local ReactModule = require(script:FindFirstAncestor("AppDebug").Parent.React)

local function isAncestorVisible(Frame): boolean
	local Gui = Frame
	while Gui do
		if Gui:IsA("GuiObject") and not Gui.Visible then
			return false
		end
		Gui = Gui.Parent
	end
	return true
end

return function(Frame: Frame)
	-- upvalues: ReactModule (copy), isAncestorVisible (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(if Frame and Frame:IsA("GuiObject") then Frame.AbsolutePosition else Vector2.zero)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(if Frame and Frame:IsA("GuiObject") then Frame.AbsoluteSize else Vector2.zero)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(function()
		-- upvalues: Frame (copy), isAncestorVisible (upval)
		return if Frame and Frame.Parent then isAncestorVisible(Frame) else false
	end)
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), UseStateResult2_2 (copy), isAncestorVisible (upval), UseStateResult2 (copy), UseStateResult2_1 (copy)
		if not Frame then
			UseStateResult2_2(false)
			
			return
		end
		if Frame.Parent == nil then
			UseStateResult2_2(false)
			
			return
		end
		if not Frame:IsA("GuiObject") then
			UseStateResult2_2(false)
			
			return
		end
		local List = {}
		
		local function updateVisibility()
			-- upvalues: Frame (copy), UseStateResult2_2 (upval), isAncestorVisible (upval)
			if Frame.Parent then
				UseStateResult2_2((isAncestorVisible(Frame)))
				
				return
			else
				UseStateResult2_2(false)
			end
		end
		
		UseStateResult2(Frame.AbsolutePosition)
		UseStateResult2_1(Frame.AbsoluteSize)
		
		if Frame.Parent then
			UseStateResult2_2((isAncestorVisible(Frame)))
		else
			UseStateResult2_2(false)
		end
		table.insert(List, Frame:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
			-- upvalues: Frame (copy), UseStateResult2 (upval)
			if Frame.Parent then
				UseStateResult2(Frame.AbsolutePosition)
			end
		end))
		table.insert(List, Frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			-- upvalues: Frame (copy), UseStateResult2_1 (upval)
			if Frame.Parent then
				UseStateResult2_1(Frame.AbsoluteSize)
			end
		end))
		table.insert(List, Frame:GetPropertyChangedSignal("Visible"):Connect(function()
			-- upvalues: Frame (copy), UseStateResult2_2 (upval), isAncestorVisible (upval)
			if Frame.Parent then
				UseStateResult2_2((isAncestorVisible(Frame)))
				
				return
			else
				UseStateResult2_2(false)
			end
		end))
		table.insert(List, Frame.AncestryChanged:Connect(function(_, NewParent)
			-- upvalues: UseStateResult2_2 (upval), updateVisibility (copy)
			if NewParent == nil then
				UseStateResult2_2(false)
				
				return
			else
				task.defer(updateVisibility)
			end
		end))
		local Parent = Frame.Parent
		while Parent do
			if Parent:IsA("GuiObject") then
				table.insert(List, Parent:GetPropertyChangedSignal("Visible"):Connect(function()
					-- upvalues: Frame (copy), UseStateResult2_2 (upval), isAncestorVisible (upval)
					if Frame.Parent then
						UseStateResult2_2((isAncestorVisible(Frame)))
						
						return
					else
						UseStateResult2_2(false)
					end
				end))
			end
			Parent = Parent.Parent
		end
		return function()
			-- upvalues: List (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, { Frame })
	
	return {
		position = UseStateResult,
		size = UseStateResult1,
		isVisible = UseStateResult3
	}
end