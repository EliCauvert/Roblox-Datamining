local reactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function()
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(nil)
	
	if var1.current == nil then
		local t = {}
		setmetatable(t, {
			__index = function(_, p0)
				-- upvalues: reactModule (copy), t (ref)
				local var3 = reactModule.createRef()
				t[p0] = var3
				
				return var3
			end,
			__tostring = function(p1)
				local var4 = "{"
				
				for i, v in pairs(p1) do
					var4 = ("%s\n\t%s -> %s"):format(var4, tostring(i), tostring(v))
				end
				return var4 .. "\n}"
			end
		})
		var1.current = t
	end
	return var1.current
end