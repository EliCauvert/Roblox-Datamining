local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local buttonType = require(corePackagesService.Packages.UIBlox).App.Button.Enum.ButtonType
local _ = coreGuiService:WaitForChild("RobloxGui")
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local signalUpdateOutfitPermissionDeniedModule = require(parent_1.Thunks.SignalUpdateOutfitPermissionDenied)
local performUpdateOutfitModule = require(parent_1.Thunks.PerformUpdateOutfit)
local promptWithAvatarViewportModule = require(parent.Prompts.PromptWithAvatarViewport)
local avatarEditorPromptsPolicyModule = require(parent_1.AvatarEditorPromptsPolicy)
local updateOutfitPrompt = roactModule.PureComponent:extend("UpdateOutfitPrompt")
updateOutfitPrompt.validateProps = tModule.strictInterface({
	screenSize = tModule.Vector2,
	humanoidDescription = tModule.instanceOf("HumanoidDescription"),
	rigType = tModule.enum(Enum.HumanoidRigType),
	outfitName = tModule.string,
	signalUpdateOutfitPermissionDenied = tModule.callback,
	performUpdateOutfit = tModule.callback,
	showCustomOutfitNames = tModule.boolean
})

function updateOutfitPrompt.render(p1)
	-- upvalues: robloxTranslatorModule (ref), roactModule (ref), promptWithAvatarViewportModule (ref), buttonType (ref)
	return roactModule.createElement(promptWithAvatarViewportModule, {
		humanoidDescription = p1.props.humanoidDescription,
		rigType = p1.props.rigType,
		title = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.UpdateOutfitPromptTitle"),
		bodyText = if p1.props.showCustomOutfitNames then robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.UpdateOutfitPromptText", { RBX_NAME = p1.props.outfitName }) else robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.UpdateOutfitPromptTextNoOutfitName"),
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = {
						onActivated = p1.props.signalUpdateOutfitPermissionDenied,
						text = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.UpdateOutfitPromptNo")
					}
				},
				{
					isDefaultChild = false,
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = p1.props.performUpdateOutfit,
						text = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.UpdateOutfitPromptYes")
					}
				}
			}
		}
	})
end

return avatarEditorPromptsPolicyModule.connect(function(p1, _)
	return { showCustomOutfitNames = p1.getCustomOutfitNames() }
end)(roactRoduxModule.connect(function(p1)
	return {
		screenSize = p1.screenSize,
		humanoidDescription = p1.promptInfo.humanoidDescription,
		rigType = p1.promptInfo.rigType,
		outfitName = p1.promptInfo.outfitName
	}
end, function(p1)
	-- upvalues: signalUpdateOutfitPermissionDeniedModule (ref), performUpdateOutfitModule (ref)
	return {
		signalUpdateOutfitPermissionDenied = function()
			-- upvalues: p1 (ref), signalUpdateOutfitPermissionDeniedModule (copy)
			return p1(signalUpdateOutfitPermissionDeniedModule)
		end,
		performUpdateOutfit = function()
			-- upvalues: p1 (ref), performUpdateOutfitModule (copy)
			return p1(performUpdateOutfitModule)
		end or nil
	}
end)(updateOutfitPrompt))