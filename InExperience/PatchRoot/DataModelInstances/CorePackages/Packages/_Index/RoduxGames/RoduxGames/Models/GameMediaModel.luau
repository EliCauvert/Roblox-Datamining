local tModule = require(script:FindFirstAncestor("RoduxGames").Parent.t)
local t = {}

function t.new(p1)
	-- upvalues: t (ref)
	assert(t.isValid(p1))
	t.__index = t
	setmetatable(p1, t)
	
	return p1
end

function t.mock(p1)
	-- upvalues: t (ref)
	p1 = p1 or {}
	
	return t.new({
		assetTypeId = p1.assetTypeId or 1,
		assetType = p1.assetType or "Image",
		imageId = p1.imageId or 1234567890,
		approved = p1.approved or false
	})
end

function t.format(p1)
	-- upvalues: t (ref)
	return t.new({
		assetTypeId = p1.assetTypeId,
		assetType = p1.assetType,
		imageId = p1.imageId,
		videoHash = p1.videoHash,
		videoTitle = p1.videoTitle,
		approved = if p1.approved then p1.approved else false,
		altText = p1.altText
	})
end

t.isValid = tModule.strictInterface({
	assetTypeId = tModule.optional(tModule.number),
	assetType = tModule.string,
	imageId = tModule.optional(tModule.number),
	videoHash = tModule.optional(tModule.string),
	videoTitle = tModule.optional(tModule.string),
	approved = tModule.boolean,
	altText = tModule.optional(tModule.string)
})

return t