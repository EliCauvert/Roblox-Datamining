local roactModule = require(script.Parent.Parent.Roact)

return function()
	-- upvalues: roactModule (ref)
	local t = {}
	setmetatable(t, {
		__index = function(_, p1)
			-- upvalues: roactModule (copy), t (ref)
			local var1 = roactModule.createRef()
			t[p1] = var1
			
			return var1
		end,
		__tostring = function(p1)
			local var1 = "{"
			
			for i, v in pairs(p1) do
				var1 = ("%s\n\t%s -> %s"):format(var1, tostring(i), tostring(v))
			end
			return var1 .. "\n}"
		end
	})
	
	return t
end