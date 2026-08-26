local parent = script.Parent.Parent
local reactModule = require(parent.React)
local useEventConnection = require(parent.ReactUtils).useEventConnection
local findLocalTextSourceModule = require(script.Parent.findLocalTextSource)

return {
	useCanSendToChannel = function(p1, p2)
		-- upvalues: reactModule (ref), findLocalTextSourceModule (ref), useEventConnection (ref)
		local var1, var2 = reactModule.useState(function()
			-- upvalues: findLocalTextSourceModule (copy), p1 (ref), p2 (ref)
			return findLocalTextSourceModule(p1, p2)
		end)
		local var3 = reactModule.useCallback(function()
			-- upvalues: var2 (ref), findLocalTextSourceModule (copy), p1 (ref), p2 (ref)
			var2(findLocalTextSourceModule(p1, p2))
		end, { p1, p2 })
		reactModule.useEffect(var3, { var3 })
		useEventConnection(if p1 then p1.ChildAdded else nil, var3, { var3 })
		useEventConnection(if p1 then p1.ChildRemoved else nil, var3, { var3 })
		local var4, var5 = reactModule.useState(function()
			-- upvalues: p1 (ref), p2 (ref), var1 (ref)
			return p1 == nil or p2 == nil or (var1 ~= nil and var1.CanSend)
		end)
		reactModule.useEffect(function()
			-- upvalues: var5 (ref), p1 (ref), p2 (ref), var1 (ref)
			var5(p1 == nil or p2 == nil or (var1 ~= nil and var1.CanSend))
		end, { p1, p2, var1 })
		useEventConnection(if var1 then var1:GetPropertyChangedSignal("CanSend") else nil, function()
			-- upvalues: var5 (ref), p1 (ref), p2 (ref), var1 (ref)
			var5(p1 == nil or p2 == nil or (var1 ~= nil and var1.CanSend))
		end, { p1, p2, var1 })
		
		return var4
	end
}