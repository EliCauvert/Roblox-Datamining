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

function createOutfitPrompt.render(p0) --[[ line: 41 ]]
	-- upvalues: roactModule (ref), promptWithAvatarViewportModule (ref), robloxTranslatorModule (ref), buttonType (ref)
	return roactModule.createElement(promptWithAvatarViewportModule, {
		humanoidDescription = p0.props.humanoidDescription,
		rigType = p0.props.rigType,
		title = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.CreateOutfitPromptTitle"),
		bodyText = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.CreateOutfitPromptText"),
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = {
						onActivated = p0.props.signalCreateOutfitPermissionDenied,
						text = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.CreateOutfitPromptNo")
					}
				},
				{
					isDefaultChild = false,
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = if p0.props.showCustomOutfitNames then p0.props.createOutfitConfirmed else p0.props.performCreateOutfit,
						text = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.CreateOutfitPromptYes")
					}
				}
			}
		}
	})
end

return avatarEditorPromptsPolicyModule.connect(function(p3, _) --[[ line: 102 ]]
	return { showCustomOutfitNames = p3.getCustomOutfitNames() }
end)(roactRoduxModule.connect(function(p1) --[[ line: 77 | named "mapStateToProps" ]]
	return {
		humanoidDescription = p1.promptInfo.humanoidDescription,
		rigType = p1.promptInfo.rigType
	}
end, function(p2) --[[ line: 84 | named "mapDispatchToProps" ]]
	-- upvalues: signalCreateOutfitPermissionDeniedModule (ref), createOutfitConfirmedModule (ref), performCreateOutfitModule (ref)
	return {
		signalCreateOutfitPermissionDenied = function() --[[ line: 86 ]]
			-- upvalues: p2 (ref), signalCreateOutfitPermissionDeniedModule (copy)
			return p2(signalCreateOutfitPermissionDeniedModule)
		end,
		createOutfitConfirmed = function() --[[ line: 90 ]]
			-- upvalues: p2 (ref), createOutfitConfirmedModule (copy)
			return p2(createOutfitConfirmedModule())
		end,
		performCreateOutfit = function() --[[ line: 94 ]]
			-- upvalues: p2 (ref), performCreateOutfitModule (copy)
			return p2(performCreateOutfitModule(""))
		end
	}
end)(createOutfitPrompt))