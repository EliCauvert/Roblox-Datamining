local reactModule = require(script:FindFirstAncestor("BulkPurchaseApp").Parent.React)

return function(p1)
	-- upvalues: reactModule (ref)
	local var1 = if p1.children then table.clone(p1.children) else {}
	local cloned = table.clone(p1)
	cloned.cornerRadius = nil
	cloned.padding = nil
	cloned.children = nil
	local var2 = if typeof(p1.padding) == "number" then {
		PaddingBottom = UDim.new(0, p1.padding),
		PaddingLeft = UDim.new(0, p1.padding),
		PaddingRight = UDim.new(0, p1.padding),
		PaddingTop = UDim.new(0, p1.padding)
	} elseif typeof(p1.padding) == "table" then {
		PaddingTop = UDim.new(0, if p1.padding and p1.padding[1] then p1.padding[1] else 0),
		PaddingRight = UDim.new(0, if p1.padding and p1.padding[2] then p1.padding[2] else 0),
		PaddingBottom = UDim.new(0, if p1.padding and p1.padding[3] then p1.padding[3] else 0),
		PaddingLeft = UDim.new(0, if p1.padding and p1.padding[4] then p1.padding[4] else 0)
	} else nil
	
	if var2 then
		var1.Padding = reactModule.createElement("UIPadding", var2)
	end
	if p1.cornerRadius then
		var1.Radius = reactModule.createElement("UICorner", { CornerRadius = p1.cornerRadius })
	end
	return reactModule.createElement("Frame", cloned, var1)
end