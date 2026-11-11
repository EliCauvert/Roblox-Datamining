local SongDetailRodux = script:FindFirstAncestor("SongDetailRodux")
local Parent = SongDetailRodux.Parent
local PerformFetch = require(Parent.Http).PerformFetch
local PromiseModule = require(Parent.Promise)
local NextDataExpirationTimeRoduxModule = require(Parent.NextDataExpirationTimeRodux)
local ExpirationTimeNamespace = NextDataExpirationTimeRoduxModule.ExpirationTimeNamespace
local NextDataExpirationTimeReducer = NextDataExpirationTimeRoduxModule.NextDataExpirationTimeReducer
local SetNextDataExpirationTimeFunction = NextDataExpirationTimeRoduxModule.SetNextDataExpirationTime
local SharedFlagsModule = require(Parent.SharedFlags)
local FIntSongDetailsRefreshIntervalSeconds = SharedFlagsModule.FIntSongDetailsRefreshIntervalSeconds
local Number: number = SharedFlagsModule.FFlagEnableTopSongsSort and tonumber(FIntSongDetailsRefreshIntervalSeconds) or 0
local AddGamesFunction = require(Parent.GameInfosRodux).AddGames
local GameInfoModel = require(Parent.GameModels).GameInfoModel
local AddSongExperiencesModule = require(SongDetailRodux.Actions.AddSongExperiences)
local GetSongExperiencesModule = require(SongDetailRodux.Requests.getSongExperiences)
local SongExperiencesReducerModule = require(SongDetailRodux.Reducers.SongExperiencesReducer)

return {
	KeyMapper = function(p1): string
		return `luaapp.musicdiscovery.songexperiences.{p1}`
	end,
	GetFetchingStatus = function(p1, p2)
		-- upvalues: PerformFetch (copy)
		return PerformFetch.GetStatus(p1, `luaapp.musicdiscovery.songexperiences.{p2}`)
	end,
	Fetch = function(p1, p2)
		-- upvalues: PerformFetch (copy), ExpirationTimeNamespace (copy), NextDataExpirationTimeReducer (copy), SongExperiencesReducerModule (copy), PromiseModule (copy), GetSongExperiencesModule (copy), GameInfoModel (copy), AddGamesFunction (copy), AddSongExperiencesModule (copy), Number (ref), SetNextDataExpirationTimeFunction (copy)
		return PerformFetch.Single(`luaapp.musicdiscovery.songexperiences.{p2}`, function(p3)
			-- upvalues: p2 (copy), ExpirationTimeNamespace (upval), NextDataExpirationTimeReducer (upval), SongExperiencesReducerModule (upval), PromiseModule (upval), GetSongExperiencesModule (upval), p1 (copy), GameInfoModel (upval), AddGamesFunction (upval), AddSongExperiencesModule (upval), Number (upval), SetNextDataExpirationTimeFunction (upval)
			local State = p3:getState()
			local SongexperiencesName: string = `luaapp.musicdiscovery.songexperiences.{p2}`
			local SongDetailPage = ExpirationTimeNamespace.SongDetailPage
			local PersonalizationEntry = (State.Personalization[NextDataExpirationTimeReducer.key][SongDetailPage] or {})[SongexperiencesName] or nil
			local PersonalizationEntry1 = State.Personalization[SongExperiencesReducerModule.key][p2] or nil
			
			return if PersonalizationEntry1 and PersonalizationEntry and tick() < PersonalizationEntry then PromiseModule.resolve(PersonalizationEntry1) else GetSongExperiencesModule(p1, p2, 100):andThen(function(Result)
				-- upvalues: GameInfoModel (upval), p3 (copy), AddGamesFunction (upval), AddSongExperiencesModule (upval), p2 (upval), Number (upval), SetNextDataExpirationTimeFunction (upval), SongexperiencesName (copy), SongDetailPage (copy)
				local List = {}
				local t = {}
				
				for _, value in ipairs(Result and Result.responseBody and Result.responseBody.experiences or {}) do
					GameInfoModel.fromMusicDiscoveryApi(value):match(function(p4)
						-- upvalues: t (copy), List (copy)
						t[p4.universeId] = p4
						table.insert(List, p4.universeId)
					end):matchError(function(p4)
						warn(`ApiFetchSongExperiences could not parse experience: {p4}`)
					end)
				end
				if next(t) then
					p3:dispatch(AddGamesFunction(t))
				end
				p3:dispatch(AddSongExperiencesModule({ [p2] = List }))
				p3:dispatch(SetNextDataExpirationTimeFunction(SongexperiencesName, math.floor(tick() + Number), SongDetailPage))
			end, function(_) end)
		end)
	end
}