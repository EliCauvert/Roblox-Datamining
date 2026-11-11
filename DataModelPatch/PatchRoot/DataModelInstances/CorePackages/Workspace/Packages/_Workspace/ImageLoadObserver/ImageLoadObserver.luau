return {
	["jest.config"] = script["jest.config"],
	createImageLoadObserver = require(script.createImageLoadObserver),
	isContentImageUri = require(script.isContentImageUri),
	ImageLoadObserverVisualizer = require(script.ImageLoadObserverVisualizer),
	OBSERVED_IMAGE_TAG = require(script.Constants).OBSERVED_IMAGE_TAG
}