local TagAnnotationContextModule = require(script.TagAnnotationContext)

return {
	Provider = TagAnnotationContextModule.TagAnnotationProvider,
	useContext = TagAnnotationContextModule.useTagAnnotationContext,
	Overlay = require(script.TagAnnotationOverlay),
	useTagScanner = require(script.useTagScanner)
}