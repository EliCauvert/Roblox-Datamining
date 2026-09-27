local reactModule = require(script:FindFirstAncestor("MomentsCreation").Parent.React)
local uDim = UDim.new(0, 0)

local function _(p1)
	local UIPadding = p1:FindFirstChildOfClass("UIPadding")
	
	if UIPadding then
		return UIPadding
	end
	local UIPadding_1 = Instance.new("UIPadding")
	UIPadding_1.Parent = p1
	
	return UIPadding_1
end

local _ = function(p1)
	-- upvalues: uDim (ref)
	return p1.PaddingTop == uDim and (p1.PaddingBottom == uDim and (p1.PaddingLeft == uDim and p1.PaddingRight == uDim))
end

local function relocateBoxPadding(p1)
	-- upvalues: uDim (ref)
	local UIPadding = p1:FindFirstChildOfClass("UIPadding")
	
	if UIPadding == nil then return end
	if UIPadding.PaddingTop == uDim and (UIPadding.PaddingBottom == uDim and (UIPadding.PaddingLeft == uDim and UIPadding.PaddingRight == uDim)) then return end
	local parent = p1.Parent
	
	if parent == nil or not parent:IsA("GuiObject") then return end
	local var1
	local UIPadding_1 = parent:FindFirstChildOfClass("UIPadding")
	
	if UIPadding_1 then
		var1 = UIPadding_1
	else
		local UIPadding_2 = Instance.new("UIPadding")
		UIPadding_2.Parent = parent
		var1 = UIPadding_2
	end
	var1.PaddingTop = UIPadding.PaddingTop
	var1.PaddingBottom = UIPadding.PaddingBottom
	var1.PaddingLeft = UIPadding.PaddingLeft
	var1.PaddingRight = UIPadding.PaddingRight
	UIPadding.PaddingTop = uDim
	UIPadding.PaddingBottom = uDim
	UIPadding.PaddingLeft = uDim
	UIPadding.PaddingRight = uDim
end

local function tryRelocate(p1)
	-- upvalues: relocateBoxPadding (ref)
	local var1 = nil
	
	if p1:IsA("TextBox") then
		var1 = p1
	elseif p1:IsA("UIPadding") then
		local parent = p1.Parent
		
		if parent and parent:IsA("TextBox") then
			var1 = parent
		end
	end
	if var1 ~= nil and (var1.Name == "TextBox" or var1.Name == "MobileTextBox") then
		relocateBoxPadding(var1)
	end
end

return function(p1)
	-- upvalues: reactModule (ref), tryRelocate (ref)
	local var1 = reactModule.useRef(nil)
	
	return reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), p1 (ref), tryRelocate (copy)
		if var1.current ~= nil then
			var1.current:Disconnect()
			var1.current = nil
		end
		if p2 == nil or not p1 then return end
		for i, v in p2:GetDescendants() do
			tryRelocate(v)
		end
		var1.current = p2.DescendantAdded:Connect(tryRelocate)
	end, { p1 })
end