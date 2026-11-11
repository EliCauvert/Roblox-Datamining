local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local UseEventConnectionFunction = require(Parent.ReactUtils).useEventConnection
local IsLocalUserInTextChannelModule = require(script.Parent.isLocalUserInTextChannel)

return function(p1, p2)
	-- upvalues: ReactModule (copy), IsLocalUserInTextChannelModule (copy), UseEventConnectionFunction (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: IsLocalUserInTextChannelModule (upval), p1 (copy), p2 (copy)
		return IsLocalUserInTextChannelModule(p1, p2)
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), IsLocalUserInTextChannelModule (upval), p1 (copy), p2 (copy)
		UseStateResult2(IsLocalUserInTextChannelModule(p1, p2))
	end, { p1, p2 })
	
	local function onMembershipChanged()
		-- upvalues: UseStateResult2 (copy), IsLocalUserInTextChannelModule (upval), p1 (copy), p2 (copy)
		UseStateResult2(IsLocalUserInTextChannelModule(p1, p2))
	end
	
	UseEventConnectionFunction(if p1 then p1.ChildAdded else nil, onMembershipChanged, { p1, p2 })
	UseEventConnectionFunction(if p1 then p1.ChildRemoved else nil, onMembershipChanged, { p1, p2 })
	
	return UseStateResult
end