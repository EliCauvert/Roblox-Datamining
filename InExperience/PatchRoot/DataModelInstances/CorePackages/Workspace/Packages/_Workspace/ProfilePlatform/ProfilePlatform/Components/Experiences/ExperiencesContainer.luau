local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local useProfileJsonComponentModule = require(profilePlatform.Hooks.useProfileJsonComponent)
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local enumsModule = require(profilePlatform.Common.Enums)
local roactUtilsModule = require(parent.RoactUtils)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local getDeepValue = require(parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local networkingGamesModule = require(profilePlatform.Networking.NetworkingGames)
local experiencesModule = require(profilePlatform.Components.Experiences.Experiences)
local experiencesSkeletonModule = require(profilePlatform.Components.Experiences.ExperiencesSkeleton)
local fetchGameVotes = require(parent.GameVotesRodux).GameVotes.FetchGameVotes
local myRoduxNetworkingImplModule = require(profilePlatform.Networking.myRoduxNetworkingImpl)
local fFlagEnableCommunityProfileLoadingSkeletonsModule = require(profilePlatform.Flags.FFlagEnableCommunityProfileLoadingSkeletons)
local t = {}

return function(p1)
	-- upvalues: useProfileJsonComponentModule (ref), enumsModule (ref), reactModule (ref), fFlagEnableCommunityProfileLoadingSkeletonsModule (ref), t (ref), cryoModule (ref), useDispatch (ref), networkingGamesModule (ref), fetchGameVotes (ref), myRoduxNetworkingImplModule (ref), useSelector (ref), getDeepValue (ref), experiencesSkeletonModule (ref), experiencesModule (ref)
	local var1 = useProfileJsonComponentModule(enumsModule.Components.Experiences)
	local var2, var3 = reactModule.useState(if fFlagEnableCommunityProfileLoadingSkeletonsModule then true else false)
	local experiences = var1.experiences or t
	local var4 = reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), experiences (ref)
		return cryoModule.List.map(experiences, function(p2, _)
			return tostring(p2.universeId)
		end)
	end, { experiences })
	local var5 = useDispatch()
	reactModule.useEffect(function()
		-- upvalues: cryoModule (copy), var4 (ref), var5 (ref), networkingGamesModule (copy), fFlagEnableCommunityProfileLoadingSkeletonsModule (copy), var3 (ref), fetchGameVotes (copy), myRoduxNetworkingImplModule (copy)
		if cryoModule.isEmpty(var4) then
			if fFlagEnableCommunityProfileLoadingSkeletonsModule then
				var3(false)
			end
			return
		else
			var5(networkingGamesModule.GetExperiencesDetails.API(var4)):catch(function(_) end):finally(function()
				-- upvalues: fFlagEnableCommunityProfileLoadingSkeletonsModule (copy), var3 (copy)
				if fFlagEnableCommunityProfileLoadingSkeletonsModule then
					var3(false)
				end
			end)
			
			for i, v in var4 do
				var5(fetchGameVotes.Fetch(myRoduxNetworkingImplModule, v)):catch(function(_) end)
			end
		end
	end, { var4 })
	local var6 = useSelector(function(p2)
		-- upvalues: getDeepValue (copy), t (copy)
		return getDeepValue(p2, "ProfilePlatform.Games.byGameId") or t
	end)
	local var7 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), var6 (ref)
		local t = {}
		
		for i, v in var4 do
			if var6[v] then
				table.insert(t, var6[v])
			end
		end
		return t
	end, { var4, var6 })
	
	return if fFlagEnableCommunityProfileLoadingSkeletonsModule and var2 then reactModule.createElement(experiencesSkeletonModule, {
		layoutOrder = p1.layoutOrder,
		numSkeletons = #experiences
	}) elseif #var7 == 0 then nil else reactModule.createElement(experiencesModule, { layoutOrder = p1.layoutOrder, experienceDetails = var7 })
end