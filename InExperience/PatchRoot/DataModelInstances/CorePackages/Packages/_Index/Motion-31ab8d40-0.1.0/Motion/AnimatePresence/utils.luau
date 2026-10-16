local ReactModule = require(script.Parent.Parent.Parent.React)

return {
	getChildKey = function(p1) --[[ Line: 28 ]]
		return if p1 == nil then nil elseif type(p1) == "table" then if p1.key == nil then if p1.props and p1.props.key ~= nil then p1.props.key else nil else p1.key else nil
	end,
	onlyElements = function(p1) --[[ Line: 65 ]]
		-- upvalues: ReactModule (copy)
		local List = {}
		ReactModule.Children.forEach(p1, function(p2) --[[ Line: 68 ]]
			-- upvalues: ReactModule (upval), List (copy)
			if ReactModule.isValidElement(p2) then
				table.insert(List, p2)
			end
		end)
		
		return List
	end,
	useIdFallback = function(): string --[[ Line: 53 ]]
		local Text = tostring(math.random(1000000))
		
		return if Text == nil then "id-" .. Text else Text
	end
}