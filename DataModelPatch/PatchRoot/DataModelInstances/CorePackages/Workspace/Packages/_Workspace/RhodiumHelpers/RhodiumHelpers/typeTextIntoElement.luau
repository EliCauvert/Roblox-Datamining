local VirtualInputManager = game:GetService("VirtualInputManager")

local function isAncestorInteractable(RbxInstance): boolean
	local Parent = RbxInstance.Parent
	while Parent do
		if Parent:IsA("GuiObject") and Parent.Interactable == false then
			return false
		end
		Parent = Parent.Parent
	end
	return true
end

return function(p1, Text: string)
	-- upvalues: isAncestorInteractable (copy), VirtualInputManager (copy)
	local RbxInstance = p1:getRbxInstance()
	
	if not RbxInstance or not RbxInstance:IsA("TextBox") then return end
	if not RbxInstance:IsFocused() then
		if not isAncestorInteractable(RbxInstance) then return end
		RbxInstance:CaptureFocus()
		task.wait()
	end
	for i = 1, #Text do
		VirtualInputManager:SendTextInputCharacterEvent(Text:sub(i, i), nil)
		task.wait()
	end
end