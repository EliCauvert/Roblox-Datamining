local interventionShared = script:FindFirstAncestor("InterventionShared")
local parent = interventionShared.Parent
local reactModule = require(parent.React)
local inlineAppealLinkModule = require(interventionShared.Components.genericComponents.InlineAppealLink)
local foundationModule = require(parent.Foundation)
local button = foundationModule.Button
local buttonSize = foundationModule.Enums.ButtonSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local text = foundationModule.Text
local view = foundationModule.View

return reactModule.memo(function(p0) --[[ line: 26 | named "InterventionDialogFooter" ]]
	-- upvalues: reactModule (ref), view (ref), inlineAppealLinkModule (ref), button (ref), buttonVariant (ref), buttonSize (ref), text (ref)
	return reactModule.createElement(view, {
		tag = "col no-flex gap-medium size-full-0 auto-y",
		testId = "intervention-dialog-footer",
		LayoutOrder = 3
	}, {
		AppealLink = p0.isAppealable and reactModule.createElement(inlineAppealLinkModule, { LayoutOrder = 1, onActivated = p0.onAppealActivated }),
		Cta = reactModule.createElement(button, {
			testId = "intervention-dialog-footer-cta",
			LayoutOrder = 2,
			variant = buttonVariant.Emphasis,
			size = buttonSize.Medium,
			text = p0.ctaText,
			onActivated = p0.onCtaActivated,
			width = UDim.new(1, 0)
		}),
		DsaMessage = p0.dsaMessage and (p0.dsaMessage ~= "" and reactModule.createElement(text, {
			tag = "auto-xy text-caption-small text-wrap text-align-x-left content-default",
			testId = "intervention-dialog-footer-dsa-message",
			LayoutOrder = 3,
			Text = p0.dsaMessage
		}))
	})
end)