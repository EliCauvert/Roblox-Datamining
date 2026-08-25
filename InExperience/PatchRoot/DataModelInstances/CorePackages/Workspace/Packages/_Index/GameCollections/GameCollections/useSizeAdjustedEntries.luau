local parent = script:FindFirstAncestor("GameCollections").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)

return function(p0, p1, p2)
	-- upvalues: reactModule (ref), cryoModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: p0 (ref), cryoModule (copy), p1 (ref), p2 (ref)
		local t = {}
		local var3 = false
		
		for i, v in p0 do
			local spanOverride = v.spanOverride
			
			if spanOverride then
				var3 = true
				local colSpan = spanOverride.colSpan or 1
				local rowSpan = spanOverride.rowSpan or 1
				table.insert(t, cryoModule.Dictionary.join(v, {
					sizeOverride = UDim2.new(colSpan, (p1 or 0) * (colSpan - 1), rowSpan, (p2 or 0) * (rowSpan - 1))
				}))
			else
				table.insert(t, v)
			end
		end
		return if var3 then t else p0
	end, { p0, p1, p2 })
end