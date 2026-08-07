local builderIconPlatformUtilsModule = require(script.builderIconPlatformUtils)

return {
	Icon = require(script.Icon),
	IconVariant = require(script.IconVariant),
	Font = require(script.Font),
	Migration = require(script.Migration),
	getBuilderIconForKeycode = builderIconPlatformUtilsModule.getBuilderIconForKeycode,
	getBuilderIconForCurrentPlatform = builderIconPlatformUtilsModule.getBuilderIconForCurrentPlatform
}