local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local radius = foundationModule.Enums.Radius
local skeleton = foundationModule.Skeleton
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local useStyle = UIBloxModule.Core.Style.useStyle
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local fFlagMoveInExperienceModeToEditProfile = require(parent.SharedFlags).FFlagMoveInExperienceModeToEditProfile
local fFlagEditProfileFixFocusNavigationModule = require(editProfile.Flags.FFlagEditProfileFixFocusNavigation)

return function(p0) --[[ line: 37 | named "EditTextButton" ]]
	-- upvalues: useStyle (ref), reactModule (ref), fFlagMoveInExperienceModeToEditProfile (ref), styledTextLabel (ref), fFlagEditProfileFixFocusNavigationModule (ref), imageSetLabel (ref), images (ref), skeleton (ref), radius (ref)
	local createElement_1
	local var5 = useStyle()
	local font = var5.Font
	local theme = var5.Theme
	local createElement = reactModule.createElement
	local var6 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = p0.layoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = Color3.new(0, 1, 0),
		Size = UDim2.new(1, 0, 0, 0)
	}
	local t_1 = {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 12)
		}),
		Title = if fFlagMoveInExperienceModeToEditProfile and p0.title or not fFlagMoveInExperienceModeToEditProfile then reactModule.createElement(styledTextLabel, {
			layoutOrder = 1,
			text = p0.title,
			fontStyle = font.Header2,
			colorStyle = theme.TextEmphasis
		}) else nil,
		Description = reactModule.createElement(styledTextLabel, {
			layoutOrder = 2,
			lineHeight = 1,
			text = p0.description,
			fontStyle = font.CaptionBody,
			colorStyle = theme.TextDefault,
			automaticSize = Enum.AutomaticSize.Y,
			size = UDim2.new(1, 0, 0, 0)
		})
	}
	
	if p0.shouldShimmerName then
		createElement_1 = nil
	else
		createElement_1 = reactModule.createElement
		createElement_1 = createElement_1("ImageButton", {
			AutomaticSize = if p0.expandSizing then Enum.AutomaticSize.Y else nil,
			LayoutOrder = 3,
			BackgroundTransparency = 0,
			Size = UDim2.new(1, 0, 0, 52),
			BackgroundColor3 = theme.BackgroundUIDefault.Color,
			[reactModule.Event.Activated] = p0.onActivated,
			ref = if fFlagEditProfileFixFocusNavigationModule then p0.forwardRef else nil
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
			InititialTextContainer = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -40, 0, 28),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				InitialText = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextWrapped = true,
					Size = UDim2.new(1, 0, 1, 0),
					TextYAlignment = Enum.TextYAlignment.Center,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextSize = font.BaseSize * font.Body.RelativeSize,
					AutomaticSize = Enum.AutomaticSize.XY,
					Text = p0.placeHolderText,
					Font = font.Body.Font,
					TextColor3 = theme.TextEmphasis.Color,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextTransparency = if p0.transparentText then 0.5 else nil
				}, {
					UISizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(1e999, 60) })
				})
			}),
			Padding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 12),
				PaddingRight = UDim.new(0, 12),
				PaddingBottom = UDim.new(0, 12),
				PaddingLeft = UDim.new(0, 12)
			}),
			Icon = if fFlagMoveInExperienceModeToEditProfile and p0.onActivated or not fFlagMoveInExperienceModeToEditProfile then reactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0.5),
				Image = images["icons/actions/edit/edit"],
				ImageColor3 = theme.IconEmphasis.Color,
				Size = UDim2.new(0, 28, 0, 28),
				Position = UDim2.new(1, 0, 0, 12)
			}) else nil
		})
	end
	t_1.EditButton = createElement_1
	t_1.ShimmerButton = if p0.shouldShimmerName then reactModule.createElement(skeleton, {
		LayoutOrder = 3,
		Size = UDim2.new(1, 0, 0, 52),
		radius = radius.Medium
	}) else nil
	
	return createElement(var6, t, t_1)
end