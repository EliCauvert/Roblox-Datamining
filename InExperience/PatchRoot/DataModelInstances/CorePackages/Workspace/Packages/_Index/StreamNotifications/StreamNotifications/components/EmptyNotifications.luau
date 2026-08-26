local streamNotifications = script:FindFirstAncestor("StreamNotifications")
local parent = streamNotifications.Parent
local constantsModule = require(streamNotifications.constants)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useStyle = require(parent.UIBlox).Core.Style.useStyle

return function()
	-- upvalues: useStyle (ref), useLocalization (ref), constantsModule (ref), reactModule (ref)
	local var1 = useStyle()
	local font = var1.Font
	local var2 = useLocalization({ emptyText = constantsModule.Text.EmptyKey })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5)
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, constantsModule.DefaultPadding)
		}),
		reactModule.createElement("TextLabel", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Text = var2 and var2.emptyText,
			Font = font.Header1.Font,
			TextSize = font.BaseSize,
			TextColor3 = var1.Theme.TextDefault.Color,
			Size = UDim2.new(1, 0, 0, constantsModule.EmptyNotifications.LabelHeight)
		})
	})
end