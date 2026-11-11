local ReactModule = require(script:FindFirstAncestor("BulkPurchaseApp").Parent.React)

return function(Tbl)
	-- upvalues: ReactModule (copy)
	local Copy = if Tbl.children then table.clone(Tbl.children) else {}
	local Copy1 = table.clone(Tbl)
	Copy1.cornerRadius = nil
	Copy1.padding = nil
	Copy1.children = nil
	local Config = if typeof(Tbl.padding) == "number" then {
		PaddingBottom = UDim.new(0, Tbl.padding),
		PaddingLeft = UDim.new(0, Tbl.padding),
		PaddingRight = UDim.new(0, Tbl.padding),
		PaddingTop = UDim.new(0, Tbl.padding)
	} elseif typeof(Tbl.padding) == "table" then {
		PaddingTop = UDim.new(0, if Tbl.padding and Tbl.padding[1] then Tbl.padding[1] else 0),
		PaddingRight = UDim.new(0, if Tbl.padding and Tbl.padding[2] then Tbl.padding[2] else 0),
		PaddingBottom = UDim.new(0, if Tbl.padding and Tbl.padding[3] then Tbl.padding[3] else 0),
		PaddingLeft = UDim.new(0, if Tbl.padding and Tbl.padding[4] then Tbl.padding[4] else 0)
	} else nil
	
	if Config then
		Copy.Padding = ReactModule.createElement("UIPadding", Config)
	end
	if Tbl.cornerRadius then
		Copy.Radius = ReactModule.createElement("UICorner", { CornerRadius = Tbl.cornerRadius })
	end
	return ReactModule.createElement("Frame", Copy1, Copy)
end