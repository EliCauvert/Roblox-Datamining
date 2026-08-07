-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:10 2026 Pacific Standard Time.

local isSourceAssetModule = require(script:FindFirstAncestor("SceneUnderstanding").isSourceAsset)

return function(value) --[[ line: 5 | named "findSourceAssetsFromDescendant" ]]
	-- upvalues: isSourceAssetModule (ref)
	local t = {}
	local parent = value.Parent
	while parent do
		if isSourceAssetModule(parent) then
			table.insert(t, parent)
		end
		parent = parent.Parent
	end
	return t
end