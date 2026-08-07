local parent = script.Parent.Parent
local reactModule = require(parent.React)
local useEventConnection = require(parent.ReactUtils).useEventConnection
local findLocalTextSourceModule = require(script.Parent.findLocalTextSource)

return {
	useCanSendToChannel = function(p0, p1) --[[ line: 8 ]]
		-- upvalues: reactModule (ref), findLocalTextSourceModule (ref), useEventConnection (ref)
		local var2, var3 = reactModule.useState(function() --[[ line: 9 ]]
			-- upvalues: findLocalTextSourceModule (copy), p0 (ref), p1 (ref)
			return findLocalTextSourceModule(p0, p1)
		end)
		local var4 = reactModule.useCallback(function() --[[ line: 13 ]]
			-- upvalues: var3 (ref), findLocalTextSourceModule (copy), p0 (ref), p1 (ref)
			var3(findLocalTextSourceModule(p0, p1))
		end, { p0, p1 })
		reactModule.useEffect(var4, { var4 })
		useEventConnection(if p0 then p0.ChildAdded else nil, var4, { var4 })
		useEventConnection(if p0 then p0.ChildRemoved else nil, var4, { var4 })
		local var5, var6 = reactModule.useState(function() --[[ line: 23 | named "evaluateCanSend" ]]
			-- upvalues: p0 (ref), p1 (ref), var2 (ref)
			return p0 == nil or p1 == nil or (var2 ~= nil and var2.CanSend)
		end)
		reactModule.useEffect(function() --[[ line: 32 ]]
			-- upvalues: var6 (ref), p0 (ref), p1 (ref), var2 (ref)
			var6(p0 == nil or p1 == nil or (var2 ~= nil and var2.CanSend))
		end, { p0, p1, var2 })
		useEventConnection(if var2 then var2:GetPropertyChangedSignal("CanSend") else nil, function() --[[ line: 36 ]]
			-- upvalues: var6 (ref), p0 (ref), p1 (ref), var2 (ref)
			var6(p0 == nil or p1 == nil or (var2 ~= nil and var2.CanSend))
		end, { p0, p1, var2 })
		
		return var5
	end
}