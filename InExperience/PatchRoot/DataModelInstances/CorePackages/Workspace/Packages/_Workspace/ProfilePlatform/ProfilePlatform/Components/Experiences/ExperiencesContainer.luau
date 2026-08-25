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

return function(p0)
	-- upvalues: useProfileJsonComponentModule (ref), enumsModule (ref), reactModule (ref), fFlagEnableCommunityProfileLoadingSkeletonsModule (ref), t (ref), cryoModule (ref), useDispatch (ref), networkingGamesModule (ref), fetchGameVotes (ref), myRoduxNetworkingImplModule (ref), useSelector (ref), getDeepValue (ref), experiencesSkeletonModule (ref), experiencesModule (ref)
	local var12 = useProfileJsonComponentModule(enumsModule.Components.Experiences)
	local var13, var14 = reactModule.useState(if fFlagEnableCommunityProfileLoadingSkeletonsModule then true else false)
	local experiences = var12.experiences or t
	local var16 = reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), experiences (ref)
		return cryoModule.List.map(experiences, function(p1, _)
			return tostring(p1.universeId)
		end)
	end, { experiences })
	local var17 = useDispatch()
	reactModule.useEffect(function()
		-- upvalues: cryoModule (copy), var16 (ref), var17 (ref), networkingGamesModule (copy), fFlagEnableCommunityProfileLoadingSkeletonsModule (copy), var14 (ref), fetchGameVotes (copy), myRoduxNetworkingImplModule (copy)
		if cryoModule.isEmpty(var16) then
			if fFlagEnableCommunityProfileLoadingSkeletonsModule then
				var14(false)
			end
			return
		else
			var17(networkingGamesModule.GetExperiencesDetails.API(var16)):catch(function(_) end):finally(function()
				-- upvalues: fFlagEnableCommunityProfileLoadingSkeletonsModule (copy), var14 (copy)
				if fFlagEnableCommunityProfileLoadingSkeletonsModule then
					var14(false)
				end
			end)
			
			for i, v in var16 do
				var17(fetchGameVotes.Fetch(myRoduxNetworkingImplModule, v)):catch(function(_) end)
			end
		end
	end, { var16 })
	local var18 = useSelector(function(p2)
		-- upvalues: getDeepValue (copy), t (copy)
		return getDeepValue(p2, "ProfilePlatform.Games.byGameId") or t
	end)
	local var19 = reactModule.useMemo(function()
		-- upvalues: var16 (ref), var18 (ref)
		local t = {}
		
		for i, v in var16 do
			if var18[v] then
				table.insert(t, var18[v])
			end
		end
		return t
	end, { var16, var18 })
	
	return if fFlagEnableCommunityProfileLoadingSkeletonsModule and var13 then reactModule.createElement(experiencesSkeletonModule, {
		layoutOrder = p0.layoutOrder,
		numSkeletons = #experiences
	}) elseif #var19 == 0 then nil else reactModule.createElement(experiencesModule, { layoutOrder = p0.layoutOrder, experienceDetails = var19 })
end