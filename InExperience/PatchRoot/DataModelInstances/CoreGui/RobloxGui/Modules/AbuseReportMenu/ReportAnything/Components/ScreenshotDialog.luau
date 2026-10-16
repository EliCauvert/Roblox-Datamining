local CorePackages = game:GetService("CorePackages")
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ButtonStack = UIBloxModule.App.Button.ButtonStack
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local Parent = script.Parent.Parent
local AssetsModule = require(Parent.Resources.Assets)
local DividerModule = require(Parent.Components.Divider)
local ScreenshotHighlighterModule = require(Parent.Components.ScreenshotHighlighter)
local VirtualKeyboardMonitorModule = require(Parent.Utility.VirtualKeyboardMonitor)
local ScreenshotDialogPortraitModeHeaderModule = require(Parent.Components.ScreenshotDialogPortraitModeHeader)
local ScreenshotDialogLandscapeModeHeaderModule = require(Parent.Components.ScreenshotDialogLandscapeModeHeader)
local _ = require(Parent.Utility.ReportAnythingAnalytics)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)

local function PortraitModeFooter(p1) --[[ Line: 43 ]]
	-- upvalues: ReactModule (copy), ButtonStack (copy), ButtonType (copy), RobloxTranslatorModule (copy)
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
							onActivated = function() --[[ Line: 74 ]]
								-- upvalues: p1 (copy)
								p1.finishAnnotationAction(p1.annotationPoints)
							end,
							text = RobloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.Next")
						}
					}
				}
			})
		})
	})
end

return function(p1) --[[ Line: 86 | Named "ScreenshotDialog" ]]
	-- upvalues: UseStyleFunction (copy), VirtualKeyboardMonitorModule (copy), ReactModule (copy), CryoModule (copy), ImageSetButton (copy), AssetsModule (copy), ScreenshotDialogPortraitModeHeaderModule (copy), ScreenshotDialogLandscapeModeHeaderModule (copy), DividerModule (copy), ScreenshotHighlighterModule (copy), PortraitModeFooter (copy)
	local Theme = UseStyleFunction().Theme
	local _Instance = VirtualKeyboardMonitorModule.getInstance()
	
	local function v19() --[[ Line: 92 ]]
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
	local UseResult = ReactModule.useCallback(function() --[[ Line: 109 ]]
		-- upvalues: UseStateResult2 (copy), UseStateResult (copy)
		UseStateResult2(table.clone(UseStateResult))
	end, { UseStateResult2, UseStateResult })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 113 ]]
		-- upvalues: p1 (copy)
		p1.reportAnythingAnalytics.incrementAnnotationBack()
		p1.backAction()
	end, { p1.backAction, p1.reportAnythingAnalytics })
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 125 ]]
		-- upvalues: UseStateResult (copy), p1 (copy), UseStateResult1 (copy), UseResult (copy)
		if #UseStateResult > 0 then
			p1.reportAnythingAnalytics.incrementAnnotationUndo()
			table.insert(UseStateResult1, 1, UseStateResult[#UseStateResult])
			table.remove(UseStateResult, #UseStateResult)
			UseResult()
		end
	end, {
		UseResult,
		UseStateResult,
		UseStateResult1,
		p1.reportAnythingAnalytics
	})
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 135 ]]
		-- upvalues: UseStateResult1 (copy), p1 (copy), UseStateResult (copy), UseResult (copy)
		if #UseStateResult1 > 0 then
			p1.reportAnythingAnalytics.incrementAnnotationRedo()
			table.insert(UseStateResult, UseStateResult1[1])
			table.remove(UseStateResult1, 1)
			UseResult()
		end
	end, {
		UseResult,
		UseStateResult,
		UseStateResult1,
		p1.reportAnythingAnalytics
	})
	local UseResult4 = ReactModule.useCallback(function(p2) --[[ Line: 145 ]]
		-- upvalues: p1 (copy)
		p1.reportAnythingAnalytics.setAnnotationNext()
		p1.finishAnnotationAction(p2)
	end, { p1.finishAnnotationAction, p1.reportAnythingAnalytics })
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
		[ReactModule.Event.Activated] = v19
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
					backAction = UseResult1,
					undoAnnotationPoints = UseResult2,
					redoAnnotationPoints = UseResult3,
					isRedoEnabled = IsRedoEnabled,
					isUndoEnabled = IsUndoEnabled,
					annotationPoints = UseStateResult
				}) else ReactModule.createElement(ScreenshotDialogLandscapeModeHeaderModule, {
					titleText = p1.titleText,
					backAction = UseResult1,
					finishAnnotationAction = UseResult4,
					undoAnnotationPoints = UseResult2,
					redoAnnotationPoints = UseResult3,
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
						Layout = ReactModule.createElement("UIListLayout", {
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							VerticalAlignment = Enum.VerticalAlignment.Center
						}),
						Padding = ReactModule.createElement("UIPadding", {
							PaddingTop = UDim.new(0, 16),
							PaddingBottom = UDim.new(0, 16),
							PaddingLeft = UDim.new(0, 16),
							PaddingRight = UDim.new(0, 16)
						}),
						AnnotationLayer = ReactModule.createElement("Frame", {
							BorderSizePixel = 2,
							Size = UDim2.new(1, 0, 1, 0),
							BorderMode = Enum.BorderMode.Outline,
							BorderColor3 = Color3.fromRGB(255, 255, 255)
						}, {
							UIAspectRatioConstraint = ReactModule.createElement("UIAspectRatioConstraint", { AspectRatio = p1.imageAspectRatio }),
							ScreenshotImage = ReactModule.createElement("ImageLabel", {
								ZIndex = 1,
								Size = UDim2.fromScale(1, 1),
								Image = p1.screenshot,
								ScaleType = Enum.ScaleType.Fit
							}, {}),
							Highlighter = ReactModule.createElement(ScreenshotHighlighterModule, {
								ZIndex = 3,
								annotationPoints = UseStateResult,
								handleAnnotationPoints = ReactModule.useCallback(function(_) --[[ Line: 118 ]]
									-- upvalues: p1 (copy), UseResult (copy), UseStateResult2_1 (copy)
									p1.reportAnythingAnalytics.incrementAnnotationPlace()
									UseResult()
									UseStateResult2_1({})
								end, { UseStateResult2_1, UseResult, p1.reportAnythingAnalytics }),
								setAnnotationCircleRadius = p1.setAnnotationCircleRadius,
								setAnnotationAreaDimensions = p1.setAnnotationAreaDimensions
							}, {})
						})
					})
				})
			}),
			Footer = if p1.isSmallPortraitMode then ReactModule.createElement(PortraitModeFooter, {
				finishAnnotationAction = UseResult4,
				annotationPoints = UseStateResult
			}) else nil
		})
	})
end