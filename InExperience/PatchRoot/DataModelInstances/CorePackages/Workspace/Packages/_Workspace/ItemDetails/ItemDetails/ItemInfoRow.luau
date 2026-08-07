local parent = script:FindFirstAncestor("ItemDetails").Parent
local reactModule = require(parent.React)
local focusable = require(parent.RoactGamepad).Focusable
local verifiedBadgesModule = require(parent.VerifiedBadges)
local UIBloxModule = require(parent.UIBlox)
local skeleton = require(parent.Foundation).Skeleton
local useStyle = UIBloxModule.Core.Style.useStyle
local useSelectionCursor = UIBloxModule.App.SelectionImage.useSelectionCursor
local cursorKind = UIBloxModule.App.SelectionImage.CursorKind
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local pushRightSmall = UIBloxModule.App.ImageSet.Images["icons/navigation/pushRight_small"] or "LuaApp/icons/GameDetails/navigation/pushRight_small"
local vector2 = Vector2.new(14, 14)
local uDim2 = UDim2.new(0.3, 0, 0.8, 0)

return reactModule.forwardRef(function(p0, p1) --[[ line: 47 ]]
	-- upvalues: useStyle (ref), useSelectionCursor (ref), cursorKind (ref), vector2 (ref), focusable (ref), reactModule (ref), verifiedBadgesModule (ref), skeleton (ref), uDim2 (ref), imageSetLabel (ref), pushRightSmall (ref)
	local layoutOrder = p0.LayoutOrder
	local infoName = p0.infoName
	local infoData = p0.infoData
	local onActivate = p0.onActivate
	local hasVerifiedBadge = p0.hasVerifiedBadge
	local isLoading = p0.isLoading
	local var6 = useStyle()
	local theme = var6.Theme
	local font = var6.Font
	local var7 = useSelectionCursor(cursorKind.RoundedRect)
	local color = theme.TextEmphasis.Color
	local var8 = font.BaseSize * font.Body.RelativeSize
	local var9 = -11 - vector2.X
	local var10 = p1 ~= nil
	
	return reactModule.createElement(if var10 then focusable.ImageButton else "ImageButton", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = layoutOrder,
		Size = UDim2.new(1, 0, 0, if p0.hideDivider then 52 else 53),
		[reactModule.Event.Activated] = onActivate,
		NextSelectionUp = p0.NextSelectionUp,
		NextSelectionDown = p0.NextSelectionDown,
		NextSelectionLeft = p0.NextSelectionLeft,
		NextSelectionRight = p0.NextSelectionRight,
		ref = p1,
		SelectionImageObject = if var10 then var7 else nil,
		Selectable = p0.Selectable
	}, {
		Container = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, if p0.hideDivider then 0 else -1)
		}, {
			InfoNameTextLabel = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Font = font.Body.Font,
				Size = UDim2.new(0.5, 0, 1, 0),
				Text = infoName,
				TextColor3 = theme.TextDefault.Color,
				TextSize = var8,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center
			}),
			InfoDataWithEmoji = not isLoading and hasVerifiedBadge and reactModule.createElement(verifiedBadgesModule.EmojiWrapper, {
				emoji = verifiedBadgesModule.emoji.verified,
				font = if onActivate then font.Header2.Font else font.Body.Font,
				anchorPoint = Vector2.new(1, 0),
				position = UDim2.new(1, if onActivate then var9 else 0, 0, 0),
				size = UDim2.new(0.5, 0, 1, 0),
				automaticSize = Enum.AutomaticSize.None,
				horizontalAlignment = Enum.HorizontalAlignment.Right,
				verticalAlignment = Enum.VerticalAlignment.Center
			}, {
				InfoDataTextLabel = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					Font = if onActivate then font.Header2.Font else font.Body.Font,
					Size = UDim2.new(0, 0, 1, 0),
					Text = infoData,
					TextColor3 = if onActivate then theme.TextEmphasis.Color else theme.TextDefault.Color,
					TextSize = var8,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextScaled = p0.TextScaled,
					AutomaticSize = Enum.AutomaticSize.X,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			}),
			InfoDataTextLabel = not isLoading and not hasVerifiedBadge and reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, if onActivate then var9 else 0, 0, 0),
				Font = if onActivate then font.Header2.Font else font.Body.Font,
				Size = UDim2.new(0.5, 0, 1, 0),
				Text = infoData,
				TextColor3 = if onActivate then theme.TextEmphasis.Color else theme.TextDefault.Color,
				TextSize = var8,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextScaled = p0.TextScaled,
				TextXAlignment = Enum.TextXAlignment.Right,
				TextYAlignment = Enum.TextYAlignment.Center
			}, {
				TextSizeConstraint = p0.TextScaled and reactModule.createElement("UITextSizeConstraint", { MaxTextSize = var8 })
			}),
			LoadingShimmer = isLoading and reactModule.createElement(skeleton, {
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, 0, 0.5, 0),
				Size = uDim2
			}),
			LinkIcon = onActivate and reactModule.createElement(imageSetLabel, {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, 0, 0.5, 0),
				Size = UDim2.fromOffset(vector2.X, vector2.Y),
				Image = pushRightSmall,
				ImageColor3 = color
			})
		}),
		Divider = not p0.hideDivider and reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundColor3 = theme.Divider.Color,
			BackgroundTransparency = theme.Divider.Transparency,
			Size = UDim2.new(1, 0, 0, 1),
			Position = UDim2.new(0, 0, 1, -1)
		})
	})
end)