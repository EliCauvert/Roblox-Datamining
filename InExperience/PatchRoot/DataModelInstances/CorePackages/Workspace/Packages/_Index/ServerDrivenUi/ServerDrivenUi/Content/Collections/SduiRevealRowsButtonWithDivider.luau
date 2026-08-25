local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local getSduiComponentWrapper = require(parent.SduiCoreSystem).getSduiComponentWrapper

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), getSduiComponentWrapper (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.View, {
		tag = "row align-y-center gap-xsmall size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		ZIndex = p1.zIndex
	}, {
		LeadingLine = reactModule.createElement(foundationModule.View, { tag = "grow", LayoutOrder = 1 }, {
			Divider = reactModule.createElement(foundationModule.Divider)
		}),
		ButtonOutline = reactModule.createElement(foundationModule.View, {
			tag = "auto-xy stroke-default radius-circle",
			LayoutOrder = 2
		}, {
			Cta = reactModule.createElement(getSduiComponentWrapper(p1.ctaComponent), {
				debugName = "SduiRevealRowsButtonWithDivider.CtaComponent",
				componentConfig = p1.ctaComponent,
				sduiContext = p1.sduiContext,
				extraLocalProps = { onActivated = p1.onActivated }
			})
		}),
		TrailingLine = reactModule.createElement(foundationModule.View, { tag = "grow", LayoutOrder = 3 }, {
			Divider = reactModule.createElement(foundationModule.Divider)
		})
	})
end)