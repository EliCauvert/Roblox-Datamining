local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Dialog = FoundationModule.Dialog
local RadioGroup = FoundationModule.RadioGroup
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseCreationFlowStringsModule = require(MomentsCreation.Hooks.useCreationFlowStrings)

return function(p1) --[[ Line: 34 | Named "GenerateTextOptionsDialog" ]]
	-- upvalues: UseCreationFlowStringsModule (copy), ReactModule (copy), View (copy), Text (copy), RadioGroup (copy), Dialog (copy), FoundationModule (copy)
	local UseCreationFlowStringsModuleResult = UseCreationFlowStringsModule()
	local Hype, Hype2 = ReactModule.useState("hype")
	
	return ReactModule.createElement(Dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		onClose = p1.onCancel,
		size = FoundationModule.Enums.DialogSize.Medium
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, {
			LayoutOrder = 1,
			text = UseCreationFlowStringsModuleResult.GenerateTextOptionsTitle
		}),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			Layout = ReactModule.createElement(View, { tag = "col gap-medium size-full-0 auto-y" }, {
				TonePanel = if p1.showTone then ReactModule.createElement(View, {
					tag = "col gap-small size-full-0 auto-y",
					LayoutOrder = 1
				}, {
					Heading = ReactModule.createElement(Text, {
						tag = "auto-xy text-title-medium content-default",
						LayoutOrder = 1,
						Text = UseCreationFlowStringsModuleResult.ToneHeading
					}),
					Radios = ReactModule.createElement(RadioGroup.Root, { LayoutOrder = 2, value = Hype, onValueChanged = Hype2 }, {
						Hype = ReactModule.createElement(RadioGroup.Item, {
							value = "hype",
							LayoutOrder = 1,
							label = UseCreationFlowStringsModuleResult.ToneHype
						}),
						Neutral = ReactModule.createElement(RadioGroup.Item, {
							value = "neutral",
							LayoutOrder = 2,
							label = UseCreationFlowStringsModuleResult.ToneNeutral
						}),
						Cinematic = ReactModule.createElement(RadioGroup.Item, {
							value = "cinematic",
							LayoutOrder = 3,
							label = UseCreationFlowStringsModuleResult.ToneCinematic
						}),
						Funny = ReactModule.createElement(RadioGroup.Item, {
							value = "funny",
							LayoutOrder = 4,
							label = UseCreationFlowStringsModuleResult.ToneFunny
						})
					})
				}) else nil
			})
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = UseCreationFlowStringsModuleResult.GenerateTextCta,
					variant = FoundationModule.Enums.ButtonVariant.Emphasis,
					onActivated = ReactModule.useCallback(function() --[[ Line: 38 ]]
						-- upvalues: p1 (copy), Hype (copy)
						p1.onSelect(if p1.showTone then Hype else nil)
					end, { p1.showTone, Hype, p1.onSelect })
				},
				{
					text = UseCreationFlowStringsModuleResult.GeneralCtaCancel,
					variant = FoundationModule.Enums.ButtonVariant.Standard,
					onActivated = p1.onCancel
				}
			}
		})
	})
end