local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local console = require(parent.Shared).console
local inspect = require(parent.LuauPolyfill).util.inspect
local _ = require(parent.Shared)
local REACT_LAZY_TYPE = require(parent.Shared).ReactSymbols.REACT_LAZY_TYPE

function lazyInitializer(p0)
	-- upvalues: reactGlobalsModule (ref), console (ref), inspect (ref)
	if p0._status == -1 then
		local var1 = p0._result()
		p0._status = 0
		p0._result = var1
		var1:andThen(function(p1)
			-- upvalues: p0 (ref), reactGlobalsModule (copy), console (copy), inspect (copy)
			if p0._status == 0 then
				local default = p1.default
				
				if reactGlobalsModule.__DEV__ and default == nil then
					console.error("lazy: Expected the result of a dynamic import() call. Instead received: `%s`\n\nYour code should look like: \n  local MyComponent = lazy(function() return reqquire(script.Parent.MyComponent) end)", inspect(p1))
				end
				local var2 = p0
				var2._status = 1
				var2._result = default
			end
		end, function(p2)
			-- upvalues: p0 (ref)
			if p0._status == 0 then
				local var3 = p0
				var3._status = 2
				var3._result = p2
			end
		end)
	end
	if p0._status == 1 then
		return p0._result
	end
	error(p0._result)
end

return {
	lazy = function(p3)
		-- upvalues: REACT_LAZY_TYPE (ref), reactGlobalsModule (ref), console (ref)
		local t = {
			["$$typeof"] = REACT_LAZY_TYPE,
			_payload = { _status = -1, _result = p3 },
			_init = lazyInitializer
		}
		
		if reactGlobalsModule.__DEV__ then
			local var5 = nil
			local var6 = nil
			setmetatable(t, {
				__index = function(_, p4)
					-- upvalues: var5 (write), var6 (write)
					if p4 == "defaultProps" then
						return var5
					elseif p4 == "propTypes" then
						return var6
					end
				end,
				__newindex = function(p5, p6, p7)
					-- upvalues: console (copy), var5 (write), var6 (write)
					if p6 == "defaultProps" then
						console.error("React.lazy(...): It is not supported to assign `defaultProps` to a lazy component import. Either specify them where the component is defined, or create a wrapping component around it.")
						var5 = p7
						setmetatable(p5, {
							__index = function() end,
							__newindex = function() end
						})
					end
					if p6 == "propTypes" then
						console.error("React.lazy(...): It is not supported to assign `propTypes` to a lazy component import. Either specify them where the component is defined, or create a wrapping component around it.")
						var6 = p7
						setmetatable(p5, {
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