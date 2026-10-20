local _ = require(script.Parent.SheetType)

return require(game:GetService("CorePackages").Packages._Index.Foundation.Foundation.Parent.React).createContext({
	sheetHeightAvailable = nil,
	actionsHeight = nil,
	hasActionsDivider = nil,
	sheetContentHeight = nil,
	safeAreaPadding = nil,
	bottomPadding = nil,
	innerScrollingEnabled = nil,
	innerScrollY = nil,
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
	setSheetHeightAvailable = function(_)
		error("No SheetContext available")
	end,
	setActionsHeight = function(_)
		error("No SheetContext available")
	end,
	setHasActionsDivider = function(_)
		error("No SheetContext available")
	end,
	setSheetContentHeight = function(_)
		error("No SheetContext available")
	end,
	setInnerScrollY = function(_)
		error("No SheetContext available")
	end,
	setHasHeader = function(_)
		error("No SheetContext available")
	end,
	setFullBleedHeight = function(_)
		error("No SheetContext available")
	end,
	setContentStartRef = function(_) end
})