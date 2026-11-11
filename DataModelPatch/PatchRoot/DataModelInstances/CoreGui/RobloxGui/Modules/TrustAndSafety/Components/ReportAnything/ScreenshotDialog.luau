local CorePackages = game:GetService("CorePackages")
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ButtonStack = UIBloxModule.App.Button.ButtonStack
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local Parent = script.Parent.Parent.Parent
local AssetsModule = require(Parent.Resources.Assets)
local DebugCanvasModule = require(Parent.Components.DebugCanvas)
local ScreenshotHighlighterModule = require(Parent.Components.ReportAnything.ScreenshotHighlighter)
local VirtualKeyboardMonitorModule = require(Parent.Components.VirtualKeyboardMonitor)
local ScreenshotDialogPortraitModeHeaderModule = require(Parent.Components.ReportAnything.ScreenshotDialogPortraitModeHeader)
local ScreenshotDialogLandscapeModeHeaderModule = require(Parent.Components.ReportAnything.ScreenshotDialogLandscapeModeHeader)
local AbuseReportBuilderModule = require(Parent.Utility.AbuseReportBuilder)
local _ = require(Parent.Utility.ReportAnythingAnalytics)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local GetFFlagReportAnythingLocalizationEnabledModule = require(Parent.Flags.GetFFlagReportAnythingLocalizationEnabled)
local DividerModule = require(require(Parent.Dependencies).Divider)

local function PortraitModeFooter(p1)
	-- upvalues: ReactModule (copy), ButtonStack (copy), ButtonType (copy), GetFFlagReportAnythingLocalizationEnabledModule (copy), RobloxTranslatorModule (copy)
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 0,
		LayoutOrder = 4,
		Size = UDim2.new(1, 0, 0, 60),
		BackgroundColor3 = Color3.fromHex("#4F545F"),
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.fromScale(0, 1)
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center
		}),
		Container = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 400, 1, 0)
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 12),
				PaddingBottom = UDim.new(0, 12),
				PaddingLeft = UDim.new(0, 32),
				PaddingRight = UDim.new(0, 32)
			}),
			ActionButtons = ReactModule.createElement(ButtonStack, {
				marginBetween = 8,
				buttons = {
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							onActivated = function()
								-- upvalues: p1 (copy)
								p1.reportAction(p1.annotationPoints)
							end,
							text = if GetFFlagReportAnythingLocalizationEnabledModule() then RobloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.Next") else "Next"
						}
					}
				}
			})
		})
	})
end

return function(p1)
	-- upvalues: ReactModule (copy), UseStyleFunction (copy), VirtualKeyboardMonitorModule (copy), CryoModule (copy), ImageSetButton (copy), AssetsModule (copy), ScreenshotDialogPortraitModeHeaderModule (copy), ScreenshotDialogLandscapeModeHeaderModule (copy), DividerModule (copy), DebugCanvasModule (copy), AbuseReportBuilderModule (copy), ScreenshotHighlighterModule (copy), PortraitModeFooter (copy)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy)
		if p1.reportAnythingAnalytics then
			p1.reportAnythingAnalytics.incrementAnnotationPageSeen()
		end
	end, {})
	local Theme = UseStyleFunction().Theme
	local _Instance = VirtualKeyboardMonitorModule.getInstance()
	
	local function v22()
		-- upvalues: _Instance (copy), p1 (copy)
		warn("OverlayActivated")
		
		if _Instance:isKeyboardJustOff() then return end
		if p1.dismissAction then
			warn("Menu dismissed")
			p1.dismissAction()
		end
	end
	
	local UseStateResult, UseStateResult2 = ReactModule.useState(CryoModule.Dictionary.join({}, p1.initialAnnotationPoints or {}))
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState({})
	
	local function _()
		-- upvalues: UseStateResult (copy), UseStateResult2 (copy)
		local t = {}
		
		for i, value in pairs(UseStateResult) do
			t[i] = value
		end
		UseStateResult2(t)
	end
	
	local function UndoAnnotationPoints()
		-- upvalues: UseStateResult (copy), p1 (copy), UseStateResult1 (copy), UseStateResult2 (copy)
		if #UseStateResult > 0 then
			if p1.reportAnythingAnalytics then
				p1.reportAnythingAnalytics.incrementAnnotationUndo()
			end
			table.insert(UseStateResult1, 1, UseStateResult[#UseStateResult])
			table.remove(UseStateResult, #UseStateResult)
			local t = {}
			
			for i, value in pairs(UseStateResult) do
				t[i] = value
			end
			UseStateResult2(t)
		end
	end
	
	local function RedoAnnotationPoints()
		-- upvalues: UseStateResult1 (copy), p1 (copy), UseStateResult (copy), UseStateResult2 (copy)
		if #UseStateResult1 > 0 then
			if p1.reportAnythingAnalytics then
				p1.reportAnythingAnalytics.incrementAnnotationRedo()
			end
			table.insert(UseStateResult, UseStateResult1[1])
			table.remove(UseStateResult1, 1)
			local t = {}
			
			for i, value in pairs(UseStateResult) do
				t[i] = value
			end
			UseStateResult2(t)
		end
	end
	
	local IsUndoEnabled = #UseStateResult > 0
	local IsRedoEnabled = #UseStateResult1 > 0
	
	return ReactModule.createElement("TextButton", {
		AutoButtonColor = false,
		BorderSizePixel = 0,
		BackgroundColor3 = Theme.Overlay.Color,
		BackgroundTransparency = Theme.Overlay.Transparency,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		ZIndex = 10,
		Text = "",
		[ReactModule.Event.Activated] = v22
	}, {
		ScreenshotDialog = ReactModule.createElement(ImageSetButton, {
			Active = true,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Image = AssetsModule.Images.RoundedRect.Image,
			ImageColor3 = Theme.BackgroundUIDefault.Color,
			ImageTransparency = Theme.BackgroundUIDefault.Transparency,
			ScaleType = AssetsModule.Images.RoundedRect.ScaleType,
			SliceCenter = AssetsModule.Images.RoundedRect.SliceCenter
		}, {
			HeaderAndContent = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, if p1.isSmallPortraitMode then -60 else 0)
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Header = if p1.isSmallPortraitMode then ReactModule.createElement(ScreenshotDialogPortraitModeHeaderModule, {
					titleText = p1.titleText,
					backAction = p1.backAction,
					undoAnnotationPoints = UndoAnnotationPoints,
					redoAnnotationPoints = RedoAnnotationPoints,
					isRedoEnabled = IsRedoEnabled,
					isUndoEnabled = IsUndoEnabled,
					annotationPoints = UseStateResult
				}) else ReactModule.createElement(ScreenshotDialogLandscapeModeHeaderModule, {
					titleText = p1.titleText,
					backAction = p1.backAction,
					reportAction = p1.reportAction,
					undoAnnotationPoints = UndoAnnotationPoints,
					redoAnnotationPoints = RedoAnnotationPoints,
					isRedoEnabled = IsRedoEnabled,
					isUndoEnabled = IsUndoEnabled,
					annotationPoints = UseStateResult
				}),
				Divider = ReactModule.createElement(DividerModule, { LayoutOrder = 2 }),
				ScreenshotAnnotation = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					ZIndex = 1,
					Size = UDim2.new(1, 0, 1, -49)
				}, {
					Container = ReactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Size = UDim2.fromScale(1, 1),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.fromScale(0.5, 0.5)
					}, {
						UIAspectRatioConstraint = ReactModule.createElement("UIAspectRatioConstraint", { AspectRatio = p1.imageAspectRatio }),
						Padding = ReactModule.createElement("UIPadding", {
							PaddingTop = UDim.new(0, 16),
							PaddingBottom = UDim.new(0, 16),
							PaddingLeft = UDim.new(0, 16),
							PaddingRight = UDim.new(0, 16)
						}),
						AnnotationLayer = ReactModule.createElement("Frame", {
							BorderSizePixel = 2,
							Size = UDim2.new(1, 0, 1, 0),
							BorderMode = Enum.BorderMode.Inset,
							BorderColor3 = Color3.fromRGB(255, 255, 255)
						}, {
							ScreenshotImage = ReactModule.createElement("ImageLabel", {
								ZIndex = 1,
								Size = UDim2.fromScale(1, 1),
								Image = p1.screenshot
							}, {}),
							DebugCanvas = ReactModule.createElement(DebugCanvasModule, {
								ZIndex = 2,
								identifiedAvatars = AbuseReportBuilderModule.getIdentifiedAvatars(),
								identifiedAds = AbuseReportBuilderModule.getIdentifiedAds()
							}),
							Highlighter = ReactModule.createElement(ScreenshotHighlighterModule, {
								ZIndex = 3,
								annotationPoints = UseStateResult,
								handleAnnotationPoints = function(_)
									-- upvalues: p1 (copy), UseStateResult (copy), UseStateResult2 (copy), UseStateResult2_1 (copy)
									if p1.reportAnythingAnalytics then
										p1.reportAnythingAnalytics.incrementAnnotationPlace()
									end
									local t = {}
									
									for i, value in pairs(UseStateResult) do
										t[i] = value
									end
									UseStateResult2(t)
									UseStateResult2_1({})
								end,
								setAnnotationCircleRadius = AbuseReportBuilderModule.setAnnotationCircleRadius,
								setAspectRatioDimensions = AbuseReportBuilderModule.setAspectRatioDimensions
							}, {})
						})
					})
				})
			}),
			Footer = if p1.isSmallPortraitMode then ReactModule.createElement(PortraitModeFooter, {
				reportAction = p1.reportAction,
				annotationPoints = UseStateResult
			}) else nil
		})
	})
end