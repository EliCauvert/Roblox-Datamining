local corePackagesService = game:GetService("CorePackages")
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local reactModule = require(corePackagesService.Packages.React)
local cryoModule = require(corePackagesService.Packages.Cryo)
local imageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local useStyle = UIBloxModule.Core.Style.useStyle
local buttonStack = UIBloxModule.App.Button.ButtonStack
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local parent = script.Parent.Parent.Parent
local assetsModule = require(parent.Resources.Assets)
local dependenciesModule = require(parent.Dependencies)
local debugCanvasModule = require(parent.Components.DebugCanvas)
local screenshotHighlighterModule = require(parent.Components.ReportAnything.ScreenshotHighlighter)
local virtualKeyboardMonitorModule = require(parent.Components.VirtualKeyboardMonitor)
local screenshotDialogPortraitModeHeaderModule = require(parent.Components.ReportAnything.ScreenshotDialogPortraitModeHeader)
local screenshotDialogLandscapeModeHeaderModule = require(parent.Components.ReportAnything.ScreenshotDialogLandscapeModeHeader)
local abuseReportBuilderModule = require(parent.Utility.AbuseReportBuilder)
local _ = require(parent.Utility.ReportAnythingAnalytics)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local getFFlagReportAnythingLocalizationEnabledModule = require(parent.Flags.GetFFlagReportAnythingLocalizationEnabled)
local dividerModule = require(dependenciesModule.Divider)

local function PortraitModeFooter(p1)
	-- upvalues: reactModule (ref), buttonStack (ref), buttonType (ref), getFFlagReportAnythingLocalizationEnabledModule (ref), robloxTranslatorModule (ref)
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 0,
		LayoutOrder = 4,
		Size = UDim2.new(1, 0, 0, 60),
		BackgroundColor3 = Color3.fromHex("#4F545F"),
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.fromScale(0, 1)
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center
		}),
		Container = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 400, 1, 0)
		}, {
			Padding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 12),
				PaddingBottom = UDim.new(0, 12),
				PaddingLeft = UDim.new(0, 32),
				PaddingRight = UDim.new(0, 32)
			}),
			ActionButtons = reactModule.createElement(buttonStack, {
				marginBetween = 8,
				buttons = {
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							onActivated = function()
								-- upvalues: p1 (ref)
								p1.reportAction(p1.annotationPoints)
							end,
							text = if getFFlagReportAnythingLocalizationEnabledModule() then robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.Next") else "Next"
						}
					}
				}
			})
		})
	})
end

return function(p1)
	-- upvalues: reactModule (ref), useStyle (ref), virtualKeyboardMonitorModule (ref), cryoModule (ref), imageSetButton (ref), assetsModule (ref), screenshotDialogPortraitModeHeaderModule (ref), screenshotDialogLandscapeModeHeaderModule (ref), dividerModule (ref), debugCanvasModule (ref), abuseReportBuilderModule (ref), screenshotHighlighterModule (ref), PortraitModeFooter (ref)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref)
		if p1.reportAnythingAnalytics then
			p1.reportAnythingAnalytics.incrementAnnotationPageSeen()
		end
	end, {})
	local theme = useStyle().Theme
	local instance = virtualKeyboardMonitorModule.getInstance()
	
	local var1 = function()
		-- upvalues: instance (ref), p1 (ref)
		warn("OverlayActivated")
		
		if instance:isKeyboardJustOff() then return end
		if p1.dismissAction then
			warn("Menu dismissed")
			p1.dismissAction()
		end
	end
	
	local var2, var3 = reactModule.useState(cryoModule.Dictionary.join({}, p1.initialAnnotationPoints or {}))
	local var4, var5 = reactModule.useState({})
	
	local function _()
		-- upvalues: var2 (ref), var3 (ref)
		local t = {}
		
		for i, v in pairs(var2) do
			t[i] = v
		end
		var3(t)
	end
	
	local var6 = function(_)
		-- upvalues: p1 (ref), var2 (ref), var3 (ref), var5 (ref)
		if p1.reportAnythingAnalytics then
			p1.reportAnythingAnalytics.incrementAnnotationPlace()
		end
		local t = {}
		
		for i, v in pairs(var2) do
			t[i] = v
		end
		var3(t)
		var5({})
	end
	
	local var7 = function()
		-- upvalues: var2 (ref), p1 (ref), var4 (ref), var3 (ref)
		if #var2 > 0 then
			if p1.reportAnythingAnalytics then
				p1.reportAnythingAnalytics.incrementAnnotationUndo()
			end
			table.insert(var4, 1, var2[#var2])
			table.remove(var2, #var2)
			local t = {}
			
			for i, v in pairs(var2) do
				t[i] = v
			end
			var3(t)
		end
	end
	
	local var8 = function()
		-- upvalues: var4 (ref), p1 (ref), var2 (ref), var3 (ref)
		if #var4 > 0 then
			if p1.reportAnythingAnalytics then
				p1.reportAnythingAnalytics.incrementAnnotationRedo()
			end
			table.insert(var2, var4[1])
			table.remove(var4, 1)
			local t = {}
			
			for i, v in pairs(var2) do
				t[i] = v
			end
			var3(t)
		end
	end
	
	local var9 = #var2 > 0
	local var10 = #var4 > 0
	
	return reactModule.createElement("TextButton", {
		AutoButtonColor = false,
		BorderSizePixel = 0,
		BackgroundColor3 = theme.Overlay.Color,
		BackgroundTransparency = theme.Overlay.Transparency,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		ZIndex = 10,
		Text = "",
		[reactModule.Event.Activated] = var1
	}, {
		ScreenshotDialog = reactModule.createElement(imageSetButton, {
			Active = true,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Image = assetsModule.Images.RoundedRect.Image,
			ImageColor3 = theme.BackgroundUIDefault.Color,
			ImageTransparency = theme.BackgroundUIDefault.Transparency,
			ScaleType = assetsModule.Images.RoundedRect.ScaleType,
			SliceCenter = assetsModule.Images.RoundedRect.SliceCenter
		}, {
			HeaderAndContent = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, if p1.isSmallPortraitMode then -60 else 0)
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Header = if p1.isSmallPortraitMode then reactModule.createElement(screenshotDialogPortraitModeHeaderModule, {
					titleText = p1.titleText,
					backAction = p1.backAction,
					undoAnnotationPoints = var7,
					redoAnnotationPoints = var8,
					isRedoEnabled = var10,
					isUndoEnabled = var9,
					annotationPoints = var2
				}) else reactModule.createElement(screenshotDialogLandscapeModeHeaderModule, {
					titleText = p1.titleText,
					backAction = p1.backAction,
					reportAction = p1.reportAction,
					undoAnnotationPoints = var7,
					redoAnnotationPoints = var8,
					isRedoEnabled = var10,
					isUndoEnabled = var9,
					annotationPoints = var2
				}),
				Divider = reactModule.createElement(dividerModule, { LayoutOrder = 2 }),
				ScreenshotAnnotation = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					ZIndex = 1,
					Size = UDim2.new(1, 0, 1, -49)
				}, {
					Container = reactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Size = UDim2.fromScale(1, 1),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5)
					}, {
						UIAspectRatioConstraint = reactModule.createElement("UIAspectRatioConstraint", { AspectRatio = p1.imageAspectRatio }),
						Padding = reactModule.createElement("UIPadding", {
							PaddingTop = UDim.new(0, 16),
							PaddingBottom = UDim.new(0, 16),
							PaddingLeft = UDim.new(0, 16),
							PaddingRight = UDim.new(0, 16)
						}),
						AnnotationLayer = reactModule.createElement("Frame", {
							BorderSizePixel = 2,
							Size = UDim2.new(1, 0, 1, 0),
							BorderMode = Enum.BorderMode.Inset,
							BorderColor3 = Color3.fromRGB(255, 255, 255)
						}, {
							ScreenshotImage = reactModule.createElement("ImageLabel", {
								ZIndex = 1,
								Size = UDim2.fromScale(1, 1),
								Image = p1.screenshot
							}, {}),
							DebugCanvas = reactModule.createElement(debugCanvasModule, {
								ZIndex = 2,
								identifiedAvatars = abuseReportBuilderModule.getIdentifiedAvatars(),
								identifiedAds = abuseReportBuilderModule.getIdentifiedAds()
							}),
							Highlighter = reactModule.createElement(screenshotHighlighterModule, {
								ZIndex = 3,
								annotationPoints = var2,
								handleAnnotationPoints = var6,
								setAnnotationCircleRadius = abuseReportBuilderModule.setAnnotationCircleRadius,
								setAspectRatioDimensions = abuseReportBuilderModule.setAspectRatioDimensions
							}, {})
						})
					})
				})
			}),
			Footer = if p1.isSmallPortraitMode then reactModule.createElement(PortraitModeFooter, { reportAction = p1.reportAction, annotationPoints = var2 }) else nil
		})
	})
end