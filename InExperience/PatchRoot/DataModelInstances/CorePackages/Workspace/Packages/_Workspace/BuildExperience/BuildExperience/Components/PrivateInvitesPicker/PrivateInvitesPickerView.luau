local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local userPickerListModule = require(buildExperience.Components.UserPicker.UserPickerList)
local var1 = if require(buildExperience.Flags.FFlagBuildExperienceUseFoundationSheet) then foundationModule.Sheet else require(buildExperience.FoundationFork.Sheet)
local button = foundationModule.Button
local iconButton = foundationModule.IconButton
local searchInput = foundationModule.SearchInput
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize

return function(p1)
	-- upvalues: reactModule (ref), view (ref), button (ref), buttonVariant (ref), inputSize (ref), var1 (ref), iconButton (ref), iconName (ref), searchInput (ref), userPickerListModule (ref)
	local testId = p1.testId or "private-invites-picker"
	
	return reactModule.createElement(var1.Root, {
		defaultSnapPointIndex = 1,
		isOpen = p1.isOpen,
		snapPoints = { 1 },
		onClose = p1.onClose,
		testId = testId
	}, {
		Header = reactModule.createElement(var1.Header, { hasCloseAffordance = false }, {
			Back = reactModule.createElement(iconButton, {
				LayoutOrder = 1,
				isCircular = true,
				icon = iconName.ChevronLargeLeft,
				onActivated = p1.onRequestClose,
				size = inputSize.Medium,
				testId = `{testId}-back`,
				variant = buttonVariant.Utility
			}),
			Search = reactModule.createElement(view, { LayoutOrder = 2, tag = "fill auto-y" }, {
				Input = reactModule.createElement(searchInput, {
					text = p1.searchText,
					onChanged = p1.setSearchText,
					placeholder = p1.searchPlaceholder,
					width = UDim.new(1, 0),
					testId = `{testId}-search`
				})
			})
		}),
		Content = reactModule.createElement(var1.Content, { scrollingFrameRef = p1.scrollingFrameRef }, {
			List = reactModule.createElement(userPickerListModule, {
				userIds = p1.userIds,
				isLoading = p1.isLoading,
				searchText = p1.searchText,
				emptyText = p1.emptyText,
				isSelected = p1.isSelected,
				canSelect = p1.canSelect,
				toggleSelected = p1.toggleSelected,
				testId = testId
			})
		}),
		Actions = reactModule.createElement(var1.Actions, nil, {
			Footer = reactModule.createElement(view, {
				tag = "col gap-small size-full-0 auto-y",
				testId = `{testId}-submit`
			}, {
				Send = reactModule.createElement(button, {
					LayoutOrder = 1,
					text = p1.sendButtonText,
					onActivated = p1.submit,
					isLoading = p1.isSubmitting,
					isDisabled = not p1.hasSelection,
					variant = buttonVariant.Emphasis,
					size = inputSize.Medium,
					width = UDim.new(1, 0),
					testId = `{testId}-send`
				})
			})
		})
	})
end