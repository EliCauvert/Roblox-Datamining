local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")
local parent = socialTabsPage.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local fFlagSocialTabsPagePresenceSignalsMigrationModule = require(socialTabsPage.Flags.FFlagSocialTabsPagePresenceSignalsMigration)
local var4 = if not fFlagSocialTabsPagePresenceSignalsMigrationModule then require(socialTabsPage.Networking.NetworkingPresence).GetPresencesFromUserIds else nil

return if fFlagSocialTabsPagePresenceSignalsMigrationModule then nil else function(p0)
	-- upvalues: useDispatch (ref), reactModule (ref), cryoModule (ref), var4 (ref)
	local var5 = useDispatch()
	local var6 = reactModule.useRef({})
	reactModule.useEffect(function()
		-- upvalues: cryoModule (copy), var6 (ref), p0 (ref), var5 (ref), var4 (copy)
		local var7 = cryoModule.List.toSet(var6.current)
		local var8 = cryoModule.List.filter(p0, function(p1)
			-- upvalues: var7 (ref)
			return not var7[p1]
		end)
		
		if #var8 > 0 then
			var5(var4.API(var8))
			var6.current = cryoModule.List.join(var6.current, var8)
		end
	end, { p0, var5 })
end