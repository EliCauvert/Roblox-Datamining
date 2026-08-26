local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local _ = coreGuiService:WaitForChild("RobloxGui")
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local promptWithTextFieldModule = require(parent.Prompts.PromptWithTextField)
local signalRenameOutfitPermissionDeniedModule = require(parent_1.Thunks.SignalRenameOutfitPermissionDenied)
local performRenameOutfitModule = require(parent_1.Thunks.PerformRenameOutfit)
local avatarEditorPromptsPolicyModule = require(parent_1.AvatarEditorPromptsPolicy)
local renameOutfitNamePrompt = roactModule.PureComponent:extend("RenameOutfitNamePrompt")
renameOutfitNamePrompt.validateProps = tModule.strictInterface({
	outfitId = tModule.integer,
	outfitName = tModule.string,
	screenSize = tModule.Vector2,
	signalRenameOutfitPermissionDenied = tModule.callback,
	performRenameOutfit = tModule.callback,
	showCustomOutfitNames = tModule.boolean
})

function renameOutfitNamePrompt.init(p1)
	p1:setState({
		outfitName = "",
		alertPosition = UDim2.fromScale(0.5, 0.5)
	})
	
	function p0.textUpdated(p2)
		-- upvalues: p1 (ref)
		p1:setState({ outfitName = p2 })
	end
	
	function p0.confirmRenameOutfit()
		-- upvalues: p1 (ref)
		p1.props.performRenameOutfit(p1.state.outfitName)
	end
end

function renameOutfitNamePrompt.render(p1)
	-- upvalues: roactModule (ref), interactiveAlert (ref), robloxTranslatorModule (ref), buttonType (ref), promptWithTextFieldModule (ref)
	return if p1.props.showCustomOutfitNames then roactModule.createElement(promptWithTextFieldModule, {
		fieldText = p1.state.outfitName,
		onFieldTextUpdated = p1.textUpdated,
		title = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.RenameOutfitNamePromptTitle"),
		bodyText = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.RenameOutfitPromptText", { RBX_NAME = p1.props.outfitName }),
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = {
						onActivated = p1.props.signalRenameOutfitPermissionDenied,
						text = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.EnterOutfitNamePromptNo")
					}
				},
				{
					isDefaultChild = false,
					buttonType = buttonType.PrimarySystem,
					props = {
						isDisabled = p1.state.outfitName == "",
						onActivated = p1.confirmRenameOutfit,
						text = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.EnterOutfitNamePromptYes")
					}
				}
			}
		}
	}) else roactModule.createElement(interactiveAlert, {
		isMiddleContentFocusable = false,
		title = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.DisabledRenameOutfitPromptTitle"),
		bodyText = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.DisabledRenameOutfitPromptText"),
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = p1.props.signalRenameOutfitPermissionDenied,
						text = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.DisabledRenameOutfitPromptOkay")
					}
				}
			}
		},
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = p1.props.screenSize
	})
end

return avatarEditorPromptsPolicyModule.connect(function(p1, _)
	return { showCustomOutfitNames = p1.getCustomOutfitNames() }
end)(roactRoduxModule.connect(function(p1)
	return {
		outfitId = p1.promptInfo.outfitId,
		outfitName = p1.promptInfo.outfitName,
		screenSize = p1.screenSize
	}
end, function(p1)
	-- upvalues: signalRenameOutfitPermissionDeniedModule (ref), performRenameOutfitModule (ref)
	return {
		signalRenameOutfitPermissionDenied = function()
			-- upvalues: p1 (ref), signalRenameOutfitPermissionDeniedModule (copy)
			return p1(signalRenameOutfitPermissionDeniedModule)
		end,
		performRenameOutfit = function(p2)
			-- upvalues: p1 (ref), performRenameOutfitModule (copy)
			return p1(performRenameOutfitModule(p2))
		end
	}
end)(renameOutfitNamePrompt))