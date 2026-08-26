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

local function _(p1)
	-- upvalues: getInputGroup (ref), inputTypeModule (ref)
	return getInputGroup(p1) == inputTypeModule.InputTypeConstants.Gamepad
end

function resultModal.init(p1)
	-- upvalues: userInputService (ref), getInputGroup (ref), inputTypeModule (ref)
	p1:setState({
		isGamepad = getInputGroup(userInputService:GetLastInputType()) == inputTypeModule.InputTypeConstants.Gamepad
	})
end

function resultModal.getLocalizedStringForResultPrompt(_, p1)
	-- upvalues: robloxTranslatorModule (ref)
	return if p1 == Enum.PromptPublishAssetResult.Success then robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.PublishSuccessMessage") elseif p1 == Enum.PromptPublishAssetResult.UploadFailed then robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.PublishFailed") elseif p1 == Enum.PromptPublishAssetResult.NoUserInput then robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.NoUserInput") else robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.UndefinedError", { RESULT_TYPE = tostring(p1) })
end

function resultModal.getLocalizedTitleForResultPrompt(_, p1)
	-- upvalues: robloxTranslatorModule (ref)
	return if p1 == Enum.PromptPublishAssetResult.Success then robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.PublishSuccessTitle") else robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.PublishFailedTitle")
end

function resultModal.render(p1)
	-- upvalues: roactModule (ref), interactiveAlert (ref), buttonType (ref), getFFlagValidateDescriptionModule (ref), robloxTranslatorModule (ref), xboxA (ref)
	return roactModule.createElement(interactiveAlert, {
		title = p1:getLocalizedTitleForResultPrompt(p1.props.resultModalType),
		bodyText = p1:getLocalizedStringForResultPrompt(p1.props.resultModalType),
		screenSize = p1.props.screenSize,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = buttonType.PrimarySystem,
					props = {
						onActivated = p1.props.closeResultModal,
						text = if getFFlagValidateDescriptionModule() then robloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.ResultModalOk") else robloxTranslatorModule:FormatByKey("InGame.CommonUI.Button.Ok"),
						inputIcon = if p1.state.isGamepad then xboxA else nil
					}
				}
			}
		}
	})
end

return roactRoduxModule.connect(function(p1)
	return { resultModalType = p1.promptRequest.resultModalType }
end, function(p1)
	-- upvalues: closeResultModalModule (ref)
	return {
		closeResultModal = function()
			-- upvalues: p1 (ref), closeResultModalModule (copy)
			return p1(closeResultModalModule)
		end
	}
end)(resultModal)