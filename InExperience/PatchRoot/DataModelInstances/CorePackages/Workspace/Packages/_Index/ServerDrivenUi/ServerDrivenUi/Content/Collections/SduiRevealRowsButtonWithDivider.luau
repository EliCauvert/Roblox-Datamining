local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local GetSduiComponentWrapperFunction = require(Parent.SduiCoreSystem).getSduiComponentWrapper

return ReactModule.memo(function(p1) --[[ Line: 24 | Named "SduiRevealRowsButtonWithDivider" ]]
	-- upvalues: ReactModule (copy), GetSduiComponentWrapperFunction (copy), FoundationModule (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "row align-y-center gap-xsmall size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		ZIndex = p1.zIndex
	}, {
		LeadingLine = ReactModule.createElement(FoundationModule.View, { tag = "grow", LayoutOrder = 1 }, {
			Divider = ReactModule.createElement(FoundationModule.Divider)
		}),
		ButtonOutline = ReactModule.createElement(FoundationModule.View, {
			tag = "auto-xy stroke-default radius-circle",
			LayoutOrder = 2
		}, {
			Cta = ReactModule.createElement(GetSduiComponentWrapperFunction(p1.ctaComponent), {
				debugName = "SduiRevealRowsButtonWithDivider.CtaComponent",
				componentConfig = p1.ctaComponent,
				sduiContext = p1.sduiContext,
				extraLocalProps = { onActivated = p1.onActivated }
			})
		}),
		TrailingLine = ReactModule.createElement(FoundationModule.View, { tag = "grow", LayoutOrder = 3 }, {
			Divider = ReactModule.createElement(FoundationModule.Divider)
		})
	})
end)