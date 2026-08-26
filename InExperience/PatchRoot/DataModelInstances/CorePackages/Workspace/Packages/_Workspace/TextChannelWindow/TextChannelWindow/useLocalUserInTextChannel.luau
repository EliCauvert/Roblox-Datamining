local parent = script.Parent.Parent
local reactModule = require(parent.React)
local useEventConnection = require(parent.ReactUtils).useEventConnection
local isLocalUserInTextChannelModule = require(script.Parent.isLocalUserInTextChannel)

return function(p1, p2)
	-- upvalues: reactModule (ref), isLocalUserInTextChannelModule (ref), useEventConnection (ref)
	local var1, var2 = reactModule.useState(function()
		-- upvalues: isLocalUserInTextChannelModule (copy), p1 (ref), p2 (ref)
		return isLocalUserInTextChannelModule(p1, p2)
	end)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), isLocalUserInTextChannelModule (copy), p1 (ref), p2 (ref)
		var2(isLocalUserInTextChannelModule(p1, p2))
	end, { p1, p2 })
	
	local function onMembershipChanged()
		-- upvalues: var2 (ref), isLocalUserInTextChannelModule (copy), p1 (ref), p2 (ref)
		var2(isLocalUserInTextChannelModule(p1, p2))
	end
	
	useEventConnection(if p1 then p1.ChildAdded else nil, onMembershipChanged, { p1, p2 })
	useEventConnection(if p1 then p1.ChildRemoved else nil, onMembershipChanged, { p1, p2 })
	
	return var1
end