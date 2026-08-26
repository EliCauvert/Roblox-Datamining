local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local dialog = foundationModule.Dialog
local radioGroup = foundationModule.RadioGroup
local text = foundationModule.Text
local view = foundationModule.View
local useCreationFlowStringsModule = require(momentsCreation.Hooks.useCreationFlowStrings)

return function(p1)
	-- upvalues: useCreationFlowStringsModule (ref), reactModule (ref), view (ref), text (ref), radioGroup (ref), dialog (ref), foundationModule (ref)
	local var1 = useCreationFlowStringsModule()
	local hype, hype_1 = reactModule.useState("hype")
	
	return reactModule.createElement(dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		onClose = p1.onCancel,
		size = foundationModule.Enums.DialogSize.Medium
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var1.GenerateTextOptionsTitle }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Layout = reactModule.createElement(view, { tag = "col gap-medium size-full-0 auto-y" }, {
				TonePanel = if p1.showTone then reactModule.createElement(view, {
					tag = "col gap-small size-full-0 auto-y",
					LayoutOrder = 1
				}, {
					Heading = reactModule.createElement(text, {
						tag = "auto-xy text-title-medium content-default",
						LayoutOrder = 1,
						Text = var1.ToneHeading
					}),
					Radios = reactModule.createElement(radioGroup.Root, { LayoutOrder = 2, value = hype, onValueChanged = hype_1 }, {
						Hype = reactModule.createElement(radioGroup.Item, { value = "hype", LayoutOrder = 1, label = var1.ToneHype }),
						Neutral = reactModule.createElement(radioGroup.Item, {
							value = "neutral",
							LayoutOrder = 2,
							label = var1.ToneNeutral
						}),
						Cinematic = reactModule.createElement(radioGroup.Item, {
							value = "cinematic",
							LayoutOrder = 3,
							label = var1.ToneCinematic
						}),
						Funny = reactModule.createElement(radioGroup.Item, { value = "funny", LayoutOrder = 4, label = var1.ToneFunny })
					})
				}) else nil
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = var1.GenerateTextCta,
					variant = foundationModule.Enums.ButtonVariant.Emphasis,
					onActivated = reactModule.useCallback(function()
						-- upvalues: p1 (ref), hype (ref)
						p1.onSelect(if p1.showTone then hype else nil)
					end, { p1.showTone, hype, p1.onSelect })
				},
				{
					text = var1.GeneralCtaCancel,
					variant = foundationModule.Enums.ButtonVariant.Standard,
					onActivated = p1.onCancel
				}
			}
		})
	})
end