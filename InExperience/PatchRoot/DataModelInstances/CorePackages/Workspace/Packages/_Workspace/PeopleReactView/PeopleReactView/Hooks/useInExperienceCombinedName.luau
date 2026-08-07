local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useGetPeopleServiceModule = require(peopleReactView.Hooks.useGetPeopleService)

return function(p0, p1) --[[ line: 9 | named "useInExperienceCombinedName" ]]
	-- upvalues: useGetPeopleServiceModule (ref), reactModule (ref), signalsReactModule (ref)
	local var4 = useGetPeopleServiceModule("PeopleListStore")
	
	return signalsReactModule.useSignalBinding(reactModule.useMemo(function() --[[ line: 12 ]]
		-- upvalues: var4 (ref), p0 (ref)
		return var4.getProfile(p0)
	end, { p0 })):map(function(p2) --[[ line: 18 ]]
		-- upvalues: p1 (ref)
		return if p2 and string.len(p2) > 0 then p2 else p1
	end)
end