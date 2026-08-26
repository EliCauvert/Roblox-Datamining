local parent = script:FindFirstAncestor("GameCollections").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), cryoModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: p1 (ref), cryoModule (copy), p2 (ref), p3 (ref)
		local t = {}
		local var1 = false
		
		for i, v in p1 do
			local spanOverride = v.spanOverride
			
			if spanOverride then
				var1 = true
				local colSpan = spanOverride.colSpan or 1
				local rowSpan = spanOverride.rowSpan or 1
				table.insert(t, cryoModule.Dictionary.join(v, {
					sizeOverride = UDim2.new(colSpan, (p2 or 0) * (colSpan - 1), rowSpan, (p3 or 0) * (rowSpan - 1))
				}))
			else
				table.insert(t, v)
			end
		end
		return if var1 then t else p1
	end, { p1, p2, p3 })
end