local parent = script.Parent.Parent
local parent_1 = parent.Parent
local core = parent_1.Core
local reactModule = require(parent_1.Parent.React)
local imagesModule = require(parent.ImageSet.Images)
local imageSetComponentModule = require(core.ImageSet.ImageSetComponent)
local useStyleModule = require(core.Style.useStyle)
local _ = require(parent.Style.Fonts)
local UIBloxConfigModule = require(parent_1.UIBloxConfig)

local function renderStatItem(p1, p2, p3, p4)
	-- upvalues: UIBloxConfigModule (ref), reactModule (ref), imageSetComponentModule (ref), imagesModule (ref)
	local tokens = p4.Tokens
	local font = p4.Font
	local var1 = font.BaseSize * font.Body.RelativeSize
	local var2 = var1 + (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_200 else tokens.Global.Size_100)
	local var3 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_50 else tokens.Global.Space_25
	local var4 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_400 else tokens.Semantic.Icon.Size.Small
	local var5 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Default else tokens.Semantic.Color.Text.Default
	local var6 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Default else tokens.Semantic.Color.Text.Default
	
	return reactModule.createElement("Frame", p1, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, var3)
		}),
		Icon = reactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.fromOffset(var4, var4),
			Image = imagesModule[p2],
			ImageTransparency = var5.Transparency,
			ImageColor3 = var5.Color3,
			AnchorPoint = Vector2.new(0, 0.5)
		}),
		Label = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = false,
			LayoutOrder = 2,
			Size = UDim2.fromScale(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			Text = p3,
			Font = font.Body.Font,
			TextSize = var1,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextColor3 = var6.Color3,
			TextTransparency = var6.Transparency
		}, {
			UISizeConstraint = reactModule.createElement("UISizeConstraint", {
				MaxSize = Vector2.new(if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_1400 else tokens.Global.Size_700, 1e999)
			}),
			UiTextSizeConstraint = reactModule.createElement("UITextSizeConstraint", { MaxTextSize = var2 })
		})
	})
end

return function(p1)
	-- upvalues: useStyleModule (ref), UIBloxConfigModule (ref), reactModule (ref), renderStatItem (ref)
	local var1 = useStyleModule()
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		AutomaticSize = Enum.AutomaticSize.X
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var1.Tokens.Size.Size_200 else var1.Tokens.Global.Space_100)
		}),
		RatingStats = renderStatItem({
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.fromScale(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY
		}, "icons/status/games/rating_small", p1.ratingText, var1),
		PlayingStats = if p1.playingText ~= nil then nil else renderStatItem({
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.fromScale(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY
		}, "icons/status/games/people-playing_small", p1.playingText, var1)
	})
end