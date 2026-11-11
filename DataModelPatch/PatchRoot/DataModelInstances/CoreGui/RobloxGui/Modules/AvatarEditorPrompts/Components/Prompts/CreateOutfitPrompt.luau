local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local ButtonType = require(CorePackages.Packages.UIBlox).App.Button.Enum.ButtonType
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local PromptWithAvatarViewportModule = require(Parent.Prompts.PromptWithAvatarViewport)
local SignalCreateOutfitPermissionDeniedModule = require(Parent1.Thunks.SignalCreateOutfitPermissionDenied)
local CreateOutfitConfirmedModule = require(Parent1.Actions.CreateOutfitConfirmed)
local PerformCreateOutfitModule = require(Parent1.Thunks.PerformCreateOutfit)
local AvatarEditorPromptsPolicyModule = require(Parent1.AvatarEditorPromptsPolicy)
local CreateOutfitPrompt = RoactModule.PureComponent:extend("CreateOutfitPrompt")
CreateOutfitPrompt.validateProps = TModule.strictInterface({
	humanoidDescription = TModule.instanceOf("HumanoidDescription"),
	rigType = TModule.enum(Enum.HumanoidRigType),
	createOutfitConfirmed = TModule.callback,
	signalCreateOutfitPermissionDenied = TModule.callback,
	performCreateOutfit = TModule.callback,
	showCustomOutfitNames = TModule.boolean
})

function CreateOutfitPrompt.render(p1)
	-- upvalues: RoactModule (copy), PromptWithAvatarViewportModule (copy), RobloxTranslatorModule (copy), ButtonType (copy)
	return RoactModule.createElement(PromptWithAvatarViewportModule, {
		humanoidDescription = p1.props.humanoidDescription,
		rigType = p1.props.rigType,
		title = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.CreateOutfitPromptTitle"),
		bodyText = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.CreateOutfitPromptText"),
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = {
						onActivated = p1.props.signalCreateOutfitPermissionDenied,
						text = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.CreateOutfitPromptNo")
					}
				},
				{
					isDefaultChild = false,
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = if p1.props.showCustomOutfitNames then p1.props.createOutfitConfirmed else p1.props.performCreateOutfit,
						text = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.CreateOutfitPromptYes")
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
		humanoidDescription = p1.promptInfo.humanoidDescription,
		rigType = p1.promptInfo.rigType
	}
end, function(Callback)
	-- upvalues: SignalCreateOutfitPermissionDeniedModule (copy), CreateOutfitConfirmedModule (copy), PerformCreateOutfitModule (copy)
	return {
		signalCreateOutfitPermissionDenied = function()
			-- upvalues: Callback (copy), SignalCreateOutfitPermissionDeniedModule (upval)
			return Callback(SignalCreateOutfitPermissionDeniedModule)
		end,
		createOutfitConfirmed = function()
			-- upvalues: Callback (copy), CreateOutfitConfirmedModule (upval)
			return Callback(CreateOutfitConfirmedModule())
		end,
		performCreateOutfit = function()
			-- upvalues: Callback (copy), PerformCreateOutfitModule (upval)
			return Callback(PerformCreateOutfitModule(""))
		end
	}
end)(CreateOutfitPrompt))))