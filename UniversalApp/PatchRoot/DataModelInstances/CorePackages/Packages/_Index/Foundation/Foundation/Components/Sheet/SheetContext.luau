local _ = require(script.Parent.SheetType)

return require(script:FindFirstAncestor("Foundation").Parent.React).createContext({
	sheetHeightAvailable = nil,
	actionsHeight = nil,
	hasActionsDivider = nil,
	sheetContentHeight = nil,
	safeAreaPadding = nil,
	bottomPadding = nil,
	innerScrollingEnabled = nil,
	innerScrollY = nil,
	innerScrollingRef = nil,
	hasHeader = nil,
	hasFullBleed = false,
	fullBleedHeight = nil,
	hasRadius = true,
	closeSheet = nil,
	sheetType = nil,
	innerSurface = nil,
	testId = nil,
	closeAffordanceRef = nil,
	contentStartRef = nil,
	isVerticalSheetGesture = nil,
	contentRevealOffset = nil,
	setIsContentReversed = nil,
	setSheetHeightAvailable = function(_) --[[ Line: 11 ]]
		error("No SheetContext available")
	end,
	setActionsHeight = function(_) --[[ Line: 15 ]]
		error("No SheetContext available")
	end,
	setHasActionsDivider = function(_) --[[ Line: 19 ]]
		error("No SheetContext available")
	end,
	setSheetContentHeight = function(_) --[[ Line: 23 ]]
		error("No SheetContext available")
	end,
	setInnerScrollY = function(_) --[[ Line: 31 ]]
		error("No SheetContext available")
	end,
	setHasHeader = function(_) --[[ Line: 35 ]]
		error("No SheetContext available")
	end,
	setFullBleedHeight = function(_) --[[ Line: 40 ]]
		error("No SheetContext available")
	end,
	setContentStartRef = function(_) --[[ Line: 50 ]] end
})