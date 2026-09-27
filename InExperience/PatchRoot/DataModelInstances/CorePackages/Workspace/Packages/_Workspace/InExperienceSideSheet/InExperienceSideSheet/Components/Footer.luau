local inExperienceSideSheet = script:FindFirstAncestor("InExperienceSideSheet")
local parent = inExperienceSideSheet.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local divider = foundationModule.Divider
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local sessionActionButtonsModule = require(inExperienceSideSheet.Components.SessionActionButtons)

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), divider (ref), sessionActionButtonsModule (ref)
	local var1 = useTokens()
	
	return reactModule.createElement(view, {
		tag = "col gap-xlarge size-full-0 auto-y padding-x-xlarge padding-bottom-xlarge",
		LayoutOrder = p1.layoutOrder
	}, {
		FooterDivider = reactModule.createElement(view, {
			testId = "side-sheet-footer-divider",
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, var1.Stroke.Standard)
		}, {
			DividerBleed = reactModule.createElement(view, {
				testId = "side-sheet-footer-divider-bleed",
				Position = UDim2.fromOffset(-var1.Padding.XLarge, 0),
				Size = UDim2.new(1, var1.Padding.XLarge * 2, 1, 0)
			}, { Divider = reactModule.createElement(divider) })
		}),
		SessionActionButtons = reactModule.createElement(sessionActionButtonsModule, { layoutOrder = 2 })
	})
end)