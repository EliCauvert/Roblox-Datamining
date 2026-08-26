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
local promptWithAvatarViewportModule = require(parent.Prompts.PromptWithAvatarViewport)
local signalCreateOutfitPermissionDeniedModule = require(parent_1.Thunks.SignalCreateOutfitPermissionDenied)
local createOutfitConfirmedModule = require(parent_1.Actions.CreateOutfitConfirmed)
local performCreateOutfitModule = require(parent_1.Thunks.PerformCreateOutfit)
local avatarEditorPromptsPolicyModule = require(parent_1.AvatarEditorPromptsPolicy)
local createOutfitPrompt = roactModule.PureComponent:extend("CreateOutfitPrompt")
createOutfitPrompt.validateProps = tModule.strictInterface({
	humanoidDescription = tModule.instanceOf("HumanoidDescription"),
	rigType = tModule.enum(Enum.HumanoidRigType),
	createOutfitConfirmed = tModule.callback,
	signalCreateOutfitPermissionDenied = tModule.callback,
	performCreateOutfit = tModule.callback,
	showCustomOutfitNames = tModule.boolean
})

function createOutfitPrompt.render(p1)
	-- upvalues: roactModule (ref), promptWithAvatarViewportModule (ref), robloxTranslatorModule (ref), buttonType (ref)
	return roactModule.createElement(promptWithAvatarViewportModule, {
		humanoidDescription = p1.props.humanoidDescription,
		rigType = p1.props.rigType,
		title = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.CreateOutfitPromptTitle"),
		bodyText = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.CreateOutfitPromptText"),
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = {
						onActivated = p1.props.signalCreateOutfitPermissionDenied,
						text = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.CreateOutfitPromptNo")
					}
				},
				{
					isDefaultChild = false,
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = if p1.props.showCustomOutfitNames then p1.props.createOutfitConfirmed else p1.props.performCreateOutfit,
						text = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.CreateOutfitPromptYes")
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
		humanoidDescription = p1.promptInfo.humanoidDescription,
		rigType = p1.promptInfo.rigType
	}
end, function(p1)
	-- upvalues: signalCreateOutfitPermissionDeniedModule (ref), createOutfitConfirmedModule (ref), performCreateOutfitModule (ref)
	return {
		signalCreateOutfitPermissionDenied = function()
			-- upvalues: p1 (ref), signalCreateOutfitPermissionDeniedModule (copy)
			return p1(signalCreateOutfitPermissionDeniedModule)
		end,
		createOutfitConfirmed = function()
			-- upvalues: p1 (ref), createOutfitConfirmedModule (copy)
			return p1(createOutfitConfirmedModule())
		end,
		performCreateOutfit = function()
			-- upvalues: p1 (ref), performCreateOutfitModule (copy)
			return p1(performCreateOutfitModule(""))
		end
	}
end)(createOutfitPrompt))