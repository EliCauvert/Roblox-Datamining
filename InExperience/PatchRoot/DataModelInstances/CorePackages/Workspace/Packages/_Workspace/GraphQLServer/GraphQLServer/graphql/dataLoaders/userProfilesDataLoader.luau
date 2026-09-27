local parent = script:FindFirstAncestor("GraphQLServer").Parent
local dataLoader = require(parent.DataLoader).DataLoader
local cryoModule = require(parent.Cryo)
local fFlagUserProfilePlatformProfile = require(parent.SharedFlags).FFlagUserProfilePlatformProfile
local fetchProfilesByIds = require(script.Parent.Parent.connectors.UserProfileConnector).fetchProfilesByIds
local t = {}
t.__index = t
local userProfilesDataLoaderClearTimeV1 = game:DefineFastInt("UserProfilesDataLoaderClearTime_v1", 15)
local getFFlagRemoveDataLoaderTimer = require(parent.SharedFlags).getFFlagRemoveDataLoaderTimer

function t.new()
	-- upvalues: t (ref)
	local t_1 = {
		loader = nil,
		lastTime = 0,
		fieldsSet = {},
		loadersByFields = {},
		dataLoaderOptions = { batchSize = 50, batchDelay = 0 }
	}
	setmetatable(t_1, t)
	
	return t_1
end

function convertToSet(value)
	local t = {}
	
	for i, v in value do
		t[v] = true
	end
	return t
end

function t:getFields()
	local t = {}
	
	for i, v in self.fieldsSet do
		table.insert(t, i)
	end
	return t
end

function t:makeDataLoader(p1, p2, p3)
	-- upvalues: cryoModule (ref), dataLoader (ref), fetchProfilesByIds (ref), fFlagUserProfilePlatformProfile (ref)
	self.fieldsSet = cryoModule.Dictionary.join(self.fieldsSet, convertToSet(p2))
	p3 = p3 or self.dataLoaderOptions
	
	return dataLoader.new(function(p4)
		-- upvalues: fetchProfilesByIds (copy), fFlagUserProfilePlatformProfile (copy), p2 (ref), self (ref), p1 (ref)
		return fetchProfilesByIds(p4, if fFlagUserProfilePlatformProfile then p2 else self:getFields(), p1)
	end, {
		cache = true,
		maxBatchSize = p3.batchSize,
		batchScheduleFn = function(p4)
			-- upvalues: p3 (ref)
			task.delay(p3.batchDelay, p4)
		end
	})
end

function t:getLoader(p1, p2, p3)
	-- upvalues: fFlagUserProfilePlatformProfile (ref), getFFlagRemoveDataLoaderTimer (ref), userProfilesDataLoaderClearTimeV1 (ref), cryoModule (ref)
	if fFlagUserProfilePlatformProfile then
		local cloned = table.clone(p2)
		table.sort(cloned)
		local joined = table.concat(cloned, ",")
		local processTime = os.clock()
		local var1 = self.loadersByFields[joined]
		
		if var1 and (getFFlagRemoveDataLoaderTimer() or userProfilesDataLoaderClearTimeV1 >= processTime - var1.lastTime) then
			return var1.loader
		end
		local var2 = self:makeDataLoader(p1, cloned, p3)
		self.loadersByFields[joined] = { loader = var2, lastTime = processTime }
		
		return var2
	else
		self.fieldsSet = cryoModule.Dictionary.join(self.fieldsSet, convertToSet(p2))
		local processTime = os.clock()
		
		if not self.loader or (if getFFlagRemoveDataLoaderTimer() then false else userProfilesDataLoaderClearTimeV1 < processTime - self.lastTime) then
			self.lastTime = processTime
			self.loader = self:makeDataLoader(p1, p2, p3)
		end
		return self.loader
	end
end

return t