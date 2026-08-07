local parent = script:FindFirstAncestor("UserList").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local radius = foundationModule.Enums.Radius
local skeleton = foundationModule.Skeleton
local avatar = foundationModule.Avatar
local inputSize = foundationModule.Enums.InputSize
local useTokens = foundationModule.Hooks.useTokens

return function(p0) --[[ line: 26 | named "UserRow" ]]
	-- upvalues: useTokens (ref), reactModule (ref), avatar (ref), inputSize (ref), foundationModule (ref), skeleton (ref), radius (ref)
	local var2 = if p0.displayName ~= "" then p0.username == "" else true
	local displayName = p0.displayName
	local username = `@{p0.username}`
	local var4 = tonumber(p0.userId)
	local var5 = useTokens()
	
	return if var4 == nil then nil else reactModule.createElement("TextButton", {
		Size = UDim2.new(1, 0, 0, 48),
		BackgroundTransparency = 1,
		Text = "",
		BorderSizePixel = 0,
		[reactModule.Event.Activated] = p0.onActivated
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 12)
		}),
		Avatar = reactModule.createElement(avatar, {
			LayoutOrder = 1,
			userId = var4,
			size = inputSize.Large,
			userPresence = p0.userPresence,
			backgroundStyle = var5.Color.Shift.Shift_300
		}),
		UserInfo = reactModule.createElement(foundationModule.View, {
			tag = "size-full-0 auto-y col gap-xsmall align-x-left align-y-center",
			LayoutOrder = 2
		}, {
			DisplayName = if not var2 then reactModule.createElement(foundationModule.Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-title-medium content-emphasis text-align-x-left",
				Text = displayName
			}) else nil,
			Username = if not var2 then reactModule.createElement(foundationModule.Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-medium content-default text-align-x-left",
				Text = username
			}) else nil,
			ShimmerDisplayName = if var2 then reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(0.8, 0, 0, var5.Typography.TitleMedium.FontSize + var5.Typography.BodyMedium.FontSize),
				radius = radius.Circle
			}) else nil
		})
	})
end