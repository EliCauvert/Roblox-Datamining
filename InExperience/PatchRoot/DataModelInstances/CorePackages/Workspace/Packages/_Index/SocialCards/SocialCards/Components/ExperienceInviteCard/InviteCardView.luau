local Parent = script:FindFirstAncestor("SocialCards").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Image = FoundationModule.Image
local Icon = FoundationModule.Icon
local Button = FoundationModule.Button
local Skeleton = FoundationModule.Skeleton
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local InputSize = FoundationModule.Enums.InputSize
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local InviteCardStatus = require(script.Parent.InviteTypes).InviteCardStatus

local function SkeletonRow(Frame)
	-- upvalues: ReactModule (copy), View (copy), Skeleton (copy), Radius (copy)
	return ReactModule.createElement(View, {
		tag = `row align-y-center {Frame.heightTag}`,
		LayoutOrder = Frame.LayoutOrder
	}, {
		Skeleton = ReactModule.createElement(Skeleton, {
			Size = UDim2.fromScale(Frame.width, 1),
			radius = Radius.Small,
			testId = Frame.testId
		})
	})
end

local function Media(p1)
	-- upvalues: ReactModule (copy), View (copy), InviteCardStatus (copy), Image (copy), Icon (copy), IconName (copy), IconSize (copy)
	local CornerRadius = {
		bottomLeft = 0,
		bottomRight = 0,
		topLeft = p1.radius,
		topRight = p1.radius
	}
	
	return ReactModule.createElement(View, {
		tag = "bg-shift-200",
		testId = "InviteCardThumbnail",
		LayoutOrder = 1,
		Size = UDim2.fromOffset(p1.width, p1.width),
		cornerRadius = CornerRadius
	}, {
		Image = if p1.status == InviteCardStatus.Ready then ReactModule.createElement(Image, {
			tag = "size-full",
			testId = "InviteCardThumbnailImage",
			Image = p1.thumbnail,
			ScaleType = Enum.ScaleType.Crop,
			cornerRadius = CornerRadius
		}) else nil,
		Placeholder = if p1.status == InviteCardStatus.Unavailable then ReactModule.createElement(Icon, {
			tag = "position-center-center anchor-center-center",
			testId = "InviteCardThumbnailPlaceholder",
			name = IconName.Controller,
			size = IconSize.XLarge
		}) else nil
	})
end

local function Title(Frame: Frame)
	-- upvalues: ReactModule (copy), SkeletonRow (copy), Text (copy)
	return if Frame.isLoading then ReactModule.createElement(SkeletonRow, {
		heightTag = "size-full-500",
		width = 0.6,
		testId = "InviteCardTitleSkeleton",
		LayoutOrder = Frame.LayoutOrder
	}) else ReactModule.createElement(Text, {
		tag = "size-full-0 auto-y text-title-medium text-no-wrap text-align-x-left text-truncate-end content-emphasis",
		testId = "InviteCardTitle",
		Text = Frame.text,
		LayoutOrder = Frame.LayoutOrder
	})
end

local function Description(Frame: Frame)
	-- upvalues: ReactModule (copy), SkeletonRow (copy), Text (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Frame (copy)
		return Frame.text:map(function(p1): boolean
			return p1 ~= ""
		end)
	end, { Frame.text })
	
	return if Frame.isLoading then ReactModule.createElement(SkeletonRow, {
		heightTag = "size-full-500",
		width = 0.8,
		testId = "InviteCardDescriptionSkeleton",
		LayoutOrder = Frame.LayoutOrder
	}) else ReactModule.createElement(Text, {
		tag = "size-full-0 auto-y text-body-medium text-no-wrap text-align-x-left text-truncate-end content-default",
		testId = "InviteCardDescription",
		Text = Frame.text,
		Visible = UseMemoResult,
		LayoutOrder = Frame.LayoutOrder
	})
end

return ReactModule.memo(function(Frame)
	-- upvalues: UseTokensFunction (copy), UseScaledValueFunction (copy), InviteCardStatus (copy), ReactModule (copy), View (copy), Media (copy), Title (copy), Description (copy), Button (copy), ButtonVariant (copy), InputSize (copy)
	local UseTokensResult = UseTokensFunction()
	local UseScaledValueResult = UseScaledValueFunction(250)
	local Medium = UseTokensResult.Radius.Medium
	local IsStatusMatch = Frame.status == InviteCardStatus.Loading
	local OnJoin = if Frame.status == InviteCardStatus.Ready then Frame.onJoin else nil
	
	return ReactModule.createElement(View, {
		tag = "col auto-y bg-shift-200",
		testId = "InviteCardView",
		Size = UDim2.fromOffset(UseScaledValueResult, 0),
		cornerRadius = UDim.new(0, Medium),
		LayoutOrder = Frame.LayoutOrder
	}, {
		Media = ReactModule.createElement(Media, {
			status = Frame.status,
			thumbnail = Frame.thumbnail,
			width = UseScaledValueResult,
			radius = Medium
		}),
		Content = ReactModule.createElement(View, {
			tag = "row align-y-center gap-small size-full-0 auto-y padding-medium",
			LayoutOrder = 2
		}, {
			Text = ReactModule.createElement(View, { tag = "col fill gap-xsmall auto-y", LayoutOrder = 1 }, {
				Title = ReactModule.createElement(Title, {
					LayoutOrder = 1,
					text = Frame.title,
					isLoading = IsStatusMatch
				}),
				Description = ReactModule.createElement(Description, {
					LayoutOrder = 2,
					text = Frame.description,
					isLoading = IsStatusMatch
				})
			}),
			Join = if OnJoin then ReactModule.createElement(Button, {
				testId = "InviteCardJoin",
				LayoutOrder = 2,
				text = Frame.joinText,
				variant = ButtonVariant.Emphasis,
				size = InputSize.Small,
				onActivated = OnJoin
			}) else nil
		})
	})
end)