local parent = script.Parent.Parent
local reactModule = require(parent.React)
local useEventConnection = require(parent.ReactUtils).useEventConnection
local isLocalUserInTextChannelModule = require(script.Parent.isLocalUserInTextChannel)

return function(p0, p1)
	-- upvalues: reactModule (ref), isLocalUserInTextChannelModule (ref), useEventConnection (ref)
	local var2, var3 = reactModule.useState(function()
		-- upvalues: isLocalUserInTextChannelModule (copy), p0 (ref), p1 (ref)
		return isLocalUserInTextChannelModule(p0, p1)
	end)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), isLocalUserInTextChannelModule (copy), p0 (ref), p1 (ref)
		var3(isLocalUserInTextChannelModule(p0, p1))
	end, { p0, p1 })
	
	local function onMembershipChanged()
		-- upvalues: var3 (ref), isLocalUserInTextChannelModule (copy), p0 (ref), p1 (ref)
		var3(isLocalUserInTextChannelModule(p0, p1))
	end
	
	useEventConnection(if p0 then p0.ChildAdded else nil, onMembershipChanged, { p0, p1 })
	useEventConnection(if p0 then p0.ChildRemoved else nil, onMembershipChanged, { p0, p1 })
	
	return var2
end