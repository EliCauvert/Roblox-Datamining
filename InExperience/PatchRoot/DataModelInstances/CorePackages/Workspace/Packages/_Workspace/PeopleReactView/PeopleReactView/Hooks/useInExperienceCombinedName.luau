local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local Parent = PeopleReactView.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseGetPeopleServiceModule = require(PeopleReactView.Hooks.useGetPeopleService)

return function(p1, p2)
	-- upvalues: UseGetPeopleServiceModule (copy), ReactModule (copy), SignalsReactModule (copy)
	local PeopleListStore = UseGetPeopleServiceModule("PeopleListStore")
	
	return SignalsReactModule.useSignalBinding((ReactModule.useMemo(function()
		-- upvalues: PeopleListStore (copy), p1 (copy)
		return PeopleListStore.getProfile(p1)
	end, { p1 }))):map(function(Text: string)
		-- upvalues: p2 (copy)
		return if Text and string.len(Text) > 0 then Text else p2
	end)
end