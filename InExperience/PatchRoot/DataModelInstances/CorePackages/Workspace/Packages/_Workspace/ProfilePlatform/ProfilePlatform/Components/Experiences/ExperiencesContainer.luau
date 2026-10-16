local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local UseProfileJsonComponentModule = require(ProfilePlatform.Hooks.useProfileJsonComponent)
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local RoactUtilsModule = require(Parent.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local GetDeepValueFunction = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local NetworkingGamesModule = require(ProfilePlatform.Networking.NetworkingGames)
local ExperiencesModule = require(ProfilePlatform.Components.Experiences.Experiences)
local ExperiencesSkeletonModule = require(ProfilePlatform.Components.Experiences.ExperiencesSkeleton)
local FetchGameVotes = require(Parent.GameVotesRodux).GameVotes.FetchGameVotes
local MyRoduxNetworkingImplModule = require(ProfilePlatform.Networking.myRoduxNetworkingImpl)
local FFlagEnableCommunityProfileLoadingSkeletonsModule = require(ProfilePlatform.Flags.FFlagEnableCommunityProfileLoadingSkeletons)
local t = {}

return function(p1) --[[ Line: 38 | Named "ExperiencesContainer" ]]
	-- upvalues: UseProfileJsonComponentModule (copy), EnumsModule (copy), ReactModule (copy), FFlagEnableCommunityProfileLoadingSkeletonsModule (copy), t (copy), CryoModule (copy), UseDispatchFunction (copy), NetworkingGamesModule (copy), FetchGameVotes (copy), MyRoduxNetworkingImplModule (copy), UseSelectorFunction (copy), GetDeepValueFunction (copy), ExperiencesSkeletonModule (copy), ExperiencesModule (copy)
	local UseProfileJsonComponentModuleResult = UseProfileJsonComponentModule(EnumsModule.Components.Experiences)
	local UseStateResult, UseStateResult2 = ReactModule.useState(if FFlagEnableCommunityProfileLoadingSkeletonsModule then true else false)
	local Experiences = UseProfileJsonComponentModuleResult.experiences or t
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 44 ]]
		-- upvalues: CryoModule (upval), Experiences (copy)
		return CryoModule.List.map(Experiences, function(p2, _): string --[[ Line: 45 ]]
			return (tostring(p2.universeId))
		end)
	end, { Experiences })
	local UseDispatchResult = UseDispatchFunction()
	ReactModule.useEffect(function() --[[ Line: 52 ]]
		-- upvalues: CryoModule (upval), UseMemoResult (copy), UseDispatchResult (copy), NetworkingGamesModule (upval), FFlagEnableCommunityProfileLoadingSkeletonsModule (upval), UseStateResult2 (copy), FetchGameVotes (upval), MyRoduxNetworkingImplModule (upval)
		if not CryoModule.isEmpty(UseMemoResult) then
			UseDispatchResult(NetworkingGamesModule.GetExperiencesDetails.API(UseMemoResult)):catch(function(_) --[[ Line: 55 ]] end):finally(function() --[[ Line: 58 ]]
				-- upvalues: FFlagEnableCommunityProfileLoadingSkeletonsModule (upval), UseStateResult2 (upval)
				if FFlagEnableCommunityProfileLoadingSkeletonsModule then
					UseStateResult2(false)
				end
			end)
			
			for _, value in UseMemoResult do
				UseDispatchResult(FetchGameVotes.Fetch(MyRoduxNetworkingImplModule, value)):catch(function(_) --[[ Line: 64 ]] end)
			end
			return
		elseif FFlagEnableCommunityProfileLoadingSkeletonsModule then
			UseStateResult2(false)
		end
	end, { UseMemoResult })
	local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 74 ]]
		-- upvalues: GetDeepValueFunction (upval), t (upval)
		return GetDeepValueFunction(p2, "ProfilePlatform.Games.byGameId") or t
	end)
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 78 ]]
		-- upvalues: UseMemoResult (copy), UseSelectorResult (copy)
		local List = {}
		
		for _, value in UseMemoResult do
			if UseSelectorResult[value] then
				table.insert(List, UseSelectorResult[value])
			end
		end
		return List
	end, { UseMemoResult, UseSelectorResult })
	
	return if FFlagEnableCommunityProfileLoadingSkeletonsModule and UseStateResult then ReactModule.createElement(ExperiencesSkeletonModule, {
		layoutOrder = p1.layoutOrder,
		numSkeletons = #Experiences
	}) elseif #UseMemoResult1 == 0 then nil else ReactModule.createElement(ExperiencesModule, {
		layoutOrder = p1.layoutOrder,
		experienceDetails = UseMemoResult1
	})
end