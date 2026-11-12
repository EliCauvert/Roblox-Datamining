local Parent = script:FindFirstAncestor("ItemDetails").Parent
local ReactModule = require(Parent.React)
local Focusable = require(Parent.RoactGamepad).Focusable
local VerifiedBadgesModule = require(Parent.VerifiedBadges)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local Skeleton = FoundationModule.Skeleton
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local IconsNavigationPushRightSmall = UIBloxModule.App.ImageSet.Images["icons/navigation/pushRight_small"] or "LuaApp/icons/GameDetails/navigation/pushRight_small"
local _Vector2 = Vector2.new(14, 14)
local _UDim2 = UDim2.new(0.3, 0, 0.8, 0)

return (ReactModule.forwardRef(function(Label, Ref)
	-- upvalues: UseStyleFunction (copy), UseSelectionCursorFunction (copy), CursorKind (copy), _Vector2 (copy), Focusable (copy), ReactModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), VerifiedBadgesModule (copy), Skeleton (copy), _UDim2 (copy), ImageSetLabel (copy), IconsNavigationPushRightSmall (copy)
	local LayoutOrder = Label.LayoutOrder
	local InfoName = Label.infoName
	local InfoData = Label.infoData
	local OnActivate = Label.onActivate
	local HasVerifiedBadge = Label.hasVerifiedBadge
	local IsLoading = Label.isLoading
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local UseSelectionCursorResult = UseSelectionCursorFunction(CursorKind.RoundedRect)
	local Color = Theme.TextEmphasis.Color
	local ScaledBaseSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Body.RelativeSize
	local v1 = -11 - _Vector2.X
	local HasRef = Ref ~= nil
	
	return ReactModule.createElement(if HasRef then Focusable.ImageButton else "ImageButton", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = LayoutOrder,
		Size = UDim2.new(1, 0, 0, if Label.hideDivider then 52 else 53),
		[ReactModule.Event.Activated] = OnActivate,
		NextSelectionUp = Label.NextSelectionUp,
		NextSelectionDown = Label.NextSelectionDown,
		NextSelectionLeft = Label.NextSelectionLeft,
		NextSelectionRight = Label.NextSelectionRight,
		ref = Ref,
		SelectionImageObject = HasRef and UseSelectionCursorResult or nil,
		Selectable = Label.Selectable
	}, {
		Container = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, if Label.hideDivider then 0 else -1)
		}, {
			InfoNameTextLabel = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				Font = if FoundationFontFaceMigration then nil else UseStyleResultFont.Body.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.BodyLarge.Font) else nil,
				Size = UDim2.new(0.5, 0, 1, 0),
				Text = InfoName,
				TextColor3 = Theme.TextDefault.Color,
				TextSize = ScaledBaseSize,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center
			}),
			InfoDataWithEmoji = not IsLoading and HasVerifiedBadge and ReactModule.createElement(VerifiedBadgesModule.EmojiWrapper, {
				emoji = VerifiedBadgesModule.emoji.verified,
				font = if OnActivate then UseStyleResultFont.Header2.Font else UseStyleResultFont.Body.Font,
				anchorPoint = Vector2.new(1, 0),
				position = UDim2.new(1, if OnActivate then v1 else 0, 0, 0),
				size = UDim2.new(0.5, 0, 1, 0),
				automaticSize = Enum.AutomaticSize.None,
				horizontalAlignment = Enum.HorizontalAlignment.Right,
				verticalAlignment = Enum.VerticalAlignment.Center
			}, {
				InfoDataTextLabel = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					Font = if FoundationFontFaceMigration then nil else OnActivate and UseStyleResultFont.Header2.Font or UseStyleResultFont.Body.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(if OnActivate then UseStyleResult.Tokens.Typography.TitleLarge.Font else UseStyleResult.Tokens.Typography.BodyLarge.Font) else nil,
					Size = UDim2.new(0, 0, 1, 0),
					Text = InfoData,
					TextColor3 = if OnActivate then Theme.TextEmphasis.Color else Theme.TextDefault.Color,
					TextSize = ScaledBaseSize,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextScaled = Label.TextScaled,
					AutomaticSize = Enum.AutomaticSize.X,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			}),
			InfoDataTextLabel = not IsLoading and not HasVerifiedBadge and ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, if OnActivate then v1 else 0, 0, 0),
				Font = if FoundationFontFaceMigration then nil elseif OnActivate then UseStyleResultFont.Header2.Font else UseStyleResultFont.Body.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(if OnActivate then UseStyleResult.Tokens.Typography.TitleLarge.Font else UseStyleResult.Tokens.Typography.BodyLarge.Font) else nil,
				Size = UDim2.new(0.5, 0, 1, 0),
				Text = InfoData,
				TextColor3 = if OnActivate then Theme.TextEmphasis.Color else Theme.TextDefault.Color,
				TextSize = ScaledBaseSize,
				TextTruncate = Enum.TextTruncate.AtEnd,
				TextScaled = Label.TextScaled,
				TextXAlignment = Enum.TextXAlignment.Right,
				TextYAlignment = Enum.TextYAlignment.Center
			}, {
				TextSizeConstraint = Label.TextScaled and ReactModule.createElement("UITextSizeConstraint", { MaxTextSize = ScaledBaseSize })
			}),
			LoadingShimmer = IsLoading and ReactModule.createElement(Skeleton, {
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, 0, 0.5, 0),
				Size = _UDim2
			}),
			LinkIcon = OnActivate and ReactModule.createElement(ImageSetLabel, {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, 0, 0.5, 0),
				Size = UDim2.fromOffset(_Vector2.X, _Vector2.Y),
				Image = IconsNavigationPushRightSmall,
				ImageColor3 = Color
			})
		}),
		Divider = not Label.hideDivider and ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundColor3 = Theme.Divider.Color,
			BackgroundTransparency = Theme.Divider.Transparency,
			Size = UDim2.new(1, 0, 0, 1),
			Position = UDim2.new(0, 0, 1, -1)
		})
	})
end))