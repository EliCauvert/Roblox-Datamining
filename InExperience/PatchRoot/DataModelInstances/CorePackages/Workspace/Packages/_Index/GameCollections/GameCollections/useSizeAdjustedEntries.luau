local Parent = script:FindFirstAncestor("GameCollections").Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)

return function(p1, p2, p3) --[[ Line: 7 ]]
	-- upvalues: ReactModule (copy), CryoModule (copy)
	return ReactModule.useMemo(function() --[[ Line: 8 ]]
		-- upvalues: p1 (copy), CryoModule (upval), p2 (copy), p3 (copy)
		local List = {}
		local Flag = false
		
		for _, value in p1 do
			local SpanOverride = value.spanOverride
			
			if SpanOverride then
				Flag = true
				local ColSpan = SpanOverride.colSpan or 1
				local RowSpan = SpanOverride.rowSpan or 1
				table.insert(List, CryoModule.Dictionary.join(value, {
					sizeOverride = UDim2.new(ColSpan, (p2 or 0) * (ColSpan - 1), RowSpan, (p3 or 0) * (RowSpan - 1))
				}))
			else
				table.insert(List, value)
			end
		end
		return if Flag then List else p1
	end, { p1, p2, p3 })
end