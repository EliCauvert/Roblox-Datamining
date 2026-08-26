local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local console = require(parent.Shared).console
local inspect = require(parent.LuauPolyfill).util.inspect
local _ = require(parent.Shared)
local REACT_LAZY_TYPE = require(parent.Shared).ReactSymbols.REACT_LAZY_TYPE

function lazyInitializer(p1)
	-- upvalues: reactGlobalsModule (ref), console (ref), inspect (ref)
	if p1._status == -1 then
		local var1 = p1._result()
		p1._status = 0
		p1._result = var1
		var1:andThen(function(p2)
			-- upvalues: p1 (ref), reactGlobalsModule (copy), console (copy), inspect (copy)
			if p1._status == 0 then
				local default = p2.default
				
				if reactGlobalsModule.__DEV__ and default == nil then
					console.error("lazy: Expected the result of a dynamic import() call. Instead received: `%s`\n\nYour code should look like: \n  local MyComponent = lazy(function() return reqquire(script.Parent.MyComponent) end)", inspect(p2))
				end
				local var2 = p1
				var2._status = 1
				var2._result = default
			end
		end, function(p2)
			-- upvalues: p1 (ref)
			if p1._status == 0 then
				local var2 = p1
				var2._status = 2
				var2._result = p2
			end
		end)
	end
	if p1._status == 1 then
		return p1._result
	end
	error(p1._result)
end

return {
	lazy = function(p1)
		-- upvalues: REACT_LAZY_TYPE (ref), reactGlobalsModule (ref), console (ref)
		local t = {
			["$$typeof"] = REACT_LAZY_TYPE,
			_payload = { _status = -1, _result = p1 },
			_init = lazyInitializer
		}
		
		if reactGlobalsModule.__DEV__ then
			local var1 = nil
			local var2 = nil
			setmetatable(t, {
				__index = function(_, p2)
					-- upvalues: var1 (write), var2 (write)
					if p2 == "defaultProps" then
						return var1
					elseif p2 == "propTypes" then
						return var2
					end
				end,
				__newindex = function(p2, p3, p4)
					-- upvalues: console (copy), var1 (write), var2 (write)
					if p3 == "defaultProps" then
						console.error("React.lazy(...): It is not supported to assign `defaultProps` to a lazy component import. Either specify them where the component is defined, or create a wrapping component around it.")
						var1 = p4
						setmetatable(p2, {
							__index = function() end,
							__newindex = function() end
						})
					end
					if p3 == "propTypes" then
						console.error("React.lazy(...): It is not supported to assign `propTypes` to a lazy component import. Either specify them where the component is defined, or create a wrapping component around it.")
						var2 = p4
						setmetatable(p2, {
							__index = function() end,
							__newindex = function() end
						})
					end
				end
			})
		end
		return t
	end
}