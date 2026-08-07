-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:30 2026 Pacific Standard Time.

local consolidatedAssetsModule = require(script.Parent.Generated.ConsolidatedAssets)
local contentProviderService = game:GetService("ContentProvider")

return function(value) --[[ line: 5 | named "preloadAsset" ]]
	-- upvalues: consolidatedAssetsModule (ref), contentProviderService (ref)
	local imageLabel = Instance.new("ImageLabel")
	imageLabel.Image = consolidatedAssetsModule[value].assetId
	task.spawn(function() --[[ line: 11 ]]
		-- upvalues: contentProviderService (copy), imageLabel (ref)
		contentProviderService:PreloadAsync({ imageLabel })
		imageLabel:Destroy()
	end)
end