local _script = script

return {
	Assets = require(_script.Generated.ConsolidatedAssets),
	preloadAsset = require(_script.preloadAsset)
}