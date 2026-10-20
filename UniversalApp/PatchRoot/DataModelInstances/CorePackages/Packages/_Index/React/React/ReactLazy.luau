local Parent = script.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local Console = require(Parent.Shared).console
local InspectFunction = require(Parent.LuauPolyfill).util.inspect
local _ = require(Parent.Shared)
local REACTLAZYTYPE = require(Parent.Shared).ReactSymbols.REACT_LAZY_TYPE

function lazyInitializer(p1)
	-- upvalues: ReactGlobalsModule (copy), Console (copy), InspectFunction (copy)
	if p1._status == -1 then
		local ResultResult = p1._result()
		p1._status = 0
		p1._result = ResultResult
		ResultResult:andThen(function(Result)
			-- upvalues: p1 (copy), ReactGlobalsModule (upval), Console (upval), InspectFunction (upval)
			if p1._status == 0 then
				local Default = Result.default
				
				if ReactGlobalsModule.__DEV__ and Default == nil then
					Console.error("lazy: Expected the result of a dynamic import() call. Instead received: `%s`\n\nYour code should look like: \n  local MyComponent = lazy(function() return reqquire(script.Parent.MyComponent) end)", InspectFunction(Result))
				end
				p1._status = 1
				p1._result = Default
			end
		end, function(_result)
			-- upvalues: p1 (copy)
			if p1._status == 0 then
				p1._status = 2
				p1._result = _result
			end
		end)
	end
	if p1._status == 1 then
		return p1._result
	else
		error(p1._result)
	end
end

return {
	lazy = function(_result)
		-- upvalues: REACTLAZYTYPE (copy), ReactGlobalsModule (copy), Console (copy)
		local config = {
			["$$typeof"] = REACTLAZYTYPE,
			_payload = { _status = -1, _result = _result },
			_init = lazyInitializer
		}
		
		if ReactGlobalsModule.__DEV__ then
			local v1 = nil
			local v2 = nil
			setmetatable(config, {
				__index = function(_, p1)
					-- upvalues: v1 (ref), v2 (ref)
					if p1 == "defaultProps" then
						return v1
					elseif p1 ~= "propTypes" then return end
					return v2
				end,
				__newindex = function(p1, p2, p3)
					-- upvalues: Console (upval), v1 (ref), v2 (ref)
					if p2 == "defaultProps" then
						Console.error("React.lazy(...): It is not supported to assign `defaultProps` to a lazy component import. Either specify them where the component is defined, or create a wrapping component around it.")
						v1 = p3
						setmetatable(p1, {
							__index = function() end,
							__newindex = function() end
						})
					end
					if p2 == "propTypes" then
						Console.error("React.lazy(...): It is not supported to assign `propTypes` to a lazy component import. Either specify them where the component is defined, or create a wrapping component around it.")
						v2 = p3
						setmetatable(p1, {
							__index = function() end,
							__newindex = function() end
						})
					end
				end
			})
		end
		return config
	end
}