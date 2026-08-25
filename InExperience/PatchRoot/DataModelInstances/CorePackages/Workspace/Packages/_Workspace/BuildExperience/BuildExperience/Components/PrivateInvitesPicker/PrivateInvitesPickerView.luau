local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local userPickerListModule = require(buildExperience.Components.UserPicker.UserPickerList)
local var4 = if require(buildExperience.Flags.FFlagBuildExperienceUseFoundationSheet) then foundationModule.Sheet else require(buildExperience.FoundationFork.Sheet)
local button = foundationModule.Button
local iconButton = foundationModule.IconButton
local searchInput = foundationModule.SearchInput
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize

return function(p0)
	-- upvalues: reactModule (ref), view (ref), button (ref), buttonVariant (ref), inputSize (ref), var4 (ref), iconButton (ref), iconName (ref), searchInput (ref), userPickerListModule (ref)
	local testId = p0.testId or "private-invites-picker"
	
	return reactModule.createElement(var4.Root, {
		defaultSnapPointIndex = 1,
		isOpen = p0.isOpen,
		snapPoints = { 1 },
		onClose = p0.onClose,
		testId = testId
	}, {
		Header = reactModule.createElement(var4.Header, { hasCloseAffordance = false }, {
			Back = reactModule.createElement(iconButton, {
				LayoutOrder = 1,
				isCircular = true,
				icon = iconName.ChevronLargeLeft,
				onActivated = p0.onRequestClose,
				size = inputSize.Medium,
				testId = `{testId}-back`,
				variant = buttonVariant.Utility
			}),
			Search = reactModule.createElement(view, { LayoutOrder = 2, tag = "fill auto-y" }, {
				Input = reactModule.createElement(searchInput, {
					text = p0.searchText,
					onChanged = p0.setSearchText,
					placeholder = p0.searchPlaceholder,
					width = UDim.new(1, 0),
					testId = `{testId}-search`
				})
			})
		}),
		Content = reactModule.createElement(var4.Content, { scrollingFrameRef = p0.scrollingFrameRef }, {
			List = reactModule.createElement(userPickerListModule, {
				userIds = p0.userIds,
				isLoading = p0.isLoading,
				searchText = p0.searchText,
				emptyText = p0.emptyText,
				isSelected = p0.isSelected,
				canSelect = p0.canSelect,
				toggleSelected = p0.toggleSelected,
				testId = testId
			})
		}),
		Actions = reactModule.createElement(var4.Actions, nil, {
			Footer = reactModule.createElement(view, {
				tag = "col gap-small size-full-0 auto-y",
				testId = `{testId}-submit`
			}, {
				Send = reactModule.createElement(button, {
					LayoutOrder = 1,
					text = p0.sendButtonText,
					onActivated = p0.submit,
					isLoading = p0.isSubmitting,
					isDisabled = not p0.hasSelection,
					variant = buttonVariant.Emphasis,
					size = inputSize.Medium,
					width = UDim.new(1, 0),
					testId = `{testId}-send`
				})
			})
		})
	})
end