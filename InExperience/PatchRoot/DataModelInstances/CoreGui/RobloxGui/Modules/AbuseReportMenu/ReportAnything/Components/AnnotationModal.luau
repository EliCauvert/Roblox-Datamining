local CoreGui = game:GetService("CoreGui")
local GuiService = game:GetService("GuiService")
local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local Chrome = CoreGui:WaitForChild("RobloxGui").Modules.Chrome
local EnabledFunction = require(CorePackages.Workspace.Packages.Chrome).Enabled
local ServiceModule = if EnabledFunction() then require(Chrome.Service) else nil
local _ = require(AbuseReportMenu.Components.Types)
local ConstantsModule = require(AbuseReportMenu.Components.Constants)
local ScreenshotFlowStepHandlerContainerModule = require(AbuseReportMenu.ReportAnything.Components.ScreenshotFlowStepHandlerContainer)
local _ = require(AbuseReportMenu.ReportAnything.Utility.ReportAnythingAnalytics)
local FFlagEnableConsoleExpControls = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls
local config = {
	annotationPageHandle = nil,
	annotationPageFrame = nil,
	annotationPageScreenGui = nil
}

local function unmountAnnotationPage() --[[ Line: 28 ]]
	-- upvalues: FFlagEnableConsoleExpControls (copy), EnabledFunction (copy), ServiceModule (copy), config (copy), RoactModule (copy)
	if FFlagEnableConsoleExpControls and (if FFlagEnableConsoleExpControls then EnabledFunction() else EnabledFunction) then
		ServiceModule:setHideShortcutBar("AnnotationModal", false)
	end
	if config.annotationPageHandle ~= nil then
		RoactModule.unmount(config.annotationPageHandle)
		config.annotationPageHandle = nil
	end
	if config.annotationPageScreenGui ~= nil then
		config.annotationPageFrame.Parent = nil
		config.annotationPageFrame = nil
		config.annotationPageScreenGui = nil
	end
end

return {
	mountAnnotationPage = function(EntryPoint, Callback1, ReportAnythingAnalytics, p1, Callback: (any) -> ()) --[[ Line: 43 ]]
		-- upvalues: FFlagEnableConsoleExpControls (copy), EnabledFunction (copy), ServiceModule (copy), GuiService (copy), config (copy), CoreGui (copy), ConstantsModule (copy), RoactModule (copy), ScreenshotFlowStepHandlerContainerModule (copy), unmountAnnotationPage (copy)
		if FFlagEnableConsoleExpControls and (if FFlagEnableConsoleExpControls then EnabledFunction() else EnabledFunction) then
			ServiceModule:setHideShortcutBar("AnnotationModal", true)
		end
		local GuiInset, _ = GuiService:GetGuiInset()
		
		if not config.annotationPageScreenGui then
			local AnnotationPageContents = Instance.new("ScreenGui")
			AnnotationPageContents.Name = "AnnotationPageContents"
			AnnotationPageContents.DisplayOrder = 7
			AnnotationPageContents.Enabled = true
			AnnotationPageContents.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			AnnotationPageContents.Parent = CoreGui:FindFirstChild(ConstantsModule.AbuseReportMenuPlaceholderFrame, true)
			config.annotationPageScreenGui = AnnotationPageContents
			local Frame = Instance.new("Frame")
			Frame.BackgroundTransparency = 1
			Frame.Position = UDim2.new(0, 0, 0, -GuiInset.Y)
			Frame.Size = UDim2.new(1, 0, 1, GuiInset.Y)
			Frame.Parent = config.annotationPageScreenGui
			config.annotationPageFrame = Frame
		end
		local Element = RoactModule.createElement(ScreenshotFlowStepHandlerContainerModule, {
			initialPageNumber = 1,
			screenshot = p1.screenshotContentId,
			entryPoint = EntryPoint,
			backAction = function() --[[ Line: 76 ]]
				-- upvalues: unmountAnnotationPage (upval)
				unmountAnnotationPage()
			end,
			dismissAction = function() --[[ Line: 79 ]]
				-- upvalues: unmountAnnotationPage (upval)
				unmountAnnotationPage()
			end,
			finishAnnotationAction = function(AnnotationPoints) --[[ Line: 82 ]]
				-- upvalues: unmountAnnotationPage (upval), Callback (copy), ConstantsModule (upval)
				unmountAnnotationPage()
				Callback({
					type = ConstantsModule.ReportAnythingActions.SetAnnotationPoints,
					annotationPoints = AnnotationPoints
				})
				Callback({
					type = ConstantsModule.ReportAnythingActions.CompleteAttachment
				})
			end,
			restartAction = function() --[[ Line: 92 ]]
				-- upvalues: unmountAnnotationPage (upval), Callback (copy), ConstantsModule (upval), Callback1 (copy)
				unmountAnnotationPage()
				Callback({ type = ConstantsModule.ReportAnythingActions.ClearAll })
				Callback1()
			end,
			skipAnnotationAction = function() --[[ Line: 102 ]]
				-- upvalues: unmountAnnotationPage (upval), Callback (copy), ConstantsModule (upval)
				unmountAnnotationPage()
				Callback({
					type = ConstantsModule.ReportAnythingActions.CompleteAttachment
				})
			end,
			setAnnotationCircleRadius = function(Radius) --[[ Line: 108 ]]
				-- upvalues: Callback (copy), ConstantsModule (upval)
				Callback({
					type = ConstantsModule.ReportAnythingActions.SetAnnotationCircleRadius,
					radius = Radius
				})
			end,
			setAnnotationAreaDimensions = function(Width, Height) --[[ Line: 114 ]]
				-- upvalues: Callback (copy), ConstantsModule (upval)
				Callback({
					type = ConstantsModule.ReportAnythingActions.SetAnnotationAreaDimensions,
					width = Width,
					height = Height
				})
			end,
			initialAnnotationPoints = {},
			viewportInfo = p1.identificationResults.avatarIDStats.viewportInfo,
			reportAnythingAnalytics = ReportAnythingAnalytics
		})
		Callback({
			type = ConstantsModule.ReportAnythingActions.SetAnnotationOptionSeen
		})
		config.annotationPageHandle = RoactModule.mount(Element, config.annotationPageFrame, "AnnotationFlow")
	end,
	unmountAnnotationPage = unmountAnnotationPage
}