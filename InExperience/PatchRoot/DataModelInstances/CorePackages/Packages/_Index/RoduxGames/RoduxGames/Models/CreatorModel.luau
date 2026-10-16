local RoduxGames = script:FindFirstAncestor("RoduxGames")
local TModule = require(RoduxGames.Parent.t)
local CreatorType = require(RoduxGames.Enums).CreatorType
local CreatorModelModule = {}

function CreatorModelModule.new(p1) --[[ Line: 15 ]]
	-- upvalues: CreatorModelModule (copy)
	assert(CreatorModelModule.isValid(p1))
	CreatorModelModule.__index = CreatorModelModule
	setmetatable(p1, CreatorModelModule)
	
	return p1
end

function CreatorModelModule.mock(p1) --[[ Line: 27 ]]
	-- upvalues: CreatorModelModule (copy), CreatorType (copy)
	local P1 = p1 or {}
	
	return (CreatorModelModule.new({
		creatorId = P1.creatorId or "creatorId",
		creatorName = P1.creatorName or "creatorName",
		creatorType = P1.creatorType or CreatorType.User
	}))
end

function CreatorModelModule.format(p1) --[[ Line: 39 ]]
	-- upvalues: CreatorModelModule (copy), CreatorType (copy)
	return (CreatorModelModule.new({
		creatorId = tostring(p1.id),
		creatorName = p1.name,
		creatorType = CreatorType.fromRawValue(p1.type)
	}))
end

CreatorModelModule.isValid = TModule.strictInterface({
	creatorId = TModule.string,
	creatorName = TModule.string,
	creatorType = TModule.userdata
})

return CreatorModelModule