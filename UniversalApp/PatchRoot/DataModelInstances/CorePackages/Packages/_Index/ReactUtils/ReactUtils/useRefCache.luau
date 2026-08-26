local reactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function()
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(nil)
	
	if var1.current == nil then
		local t = {}
		setmetatable(t, {
			__index = function(_, p1)
				-- upvalues: reactModule (copy), t (ref)
				local var2 = reactModule.createRef()
				t[p1] = var2
				
				return var2
			end,
			__tostring = function(p1)
				local var2 = "{"
				
				for i, v in pairs(p1) do
					var2 = ("%s\n\t%s -> %s"):format(var2, tostring(i), tostring(v))
				end
				return var2 .. "\n}"
			end
		})
		var1.current = t
	end
	return var1.current
end