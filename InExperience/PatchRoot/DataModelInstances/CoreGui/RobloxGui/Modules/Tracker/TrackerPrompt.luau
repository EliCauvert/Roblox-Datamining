local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local GuiService = game:GetService("GuiService")
local _ = game:GetService("ContentProvider")
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local Toast = UIBloxModule.App.Dialog.Toast
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local RenderWithCoreScriptsStyleProviderModule = require(RobloxGui.Modules.Common.renderWithCoreScriptsStyleProvider)
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local TrackerPromptTypeModule = require(RobloxGui.Modules.Tracker.TrackerPromptType)
local TrackerPromptNewCopyForCameraPerformanceEnabled = game:DefineFastFlag("TrackerPromptNewCopyForCameraPerformanceEnabled", false)
local CameraUnavailableUrl = game:DefineFastString("CameraUnavailableUrl", "https://help.roblox.com/hc/articles/17877687557396")
local TrackerPrompt = RoactModule.PureComponent:extend("TrackerPrompt")
TrackerPrompt.validateProps = TModule.strictInterface({ promptType = TModule.optional(TModule.string) })
local config = {
	[TrackerPromptTypeModule.None] = "",
	[TrackerPromptTypeModule.VideoNoPermission] = RobloxTranslatorModule:FormatByKey("Feature.FaceChat.Heading.UnableToAccessCamera"),
	[TrackerPromptTypeModule.NotAvailable] = RobloxTranslatorModule:FormatByKey("Feature.FaceChat.Heading.NotAvailable"),
	[TrackerPromptTypeModule.FeatureDisabled] = RobloxTranslatorModule:FormatByKey("Feature.FaceChat.Heading.FacialAnimation"),
	[TrackerPromptTypeModule.LODCameraRecommendDisable] = if TrackerPromptNewCopyForCameraPerformanceEnabled then RobloxTranslatorModule:FormatByKey("Feature.FaceChat.Heading.LowPerformanceDetected") else RobloxTranslatorModule:FormatByKey("Feature.FaceChat.Heading.VideoPerformancePromptDisable"),
	[TrackerPromptTypeModule.NoDynamicHeadEquipped] = RobloxTranslatorModule:FormatByKey("Feature.FaceChat.Heading.PromptNoDynamicHeadEquipped"),
	[TrackerPromptTypeModule.VideoUnsupported] = RobloxTranslatorModule:FormatByKey("Feature.FaceChat.Heading.VideoUnsupported"),
	[TrackerPromptTypeModule.UnsupportedDevice] = RobloxTranslatorModule:FormatByKey("Feature.FaceChat.Heading.NotAvailable"),
	[TrackerPromptTypeModule.CameraUnavailable] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.CameraUnavailable")
}
local config1 = {
	[TrackerPromptTypeModule.None] = "",
	[TrackerPromptTypeModule.VideoNoPermission] = RobloxTranslatorModule:FormatByKey("Feature.FaceChat.Subtitle.UnableToAccessCamera"),
	[TrackerPromptTypeModule.NotAvailable] = RobloxTranslatorModule:FormatByKey("Feature.FaceChat.Subtitle.NotAvailable"),
	[TrackerPromptTypeModule.FeatureDisabled] = RobloxTranslatorModule:FormatByKey("Feature.FaceChat.Subtitle.FeatureDisabled"),
	[TrackerPromptTypeModule.LODCameraRecommendDisable] = RobloxTranslatorModule:FormatByKey("Feature.FaceChat.Subtitle.VideoPerformancePromptDisable"),
	[TrackerPromptTypeModule.NoDynamicHeadEquipped] = RobloxTranslatorModule:FormatByKey("Feature.FaceChat.Subtitle.PromptNoDynamicHeadEquipped"),
	[TrackerPromptTypeModule.VideoUnsupported] = RobloxTranslatorModule:FormatByKey("Feature.FaceChat.Subtitle.VideoUnsupported"),
	[TrackerPromptTypeModule.UnsupportedDevice] = RobloxTranslatorModule:FormatByKey("Feature.FaceChat.Subtitle.UnsupportedDevice"),
	[TrackerPromptTypeModule.CameraUnavailable] = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.CameraUnavailable")
}

local function openWebview(Url) --[[ Line: 77 ]]
	-- upvalues: HttpService (copy), RobloxTranslatorModule (copy), GuiService (copy)
	GuiService:BroadcastNotification(HttpService:JSONEncode({
		presentationStyle = 2,
		visible = true,
		title = if game:GetEngineFeature("SetWebViewTitle") then RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.CameraUnavailable") else nil,
		url = Url
	}), 20)
end

function TrackerPrompt.init(p1) --[[ Line: 90 ]]
	p1.promptType = p1.props.promptType
end

function TrackerPrompt.render(p1) --[[ Line: 94 ]]
	-- upvalues: RoactModule (copy), TrackerPromptTypeModule (copy), Toast (copy), Images (copy), config (copy), config1 (copy), openWebview (copy), CameraUnavailableUrl (copy), RenderWithCoreScriptsStyleProviderModule (copy)
	p1.promptType = p1.props.promptType
	
	return RoactModule.createElement("ScreenGui", {
		AutoLocalize = false,
		DisplayOrder = 10,
		IgnoreGuiInset = true,
		OnTopOfCoreBlur = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Content = RenderWithCoreScriptsStyleProviderModule({
			TrackerPrompt = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				Toast = p1.promptType ~= TrackerPromptTypeModule.None and RoactModule.createElement(Toast, {
					duration = 8,
					toastContent = {
						iconImage = Images["icons/status/alert"],
						toastTitle = config[p1.promptType],
						toastSubtitle = config1[p1.promptType],
						onDismissed = function() --[[ Line: 106 ]] end,
						onActivated = function() --[[ Line: 107 ]]
							-- upvalues: p1 (copy), TrackerPromptTypeModule (upval), openWebview (upval), CameraUnavailableUrl (upval)
							if p1.promptType == TrackerPromptTypeModule.CameraUnavailable then
								openWebview(CameraUnavailableUrl)
							end
						end
					}
				})
			})
		})
	})
end

return TrackerPrompt