local parent = script.Parent.Parent
local parent_1 = parent.Parent
local core = parent_1.Core
local reactModule = require(parent_1.Parent.React)
local imagesModule = require(parent.ImageSet.Images)
local imageSetComponentModule = require(core.ImageSet.ImageSetComponent)
local useStyleModule = require(core.Style.useStyle)
local _ = require(parent.Style.Fonts)
local UIBloxConfigModule = require(parent_1.UIBloxConfig)

local function renderStatItem(p0, p1, p2, p3) --[[ line: 28 ]]
	-- upvalues: UIBloxConfigModule (ref), reactModule (ref), imageSetComponentModule (ref), imagesModule (ref)
	local tokens = p3.Tokens
	local font = p3.Font
	local var6 = font.BaseSize * font.Body.RelativeSize
	local var7 = var6 + (if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_200 else tokens.Global.Size_100)
	local var8 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_50 else tokens.Global.Space_25
	local var9 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_400 else tokens.Semantic.Icon.Size.Small
	local var10 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Default else tokens.Semantic.Color.Text.Default
	local var11 = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Color.Content.Default else tokens.Semantic.Color.Text.Default
	
	return reactModule.createElement("Frame", p0, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, var8)
		}),
		Icon = reactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.fromOffset(var9, var9),
			Image = imagesModule[p1],
			ImageTransparency = var10.Transparency,
			ImageColor3 = var10.Color3,
			AnchorPoint = Vector2.new(0, 0.5)
		}),
		Label = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = false,
			LayoutOrder = 2,
			Size = UDim2.fromScale(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			Text = p2,
			Font = font.Body.Font,
			TextSize = var6,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextColor3 = var11.Color3,
			TextTransparency = var11.Transparency
		}, {
			UISizeConstraint = reactModule.createElement("UISizeConstraint", {
				MaxSize = Vector2.new(if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then tokens.Size.Size_1400 else tokens.Global.Size_700, 1e999)
			}),
			UiTextSizeConstraint = reactModule.createElement("UITextSizeConstraint", { MaxTextSize = var7 })
		})
	})
end

return function(p4) --[[ line: 98 | named "StatGroup" ]]
	-- upvalues: useStyleModule (ref), UIBloxConfigModule (ref), reactModule (ref), renderStatItem (ref)
	local var12 = useStyleModule()
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		AutomaticSize = Enum.AutomaticSize.X
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var12.Tokens.Size.Size_200 else var12.Tokens.Global.Space_100)
		}),
		RatingStats = renderStatItem({
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.fromScale(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY
		}, "icons/status/games/rating_small", p4.ratingText, var12),
		PlayingStats = if p4.playingText ~= nil then nil else renderStatItem({
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.fromScale(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY
		}, "icons/status/games/people-playing_small", p4.playingText, var12)
	})
end