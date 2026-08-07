-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:50 2026 Pacific Standard Time.

local momentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local parent = momentsCreationFlow.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local dialog = foundationModule.Dialog
local creationFlowContextModule = require(momentsCreationFlow.Context.CreationFlowContext)
local creationFlowLocalizationModule = require(momentsCreationFlow.Enums.CreationFlowLocalization)

return function(p0) --[[ line: 17 ]]
	-- upvalues: reactModule (ref), creationFlowContextModule (ref), dialog (ref), foundationModule (ref), creationFlowLocalizationModule (ref)
	local var5 = reactModule.useContext(creationFlowContextModule)
	
	return reactModule.createElement(dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		size = foundationModule.Enums.DialogSize.Medium
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, {
			LayoutOrder = 1,
			text = var5.getLocalization(creationFlowLocalizationModule.LeaveMomentCreationTitle)
		}),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			DialogText = reactModule.createElement(dialog.Text, {
				Text = var5.getLocalization(creationFlowLocalizationModule.LeaveMomentCreationBody)
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = var5.getLocalization(creationFlowLocalizationModule.GeneralCtaLeave),
					variant = foundationModule.Enums.ButtonVariant.Emphasis,
					onActivated = p0.onConfirm
				},
				{
					text = var5.getLocalization(creationFlowLocalizationModule.GeneralCtaCancel),
					variant = foundationModule.Enums.ButtonVariant.Standard,
					onActivated = p0.onCancel
				}
			}
		})
	})
end