-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:55 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local parent_1 = parent.Parent
local core = parent_1.Core
local reactModule = require(parent_1.Parent.React)
local imagesModule = require(parent.ImageSet.Images)
local imageSetComponentModule = require(core.ImageSet.ImageSetComponent)
local useStyleModule = require(core.Style.useStyle)
local _ = require(parent.Style.Fonts)

local function renderStatItem(p0, p1, p2, p3) --[[ line: 26 ]]
	-- upvalues: reactModule (ref), imageSetComponentModule (ref), imagesModule (ref)
	local tokens = p3.Tokens
	local font = p3.Font
	local var5 = font.BaseSize * font.Body.RelativeSize
	local var6 = var5 + tokens.Global.Size_100
	local space25 = tokens.Global.Space_25
	local small = tokens.Semantic.Icon.Size.Small
	local default = tokens.Semantic.Color.Text.Default
	local default_1 = tokens.Semantic.Color.Text.Default
	
	return reactModule.createElement("Frame", p0, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, space25)
		}),
		Icon = reactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.fromOffset(small, small),
			Image = imagesModule[p1],
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
			Text = p2,
			Font = font.Body.Font,
			TextSize = var5,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextColor3 = default_1.Color3,
			TextTransparency = default_1.Transparency
		}, {
			UISizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(tokens.Global.Size_700, 1e999) }),
			UiTextSizeConstraint = reactModule.createElement("UITextSizeConstraint", { MaxTextSize = var6 })
		})
	})
end

return function(p4) --[[ line: 78 | named "StatGroup" ]]
	-- upvalues: useStyleModule (ref), reactModule (ref), renderStatItem (ref)
	local var7 = useStyleModule()
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		AutomaticSize = Enum.AutomaticSize.X
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, var7.Tokens.Global.Space_100)
		}),
		RatingStats = renderStatItem({
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.fromScale(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY
		}, "icons/status/games/rating_small", p4.ratingText, var7),
		PlayingStats = if p4.playingText ~= nil then nil else renderStatItem({
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.fromScale(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY
		}, "icons/status/games/people-playing_small", p4.playingText, var7)
	})
end