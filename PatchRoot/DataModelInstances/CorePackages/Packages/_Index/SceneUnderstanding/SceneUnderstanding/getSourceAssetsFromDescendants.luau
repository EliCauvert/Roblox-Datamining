-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:10 2026 Pacific Standard Time.

local sceneUnderstanding = script:FindFirstAncestor("SceneUnderstanding")
local isSourceAssetModule = require(sceneUnderstanding.isSourceAsset)
local findSourceAssetsFromDescendantModule = require(sceneUnderstanding.findSourceAssetsFromDescendant)

return function(value) --[[ line: 17 | named "getSourceAssetsFromDescendants" ]]
	-- upvalues: isSourceAssetModule (ref), findSourceAssetsFromDescendantModule (ref)
	local t = {}
	
	for i, v in value do
		if isSourceAssetModule(v) then
			table.insert(t, v)
		end
		for i_1, v_1 in findSourceAssetsFromDescendantModule(v) do
			if not table.find(t, v_1) then
				table.insert(t, v_1)
			end
		end
	end
	return t
end