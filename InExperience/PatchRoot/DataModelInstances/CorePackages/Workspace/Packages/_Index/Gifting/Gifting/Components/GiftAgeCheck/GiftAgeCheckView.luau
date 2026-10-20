local Parent = script:FindFirstAncestor("Gifting").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Sheet = FoundationModule.Sheet
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local DialogSize = FoundationModule.Enums.DialogSize
local FillBehavior = FoundationModule.Enums.FillBehavior
local IconName = FoundationModule.Enums.IconName
local GetIconRichTextFunction = FoundationModule.Utility.getIconRichText
local _UDim2 = UDim2.fromScale(0.375, 0.5555555555555556)
local _UDim2_1 = UDim2.fromScale(0.671875, 0.4444444444444444)

local function PictogramCard(p1)
	-- upvalues: ReactModule (copy), FoundationModule (copy), GetIconRichTextFunction (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "align-x-center align-y-center anchor-center-center size-2500-2500 stroke-emphasis radius-medium bg-surface-100",
		Position = p1.position,
		Rotation = p1.rotation,
		ZIndex = p1.zIndex,
		testId = p1.testId
	}, {
		Icon = ReactModule.createElement(FoundationModule.Text, {
			tag = "position-center-center anchor-center-center size-1800-1800 text-display-medium text-align-x-center content-emphasis",
			RichText = true,
			Text = GetIconRichTextFunction(p1.icon)
		})
	})
end

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), Sheet (copy), DialogSize (copy), FoundationModule (copy), PictogramCard (copy), IconName (copy), _UDim2 (copy), _UDim2_1 (copy), ButtonVariant (copy), FillBehavior (copy)
	return ReactModule.createElement(Sheet.Root, {
		preferCenterSheet = true,
		testId = "GiftAgeCheckView",
		isOpen = p1.isOpen,
		size = DialogSize.Medium,
		snapPoints = { p1.mobileSnapPoint },
		onClose = p1.onClose
	}, {
		Content = ReactModule.createElement(Sheet.Content, { testId = "gift-age-check-content", LayoutOrder = 1 }, {
			Body = ReactModule.createElement(FoundationModule.View, { tag = "col align-x-center gap-small size-full-0 auto-y" }, {
				Pictogram = ReactModule.createElement(FoundationModule.View, { LayoutOrder = 1, Size = p1.pictogramSize }, {
					ShieldCard = ReactModule.createElement(PictogramCard, {
						rotation = -15,
						zIndex = 1,
						testId = "gift-age-check-shield",
						icon = IconName.ShieldCheck,
						position = _UDim2
					}),
					GiftCard = ReactModule.createElement(PictogramCard, {
						rotation = 15,
						zIndex = 2,
						testId = "gift-age-check-gift",
						icon = IconName.GiftBox,
						position = _UDim2_1
					})
				}),
				Title = ReactModule.createElement(FoundationModule.Text, {
					tag = "size-full-0 auto-y text-heading-small text-wrap text-align-x-left content-emphasis",
					testId = "gift-age-check-title",
					LayoutOrder = 2,
					Text = p1.titleText
				}),
				Description = ReactModule.createElement(FoundationModule.Text, {
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
					testId = "gift-age-check-description",
					LayoutOrder = 3,
					Text = p1.descriptionText
				})
			})
		}),
		Actions = ReactModule.createElement(Sheet.Actions, { LayoutOrder = 2 }, {
			ContinueButton = ReactModule.createElement(FoundationModule.Button, {
				testId = "gift-age-check-continue",
				text = p1.continueLabel,
				variant = ButtonVariant.Emphasis,
				fillBehavior = FillBehavior.Fill,
				onActivated = p1.onContinue
			})
		})
	})
end)