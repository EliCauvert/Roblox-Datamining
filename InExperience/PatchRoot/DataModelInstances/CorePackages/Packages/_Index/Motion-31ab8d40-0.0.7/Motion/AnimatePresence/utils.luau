local reactModule = require(script.Parent.Parent.Parent.React)

return {
	getChildKey = function(p0) --[[ line: 28 ]]
		return if p0 == nil then nil elseif type(p0) == "table" then if p0.key == nil then if p0.props and p0.props.key ~= nil then p0.props.key else nil else p0.key else nil
	end,
	onlyElements = function(p1) --[[ line: 65 ]]
		-- upvalues: reactModule (ref)
		local t = {}
		reactModule.Children.forEach(p1, function(p2) --[[ line: 68 ]]
			-- upvalues: reactModule (copy), t (ref)
			if reactModule.isValidElement(p2) then
				table.insert(t, p2)
			end
		end)
		
		return t
	end,
	useIdFallback = function() --[[ line: 53 ]]
		local var2 = tostring(math.random(1000000))
		
		return if var2 == nil then "id-" .. var2 else var2
	end
}