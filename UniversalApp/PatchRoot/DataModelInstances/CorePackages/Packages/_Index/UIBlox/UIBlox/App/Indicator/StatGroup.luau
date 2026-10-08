local parent = script.Parent.Parent
local parent_1 = parent.Parent
local core = parent_1.Core
local parent_2 = parent_1.Parent
local reactModule = require(parent_2.React)
local foundationModule = require(parent_2.Foundation)
local normalizeFontFace = foundationModule.Utility.normalizeFontFace
local imagesModule = require(parent.ImageSet.Images)
local imageSetComponentModule = require(core.ImageSet.ImageSetComponent)
local useStyleModule = require(core.Style.useStyle)
local _ = require(parent.Style.Fonts)
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration

local function renderStatItem(p1, p2, p3, p4)
	-- upvalues: reactModule (ref), imageSetComponentModule (ref), imagesModule (ref), foundationFontFaceMigration (ref), normalizeFontFace (ref)
	local tokens = p4.Tokens
	local font = p4.Font
	local var1 = font.BaseSize * font.Body.RelativeSize
	local var2 = var1 + tokens.Size.Size_200
	local size50 = tokens.Size.Size_50
	local size400 = tokens.Size.Size_400
	local default = tokens.Color.Content.Default
	local default_1 = tokens.Color.Content.Default
	
	return reactModule.createElement("Frame", p1, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, size50)
		}),
		Icon = reactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.fromOffset(size400, size400),
			Image = imagesModule[p2],
			ImageTransparency = default.Transparency,
			ImageColor3 = default.Color3,
			AnchorPoint = Vector2.new(0, 0.5)
		}),
		Label = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = false,
			LayoutOrder = 2,
			Size = UDim2.fromScale(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			Text = p3,
			Font = if foundationFontFaceMigration then nil else font.Body.Font,
			FontFace = if foundationFontFaceMigration then normalizeFontFace(font.Body.Font) else nil,
			TextSize = var1,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextColor3 = default_1.Color3,
			TextTransparency = default_1.Transparency
		}, {
			UISizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(tokens.Size.Size_1400, 1e999) }),
			UiTextSizeConstraint = reactModule.createElement("UITextSizeConstraint", { MaxTextSize = var2 })
		})
	})
end

return function(p1)
	-- upvalues: useStyleModule (ref), reactModule (ref), renderStatItem (ref)
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
			Padding = UDim.new(0, var1.Tokens.Size.Size_200)
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