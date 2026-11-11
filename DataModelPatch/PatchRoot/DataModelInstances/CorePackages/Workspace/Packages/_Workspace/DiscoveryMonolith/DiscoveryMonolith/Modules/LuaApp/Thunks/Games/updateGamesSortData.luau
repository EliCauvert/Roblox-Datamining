local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local CryoModule = require(Parent.Cryo)
local GameInfoModel = require(Parent.GameModels).GameInfoModel
local ParseAndAddGameInfosFunction = require(Parent.GameInfosRodux).parseAndAddGameInfos
local TopicContentsRoduxModule = require(Parent.TopicContentsRodux)
local TopicContentsEntryModel = TopicContentsRoduxModule.TopicContentsEntryModel
local TopicContentsModel = TopicContentsRoduxModule.TopicContentsModel
local AddTopicContentsFunction = TopicContentsRoduxModule.AddTopicContents

return function(p1, p2, p3, p4)
	-- upvalues: TopicContentsEntryModel (copy), CryoModule (copy), ParseAndAddGameInfosFunction (copy), GameInfoModel (copy), TopicContentsModel (copy), AddTopicContentsFunction (copy)
	local Entries = {}
	local Games = p3.games
	
	if #Games == 0 then
		warn("Found no games in this sort:", p3.sortDisplayName)
	end
	ParseAndAddGameInfosFunction(p1, p2, Games, GameInfoModel.fromOmniApi, function(p5, p6)
		-- upvalues: TopicContentsEntryModel (upval), CryoModule (upval), Entries (copy)
		TopicContentsEntryModel.fromExploreApiData(p5):match(function(p7)
			-- upvalues: CryoModule (upval), p6 (copy), Entries (upval)
			table.insert(Entries, (CryoModule.Dictionary.join(p6, p7)))
		end):matchError(function(p7)
			warn(p7)
		end)
	end)
	local config = {
		nextPageExclusiveStartId = 0,
		rowsRequested = 0,
		entries = Entries,
		hasMoreRows = p3.nextPageToken ~= nil and p3.nextPageToken ~= "",
		nextPageToken = p3.nextPageToken
	}
	
	if not p4 then
		config.updatedTimestamp = tick()
	end
	p2:dispatch(AddTopicContentsFunction(p3.sortId, TopicContentsModel.fromData(config), p4))
end