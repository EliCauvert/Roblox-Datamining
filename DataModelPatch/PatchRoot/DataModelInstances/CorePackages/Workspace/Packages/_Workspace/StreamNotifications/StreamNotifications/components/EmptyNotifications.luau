local StreamNotifications = script:FindFirstAncestor("StreamNotifications")
local Parent = StreamNotifications.Parent
local ConstantsModule = require(StreamNotifications.constants)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle

return function()
	-- upvalues: UseStyleFunction (copy), UseLocalizationFunction (copy), ConstantsModule (copy), ReactModule (copy)
	local UseStyleResult = UseStyleFunction()
	local UseStyleResultFont = UseStyleResult.Font
	local HeaderFont = UseStyleResultFont.Header1.Font
	local BaseSize = UseStyleResultFont.BaseSize
	local UseLocalizationResult = UseLocalizationFunction({ emptyText = ConstantsModule.Text.EmptyKey })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5)
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, ConstantsModule.DefaultPadding)
		}),
		ReactModule.createElement("TextLabel", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Text = UseLocalizationResult and UseLocalizationResult.emptyText,
			Font = HeaderFont,
			TextSize = BaseSize,
			TextColor3 = UseStyleResult.Theme.TextDefault.Color,
			Size = UDim2.new(1, 0, 0, ConstantsModule.EmptyNotifications.LabelHeight)
		})
	})
end