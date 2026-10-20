local Parent = script:FindFirstAncestor("GraphQLServer").Parent
local DataLoader = require(Parent.DataLoader).DataLoader
local CryoModule = require(Parent.Cryo)
local FetchProfilesByIdsFunction = require(script.Parent.Parent.connectors.UserProfileConnector).fetchProfilesByIds
local UserProfilesDataLoaderModule = {}
UserProfilesDataLoaderModule.__index = UserProfilesDataLoaderModule
local UserProfilesDataLoaderClearTimeV1 = game:DefineFastInt("UserProfilesDataLoaderClearTime_v1", 15)
local GetFFlagRemoveDataLoaderTimerFunction = require(Parent.SharedFlags).getFFlagRemoveDataLoaderTimer

function UserProfilesDataLoaderModule.new()
	-- upvalues: UserProfilesDataLoaderModule (copy)
	local config = {
		loader = nil,
		lastTime = 0,
		fieldsSet = {},
		dataLoaderOptions = { batchSize = 50, batchDelay = 0 }
	}
	setmetatable(config, UserProfilesDataLoaderModule)
	
	return config
end

function convertToSet(List)
	local t = {}
	
	for _, value in List do
		t[value] = true
	end
	return t
end

function UserProfilesDataLoaderModule.getFields(p1)
	local List = {}
	
	for i, _ in p1.fieldsSet do
		table.insert(List, i)
	end
	return List
end

function UserProfilesDataLoaderModule:makeDataLoader(p2, p3, p4)
	-- upvalues: CryoModule (copy), DataLoader (copy), FetchProfilesByIdsFunction (copy)
	self.fieldsSet = CryoModule.Dictionary.join(self.fieldsSet, convertToSet(p3))
	local P5 = p4 or self.dataLoaderOptions
	
	return DataLoader.new(function(p5)
		-- upvalues: FetchProfilesByIdsFunction (upval), self (copy), p2 (copy)
		return FetchProfilesByIdsFunction(p5, self:getFields(), p2)
	end, {
		cache = true,
		maxBatchSize = P5.batchSize,
		batchScheduleFn = function(p5)
			-- upvalues: P5 (copy)
			task.delay(P5.batchDelay, p5)
		end
	})
end

function UserProfilesDataLoaderModule:getLoader(p2, p3, p4)
	-- upvalues: CryoModule (copy), GetFFlagRemoveDataLoaderTimerFunction (copy), UserProfilesDataLoaderClearTimeV1 (copy)
	self.fieldsSet = CryoModule.Dictionary.join(self.fieldsSet, convertToSet(p3))
	local ClockTime = os.clock()
	local IsClockTimeAbove: boolean = not GetFFlagRemoveDataLoaderTimerFunction() and ClockTime - self.lastTime > UserProfilesDataLoaderClearTimeV1
	
	if not self.loader or IsClockTimeAbove then
		self.lastTime = ClockTime
		self.loader = self:makeDataLoader(p2, p3, p4)
	end
	return self.loader
end

return UserProfilesDataLoaderModule