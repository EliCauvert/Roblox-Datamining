local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local IconsControlsKeysXboxA = UIBloxModule.App.ImageSet.Images["icons/controls/keys/xboxA"]
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local InputTypeModule = require(CorePackages.Workspace.Packages.InputType)
local GetInputGroupFunction = require(CorePackages.Workspace.Packages.InputType).getInputGroup
local CloseResultModalModule = require(script.Parent.Parent.Thunks.CloseResultModal)
local GetFFlagValidateDescriptionModule = require(script.Parent.Parent.GetFFlagValidateDescription)
local ResultModal = RoactModule.PureComponent:extend("ResultModal")
ResultModal.validateProps = TModule.strictInterface({
	screenSize = TModule.Vector2,
	resultModalType = TModule.enum(Enum.PromptPublishAssetResult),
	closeResultModal = TModule.callback
})

local function _(p1): boolean
	-- upvalues: GetInputGroupFunction (copy), InputTypeModule (copy)
	return GetInputGroupFunction(p1) == InputTypeModule.InputTypeConstants.Gamepad
end

function ResultModal.init(p1)
	-- upvalues: UserInputService (copy), GetInputGroupFunction (copy), InputTypeModule (copy)
	p1:setState({
		isGamepad = GetInputGroupFunction((UserInputService:GetLastInputType())) == InputTypeModule.InputTypeConstants.Gamepad
	})
end

function ResultModal:getLocalizedStringForResultPrompt(PromptPublishAssetResult)
	-- upvalues: RobloxTranslatorModule (copy)
	return if PromptPublishAssetResult == Enum.PromptPublishAssetResult.Success then RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.PublishSuccessMessage") elseif PromptPublishAssetResult == Enum.PromptPublishAssetResult.UploadFailed then RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.PublishFailed") elseif PromptPublishAssetResult == Enum.PromptPublishAssetResult.NoUserInput then RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.NoUserInput") else RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.UndefinedError", { RESULT_TYPE = tostring(PromptPublishAssetResult) })
end

function ResultModal:getLocalizedTitleForResultPrompt(PromptPublishAssetResult)
	-- upvalues: RobloxTranslatorModule (copy)
	return if PromptPublishAssetResult == Enum.PromptPublishAssetResult.Success then RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.PublishSuccessTitle") else RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.PublishFailedTitle")
end

function ResultModal.render(p1)
	-- upvalues: RoactModule (copy), InteractiveAlert (copy), ButtonType (copy), GetFFlagValidateDescriptionModule (copy), RobloxTranslatorModule (copy), IconsControlsKeysXboxA (copy)
	return RoactModule.createElement(InteractiveAlert, {
		title = p1:getLocalizedTitleForResultPrompt(p1.props.resultModalType),
		bodyText = p1:getLocalizedStringForResultPrompt(p1.props.resultModalType),
		screenSize = p1.props.screenSize,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = p1.props.closeResultModal,
						text = if GetFFlagValidateDescriptionModule() then RobloxTranslatorModule:FormatByKey("CoreScripts.PublishAssetPrompt.ResultModalOk") else RobloxTranslatorModule:FormatByKey("InGame.CommonUI.Button.Ok"),
						inputIcon = p1.state.isGamepad and IconsControlsKeysXboxA or nil
					}
				}
			}
		}
	})
end

return RoactRoduxModule.connect(function(p1)
	return { resultModalType = p1.promptRequest.resultModalType }
end, function(Callback)
	-- upvalues: CloseResultModalModule (copy)
	return {
		closeResultModal = function()
			-- upvalues: Callback (copy), CloseResultModalModule (upval)
			return Callback(CloseResultModalModule)
		end
	}
end)(ResultModal)