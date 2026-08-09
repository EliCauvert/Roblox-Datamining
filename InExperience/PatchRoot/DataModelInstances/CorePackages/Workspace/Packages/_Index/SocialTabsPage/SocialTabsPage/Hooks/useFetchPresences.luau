local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local parent = socialTabsPage.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local getPresencesFromUserIds = require(socialTabsPage.Networking.NetworkingPresence).GetPresencesFromUserIds

return function(p0) --[[ line: 12 | named "useFetchPresences" ]]
	-- upvalues: useDispatch (ref), reactModule (ref), cryoModule (ref), getPresencesFromUserIds (ref)
	local var3 = useDispatch()
	local var4 = reactModule.useRef({})
	reactModule.useEffect(function() --[[ line: 16 ]]
		-- upvalues: cryoModule (copy), var4 (ref), p0 (ref), var3 (ref), getPresencesFromUserIds (copy)
		local var5 = cryoModule.List.toSet(var4.current)
		local var6 = cryoModule.List.filter(p0, function(p1) --[[ line: 18 ]]
			-- upvalues: var5 (ref)
			return not var5[p1]
		end)
		
		if #var6 > 0 then
			var3(getPresencesFromUserIds.API(var6))
			var4.current = cryoModule.List.join(var4.current, var6)
		end
	end, { p0, var3 })
end