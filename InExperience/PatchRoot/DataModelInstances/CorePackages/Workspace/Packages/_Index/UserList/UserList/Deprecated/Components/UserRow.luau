local Parent = script:FindFirstAncestor("UserList").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Radius = FoundationModule.Enums.Radius
local Skeleton = FoundationModule.Skeleton
local Avatar = FoundationModule.Avatar
local InputSize = FoundationModule.Enums.InputSize
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1) --[[ Line: 26 | Named "UserRow" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Avatar (copy), InputSize (copy), FoundationModule (copy), Skeleton (copy), Radius (copy)
	local IsDisplayNameMatch: boolean = p1.displayName == "" or p1.username == ""
	local DisplayName = p1.displayName
	local Text: string = `@{p1.username}`
	local Number: number? = tonumber(p1.userId)
	local UseTokensResult = UseTokensFunction()
	
	return if Number == nil then nil else ReactModule.createElement("TextButton", {
		Size = UDim2.new(1, 0, 0, 48),
		BackgroundTransparency = 1,
		Text = "",
		BorderSizePixel = 0,
		[ReactModule.Event.Activated] = p1.onActivated
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 12)
		}),
		Avatar = ReactModule.createElement(Avatar, {
			LayoutOrder = 1,
			userId = Number,
			size = InputSize.Large,
			userPresence = p1.userPresence,
			backgroundStyle = UseTokensResult.Color.Shift.Shift_300
		}),
		UserInfo = ReactModule.createElement(FoundationModule.View, {
			tag = "size-full-0 auto-y col gap-xsmall align-x-left align-y-center",
			LayoutOrder = 2
		}, {
			DisplayName = if IsDisplayNameMatch then nil else ReactModule.createElement(FoundationModule.Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-title-medium content-emphasis text-align-x-left",
				Text = DisplayName
			}),
			Username = if IsDisplayNameMatch then nil else ReactModule.createElement(FoundationModule.Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-medium content-default text-align-x-left",
				Text = Text
			}),
			ShimmerDisplayName = if IsDisplayNameMatch then ReactModule.createElement(Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(0.8, 0, 0, UseTokensResult.Typography.TitleMedium.FontSize + UseTokensResult.Typography.BodyMedium.FontSize),
				radius = Radius.Circle
			}) else nil
		})
	})
end