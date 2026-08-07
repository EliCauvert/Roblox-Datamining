local roactModule = require(script.Parent.Parent.Roact)

return function() --[[ line: 10 | named "createRefCache" ]]
	-- upvalues: roactModule (ref)
	local t = {}
	setmetatable(t, {
		__index = function(_, p0) --[[ line: 14 ]]
			-- upvalues: roactModule (copy), t (ref)
			local var2 = roactModule.createRef()
			t[p0] = var2
			
			return var2
		end,
		__tostring = function(p1) --[[ line: 20 ]]
			local var3 = "{"
			
			for i, v in pairs(p1) do
				var3 = ("%s\n\t%s -> %s"):format(var3, tostring(i), tostring(v))
			end
			return var3 .. "\n}"
		end
	})
	
	return t
end