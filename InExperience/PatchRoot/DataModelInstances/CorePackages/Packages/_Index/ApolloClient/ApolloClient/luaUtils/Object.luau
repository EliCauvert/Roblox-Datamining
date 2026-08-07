local luauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)

return luauPolyfillModule.Object.assign({}, luauPolyfillModule.Object, {
	getPrototypeOf = function(p0) --[[ line: 12 ]]
		local var1 = getmetatable(p0)
		
		return if var1 ~= false then var1 else nil
	end,
	create = function(p1, p2) --[[ line: 16 ]]
		if p2 == nil then
			p2 = {}
		end
		return setmetatable(p2, p1)
	end
})