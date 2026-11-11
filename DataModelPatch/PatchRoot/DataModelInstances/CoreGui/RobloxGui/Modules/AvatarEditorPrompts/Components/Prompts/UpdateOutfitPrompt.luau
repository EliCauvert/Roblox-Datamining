local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local ButtonType = require(CorePackages.Packages.UIBlox).App.Button.Enum.ButtonType
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local SignalUpdateOutfitPermissionDeniedModule = require(Parent1.Thunks.SignalUpdateOutfitPermissionDenied)
local PerformUpdateOutfitModule = require(Parent1.Thunks.PerformUpdateOutfit)
local PromptWithAvatarViewportModule = require(Parent.Prompts.PromptWithAvatarViewport)
local AvatarEditorPromptsPolicyModule = require(Parent1.AvatarEditorPromptsPolicy)
local UpdateOutfitPrompt = RoactModule.PureComponent:extend("UpdateOutfitPrompt")
UpdateOutfitPrompt.validateProps = TModule.strictInterface({
	screenSize = TModule.Vector2,
	humanoidDescription = TModule.instanceOf("HumanoidDescription"),
	rigType = TModule.enum(Enum.HumanoidRigType),
	outfitName = TModule.string,
	signalUpdateOutfitPermissionDenied = TModule.callback,
	performUpdateOutfit = TModule.callback,
	showCustomOutfitNames = TModule.boolean
})

function UpdateOutfitPrompt.render(p1)
	-- upvalues: RobloxTranslatorModule (copy), RoactModule (copy), PromptWithAvatarViewportModule (copy), ButtonType (copy)
	return RoactModule.createElement(PromptWithAvatarViewportModule, {
		humanoidDescription = p1.props.humanoidDescription,
		rigType = p1.props.rigType,
		title = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.UpdateOutfitPromptTitle"),
		bodyText = if p1.props.showCustomOutfitNames then RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.UpdateOutfitPromptText", { RBX_NAME = p1.props.outfitName }) else RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.UpdateOutfitPromptTextNoOutfitName"),
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = {
						onActivated = p1.props.signalUpdateOutfitPermissionDenied,
						text = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.UpdateOutfitPromptNo")
					}
				},
				{
					isDefaultChild = false,
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = p1.props.performUpdateOutfit,
						text = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.UpdateOutfitPromptYes")
					}
				}
			}
		}
	})
end

return (AvatarEditorPromptsPolicyModule.connect(function(p1, _)
	return { showCustomOutfitNames = p1.getCustomOutfitNames() }
end)((RoactRoduxModule.connect(function(p1)
	return {
		screenSize = p1.screenSize,
		humanoidDescription = p1.promptInfo.humanoidDescription,
		rigType = p1.promptInfo.rigType,
		outfitName = p1.promptInfo.outfitName
	}
end, function(Callback)
	-- upvalues: SignalUpdateOutfitPermissionDeniedModule (copy), PerformUpdateOutfitModule (copy)
	return {
		signalUpdateOutfitPermissionDenied = function()
			-- upvalues: Callback (copy), SignalUpdateOutfitPermissionDeniedModule (upval)
			return Callback(SignalUpdateOutfitPermissionDeniedModule)
		end,
		performUpdateOutfit = function()
			-- upvalues: Callback (copy), PerformUpdateOutfitModule (upval)
			return Callback(PerformUpdateOutfitModule)
		end or nil
	}
end)(UpdateOutfitPrompt))))