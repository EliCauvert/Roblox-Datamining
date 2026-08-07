local reactModule = require(script:FindFirstAncestor("BulkPurchaseApp").Parent.React)

return function(p0) --[[ line: 12 | named "Box" ]]
	-- upvalues: reactModule (ref)
	local var1 = if p0.children then table.clone(p0.children) else {}
	local cloned = table.clone(p0)
	cloned.cornerRadius = nil
	cloned.padding = nil
	cloned.children = nil
	local var3 = if typeof(p0.padding) == "number" then {
		PaddingBottom = UDim.new(0, p0.padding),
		PaddingLeft = UDim.new(0, p0.padding),
		PaddingRight = UDim.new(0, p0.padding),
		PaddingTop = UDim.new(0, p0.padding)
	} elseif typeof(p0.padding) == "table" then {
		PaddingTop = UDim.new(0, if p0.padding and p0.padding[1] then p0.padding[1] else 0),
		PaddingRight = UDim.new(0, if p0.padding and p0.padding[2] then p0.padding[2] else 0),
		PaddingBottom = UDim.new(0, if p0.padding and p0.padding[3] then p0.padding[3] else 0),
		PaddingLeft = UDim.new(0, if p0.padding and p0.padding[4] then p0.padding[4] else 0)
	} else nil
	
	if var3 then
		var1.Padding = reactModule.createElement("UIPadding", var3)
	end
	if p0.cornerRadius then
		var1.Radius = reactModule.createElement("UICorner", { CornerRadius = p0.cornerRadius })
	end
	return reactModule.createElement("Frame", cloned, var1)
end