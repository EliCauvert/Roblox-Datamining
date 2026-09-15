local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local dialogSize = foundationModule.Enums.DialogSize
local sheet = foundationModule.Sheet
local buildLibrarySnapPoint = game:DefineFastInt("BuildLibrarySnapPoint", 85)

return function(p1)
	-- upvalues: reactModule (ref), sheet (ref), buildLibrarySnapPoint (ref), dialogSize (ref)
	return reactModule.createElement(sheet.Root, {
		defaultSnapPointIndex = 1,
		testId = "Library.Sheet",
		isOpen = p1.isOpen,
		snapPoints = { buildLibrarySnapPoint / 100 },
		size = dialogSize.Large,
		onClose = p1.onClose
	}, {
		Content = reactModule.createElement(sheet.Content, nil, { Body = p1.children })
	})
end