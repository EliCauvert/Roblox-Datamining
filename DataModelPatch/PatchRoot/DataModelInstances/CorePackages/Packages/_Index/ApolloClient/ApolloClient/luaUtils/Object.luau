local LuauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)

return (LuauPolyfillModule.Object.assign({}, LuauPolyfillModule.Object, {
	getPrototypeOf = function(p1)
		local Meta = getmetatable(p1)
		
		return if Meta == false then nil else Meta or nil
	end,
	create = function(p1, p2)
		if p2 == nil then
			p2 = {}
		end
		return (setmetatable(p2, p1))
	end
}))