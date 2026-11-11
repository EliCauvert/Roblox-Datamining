local SongDetailRodux = script:FindFirstAncestor("SongDetailRodux")
local Parent = SongDetailRodux.Parent
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local ApiFetchSongExperiencesModule = require(SongDetailRodux.Thunks.ApiFetchSongExperiences)
local SongExperiencesReducerModule = require(SongDetailRodux.Reducers.SongExperiencesReducer)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local GameInfosReducer = require(Parent.GameInfosRodux).GameInfosReducer
local _ = require(Parent.DiscoveryTypes)
local _ = require(SongDetailRodux.Types)

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseSelectorFunction (copy), ApiFetchSongExperiencesModule (copy), SongExperiencesReducerModule (copy), GameInfosReducer (copy), ReactModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: p1 (copy), ApiFetchSongExperiencesModule (upval)
		return p1 and ApiFetchSongExperiencesModule.GetFetchingStatus(p2, p1) or nil
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		-- upvalues: p1 (copy), SongExperiencesReducerModule (upval), GameInfosReducer (upval)
		if not p1 then
			return {}
		end
		local PersonalizationEntry = p2.Personalization[SongExperiencesReducerModule.key][p1]
		
		if not PersonalizationEntry then
			return {}
		end
		local List = {}
		
		for _, value in PersonalizationEntry do
			local PersonalizationEntry1 = p2.Personalization[GameInfosReducer.key][value]
			
			if PersonalizationEntry1 then
				table.insert(List, PersonalizationEntry1)
			end
		end
		return List
	end)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseDispatchResult (copy), ApiFetchSongExperiencesModule (upval), UseRoactServiceResult (copy)
		if p1 then
			UseDispatchResult(ApiFetchSongExperiencesModule.Fetch(UseRoactServiceResult, p1))
		end
	end, { UseDispatchResult, UseRoactServiceResult, p1 })
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy)
		UseResult()
	end, { UseResult })
	
	return {
		fetchStatus = UseSelectorResult,
		refetchSongExperiences = UseResult,
		songExperiences = UseSelectorResult1
	}
end