local Parent = script:FindFirstAncestor("AddFriends").Parent
local ReactModule = require(Parent.React)
local ImageSetLabel = require(Parent.UIBlox).Core.ImageSet.ImageSetLabel
local FoundationModule = require(Parent.Foundation)
local Skeleton = FoundationModule.Skeleton
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local View = FoundationModule.View
local Text = FoundationModule.Text
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), ImageSetLabel (copy), Text (copy), Skeleton (copy), Icon (copy), IconSize (copy), Button (copy), ButtonVariant (copy), InputSize (copy)
	local LayoutOrder = p1.layoutOrder
	local MaxWidth = p1.maxWidth
	local OnBannerMountedFunction = p1.onBannerMounted
	local OnActivated = p1.onActivated
	local v1: boolean = if p1.bannerIcon then true else false
	local BannerIcon = p1.bannerIcon
	local BannerTitle = p1.bannerTitle
	local BannerText = p1.bannerText
	local TitleFont = p1.titleFont
	local TextFont = p1.textFont
	local RightCornerButtonIcon = p1.rightCornerButtonIcon
	local RightCornerButtonIcon1 = p1.rightCornerButtonIcon
	local RightCornerButtonActivated = p1.rightCornerButtonActivated
	local BigBottomButton = p1.bigBottomButton
	ReactModule.useEffect(function()
		-- upvalues: OnBannerMountedFunction (copy)
		if OnBannerMountedFunction then
			OnBannerMountedFunction()
		end
	end, {})
	
	return ReactModule.createElement(View, {
		tag = "col size-full-0 auto-y align-x-center radius-medium bg-surface-300 auto-y padding-medium gap-xlarge",
		onActivated = OnActivated,
		LayoutOrder = LayoutOrder
	}, {
		UISizeConstraint = ReactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(MaxWidth, 1e999) }),
		InfoContent = ReactModule.createElement(View, { tag = "size-full-0 auto-y row flex-x-fill gap-medium" }, {
			BannerIconView = v1 and ReactModule.createElement(View, {
				tag = "auto-xy padding-y-xsmall padding-x-xsmall",
				LayoutOrder = 1
			}, {
				BannerIcon = ReactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 48, 0, 48),
					Image = BannerIcon
				})
			}) or nil,
			TextContent = ReactModule.createElement(View, { tag = "auto-xy align-x-left", LayoutOrder = 2 }, {
				TextVertical = ReactModule.createElement(View, {
					tag = {
						["col size-full-0 auto-y gap-small"] = true,
						["padding-small"] = v1
					}
				}, {
					BannerTitle = ReactModule.createElement(Text, {
						LayoutOrder = 1,
						tag = {
							["auto-y size-full-0 text-align-x-left content-emphasis"] = true,
							[TitleFont or "text-label-large"] = true
						},
						Text = BannerTitle
					}),
					BannerText = if p1.isLoading then ReactModule.createElement(Skeleton, { LayoutOrder = 2, Size = UDim2.new(1, 0, 0, 30) }) else ReactModule.createElement(Text, {
						LayoutOrder = 2,
						tag = {
							["auto-y size-full-0 text-align-x-left text-wrap"] = true,
							[TextFont or "text-body-small"] = true
						},
						Text = BannerText
					})
				})
			}),
			RightCornerButton = RightCornerButtonIcon and ReactModule.createElement(View, {
				tag = "auto-xy radius-xsmall",
				LayoutOrder = 3,
				onActivated = RightCornerButtonActivated
			}, {
				RightCornerButtonIcon = ReactModule.createElement(Icon, { size = IconSize.Large, name = RightCornerButtonIcon1 })
			}) or nil
		}),
		BannerButton = if BigBottomButton then ReactModule.createElement(Button, {
			width = UDim.new(1, 0),
			variant = ButtonVariant.Standard,
			size = InputSize.Medium,
			text = BigBottomButton.text,
			onActivated = BigBottomButton.onActivated
		}) else nil
	})
end