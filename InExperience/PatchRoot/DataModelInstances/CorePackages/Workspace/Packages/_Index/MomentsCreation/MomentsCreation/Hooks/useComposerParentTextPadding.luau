local ReactModule = require(script:FindFirstAncestor("MomentsCreation").Parent.React)
local _UDim = UDim.new(0, 0)

local function _(Parent) --[[ Line: 37 | Named "ensureUIPadding" ]]
	local UIPadding = Parent:FindFirstChildOfClass("UIPadding")
	
	if UIPadding then
		return UIPadding
	else
		local Padding = Instance.new("UIPadding")
		Padding.Parent = Parent
		
		return Padding
	end
end

local _ = function(UIPadding): boolean --[[ Line: 47 | Named "isZeroed" ]]
	-- upvalues: _UDim (copy)
	return UIPadding.PaddingTop == _UDim and (UIPadding.PaddingBottom == _UDim and UIPadding.PaddingLeft == _UDim) and UIPadding.PaddingRight == _UDim
end

local function relocateBoxPadding(Object) --[[ Line: 54 ]]
	-- upvalues: _UDim (copy)
	local UIPadding = Object:FindFirstChildOfClass("UIPadding")
	
	if UIPadding == nil then return end
	if UIPadding.PaddingTop == _UDim and (UIPadding.PaddingBottom == _UDim and (UIPadding.PaddingLeft == _UDim and UIPadding.PaddingRight == _UDim)) then return end
	local Parent = Object.Parent
	
	if Parent == nil or not Parent:IsA("GuiObject") then return end
	local UIPadding1 = Parent:FindFirstChildOfClass("UIPadding")
	local UIPadding2 = nil
	
	if UIPadding1 then
		UIPadding2 = UIPadding1
	else
		local Padding = Instance.new("UIPadding")
		Padding.Parent = Parent
		UIPadding2 = Padding
	end
	UIPadding2.PaddingTop = UIPadding.PaddingTop
	UIPadding2.PaddingBottom = UIPadding.PaddingBottom
	UIPadding2.PaddingLeft = UIPadding.PaddingLeft
	UIPadding2.PaddingRight = UIPadding.PaddingRight
	UIPadding.PaddingTop = _UDim
	UIPadding.PaddingBottom = _UDim
	UIPadding.PaddingLeft = _UDim
	UIPadding.PaddingRight = _UDim
end

local function tryRelocate(Descendant) --[[ Line: 86 ]]
	-- upvalues: relocateBoxPadding (copy)
	local v1 = nil
	
	if Descendant:IsA("TextBox") then
		v1 = Descendant
	elseif Descendant:IsA("UIPadding") then
		local Parent = Descendant.Parent
		
		if Parent and Parent:IsA("TextBox") then
			v1 = Parent
		end
	end
	if v1 ~= nil and (v1.Name == "TextBox" or v1.Name == "MobileTextBox") then
		relocateBoxPadding(v1)
	end
end

return function(p1) --[[ Line: 101 | Named "useComposerParentTextPadding" ]]
	-- upvalues: ReactModule (copy), tryRelocate (copy)
	local UseRefResult = ReactModule.useRef(nil)
	
	return ReactModule.useCallback(function(Object) --[[ Line: 104 ]]
		-- upvalues: UseRefResult (copy), p1 (copy), tryRelocate (upval)
		if UseRefResult.current ~= nil then
			UseRefResult.current:Disconnect()
			UseRefResult.current = nil
		end
		if Object == nil or not p1 then return end
		for _, descendant in Object:GetDescendants() do
			tryRelocate(descendant)
		end
		UseRefResult.current = Object.DescendantAdded:Connect(tryRelocate)
	end, { p1 })
end