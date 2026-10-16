local InterventionShared = script:FindFirstAncestor("InterventionShared")
local Parent = InterventionShared.Parent
local ReactModule = require(Parent.React)
local InlineAppealLinkModule = require(InterventionShared.Components.genericComponents.InlineAppealLink)
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local ButtonSize = FoundationModule.Enums.ButtonSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Text = FoundationModule.Text
local View = FoundationModule.View

return ReactModule.memo(function(p1) --[[ Line: 26 | Named "InterventionDialogFooter" ]]
	-- upvalues: ReactModule (copy), View (copy), InlineAppealLinkModule (copy), Button (copy), ButtonVariant (copy), ButtonSize (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "col no-flex gap-medium size-full-0 auto-y",
		testId = "intervention-dialog-footer",
		LayoutOrder = 3
	}, {
		AppealLink = p1.isAppealable and ReactModule.createElement(InlineAppealLinkModule, { LayoutOrder = 1, onActivated = p1.onAppealActivated }),
		Cta = ReactModule.createElement(Button, {
			testId = "intervention-dialog-footer-cta",
			LayoutOrder = 2,
			variant = ButtonVariant.Emphasis,
			size = ButtonSize.Medium,
			text = p1.ctaText,
			onActivated = p1.onCtaActivated,
			width = UDim.new(1, 0)
		}),
		DsaMessage = p1.dsaMessage and (p1.dsaMessage ~= "" and ReactModule.createElement(Text, {
			tag = "auto-xy text-caption-small text-wrap text-align-x-left content-default",
			testId = "intervention-dialog-footer-dsa-message",
			LayoutOrder = 3,
			Text = p1.dsaMessage
		}))
	})
end)