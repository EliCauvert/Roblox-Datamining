local SocialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local Parent = SocialTabsPage.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local GetPresencesFromUserIds = require(SocialTabsPage.Networking.NetworkingPresence).GetPresencesFromUserIds

return function(p1)
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), CryoModule (copy), GetPresencesFromUserIds (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRefResult = ReactModule.useRef({})
	ReactModule.useEffect(function()
		-- upvalues: CryoModule (upval), UseRefResult (copy), p1 (copy), UseDispatchResult (copy), GetPresencesFromUserIds (upval)
		local Set = CryoModule.List.toSet(UseRefResult.current)
		local FilterResult = CryoModule.List.filter(p1, function(p2): boolean
			-- upvalues: Set (copy)
			return not Set[p2]
		end)
		
		if #FilterResult > 0 then
			UseDispatchResult(GetPresencesFromUserIds.API(FilterResult))
			UseRefResult.current = CryoModule.List.join(UseRefResult.current, FilterResult)
		end
	end, { p1, UseDispatchResult })
end