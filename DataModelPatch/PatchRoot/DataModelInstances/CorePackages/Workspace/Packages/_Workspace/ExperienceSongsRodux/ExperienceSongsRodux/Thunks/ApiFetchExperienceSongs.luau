local ExperienceSongsRodux = script:FindFirstAncestor("ExperienceSongsRodux")
local Parent = ExperienceSongsRodux.Parent
local PerformFetch = require(Parent.Http).PerformFetch
local PromiseModule = require(Parent.Promise)
local AddSongsFunction = require(Parent.SongInfosRodux).AddSongs
local NextDataExpirationTimeRoduxModule = require(Parent.NextDataExpirationTimeRodux)
local ExpirationTimeNamespace = NextDataExpirationTimeRoduxModule.ExpirationTimeNamespace
local NextDataExpirationTimeReducer = NextDataExpirationTimeRoduxModule.NextDataExpirationTimeReducer
local SetNextDataExpirationTimeFunction = NextDataExpirationTimeRoduxModule.SetNextDataExpirationTime
local AddExperienceSongsModule = require(ExperienceSongsRodux.Actions.AddExperienceSongs)
local ExperienceSongsReducerModule = require(ExperienceSongsRodux.Reducers.ExperienceSongsReducer)
local GetExperienceSongsModule = require(ExperienceSongsRodux.Requests.getExperienceSongs)
local SongInfoModel = require(Parent.SongModels).SongInfoModel
local Number: number = tonumber(settings():GetFVariable("LuaAppGameDetailsRefreshIntervalInSeconds")) or 0

return {
	KeyMapper = function(p1): string
		return `luaapp.musicdiscovery.experiencesongs.{p1}`
	end,
	Fetch = function(p1, p2)
		-- upvalues: PerformFetch (copy), ExpirationTimeNamespace (copy), NextDataExpirationTimeReducer (copy), ExperienceSongsReducerModule (copy), PromiseModule (copy), GetExperienceSongsModule (copy), SongInfoModel (copy), AddSongsFunction (copy), AddExperienceSongsModule (copy), Number (copy), SetNextDataExpirationTimeFunction (copy)
		return PerformFetch.Single(`luaapp.musicdiscovery.experiencesongs.{p2}`, function(p3)
			-- upvalues: ExpirationTimeNamespace (upval), NextDataExpirationTimeReducer (upval), p2 (copy), ExperienceSongsReducerModule (upval), PromiseModule (upval), GetExperienceSongsModule (upval), p1 (copy), SongInfoModel (upval), AddSongsFunction (upval), AddExperienceSongsModule (upval), Number (upval), SetNextDataExpirationTimeFunction (upval)
			local State = p3:getState()
			local GameDetailPage = ExpirationTimeNamespace.GameDetailPage
			local PersonalizationEntry = (State.Personalization[NextDataExpirationTimeReducer.key][GameDetailPage] or {})[p2]
			local PersonalizationEntry1 = State.Personalization[ExperienceSongsReducerModule.key][p2] or nil
			
			return if PersonalizationEntry1 == nil or PersonalizationEntry == nil or tick() >= PersonalizationEntry then GetExperienceSongsModule(p1, p2, 100):andThen(function(Result)
				-- upvalues: SongInfoModel (upval), p3 (copy), AddSongsFunction (upval), AddExperienceSongsModule (upval), p2 (upval), Number (upval), SetNextDataExpirationTimeFunction (upval), GameDetailPage (copy)
				local t = {}
				local AssetIds = {}
				
				for _, value in Result and Result.responseBody and Result.responseBody.songs or {} do
					SongInfoModel.fromBaseJson(value):match(function(p4)
						-- upvalues: AssetIds (copy), t (copy)
						table.insert(AssetIds, p4.assetId)
						t[p4.assetId] = p4
					end):matchError(function(p4)
						warn(`ApiFetchExperienceSongs could not parse song: {p4}`)
					end)
				end
				if next(t) then
					p3:dispatch(AddSongsFunction(t))
				end
				p3:dispatch(AddExperienceSongsModule({ [p2] = AssetIds }))
				p3:dispatch(SetNextDataExpirationTimeFunction(p2, math.floor(tick() + Number), GameDetailPage))
			end, function(_) end) else PromiseModule.resolve(PersonalizationEntry1)
		end)
	end
}