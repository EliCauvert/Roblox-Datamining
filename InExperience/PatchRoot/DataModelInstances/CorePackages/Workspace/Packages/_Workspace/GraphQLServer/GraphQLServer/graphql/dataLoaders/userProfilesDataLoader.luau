local Parent = script:FindFirstAncestor("GraphQLServer").Parent
local DataLoader = require(Parent.DataLoader).DataLoader
local CryoModule = require(Parent.Cryo)
local FFlagUserProfilePlatformProfile = require(Parent.SharedFlags).FFlagUserProfilePlatformProfile
local FetchProfilesByIdsFunction = require(script.Parent.Parent.connectors.UserProfileConnector).fetchProfilesByIds
local UserProfilesDataLoaderModule = {}
UserProfilesDataLoaderModule.__index = UserProfilesDataLoaderModule
local UserProfilesDataLoaderClearTimeV1 = game:DefineFastInt("UserProfilesDataLoaderClearTime_v1", 15)
local GetFFlagRemoveDataLoaderTimerFunction = require(Parent.SharedFlags).getFFlagRemoveDataLoaderTimer

function UserProfilesDataLoaderModule.new() --[[ Line: 23 ]]
	-- upvalues: UserProfilesDataLoaderModule (copy)
	local config = {
		loader = nil,
		lastTime = 0,
		fieldsSet = {},
		loadersByFields = {},
		dataLoaderOptions = { batchSize = 50, batchDelay = 0 }
	}
	setmetatable(config, UserProfilesDataLoaderModule)
	
	return config
end

function convertToSet(List) --[[ Line: 39 ]]
	local t = {}
	
	for _, value in List do
		t[value] = true
	end
	return t
end

function UserProfilesDataLoaderModule.getFields(p1) --[[ Line: 47 ]]
	local List = {}
	
	for i, _ in p1.fieldsSet do
		table.insert(List, i)
	end
	return List
end

function UserProfilesDataLoaderModule:makeDataLoader(p2, p3, p4) --[[ Line: 55 ]]
	-- upvalues: CryoModule (copy), DataLoader (copy), FetchProfilesByIdsFunction (copy), FFlagUserProfilePlatformProfile (copy)
	self.fieldsSet = CryoModule.Dictionary.join(self.fieldsSet, convertToSet(p3))
	local P5 = p4 or self.dataLoaderOptions
	
	return DataLoader.new(function(p5) --[[ Line: 58 ]]
		-- upvalues: FetchProfilesByIdsFunction (upval), FFlagUserProfilePlatformProfile (upval), p3 (copy), self (copy), p2 (copy)
		return FetchProfilesByIdsFunction(p5, if FFlagUserProfilePlatformProfile then p3 else self:getFields(), p2)
	end, {
		cache = true,
		maxBatchSize = P5.batchSize,
		batchScheduleFn = function(p5) --[[ Line: 67 ]]
			-- upvalues: P5 (copy)
			task.delay(P5.batchDelay, p5)
		end
	})
end

function UserProfilesDataLoaderModule:getLoader(p2, Tbl, p3) --[[ Line: 74 ]]
	-- upvalues: FFlagUserProfilePlatformProfile (copy), GetFFlagRemoveDataLoaderTimerFunction (copy), UserProfilesDataLoaderClearTimeV1 (copy), CryoModule (copy)
	if FFlagUserProfilePlatformProfile then
		local Copy = table.clone(Tbl)
		table.sort(Copy)
		local Joined = table.concat(Copy, ",")
		local ClockTime = os.clock()
		local LoadersByField = self.loadersByFields[Joined]
		
		if LoadersByField and (GetFFlagRemoveDataLoaderTimerFunction() or UserProfilesDataLoaderClearTimeV1 >= ClockTime - LoadersByField.lastTime) then
			return LoadersByField.loader
		else
			local DataLoader = self:makeDataLoader(p2, Copy, p3)
			self.loadersByFields[Joined] = { loader = DataLoader, lastTime = ClockTime }
			
			return DataLoader
		end
	else
		self.fieldsSet = CryoModule.Dictionary.join(self.fieldsSet, convertToSet(Tbl))
		local ClockTime1 = os.clock()
		local IsClockTimeAbove: boolean = not GetFFlagRemoveDataLoaderTimerFunction() and ClockTime1 - self.lastTime > UserProfilesDataLoaderClearTimeV1
		
		if not self.loader or IsClockTimeAbove then
			self.lastTime = ClockTime1
			self.loader = self:makeDataLoader(p2, Tbl, p3)
		end
		return self.loader
	end
end

return UserProfilesDataLoaderModule