local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local IconButton = FoundationModule.IconButton
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local GetPublishGameSheetStoreModule = require(BuildExperience.Stores.GetPublishGameSheetStore)
local _ = require(BuildExperience.Stores.GetPublishGameSheetStore.createPublishGameSheetStore)

return function(Frame)
	-- upvalues: GetPublishGameSheetStoreModule (copy), ReactModule (copy), IconButton (copy), ButtonVariant (copy), InputSize (copy)
	local Store = Frame.store or GetPublishGameSheetStoreModule()
	
	return ReactModule.createElement(IconButton, {
		isCircular = true,
		testId = "build-header-overflow-sheet-button",
		icon = Frame.icon,
		variant = ButtonVariant.OverMedia,
		size = InputSize.Medium,
		onActivated = ReactModule.useCallback(function()
			-- upvalues: Store (copy), Frame (copy)
			Store.setIsOpen(true)
			
			if Frame.onActivated then
				Frame.onActivated()
			end
		end, { Store, Frame.onActivated }),
		LayoutOrder = Frame.LayoutOrder
	})
end