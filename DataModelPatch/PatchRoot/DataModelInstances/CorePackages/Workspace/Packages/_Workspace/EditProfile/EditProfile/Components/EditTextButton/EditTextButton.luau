local EditProfile = script:FindFirstAncestor("EditProfile")
local Parent = EditProfile.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local Radius = FoundationModule.Enums.Radius
local Skeleton = FoundationModule.Skeleton
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local FFlagMoveInExperienceModeToEditProfile = require(Parent.SharedFlags).FFlagMoveInExperienceModeToEditProfile
local FFlagEditProfileFixFocusNavigationModule = require(EditProfile.Flags.FFlagEditProfileFixFocusNavigation)

return function(p1)
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), FFlagMoveInExperienceModeToEditProfile (copy), StyledTextLabel (copy), FFlagEditProfileFixFocusNavigationModule (copy), ImageSetLabel (copy), Images (copy), Skeleton (copy), Radius (copy)
	local UseStyleResult = UseStyleFunction()
	local UseStyleResultFont = UseStyleResult.Font
	local Theme = UseStyleResult.Theme
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = p1.layoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = Color3.new(0, 1, 0),
		Size = UDim2.new(1, 0, 0, 0)
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 12)
		}),
		Title = if FFlagMoveInExperienceModeToEditProfile and p1.title then ReactModule.createElement(StyledTextLabel, {
			layoutOrder = 1,
			text = p1.title,
			fontStyle = UseStyleResultFont.Header2,
			colorStyle = Theme.TextEmphasis
		}) elseif FFlagMoveInExperienceModeToEditProfile then nil else ReactModule.createElement(StyledTextLabel, {
			layoutOrder = 1,
			text = p1.title,
			fontStyle = UseStyleResultFont.Header2,
			colorStyle = Theme.TextEmphasis
		}),
		Description = ReactModule.createElement(StyledTextLabel, {
			layoutOrder = 2,
			lineHeight = 1,
			text = p1.description,
			fontStyle = UseStyleResultFont.CaptionBody,
			colorStyle = Theme.TextDefault,
			automaticSize = Enum.AutomaticSize.Y,
			size = UDim2.new(1, 0, 0, 0)
		}),
		EditButton = if p1.shouldShimmerName then nil else ReactModule.createElement("ImageButton", {
			AutomaticSize = if p1.expandSizing then Enum.AutomaticSize.Y else nil,
			LayoutOrder = 3,
			BackgroundTransparency = 0,
			Size = UDim2.new(1, 0, 0, 52),
			BackgroundColor3 = Theme.BackgroundUIDefault.Color,
			[ReactModule.Event.Activated] = p1.onActivated,
			ref = if FFlagEditProfileFixFocusNavigationModule then p1.forwardRef else nil
		}, {
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
			InititialTextContainer = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -40, 0, 28),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				InitialText = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextWrapped = true,
					Size = UDim2.new(1, 0, 1, 0),
					TextYAlignment = Enum.TextYAlignment.Center,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Body.RelativeSize,
					AutomaticSize = Enum.AutomaticSize.XY,
					Text = p1.placeHolderText,
					Font = UseStyleResultFont.Body.Font,
					TextColor3 = Theme.TextEmphasis.Color,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextTransparency = if p1.transparentText then 0.5 else nil
				}, {
					UISizeConstraint = ReactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(1e999, 60) })
				})
			}),
			Padding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 12),
				PaddingRight = UDim.new(0, 12),
				PaddingBottom = UDim.new(0, 12),
				PaddingLeft = UDim.new(0, 12)
			}),
			Icon = if FFlagMoveInExperienceModeToEditProfile and p1.onActivated then ReactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0.5),
				Image = Images["icons/actions/edit/edit"],
				ImageColor3 = Theme.IconEmphasis.Color,
				Size = UDim2.new(0, 28, 0, 28),
				Position = UDim2.new(1, 0, 0, 12)
			}) elseif FFlagMoveInExperienceModeToEditProfile then nil else ReactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0.5),
				Image = Images["icons/actions/edit/edit"],
				ImageColor3 = Theme.IconEmphasis.Color,
				Size = UDim2.new(0, 28, 0, 28),
				Position = UDim2.new(1, 0, 0, 12)
			})
		}),
		ShimmerButton = if p1.shouldShimmerName then ReactModule.createElement(Skeleton, {
			LayoutOrder = 3,
			Size = UDim2.new(1, 0, 0, 52),
			radius = Radius.Medium
		}) else nil
	})
end