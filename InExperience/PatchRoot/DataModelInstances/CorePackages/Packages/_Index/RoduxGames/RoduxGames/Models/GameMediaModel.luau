local TModule = require(script:FindFirstAncestor("RoduxGames").Parent.t)
local GameMediaModelModule = {}

function GameMediaModelModule.new(p1) --[[ Line: 19 ]]
	-- upvalues: GameMediaModelModule (copy)
	assert(GameMediaModelModule.isValid(p1))
	GameMediaModelModule.__index = GameMediaModelModule
	setmetatable(p1, GameMediaModelModule)
	
	return p1
end

function GameMediaModelModule.mock(p1) --[[ Line: 31 ]]
	-- upvalues: GameMediaModelModule (copy)
	local P1 = p1 or {}
	
	return (GameMediaModelModule.new({
		assetTypeId = P1.assetTypeId or 1,
		assetType = P1.assetType or "Image",
		imageId = P1.imageId or 1234567890,
		approved = P1.approved or false
	}))
end

function GameMediaModelModule.format(p1) --[[ Line: 44 ]]
	-- upvalues: GameMediaModelModule (copy)
	return (GameMediaModelModule.new({
		assetTypeId = p1.assetTypeId,
		assetType = p1.assetType,
		imageId = p1.imageId,
		videoHash = p1.videoHash,
		videoTitle = p1.videoTitle,
		approved = if p1.approved then p1.approved else false,
		altText = p1.altText
	}))
end

GameMediaModelModule.isValid = TModule.strictInterface({
	assetTypeId = TModule.optional(TModule.number),
	assetType = TModule.string,
	imageId = TModule.optional(TModule.number),
	videoHash = TModule.optional(TModule.string),
	videoTitle = TModule.optional(TModule.string),
	approved = TModule.boolean,
	altText = TModule.optional(TModule.string)
})

return GameMediaModelModule