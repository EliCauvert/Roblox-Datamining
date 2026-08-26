local parent = script:FindFirstAncestor("UserList").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local radius = foundationModule.Enums.Radius
local skeleton = foundationModule.Skeleton
local avatar = foundationModule.Avatar
local inputSize = foundationModule.Enums.InputSize
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), avatar (ref), inputSize (ref), foundationModule (ref), skeleton (ref), radius (ref)
	local var1 = if p1.displayName ~= "" then p1.username == "" else true
	local displayName = p1.displayName
	local username = `@{p1.username}`
	local var2 = tonumber(p1.userId)
	local var3 = useTokens()
	
	return if var2 == nil then nil else reactModule.createElement("TextButton", {
		Size = UDim2.new(1, 0, 0, 48),
		BackgroundTransparency = 1,
		Text = "",
		BorderSizePixel = 0,
		[reactModule.Event.Activated] = p1.onActivated
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 12)
		}),
		Avatar = reactModule.createElement(avatar, {
			LayoutOrder = 1,
			userId = var2,
			size = inputSize.Large,
			userPresence = p1.userPresence,
			backgroundStyle = var3.Color.Shift.Shift_300
		}),
		UserInfo = reactModule.createElement(foundationModule.View, {
			tag = "size-full-0 auto-y col gap-xsmall align-x-left align-y-center",
			LayoutOrder = 2
		}, {
			DisplayName = if not var1 then reactModule.createElement(foundationModule.Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-title-medium content-emphasis text-align-x-left",
				Text = displayName
			}) else nil,
			Username = if not var1 then reactModule.createElement(foundationModule.Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-medium content-default text-align-x-left",
				Text = username
			}) else nil,
			ShimmerDisplayName = if var1 then reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(0.8, 0, 0, var3.Typography.TitleMedium.FontSize + var3.Typography.BodyMedium.FontSize),
				radius = radius.Circle
			}) else nil
		})
	})
end