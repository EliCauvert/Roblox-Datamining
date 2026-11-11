local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local AddSongsFunction = require(Parent.SongInfosRodux).AddSongs
local _ = require(Parent.DiscoveryTypes)
local TopicContentsRoduxModule = require(Parent.TopicContentsRodux)
local TopicContentsEntryModel = TopicContentsRoduxModule.TopicContentsEntryModel
local TopicContentsModel = TopicContentsRoduxModule.TopicContentsModel
local AddTopicContentsFunction = TopicContentsRoduxModule.AddTopicContents
local SongInfoModel = require(Parent.SongModels).SongInfoModel
local FFlagEnableTopSongsSort = require(Parent.SharedFlags).FFlagEnableTopSongsSort

return function(p1, p2, p3, _)
	-- upvalues: FFlagEnableTopSongsSort (copy), TopicContentsEntryModel (copy), SongInfoModel (copy), AddSongsFunction (copy), TopicContentsModel (copy), AddTopicContentsFunction (copy)
	assert(FFlagEnableTopSongsSort, "Songs sort is not enabled")
	local Entries = {}
	local t = {}
	local Songs = p2.songs
	
	if #Songs == 0 then
		warn(`Found no songs in this sort: {p2.sortDisplayName}`)
	end
	local function forEachSongInfo(p4)
		-- upvalues: TopicContentsEntryModel (upval), Entries (copy), SongInfoModel (upval), t (copy)
		TopicContentsEntryModel.songFromExploreApiData(p4):match(function(p5)
			-- upvalues: Entries (upval)
			table.insert(Entries, p5)
		end):matchError(function(p5)
			warn(p5)
		end)
		SongInfoModel.fromExploreApi(p4):match(function(p5)
			-- upvalues: t (upval)
			t[p5.assetId] = p5
		end):matchError(function(p5)
			warn(p5)
		end)
	end
	
	for _, song in ipairs(Songs) do
		forEachSongInfo(song)
	end
	p1:dispatch(AddSongsFunction(t))
	local config = {
		nextPageExclusiveStartId = 0,
		rowsRequested = 0,
		entries = Entries,
		hasMoreRows = p2.nextPageToken ~= nil and p2.nextPageToken ~= "",
		nextPageToken = p2.nextPageToken
	}
	
	if not p3 then
		config.updatedTimestamp = tick()
	end
	p1:dispatch(AddTopicContentsFunction(p2.sortId, TopicContentsModel.fromData(config), p3))
end