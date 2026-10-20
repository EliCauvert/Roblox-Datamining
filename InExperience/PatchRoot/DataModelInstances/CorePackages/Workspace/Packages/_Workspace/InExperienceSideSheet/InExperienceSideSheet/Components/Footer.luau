local InExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local Parent = InExperienceSideSheet.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Divider = FoundationModule.Divider
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local SessionActionButtonsModule = require(InExperienceSideSheet.Components.SessionActionButtons)

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Divider (copy), SessionActionButtonsModule (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, {
		tag = "col gap-xlarge size-full-0 auto-y padding-x-xlarge padding-bottom-xlarge",
		LayoutOrder = p1.layoutOrder
	}, {
		FooterDivider = ReactModule.createElement(View, {
			testId = "side-sheet-footer-divider",
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, UseTokensResult.Stroke.Standard)
		}, {
			DividerBleed = ReactModule.createElement(View, {
				testId = "side-sheet-footer-divider-bleed",
				Position = UDim2.fromOffset(-UseTokensResult.Padding.XLarge, 0),
				Size = UDim2.new(1, UseTokensResult.Padding.XLarge * 2, 1, 0)
			}, { Divider = ReactModule.createElement(Divider) })
		}),
		SessionActionButtons = ReactModule.createElement(SessionActionButtonsModule, { layoutOrder = 2 })
	})
end)