local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local pickedUserListModule = require(buildExperience.Components.UserPicker.PickedUserList)
local badge = foundationModule.Badge
local button = foundationModule.Button
local list = foundationModule.List
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize

return function(p1)
	-- upvalues: reactModule (ref), list (ref), view (ref), text (ref), badge (ref), button (ref), buttonVariant (ref), inputSize (ref), pickedUserListModule (ref)
	local testId = p1.testId or "private-invites-management"
	local isInviteDisabled = p1.isInviteDisabled
	local var1 = reactModule.createElement(list.Item, {
		LayoutOrder = 1,
		title = p1.inviteButtonText,
		onActivated = if isInviteDisabled then nil else p1.onOpenInvitePicker,
		testId = `{testId}-invite-button`
	})
	
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		testId = testId
	}, {
		Header = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "row align-y-center gap-small size-full-0 auto-y"
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "fill auto-y text-title-large text-align-x-left content-default",
				Text = p1.title
			}),
			Count = reactModule.createElement(badge, {
				LayoutOrder = 2,
				text = p1.countText,
				testId = `{testId}-count`
			})
		}),
		Body = reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-muted",
			Text = p1.subtitle
		}),
		ShareLink = reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "row align-y-center gap-small size-full-0 auto-y padding-large stroke-standard stroke-default radius-large bg-surface-0",
			testId = `{testId}-share-link`
		}, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "fill auto-y text-title-medium text-wrap text-align-x-left content-default",
				Text = p1.shareWithFriendsTitle
			}),
			Share = reactModule.createElement(button, {
				LayoutOrder = 2,
				text = p1.shareWithFriendsButtonText,
				onActivated = p1.onShareLink,
				variant = buttonVariant.Standard,
				size = inputSize.Small,
				testId = `{testId}-share-link-button`
			})
		}),
		Table = reactModule.createElement(pickedUserListModule, {
			layoutOrder = 4,
			userIds = p1.userIds,
			onRemove = p1.onRemove,
			removingUserIds = p1.removingUserIds,
			header = if isInviteDisabled then reactModule.createElement("CanvasGroup", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				GroupTransparency = 0.5,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, { Item = var1 }) else var1,
			testId = `{testId}-list`
		})
	})
end