local ConsolidatedAssetsModule = require(script.Parent.Generated.ConsolidatedAssets)
local ContentProvider = game:GetService("ContentProvider")

return function(p1)
	-- upvalues: ConsolidatedAssetsModule (copy), ContentProvider (copy)
	local Image = Instance.new("ImageLabel")
	Image.Image = ConsolidatedAssetsModule[p1].assetId
	task.spawn(function()
		-- upvalues: ContentProvider (upval), Image (copy)
		ContentProvider:PreloadAsync({ Image })
		Image:Destroy()
	end)
end