local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local iconButton = foundationModule.IconButton
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local getPublishGameSheetStoreModule = require(buildExperience.Stores.GetPublishGameSheetStore)
local _ = require(buildExperience.Stores.GetPublishGameSheetStore.createPublishGameSheetStore)

return function(p0) --[[ line: 25 | named "BuildOverflowSheetButton" ]]
	-- upvalues: getPublishGameSheetStoreModule (ref), reactModule (ref), iconButton (ref), buttonVariant (ref), inputSize (ref)
	local store = p0.store or getPublishGameSheetStoreModule()
	
	return reactModule.createElement(iconButton, {
		isCircular = true,
		testId = "build-header-overflow-sheet-button",
		icon = p0.icon,
		variant = buttonVariant.OverMedia,
		size = inputSize.Medium,
		onActivated = reactModule.useCallback(function() --[[ line: 28 ]]
			-- upvalues: store (ref), p0 (ref)
			store.setIsOpen(true)
			
			if p0.onActivated then
				p0.onActivated()
			end
		end, { store, p0.onActivated }),
		LayoutOrder = p0.LayoutOrder
	})
end