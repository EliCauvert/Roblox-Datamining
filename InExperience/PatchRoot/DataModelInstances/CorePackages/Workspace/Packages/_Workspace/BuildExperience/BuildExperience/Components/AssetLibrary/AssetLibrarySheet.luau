local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local dialogSize = foundationModule.Enums.DialogSize
local sheet = foundationModule.Sheet
local buildAssetLibrarySnapPoint = game:DefineFastInt("BuildAssetLibrarySnapPoint", 85)

return function(value)
	-- upvalues: reactModule (ref), sheet (ref), buildAssetLibrarySnapPoint (ref), dialogSize (ref)
	return reactModule.createElement(sheet.Root, {
		defaultSnapPointIndex = 1,
		testId = "AssetLibrary.Sheet",
		isOpen = value.isOpen,
		snapPoints = { buildAssetLibrarySnapPoint / 100 },
		size = dialogSize.Large,
		onClose = value.onClose
	}, {
		Content = reactModule.createElement(sheet.Content, nil, { Body = value.children })
	})
end