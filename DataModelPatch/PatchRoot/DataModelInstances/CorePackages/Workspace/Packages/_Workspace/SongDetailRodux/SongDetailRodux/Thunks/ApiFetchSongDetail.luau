local SongDetailRodux = script:FindFirstAncestor("SongDetailRodux")
local Parent = SongDetailRodux.Parent
local ArgCheckModule = require(Parent.ArgCheck)
local PerformFetch = require(Parent.Http).PerformFetch
local PromiseModule = require(Parent.Promise)
local ResultModule = require(Parent.Result)
local NextDataExpirationTimeRoduxModule = require(Parent.NextDataExpirationTimeRodux)
local ExpirationTimeNamespace = NextDataExpirationTimeRoduxModule.ExpirationTimeNamespace
local NextDataExpirationTimeReducer = NextDataExpirationTimeRoduxModule.NextDataExpirationTimeReducer
local SetNextDataExpirationTimeFunction = NextDataExpirationTimeRoduxModule.SetNextDataExpirationTime
local SharedFlagsModule = require(Parent.SharedFlags)
local FIntSongDetailsRefreshIntervalSeconds = SharedFlagsModule.FIntSongDetailsRefreshIntervalSeconds
local AddSongDetailModule = require(SongDetailRodux.Actions.AddSongDetail)
local BatchGetSongDetailModule = require(SongDetailRodux.Requests.batchGetSongDetail)
local SongDetailModelModule = require(SongDetailRodux.SongDetailModel)
local SongDetailReducerModule = require(SongDetailRodux.Reducers.SongDetailReducer)
local Number: number = SharedFlagsModule.FFlagEnableTopSongsSort and tonumber(FIntSongDetailsRefreshIntervalSeconds) or 0

local function KeyMapper(p1): string
	return `luaapp.musicdiscovery.songdetails.{p1}`
end

return {
	KeyMapper = KeyMapper,
	GetFetchingStatus = function(p1, p2)
		-- upvalues: PerformFetch (copy)
		return PerformFetch.GetStatus(p1, `luaapp.musicdiscovery.songdetails.{p2}`)
	end,
	Fetch = function(p1, List)
		-- upvalues: ArgCheckModule (copy), PerformFetch (copy), KeyMapper (copy), ExpirationTimeNamespace (copy), NextDataExpirationTimeReducer (copy), SongDetailReducerModule (copy), ResultModule (copy), PromiseModule (copy), BatchGetSongDetailModule (copy), SongDetailModelModule (copy), Number (ref), SetNextDataExpirationTimeFunction (copy), AddSongDetailModule (copy)
		ArgCheckModule.isType(List, "table", "ApiFetchSongDetail: inputSongIds")
		local List1 = {}
		
		for _, value in List do
			if value ~= nil and value ~= "" and (type(value) == "string" or type(value) == "number") then
				table.insert(List1, (tostring(value)))
			end
		end
		if #List1 == 0 then
			warn("ApiFetchSongDetail: No songIds provided")
		end
		return PerformFetch.Batch(List1, KeyMapper, function(p2, List)
			-- upvalues: ExpirationTimeNamespace (upval), NextDataExpirationTimeReducer (upval), SongDetailReducerModule (upval), ResultModule (upval), PromiseModule (upval), BatchGetSongDetailModule (upval), p1 (copy), SongDetailModelModule (upval), Number (upval), SetNextDataExpirationTimeFunction (upval), AddSongDetailModule (upval)
			local NewResults = {}
			local CurrentTime = tick()
			local List1 = {}
			local State = p2:getState()
			local SongDetailPage = ExpirationTimeNamespace.SongDetailPage
			local PersonalizationEntry = State.Personalization[NextDataExpirationTimeReducer.key][SongDetailPage] or {}
			local PersonalizationEntry1 = State.Personalization[SongDetailReducerModule.key] or {}
			for _, value in List do
				local PersonalizationEntry2 = PersonalizationEntry[value]
				
				if PersonalizationEntry1[value] == nil or PersonalizationEntry2 == nil or PersonalizationEntry2 < CurrentTime then
					table.insert(List1, value)
				else
					NewResults[`luaapp.musicdiscovery.songdetails.{value}`] = ResultModule.new(true, nil)
				end
			end
			return if #List1 == 0 then PromiseModule.resolve(NewResults) else BatchGetSongDetailModule(p1, List1):andThen(function(Result)
				-- upvalues: CurrentTime (ref), SongDetailModelModule (upval), NewResults (copy), ResultModule (upval), Number (upval), p2 (copy), SetNextDataExpirationTimeFunction (upval), SongDetailPage (copy), AddSongDetailModule (upval), PromiseModule (upval)
				local t = {}
				local SongDetails = Result and Result.responseBody and Result.responseBody.songDetails or nil
				
				if SongDetails ~= nil then
					CurrentTime = tick()
					
					for _, songDetail in SongDetails do
						SongDetailModelModule.fromJsonData(songDetail):match(function(p3)
							-- upvalues: NewResults (upval), ResultModule (upval), t (copy), CurrentTime (upval), Number (upval), p2 (upval), SetNextDataExpirationTimeFunction (upval), SongDetailPage (upval)
							local AssetId = p3.assetId
							NewResults[`luaapp.musicdiscovery.songdetails.{AssetId}`] = ResultModule.new(true, nil)
							t[AssetId] = p3
							p2:dispatch(SetNextDataExpirationTimeFunction(AssetId, math.floor(CurrentTime + Number), SongDetailPage))
						end):matchError(function(p3)
							warn(`ApiFetchSongDetail could not parse songDetail: {p3}`)
						end)
					end
					if next(t) then
						p2:dispatch(AddSongDetailModule(t))
					end
				end
				return PromiseModule.resolve(NewResults)
			end, function(_)
				-- upvalues: PromiseModule (upval)
				return PromiseModule.resolve({})
			end)
		end)
	end
}