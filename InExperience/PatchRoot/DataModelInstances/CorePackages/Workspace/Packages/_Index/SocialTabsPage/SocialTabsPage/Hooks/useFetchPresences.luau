local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local parent = socialTabsPage.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local fFlagSocialTabsPagePresenceSignalsMigrationModule = require(socialTabsPage.Flags.FFlagSocialTabsPagePresenceSignalsMigration)
local var1 = if not fFlagSocialTabsPagePresenceSignalsMigrationModule then require(socialTabsPage.Networking.NetworkingPresence).GetPresencesFromUserIds else nil

return if fFlagSocialTabsPagePresenceSignalsMigrationModule then nil else function(p1)
	-- upvalues: useDispatch (ref), reactModule (ref), cryoModule (ref), var1 (ref)
	local var2 = useDispatch()
	local var3 = reactModule.useRef({})
	reactModule.useEffect(function()
		-- upvalues: cryoModule (copy), var3 (ref), p1 (ref), var2 (ref), var1 (copy)
		local var4 = cryoModule.List.toSet(var3.current)
		local var5 = cryoModule.List.filter(p1, function(p2)
			-- upvalues: var4 (ref)
			return not var4[p2]
		end)
		
		if #var5 > 0 then
			var2(var1.API(var5))
			var3.current = cryoModule.List.join(var3.current, var5)
		end
	end, { p1, var2 })
end