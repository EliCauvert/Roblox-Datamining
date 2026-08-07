-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:08 2026 Pacific Standard Time.

local tModule = require(script:FindFirstAncestor("RoduxGames").Parent.t)
local t = {}

function t.new(p0) --[[ line: 19 ]]
	-- upvalues: t (ref)
	assert(t.isValid(p0))
	t.__index = t
	setmetatable(p0, t)
	
	return p0
end

function t.mock(p1) --[[ line: 31 ]]
	-- upvalues: t (ref)
	p1 = p1 or {}
	
	return t.new({
		assetTypeId = p1.assetTypeId or 1,
		assetType = p1.assetType or "Image",
		imageId = p1.imageId or 1234567890,
		approved = p1.approved or false
	})
end

function t.format(p2) --[[ line: 44 ]]
	-- upvalues: t (ref)
	return t.new({
		assetTypeId = p2.assetTypeId,
		assetType = p2.assetType,
		imageId = p2.imageId,
		videoHash = p2.videoHash,
		videoTitle = p2.videoTitle,
		approved = if p2.approved then p2.approved else false,
		altText = p2.altText
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