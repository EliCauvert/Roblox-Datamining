-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:10 2026 Pacific Standard Time.

local sceneUnderstanding = script:FindFirstAncestor("SceneUnderstanding")
local findSourceAssetsFromDescendantModule = require(sceneUnderstanding.findSourceAssetsFromDescendant)
local getSourceAssetsFromDescendantsModule = require(sceneUnderstanding.getSourceAssetsFromDescendants)
local isSourceAssetModule = require(sceneUnderstanding.isSourceAsset)
local rangeQueryOptionsModule = require(sceneUnderstanding.options.RangeQueryOptions)

return function(value, p0) --[[ line: 30 | named "getSourceAssetsInRange" ]]
	-- upvalues: rangeQueryOptionsModule (ref), isSourceAssetModule (ref), findSourceAssetsFromDescendantModule (ref), getSourceAssetsFromDescendantsModule (ref)
	local t = {}
	
	for i, v in workspace:GetPartBoundsInRadius(value, rangeQueryOptionsModule.new(p0).maxDistance) do
		if isSourceAssetModule(v) or #findSourceAssetsFromDescendantModule(v) > 0 then
			table.insert(t, v)
		end
	end
	return getSourceAssetsFromDescendantsModule(t)
end