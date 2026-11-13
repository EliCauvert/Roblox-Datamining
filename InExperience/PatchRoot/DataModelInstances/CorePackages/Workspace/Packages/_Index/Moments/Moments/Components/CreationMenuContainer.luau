local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local CreationMenuViewModule = require(Moments.Components.CreationMenuView)
local UseCreationMenuViewModelModule = require(Moments.Components.useCreationMenuViewModel)
local _ = FoundationModule.Enums.ButtonVariant

return function(p1)
	-- upvalues: UseCreationMenuViewModelModule (copy), ReactModule (copy), CreationMenuViewModule (copy)
	local UseCreationMenuViewModelModuleResult = UseCreationMenuViewModelModule({
		onCreateFromCaptures = p1.onCreateFromCaptures,
		onCreateFromAvatar = p1.onCreateFromAvatar,
		onTriggerActivated = p1.onTriggerActivated
	})
	
	return ReactModule.createElement(CreationMenuViewModule, {
		layoutOrder = p1.layoutOrder,
		testId = p1.testId,
		buttonTestId = p1.buttonTestId,
		buttonVariant = p1.buttonVariant,
		isOpen = UseCreationMenuViewModelModuleResult.isOpen,
		items = UseCreationMenuViewModelModuleResult.items,
		menuRef = UseCreationMenuViewModelModuleResult.menuRef,
		onToggle = UseCreationMenuViewModelModuleResult.onToggle,
		onPressedOutside = UseCreationMenuViewModelModuleResult.onPressedOutside
	})
end