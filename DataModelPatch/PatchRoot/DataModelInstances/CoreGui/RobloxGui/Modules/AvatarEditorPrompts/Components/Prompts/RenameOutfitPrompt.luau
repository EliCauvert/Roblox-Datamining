local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local PromptWithTextFieldModule = require(Parent.Prompts.PromptWithTextField)
local SignalRenameOutfitPermissionDeniedModule = require(Parent1.Thunks.SignalRenameOutfitPermissionDenied)
local PerformRenameOutfitModule = require(Parent1.Thunks.PerformRenameOutfit)
local AvatarEditorPromptsPolicyModule = require(Parent1.AvatarEditorPromptsPolicy)
local RenameOutfitNamePrompt = RoactModule.PureComponent:extend("RenameOutfitNamePrompt")
RenameOutfitNamePrompt.validateProps = TModule.strictInterface({
	outfitId = TModule.integer,
	outfitName = TModule.string,
	screenSize = TModule.Vector2,
	signalRenameOutfitPermissionDenied = TModule.callback,
	performRenameOutfit = TModule.callback,
	showCustomOutfitNames = TModule.boolean
})

function RenameOutfitNamePrompt.init(p1)
	p1:setState({
		outfitName = "",
		alertPosition = UDim2.fromScale(0.5, 0.5)
	})
	
	function p1.textUpdated(OutfitName)
		-- upvalues: p1 (copy)
		p1:setState({ outfitName = OutfitName })
	end
	
	function p1.confirmRenameOutfit()
		-- upvalues: p1 (copy)
		p1.props.performRenameOutfit(p1.state.outfitName)
	end
end

function RenameOutfitNamePrompt.render(p1)
	-- upvalues: RoactModule (copy), InteractiveAlert (copy), RobloxTranslatorModule (copy), ButtonType (copy), PromptWithTextFieldModule (copy)
	return if p1.props.showCustomOutfitNames then RoactModule.createElement(PromptWithTextFieldModule, {
		fieldText = p1.state.outfitName,
		onFieldTextUpdated = p1.textUpdated,
		title = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.RenameOutfitNamePromptTitle"),
		bodyText = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.RenameOutfitPromptText", { RBX_NAME = p1.props.outfitName }),
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = {
						onActivated = p1.props.signalRenameOutfitPermissionDenied,
						text = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.EnterOutfitNamePromptNo")
					}
				},
				{
					isDefaultChild = false,
					buttonType = ButtonType.PrimarySystem,
					props = {
						isDisabled = p1.state.outfitName == "",
						onActivated = p1.confirmRenameOutfit,
						text = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.EnterOutfitNamePromptYes")
					}
				}
			}
		}
	}) else RoactModule.createElement(InteractiveAlert, {
		isMiddleContentFocusable = false,
		title = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.DisabledRenameOutfitPromptTitle"),
		bodyText = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.DisabledRenameOutfitPromptText"),
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = p1.props.signalRenameOutfitPermissionDenied,
						text = RobloxTranslatorModule:FormatByKey("CoreScripts.AvatarEditorPrompts.DisabledRenameOutfitPromptOkay")
					}
				}
			}
		},
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = p1.props.screenSize
	})
end

return (AvatarEditorPromptsPolicyModule.connect(function(p1, _)
	return { showCustomOutfitNames = p1.getCustomOutfitNames() }
end)((RoactRoduxModule.connect(function(p1)
	return {
		outfitId = p1.promptInfo.outfitId,
		outfitName = p1.promptInfo.outfitName,
		screenSize = p1.screenSize
	}
end, function(Callback)
	-- upvalues: SignalRenameOutfitPermissionDeniedModule (copy), PerformRenameOutfitModule (copy)
	return {
		signalRenameOutfitPermissionDenied = function()
			-- upvalues: Callback (copy), SignalRenameOutfitPermissionDeniedModule (upval)
			return Callback(SignalRenameOutfitPermissionDeniedModule)
		end,
		performRenameOutfit = function(p1)
			-- upvalues: Callback (copy), PerformRenameOutfitModule (upval)
			return Callback(PerformRenameOutfitModule(p1))
		end
	}
end)(RenameOutfitNamePrompt))))