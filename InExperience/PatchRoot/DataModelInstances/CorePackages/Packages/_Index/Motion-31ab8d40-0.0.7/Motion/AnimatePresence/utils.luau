local reactModule = require(script.Parent.Parent.Parent.React)

return {
	getChildKey = function(p1)
		return if p1 == nil then nil elseif type(p1) == "table" then if p1.key == nil then if p1.props and p1.props.key ~= nil then p1.props.key else nil else p1.key else nil
	end,
	onlyElements = function(p1)
		-- upvalues: reactModule (ref)
		local t = {}
		reactModule.Children.forEach(p1, function(p2)
			-- upvalues: reactModule (copy), t (ref)
			if reactModule.isValidElement(p2) then
				table.insert(t, p2)
			end
		end)
		
		return t
	end,
	useIdFallback = function()
		local var1 = tostring(math.random(1000000))
		
		return if var1 == nil then "id-" .. var2 else var1
	end
}