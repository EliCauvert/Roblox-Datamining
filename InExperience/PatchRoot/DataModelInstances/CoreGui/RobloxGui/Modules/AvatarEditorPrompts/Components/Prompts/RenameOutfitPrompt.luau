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

function renameOutfitNamePrompt.init(p0)
	p0:setState({
		outfitName = "",
		alertPosition = UDim2.fromScale(0.5, 0.5)
	})
	
	function p0.textUpdated(p1)
		-- upvalues: p0 (ref)
		p0:setState({ outfitName = p1 })
	end
	
	function p0.confirmRenameOutfit()
		-- upvalues: p0 (ref)
		p0.props.performRenameOutfit(p0.state.outfitName)
	end
end

function renameOutfitNamePrompt.render(p2)
	-- upvalues: roactModule (ref), interactiveAlert (ref), robloxTranslatorModule (ref), buttonType (ref), promptWithTextFieldModule (ref)
	return if p2.props.showCustomOutfitNames then roactModule.createElement(promptWithTextFieldModule, {
		fieldText = p2.state.outfitName,
		onFieldTextUpdated = p2.textUpdated,
		title = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.RenameOutfitNamePromptTitle"),
		bodyText = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.RenameOutfitPromptText", { RBX_NAME = p2.props.outfitName }),
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = {
						onActivated = p2.props.signalRenameOutfitPermissionDenied,
						text = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.EnterOutfitNamePromptNo")
					}
				},
				{
					isDefaultChild = false,
					buttonType = buttonType.PrimarySystem,
					props = {
						isDisabled = p2.state.outfitName == "",
						onActivated = p2.confirmRenameOutfit,
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
						onActivated = p2.props.signalRenameOutfitPermissionDenied,
						text = robloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.DisabledRenameOutfitPromptOkay")
					}
				}
			}
		},
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = p2.props.screenSize
	})
end

return avatarEditorPromptsPolicyModule.connect(function(p6, _)
	return { showCustomOutfitNames = p6.getCustomOutfitNames() }
end)(roactRoduxModule.connect(function(p3)
	return {
		outfitId = p3.promptInfo.outfitId,
		outfitName = p3.promptInfo.outfitName,
		screenSize = p3.screenSize
	}
end, function(p4)
	-- upvalues: signalRenameOutfitPermissionDeniedModule (ref), performRenameOutfitModule (ref)
	return {
		signalRenameOutfitPermissionDenied = function()
			-- upvalues: p4 (ref), signalRenameOutfitPermissionDeniedModule (copy)
			return p4(signalRenameOutfitPermissionDeniedModule)
		end,
		performRenameOutfit = function(p5)
			-- upvalues: p4 (ref), performRenameOutfitModule (copy)
			return p4(performRenameOutfitModule(p5))
		end
	}
end)(renameOutfitNamePrompt))