local corePackagesService = game:GetService("CorePackages")
local userInputService = game:GetService("UserInputService")
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local xboxA = UIBloxModule.App.ImageSet.Images["icons/controls/keys/xboxA"]
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local inputTypeModule = require(corePackagesService.Workspace.Packages.InputType)
local getInputGroup = require(corePackagesService.Workspace.Packages.InputType).getInputGroup
local closeResultModalModule = require(script.Parent.Parent.Thunks.CloseResultModal)
local getFFlagValidateDescriptionModule = require(script.Parent.Parent.GetFFlagValidateDescription)
local resultModal = roactModule.PureComponent:extend("ResultModal")
resultModal.validateProps = tModule.strictInterface({
	screenSize = tModule.Vector2,
	resultModalType = tModule.enum(Enum.PromptPublishAssetResult),
	closeResultModal = tModule.callback
})

local function _(p0)
	-- upvalues: getInputGroup (ref), inputTypeModule (ref)
	return getInputGroup(p0) == inputTypeModule.InputTypeConstants.Gamepad
end

function resultModal.init(p1)
	-- upvalues: userInputService (ref), getInputGroup (ref), inputTypeModule (ref)
	p1:setState({
		isGamepad = getInputGroup(userInputService:GetLastInputType()) == inputTypeModule.InputTypeConstants.Gamepad
	})
end

function resultModal.getLocalizedStringForResultPrompt(_, p2)
	-- upvalues: robloxTranslatorModule (ref)
	return if p2 == Enum.PromptPublishAssetResult.Success then robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.PublishSuccessMessage") elseif p2 == Enum.PromptPublishAssetResult.UploadFailed then robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.PublishFailed") elseif p2 == Enum.PromptPublishAssetResult.NoUserInput then robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.NoUserInput") else robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.UndefinedError", { RESULT_TYPE = tostring(p2) })
end

function resultModal.getLocalizedTitleForResultPrompt(_, p3)
	-- upvalues: robloxTranslatorModule (ref)
	return if p3 == Enum.PromptPublishAssetResult.Success then robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.PublishSuccessTitle") else robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.PublishFailedTitle")
end

function resultModal.render(p4)
	-- upvalues: roactModule (ref), interactiveAlert (ref), buttonType (ref), getFFlagValidateDescriptionModule (ref), robloxTranslatorModule (ref), xboxA (ref)
	return roactModule.createElement(interactiveAlert, {
		title = p4:getLocalizedTitleForResultPrompt(p4.props.resultModalType),
		bodyText = p4:getLocalizedStringForResultPrompt(p4.props.resultModalType),
		screenSize = p4.props.screenSize,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = p4.props.closeResultModal,
						text = if getFFlagValidateDescriptionModule() then robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.ResultModalOk") else robloxTranslatorModule:FormatByKey("InGame.CommonUI.Button.Ok"),
						inputIcon = if p4.state.isGamepad then xboxA else nil
					}
				}
			}
		}
	})
end

return roactRoduxModule.connect(function(p5)
	return { resultModalType = p5.promptRequest.resultModalType }
end, function(p6)
	-- upvalues: closeResultModalModule (ref)
	return {
		closeResultModal = function()
			-- upvalues: p6 (ref), closeResultModalModule (copy)
			return p6(closeResultModalModule)
		end
	}
end)(resultModal)