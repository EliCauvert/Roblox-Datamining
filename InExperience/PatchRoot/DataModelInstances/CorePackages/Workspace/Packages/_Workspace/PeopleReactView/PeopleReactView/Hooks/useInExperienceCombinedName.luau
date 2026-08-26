local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useGetPeopleServiceModule = require(peopleReactView.Hooks.useGetPeopleService)

return function(p1, p2)
	-- upvalues: useGetPeopleServiceModule (ref), reactModule (ref), signalsReactModule (ref)
	local var1 = useGetPeopleServiceModule("PeopleListStore")
	
	return signalsReactModule.useSignalBinding(reactModule.useMemo(function()
		-- upvalues: var1 (ref), p1 (ref)
		return var1.getProfile(p1)
	end, { p1 })):map(function(p3)
		-- upvalues: p2 (ref)
		return if p3 and string.len(p3) > 0 then p3 else p2
	end)
end