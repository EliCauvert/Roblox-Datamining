local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseSignalFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.useSignal
local FormPeekviewModule = require(Modules.AvatarExperience.Common.Components.FormPeekview)
local FormDropdownModule = require(Modules.AvatarExperience.Common.Components.FormDropdown)
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)

return ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseSelectorFunction (copy), SelectIsPortraitModule (copy), ReactModule (copy), Signal (copy), UseSignalFunction (copy), FormPeekviewModule (copy), FoundationModule (copy), FormDropdownModule (copy)
	local UseSelectorResult = UseSelectorFunction(SelectIsPortraitModule)
	local UseRefResult = ReactModule.useRef(Signal.new())
	UseSignalFunction(UseRefResult.current, p1.onClose or function() end)
	
	return if UseSelectorResult then ReactModule.createElement(FormPeekviewModule, {
		useAutomaticSize = true,
		canApply = p1.canApply,
		onApply = p1.onApply,
		closePeekViewSignal = UseRefResult.current,
		totalSize = UDim2.fromScale(1, 0)
	}, {
		Container = ReactModule.createElement(FoundationModule.View, { tag = "auto-xy col" }, {
			Header = p1.headerText and ReactModule.createElement(FoundationModule.Text, {
				tag = "auto-xy text-title-large padding-x-xlarge padding-bottom-xlarge",
				LayoutOrder = 1,
				Text = p1.headerText
			}),
			ChildrenContainer = ReactModule.createElement(FoundationModule.View, { tag = "padding-x-large auto-xy", LayoutOrder = 2 }, p1.children)
		})
	}) else ReactModule.createElement(FormDropdownModule, {
		canApply = p1.canApply,
		onApply = p1.onApply,
		onClose = p1.onClose,
		dropdownPosition = p1.dropdownPosition,
		headerText = p1.headerText,
		ref = Ref
	}, p1.children)
end)