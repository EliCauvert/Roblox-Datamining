local _ = require(script:FindFirstAncestor("Foundation").Providers.Style.Tokens)
local _UDim = UDim.new(0, 0)

return function(p1, p2)
	-- upvalues: _UDim (copy)
	local _UDim1 = UDim.new(0, p1.Radius.Medium)
	local _UDim2 = if p2 then _UDim else _UDim1
	
	return {
		TopLeftRadius = _UDim1,
		TopRightRadius = _UDim1,
		BottomLeftRadius = _UDim2,
		BottomRightRadius = _UDim2
	}
end