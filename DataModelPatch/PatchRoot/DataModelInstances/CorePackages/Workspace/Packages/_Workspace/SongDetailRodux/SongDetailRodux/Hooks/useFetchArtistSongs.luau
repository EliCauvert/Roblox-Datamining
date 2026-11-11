local SongDetailRodux = script:FindFirstAncestor("SongDetailRodux")
local Parent = SongDetailRodux.Parent
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local ApiFetchArtistSongsModule = require(SongDetailRodux.Thunks.ApiFetchArtistSongs)
local ArtistSongReducerModule = require(SongDetailRodux.Reducers.ArtistSongReducer)
local _ = require(SongDetailRodux.Types)

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseSelectorFunction (copy), ApiFetchArtistSongsModule (copy), ArtistSongReducerModule (copy), ReactModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: p1 (copy), ApiFetchArtistSongsModule (upval)
		return p1 and ApiFetchArtistSongsModule.GetFetchingStatus(p2, p1) or nil
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		-- upvalues: p1 (copy), ArtistSongReducerModule (upval)
		return p1 and p2.Personalization[ArtistSongReducerModule.key][p1] or {}
	end)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseDispatchResult (copy), ApiFetchArtistSongsModule (upval), UseRoactServiceResult (copy)
		if p1 then
			UseDispatchResult(ApiFetchArtistSongsModule.Fetch(UseRoactServiceResult, p1))
		end
	end, { UseDispatchResult, UseRoactServiceResult, p1 })
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy)
		UseResult()
	end, { UseResult })
	
	return {
		artistSongIds = UseSelectorResult1,
		fetchStatus = UseSelectorResult,
		refetchArtistSongs = UseResult
	}
end