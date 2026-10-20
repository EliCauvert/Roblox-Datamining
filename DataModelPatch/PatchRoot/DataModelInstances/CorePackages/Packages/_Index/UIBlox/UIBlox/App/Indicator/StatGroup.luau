local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local Core = Parent1.Core
local ReactModule = require(Parent1.Parent.React)
local ImagesModule = require(Parent.ImageSet.Images)
local ImageSetComponentModule = require(Core.ImageSet.ImageSetComponent)
local UseStyleModule = require(Core.Style.useStyle)
local _ = require(Parent.Style.Fonts)

local function renderStatItem(p1, p2, Text, p3)
	-- upvalues: ReactModule (copy), ImageSetComponentModule (copy), ImagesModule (copy)
	local Tokens = p3.Tokens
	local _Font = p3.Font
	local ScaledBaseSize = _Font.BaseSize * _Font.Body.RelativeSize
	local Small = Tokens.Semantic.Icon.Size.Small
	local Default = Tokens.Semantic.Color.Text.Default
	local Default1 = Tokens.Semantic.Color.Text.Default
	
	return ReactModule.createElement("Frame", p1, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, Tokens.Global.Space_25)
		}),
		Icon = ReactModule.createElement(ImageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.fromOffset(Small, Small),
			Image = ImagesModule[p2],
			ImageTransparency = Default.Transparency,
			ImageColor3 = Default.Color3,
			AnchorPoint = Vector2.new(0, 0.5)
		}),
		Label = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = false,
			LayoutOrder = 2,
			Size = UDim2.fromScale(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			Text = Text,
			Font = _Font.Body.Font,
			TextSize = ScaledBaseSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextColor3 = Default1.Color3,
			TextTransparency = Default1.Transparency
		}, {
			UISizeConstraint = ReactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(Tokens.Global.Size_700, 1e999) }),
			UiTextSizeConstraint = ReactModule.createElement("UITextSizeConstraint", { MaxTextSize = ScaledBaseSize + Tokens.Global.Size_100 })
		})
	})
end

return function(p1)
	-- upvalues: UseStyleModule (copy), ReactModule (copy), renderStatItem (copy)
	local UseStyleModuleResult = UseStyleModule()
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		AutomaticSize = Enum.AutomaticSize.X
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, UseStyleModuleResult.Tokens.Global.Space_100)
		}),
		RatingStats = renderStatItem({
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.fromScale(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY
		}, "icons/status/games/rating_small", p1.ratingText, UseStyleModuleResult),
		PlayingStats = if p1.playingText == nil then nil else renderStatItem({
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.fromScale(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY
		}, "icons/status/games/people-playing_small", p1.playingText, UseStyleModuleResult)
	})
end