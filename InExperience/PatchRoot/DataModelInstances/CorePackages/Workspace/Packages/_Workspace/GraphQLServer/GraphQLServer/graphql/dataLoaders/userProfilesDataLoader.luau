local parent = script:FindFirstAncestor("GraphQLServer").Parent
local dataLoader = require(parent.DataLoader).DataLoader
local cryoModule = require(parent.Cryo)
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

function t:makeDataLoader(p0, p1, p2)
	-- upvalues: cryoModule (ref), dataLoader (ref), fetchProfilesByIds (ref)
	self.fieldsSet = cryoModule.Dictionary.join(self.fieldsSet, convertToSet(p1))
	p2 = p2 or self.dataLoaderOptions
	
	return dataLoader.new(function(p3)
		-- upvalues: fetchProfilesByIds (copy), self (ref), p0 (ref)
		return fetchProfilesByIds(p3, self:getFields(), p0)
	end, {
		cache = true,
		maxBatchSize = p2.batchSize,
		batchScheduleFn = function(p4)
			-- upvalues: p2 (ref)
			task.delay(p2.batchDelay, p4)
		end
	})
end

function t:getLoader(p5, p6, p7)
	-- upvalues: cryoModule (ref), getFFlagRemoveDataLoaderTimer (ref), userProfilesDataLoaderClearTimeV1 (ref)
	self.fieldsSet = cryoModule.Dictionary.join(self.fieldsSet, convertToSet(p6))
	local processTime = os.clock()
	
	if not self.loader or (if getFFlagRemoveDataLoaderTimer() then false else userProfilesDataLoaderClearTimeV1 < processTime - self.lastTime) then
		self.lastTime = processTime
		self.loader = self:makeDataLoader(p5, p6, p7)
	end
	return self.loader
end

return t