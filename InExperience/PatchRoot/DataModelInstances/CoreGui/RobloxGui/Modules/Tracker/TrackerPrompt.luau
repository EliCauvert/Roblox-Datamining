local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local httpService = game:GetService("HttpService")
local guiService = game:GetService("GuiService")
local _ = game:GetService("ContentProvider")
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local toast = UIBloxModule.App.Dialog.Toast
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local renderWithCoreScriptsStyleProviderModule = require(robloxGui.Modules.Common.renderWithCoreScriptsStyleProvider)
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local trackerPromptTypeModule = require(robloxGui.Modules.Tracker.TrackerPromptType)
local trackerPromptNewCopyForCameraPerformanceEnabled = game:DefineFastFlag("TrackerPromptNewCopyForCameraPerformanceEnabled", false)
local cameraUnavailableUrl = game:DefineFastString("CameraUnavailableUrl", "https://help.roblox.com/hc/articles/17877687557396")
local trackerPrompt = roactModule.PureComponent:extend("TrackerPrompt")
trackerPrompt.validateProps = tModule.strictInterface({ promptType = tModule.optional(tModule.string) })
local t = {
	[trackerPromptTypeModule.None] = "",
	[trackerPromptTypeModule.VideoNoPermission] = robloxTranslatorModule:FormatByKey("Feature.FaceChat.Heading.UnableToAccessCamera"),
	[trackerPromptTypeModule.NotAvailable] = robloxTranslatorModule:FormatByKey("Feature.FaceChat.Heading.NotAvailable"),
	[trackerPromptTypeModule.FeatureDisabled] = robloxTranslatorModule:FormatByKey("Feature.FaceChat.Heading.FacialAnimation"),
	[trackerPromptTypeModule.LODCameraRecommendDisable] = if trackerPromptNewCopyForCameraPerformanceEnabled then robloxTranslatorModule:FormatByKey("Feature.FaceChat.Heading.LowPerformanceDetected") else robloxTranslatorModule:FormatByKey("Feature.FaceChat.Heading.VideoPerformancePromptDisable"),
	[trackerPromptTypeModule.NoDynamicHeadEquipped] = robloxTranslatorModule:FormatByKey("Feature.FaceChat.Heading.PromptNoDynamicHeadEquipped"),
	[trackerPromptTypeModule.VideoUnsupported] = robloxTranslatorModule:FormatByKey("Feature.FaceChat.Heading.VideoUnsupported"),
	[trackerPromptTypeModule.UnsupportedDevice] = robloxTranslatorModule:FormatByKey("Feature.FaceChat.Heading.NotAvailable"),
	[trackerPromptTypeModule.CameraUnavailable] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.CameraUnavailable")
}
local t_1 = {
	[trackerPromptTypeModule.None] = "",
	[trackerPromptTypeModule.VideoNoPermission] = robloxTranslatorModule:FormatByKey("Feature.FaceChat.Subtitle.UnableToAccessCamera"),
	[trackerPromptTypeModule.NotAvailable] = robloxTranslatorModule:FormatByKey("Feature.FaceChat.Subtitle.NotAvailable"),
	[trackerPromptTypeModule.FeatureDisabled] = robloxTranslatorModule:FormatByKey("Feature.FaceChat.Subtitle.FeatureDisabled"),
	[trackerPromptTypeModule.LODCameraRecommendDisable] = robloxTranslatorModule:FormatByKey("Feature.FaceChat.Subtitle.VideoPerformancePromptDisable"),
	[trackerPromptTypeModule.NoDynamicHeadEquipped] = robloxTranslatorModule:FormatByKey("Feature.FaceChat.Subtitle.PromptNoDynamicHeadEquipped"),
	[trackerPromptTypeModule.VideoUnsupported] = robloxTranslatorModule:FormatByKey("Feature.FaceChat.Subtitle.VideoUnsupported"),
	[trackerPromptTypeModule.UnsupportedDevice] = robloxTranslatorModule:FormatByKey("Feature.FaceChat.Subtitle.UnsupportedDevice"),
	[trackerPromptTypeModule.CameraUnavailable] = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.CameraUnavailable")
}
local _ = { FullScreen = 0, FormSheet = 2 }

local function openWebview(p0) --[[ line: 77 ]]
	-- upvalues: httpService (ref), robloxTranslatorModule (ref), guiService (ref)
	guiService:BroadcastNotification(httpService:JSONEncode({
		presentationStyle = 2,
		visible = true,
		title = if game:GetEngineFeature("SetWebViewTitle") then robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Prompt.CameraUnavailable") else nil,
		url = p0
	}), 20)
end

function trackerPrompt.init(p1) --[[ line: 90 ]]
	p1.promptType = p1.props.promptType
end

function trackerPrompt.render(p2) --[[ line: 94 ]]
	-- upvalues: roactModule (ref), trackerPromptTypeModule (ref), toast (ref), images (ref), t (ref), t_1 (ref), openWebview (ref), cameraUnavailableUrl (ref), renderWithCoreScriptsStyleProviderModule (ref)
	p2.promptType = p2.props.promptType
	
	return roactModule.createElement("ScreenGui", {
		AutoLocalize = false,
		DisplayOrder = 10,
		IgnoreGuiInset = true,
		OnTopOfCoreBlur = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Content = renderWithCoreScriptsStyleProviderModule({
			TrackerPrompt = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
				Toast = p2.promptType ~= trackerPromptTypeModule.None and roactModule.createElement(toast, {
					duration = 8,
					toastContent = {
						iconImage = images["icons/status/alert"],
						toastTitle = t[p2.promptType],
						toastSubtitle = t_1[p2.promptType],
						onDismissed = function() --[[ line: 106 ]] end,
						onActivated = function() --[[ line: 107 ]]
							-- upvalues: p2 (ref), trackerPromptTypeModule (copy), openWebview (copy), cameraUnavailableUrl (copy)
							if p2.promptType == trackerPromptTypeModule.CameraUnavailable then
								openWebview(cameraUnavailableUrl)
							end
						end
					}
				})
			})
		})
	})
end

return trackerPrompt