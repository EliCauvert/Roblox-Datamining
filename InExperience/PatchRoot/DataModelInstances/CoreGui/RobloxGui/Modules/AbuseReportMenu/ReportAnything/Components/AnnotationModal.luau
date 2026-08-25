local coreGuiService = game:GetService("CoreGui")
local guiService = game:GetService("GuiService")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local enabled = require(corePackagesService.Workspace.Packages.Chrome).Enabled
local var6 = if enabled() then require(robloxGui.Modules.Chrome.Service) else nil
local _ = require(abuseReportMenu.Components.Types)
local constantsModule = require(abuseReportMenu.Components.Constants)
local screenshotFlowStepHandlerContainerModule = require(abuseReportMenu.ReportAnything.Components.ScreenshotFlowStepHandlerContainer)
local _ = require(abuseReportMenu.ReportAnything.Utility.ReportAnythingAnalytics)
local fFlagEnableConsoleExpControls = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls
local t = {
	annotationPageHandle = nil,
	annotationPageFrame = nil,
	annotationPageScreenGui = nil
}

local function unmountAnnotationPage()
	-- upvalues: fFlagEnableConsoleExpControls (ref), enabled (ref), var6 (ref), t (ref), roactModule (ref)
	if fFlagEnableConsoleExpControls and (if fFlagEnableConsoleExpControls then enabled() else enabled) then
		var6:setHideShortcutBar("AnnotationModal", false)
	end
	if t.annotationPageHandle ~= nil then
		roactModule.unmount(t.annotationPageHandle)
		t.annotationPageHandle = nil
	end
	if t.annotationPageScreenGui ~= nil then
		t.annotationPageFrame.Parent = nil
		t.annotationPageFrame = nil
		t.annotationPageScreenGui = nil
	end
end

return {
	mountAnnotationPage = function(p0, p1, p2, p3, p4)
		-- upvalues: fFlagEnableConsoleExpControls (ref), enabled (ref), var6 (ref), guiService (ref), t (ref), coreGuiService (ref), constantsModule (ref), roactModule (ref), screenshotFlowStepHandlerContainerModule (ref), unmountAnnotationPage (ref)
		if fFlagEnableConsoleExpControls and (if fFlagEnableConsoleExpControls then enabled() else enabled) then
			var6:setHideShortcutBar("AnnotationModal", true)
		end
		local guiInset, _ = guiService:GetGuiInset()
		
		if not t.annotationPageScreenGui then
			local annotationPageContents = Instance.new("ScreenGui")
			annotationPageContents.Name = "AnnotationPageContents"
			annotationPageContents.DisplayOrder = 7
			annotationPageContents.Enabled = true
			annotationPageContents.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			annotationPageContents.Parent = coreGuiService:FindFirstChild(constantsModule.AbuseReportMenuPlaceholderFrame, true)
			t.annotationPageScreenGui = annotationPageContents
			local frame = Instance.new("Frame")
			frame.BackgroundTransparency = 1
			frame.Position = UDim2.new(0, 0, 0, -guiInset.Y)
			frame.Size = UDim2.new(1, 0, 1, guiInset.Y)
			frame.Parent = t.annotationPageScreenGui
			t.annotationPageFrame = frame
		end
		local var14 = roactModule.createElement(screenshotFlowStepHandlerContainerModule, {
			initialPageNumber = 1,
			screenshot = p3.screenshotContentId,
			entryPoint = p0,
			backAction = function()
				-- upvalues: unmountAnnotationPage (copy)
				unmountAnnotationPage()
			end,
			dismissAction = function()
				-- upvalues: unmountAnnotationPage (copy)
				unmountAnnotationPage()
			end,
			finishAnnotationAction = function(p5)
				-- upvalues: unmountAnnotationPage (copy), p4 (ref), constantsModule (copy)
				unmountAnnotationPage()
				p4({
					type = constantsModule.ReportAnythingActions.SetAnnotationPoints,
					annotationPoints = p5
				})
				p4({
					type = constantsModule.ReportAnythingActions.CompleteAttachment
				})
			end,
			restartAction = function()
				-- upvalues: unmountAnnotationPage (copy), p4 (ref), constantsModule (copy), p1 (ref)
				unmountAnnotationPage()
				p4({ type = constantsModule.ReportAnythingActions.ClearAll })
				p1()
			end,
			skipAnnotationAction = function()
				-- upvalues: unmountAnnotationPage (copy), p4 (ref), constantsModule (copy)
				unmountAnnotationPage()
				p4({
					type = constantsModule.ReportAnythingActions.CompleteAttachment
				})
			end,
			setAnnotationCircleRadius = function(value)
				-- upvalues: p4 (ref), constantsModule (copy)
				p4({
					type = constantsModule.ReportAnythingActions.SetAnnotationCircleRadius,
					radius = value
				})
			end,
			setAnnotationAreaDimensions = function(value, p6)
				-- upvalues: p4 (ref), constantsModule (copy)
				p4({
					type = constantsModule.ReportAnythingActions.SetAnnotationAreaDimensions,
					width = value,
					height = p6
				})
			end,
			initialAnnotationPoints = {},
			viewportInfo = p3.identificationResults.avatarIDStats.viewportInfo,
			reportAnythingAnalytics = p2
		})
		p4({
			type = constantsModule.ReportAnythingActions.SetAnnotationOptionSeen
		})
		t.annotationPageHandle = roactModule.mount(var14, t.annotationPageFrame, "AnnotationFlow")
	end,
	unmountAnnotationPage = unmountAnnotationPage
}