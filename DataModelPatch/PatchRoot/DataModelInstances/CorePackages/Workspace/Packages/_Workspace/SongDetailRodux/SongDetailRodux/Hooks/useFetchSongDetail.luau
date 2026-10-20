local SongDetailRodux = script:FindFirstAncestor("SongDetailRodux")
local Parent = SongDetailRodux.Parent
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local _ = require(Parent.DiscoveryTypes)
local ApiFetchSongDetailModule = require(SongDetailRodux.Thunks.ApiFetchSongDetail)
local SongDetailReducerModule = require(SongDetailRodux.Reducers.SongDetailReducer)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local _ = require(SongDetailRodux.Types)

return function(SongId)
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseSelectorFunction (copy), ApiFetchSongDetailModule (copy), SongDetailReducerModule (copy), ReactModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseSelectorResult = UseSelectorFunction(function(p1)
		-- upvalues: SongId (copy), ApiFetchSongDetailModule (upval)
		return SongId and ApiFetchSongDetailModule.GetFetchingStatus(p1, SongId) or nil
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p1)
		-- upvalues: SongId (copy), SongDetailReducerModule (upval)
		return SongId and p1.Personalization[SongDetailReducerModule.key][SongId] or nil
	end)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: SongId (copy), UseDispatchResult (copy), ApiFetchSongDetailModule (upval), UseRoactServiceResult (copy)
		if SongId then
			UseDispatchResult(ApiFetchSongDetailModule.Fetch(UseRoactServiceResult, { SongId }))
		end
	end, { UseDispatchResult, UseRoactServiceResult, SongId })
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy)
		UseResult()
	end, { UseResult })
	
	return {
		fetchStatus = UseSelectorResult,
		refetchSongDetail = UseResult,
		songDetail = UseSelectorResult1,
		songId = SongId
	}
end