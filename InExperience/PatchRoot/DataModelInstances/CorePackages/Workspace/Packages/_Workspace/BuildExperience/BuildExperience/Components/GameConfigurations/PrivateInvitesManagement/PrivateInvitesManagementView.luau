local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local PickedUserListModule = require(BuildExperience.Components.UserPicker.PickedUserList)
local Badge = FoundationModule.Badge
local List = FoundationModule.List
local Text = FoundationModule.Text
local View = FoundationModule.View

return function(p1) --[[ Line: 33 | Named "PrivateInvitesManagementView" ]]
	-- upvalues: ReactModule (copy), List (copy), View (copy), Text (copy), Badge (copy), PickedUserListModule (copy)
	local TestId = p1.testId or "private-invites-management"
	local IsInviteDisabled = p1.isInviteDisabled
	local Element = ReactModule.createElement(List.Item, {
		LayoutOrder = 1,
		title = p1.inviteButtonText,
		onActivated = if IsInviteDisabled then nil else p1.onOpenInvitePicker,
		testId = `{TestId}-invite-button`
	})
	
	return ReactModule.createElement(View, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		testId = TestId
	}, {
		Header = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "row align-y-center gap-small size-full-0 auto-y"
		}, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "fill auto-y text-title-large text-align-x-left content-default",
				Text = p1.title
			}),
			Count = ReactModule.createElement(Badge, {
				LayoutOrder = 2,
				text = p1.countText,
				testId = `{TestId}-count`
			})
		}),
		Body = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-muted",
			Text = p1.subtitle
		}),
		Table = ReactModule.createElement(PickedUserListModule, {
			layoutOrder = 4,
			userIds = p1.userIds,
			onRemove = p1.onRemove,
			removingUserIds = p1.removingUserIds,
			header = if IsInviteDisabled then ReactModule.createElement("CanvasGroup", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				GroupTransparency = 0.5,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, { Item = Element }) else Element,
			testId = `{TestId}-list`
		})
	})
end