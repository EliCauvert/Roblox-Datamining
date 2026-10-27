local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UserPickerListModule = require(BuildExperience.Components.UserPicker.UserPickerList)
local PrivateInviteAddErrorDialogModule = require(script.Parent.PrivateInviteAddErrorDialog)
local PrivateInviteAddRejectedDialogModule = require(script.Parent.PrivateInviteAddRejectedDialog)
local Sheet = FoundationModule.Sheet
local Button = FoundationModule.Button
local IconButton = FoundationModule.IconButton
local SearchInput = FoundationModule.SearchInput
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), Button (copy), ButtonVariant (copy), InputSize (copy), Sheet (copy), IconButton (copy), IconName (copy), SearchInput (copy), UserPickerListModule (copy), PrivateInviteAddErrorDialogModule (copy), PrivateInviteAddRejectedDialogModule (copy)
	local TestId = p1.testId or "private-invites-picker"
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Sheet = ReactModule.createElement(Sheet.Root, {
			defaultSnapPointIndex = 1,
			isOpen = p1.isOpen,
			snapPoints = { 1 },
			onClose = p1.onClose,
			testId = TestId
		}, {
			Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = false }, {
				Back = ReactModule.createElement(IconButton, {
					LayoutOrder = 1,
					isCircular = true,
					icon = IconName.ChevronLargeLeft,
					onActivated = p1.onRequestClose,
					size = InputSize.Medium,
					testId = `{TestId}-back`,
					variant = ButtonVariant.Utility
				}),
				Search = ReactModule.createElement(View, { LayoutOrder = 2, tag = "fill auto-y" }, {
					Input = ReactModule.createElement(SearchInput, {
						text = p1.searchText,
						onChanged = p1.setSearchText,
						placeholder = p1.searchPlaceholder,
						width = UDim.new(1, 0),
						testId = `{TestId}-search`
					})
				})
			}),
			Content = ReactModule.createElement(Sheet.Content, { scrollingFrameRef = p1.scrollingFrameRef }, {
				List = ReactModule.createElement(UserPickerListModule, {
					userIds = p1.userIds,
					isLoading = p1.isLoading,
					searchText = p1.searchText,
					emptyText = p1.emptyText,
					isSelected = p1.isSelected,
					canSelect = p1.canSelect,
					toggleSelected = p1.toggleSelected,
					testId = TestId
				})
			}),
			Actions = ReactModule.createElement(Sheet.Actions, nil, {
				Footer = ReactModule.createElement(View, {
					tag = "col gap-small size-full-0 auto-y",
					testId = `{TestId}-submit`
				}, {
					Send = ReactModule.createElement(Button, {
						LayoutOrder = 1,
						text = p1.sendButtonText,
						onActivated = p1.submit,
						isLoading = p1.isSubmitting,
						isDisabled = not p1.hasSelection,
						variant = ButtonVariant.Emphasis,
						size = InputSize.Medium,
						width = UDim.new(1, 0),
						testId = `{TestId}-send`
					})
				})
			})
		}),
		AddErrorDialog = if p1.hasAddError then ReactModule.createElement(PrivateInviteAddErrorDialogModule, { onDismiss = p1.onDismissAddError }) else nil,
		AddRejectedDialog = if #p1.rejectedInviteUserIds > 0 then ReactModule.createElement(PrivateInviteAddRejectedDialogModule, {
			rejectedUserIds = p1.rejectedInviteUserIds,
			onDismiss = p1.onDismissRejectedInvite
		}) else nil
	})
end