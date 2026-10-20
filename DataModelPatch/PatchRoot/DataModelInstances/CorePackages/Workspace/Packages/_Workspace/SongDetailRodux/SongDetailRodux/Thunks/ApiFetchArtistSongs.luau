local SongDetailRodux = script:FindFirstAncestor("SongDetailRodux")
local Parent = SongDetailRodux.Parent
local PerformFetch = require(Parent.Http).PerformFetch
local PromiseModule = require(Parent.Promise)
local AddSongsFunction = require(Parent.SongInfosRodux).AddSongs
local NextDataExpirationTimeRoduxModule = require(Parent.NextDataExpirationTimeRodux)
local ExpirationTimeNamespace = NextDataExpirationTimeRoduxModule.ExpirationTimeNamespace
local NextDataExpirationTimeReducer = NextDataExpirationTimeRoduxModule.NextDataExpirationTimeReducer
local SetNextDataExpirationTimeFunction = NextDataExpirationTimeRoduxModule.SetNextDataExpirationTime
local AddArtistSongsModule = require(SongDetailRodux.Actions.AddArtistSongs)
local ArtistSongReducerModule = require(SongDetailRodux.Reducers.ArtistSongReducer)
local GetArtistSongsModule = require(SongDetailRodux.Requests.getArtistSongs)
local SongInfoModel = require(Parent.SongModels).SongInfoModel
local SharedFlagsModule = require(Parent.SharedFlags)
local FIntSongDetailsRefreshIntervalSeconds = SharedFlagsModule.FIntSongDetailsRefreshIntervalSeconds
local Number: number = SharedFlagsModule.FFlagEnableTopSongsSort and tonumber(FIntSongDetailsRefreshIntervalSeconds) or 0

return {
	KeyMapper = function(p1): string
		return `luaapp.musicdiscovery.artistsongs.{p1}`
	end,
	GetFetchingStatus = function(p1, p2)
		-- upvalues: PerformFetch (copy)
		return PerformFetch.GetStatus(p1, `luaapp.musicdiscovery.artistsongs.{p2}`)
	end,
	Fetch = function(p1, p2)
		-- upvalues: PerformFetch (copy), ExpirationTimeNamespace (copy), NextDataExpirationTimeReducer (copy), ArtistSongReducerModule (copy), PromiseModule (copy), GetArtistSongsModule (copy), SongInfoModel (copy), AddSongsFunction (copy), AddArtistSongsModule (copy), Number (ref), SetNextDataExpirationTimeFunction (copy)
		local MusicdiscoveryName: string = `luaapp.musicdiscovery.artistsongs.{p2}`
		
		return PerformFetch.Single(MusicdiscoveryName, function(p3)
			-- upvalues: ExpirationTimeNamespace (upval), NextDataExpirationTimeReducer (upval), MusicdiscoveryName (copy), ArtistSongReducerModule (upval), p2 (copy), PromiseModule (upval), GetArtistSongsModule (upval), p1 (copy), SongInfoModel (upval), AddSongsFunction (upval), AddArtistSongsModule (upval), Number (upval), SetNextDataExpirationTimeFunction (upval)
			local State = p3:getState()
			local SongDetailPage = ExpirationTimeNamespace.SongDetailPage
			local PersonalizationEntry = (State.Personalization[NextDataExpirationTimeReducer.key][SongDetailPage] or {})[MusicdiscoveryName]
			local PersonalizationEntry1 = State.Personalization[ArtistSongReducerModule.key][p2] or nil
			
			return if PersonalizationEntry1 == nil or PersonalizationEntry == nil or tick() >= PersonalizationEntry then GetArtistSongsModule(p1, p2, 100):andThen(function(Result)
				-- upvalues: SongInfoModel (upval), p3 (copy), AddSongsFunction (upval), AddArtistSongsModule (upval), p2 (upval), Number (upval), SetNextDataExpirationTimeFunction (upval), MusicdiscoveryName (upval), SongDetailPage (copy)
				local t = {}
				local AssetIds = {}
				
				for _, value in Result and Result.responseBody and Result.responseBody.songs or {} do
					SongInfoModel.fromBaseJson(value):match(function(p4)
						-- upvalues: AssetIds (copy), t (copy)
						table.insert(AssetIds, p4.assetId)
						t[p4.assetId] = p4
					end):matchError(function(p4)
						warn(`ApiFetchArtistSongs could not parse song: {p4}`)
					end)
				end
				if next(t) then
					p3:dispatch(AddSongsFunction(t))
				end
				p3:dispatch(AddArtistSongsModule({ [p2] = AssetIds }))
				p3:dispatch(SetNextDataExpirationTimeFunction(MusicdiscoveryName, math.floor(tick() + Number), SongDetailPage))
			end, function(_) end) else PromiseModule.resolve(PersonalizationEntry1)
		end)
	end
}