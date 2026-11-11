return {
	MAX_RESULTS = 200,
	TEXT_CLASSES = { TextLabel = true, TextButton = true, TextBox = true },
	resolveInstance = require(script.resolveInstance),
	guiProps = require(script.guiProps),
	escapePattern = require(script.escapePattern),
	isVisible = require(script.isVisible),
	isVisibleAtPath = require(script.isVisibleAtPath),
	isInExperienceContext = require(script.isInExperienceContext),
	btnCenter = require(script.btnCenter),
	isOnScreen = require(script.isOnScreen),
	findAncestorScrollFrame = require(script.findAncestorScrollFrame),
	findDescendant = require(script.findDescendant),
	findAllDescendants = require(script.findAllDescendants),
	sortChildrenByLayoutOrder = require(script.sortChildrenByLayoutOrder)
}