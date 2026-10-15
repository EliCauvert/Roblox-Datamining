local parent = script:FindFirstAncestor("Gifting").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local sheet = foundationModule.Sheet
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialogSize = foundationModule.Enums.DialogSize
local fillBehavior = foundationModule.Enums.FillBehavior
local iconName = foundationModule.Enums.IconName
local getIconRichText = foundationModule.Utility.getIconRichText
local uDim2 = UDim2.fromScale(0.375, 0.555555555556)
local uDim2_1 = UDim2.fromScale(0.671875, 0.444444444444)

local function PictogramCard(p1)
	-- upvalues: reactModule (ref), foundationModule (ref), getIconRichText (ref)
	return reactModule.createElement(foundationModule.View, {
		tag = "align-x-center align-y-center anchor-center-center size-2500-2500 stroke-emphasis radius-medium bg-surface-100",
		Position = p1.position,
		Rotation = p1.rotation,
		ZIndex = p1.zIndex,
		testId = p1.testId
	}, {
		Icon = reactModule.createElement(foundationModule.Text, {
			tag = "position-center-center anchor-center-center size-1800-1800 text-display-medium text-align-x-center content-emphasis",
			RichText = true,
			Text = getIconRichText(p1.icon)
		})
	})
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), sheet (ref), dialogSize (ref), foundationModule (ref), PictogramCard (ref), iconName (ref), uDim2 (ref), uDim2_1 (ref), buttonVariant (ref), fillBehavior (ref)
	return reactModule.createElement(sheet.Root, {
		preferCenterSheet = true,
		testId = "GiftAgeCheckView",
		isOpen = p1.isOpen,
		size = dialogSize.Medium,
		snapPoints = { p1.mobileSnapPoint },
		onClose = p1.onClose
	}, {
		Content = reactModule.createElement(sheet.Content, { testId = "gift-age-check-content", LayoutOrder = 1 }, {
			Body = reactModule.createElement(foundationModule.View, { tag = "col align-x-center gap-small size-full-0 auto-y" }, {
				Pictogram = reactModule.createElement(foundationModule.View, { LayoutOrder = 1, Size = p1.pictogramSize }, {
					ShieldCard = reactModule.createElement(PictogramCard, {
						rotation = -15,
						zIndex = 1,
						testId = "gift-age-check-shield",
						icon = iconName.ShieldCheck,
						position = uDim2
					}),
					GiftCard = reactModule.createElement(PictogramCard, {
						rotation = 15,
						zIndex = 2,
						testId = "gift-age-check-gift",
						icon = iconName.GiftBox,
						position = uDim2_1
					})
				}),
				Title = reactModule.createElement(foundationModule.Text, {
					tag = "size-full-0 auto-y text-heading-small text-wrap text-align-x-left content-emphasis",
					testId = "gift-age-check-title",
					LayoutOrder = 2,
					Text = p1.titleText
				}),
				Description = reactModule.createElement(foundationModule.Text, {
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
					testId = "gift-age-check-description",
					LayoutOrder = 3,
					Text = p1.descriptionText
				})
			})
		}),
		Actions = reactModule.createElement(sheet.Actions, { LayoutOrder = 2 }, {
			ContinueButton = reactModule.createElement(foundationModule.Button, {
				testId = "gift-age-check-continue",
				text = p1.continueLabel,
				variant = buttonVariant.Emphasis,
				fillBehavior = fillBehavior.Fill,
				onActivated = p1.onContinue
			})
		})
	})
end)