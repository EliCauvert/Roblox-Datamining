-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:10 2026 Pacific Standard Time.

return {
	ViewportQueryOptions = require(script.options.ViewportQueryOptions),
	RangeQueryOptions = require(script.options.RangeQueryOptions),
	DataModelTraversalOptions = require(script.options.DataModelTraversalOptions),
	getSourceAssetsInView = require(script.getSourceAssetsInView),
	getSourceAssetsInRange = require(script.getSourceAssetsInRange),
	createLazyInstanceCollector = require(script.traversal.createLazyInstanceCollector),
	isSourceAsset = require(script.isSourceAsset),
	calculatePotentialAudibility = require(script.audio.calculatePotentialAudibility),
	getAudibleVolume = require(script.audio.getAudibleVolume),
	isAudible = require(script.audio.isAudible)
}