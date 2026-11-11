local CorePackages = game:GetService("CorePackages")
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ReactModule = require(CorePackages.Packages.React)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local GetFFlagReportAnythingLocalizationEnabledModule = require(script.Parent.Parent.Parent.Flags.GetFFlagReportAnythingLocalizationEnabled)
local ButtonStack = UIBloxModule.App.Button.ButtonStack
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local HeaderBar = UIBloxModule.App.Bar.HeaderBar
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local Images = UIBloxModule.App.ImageSet.Images
local WithStyleFunction = UIBloxModule.Style.withStyle

local function _(Text)
	-- upvalues: WithStyleFunction (copy), ReactModule (copy)
	return function()
		-- upvalues: WithStyleFunction (upval), ReactModule (upval), Text (copy)
		return WithStyleFunction(function(p1)
			-- upvalues: ReactModule (upval), Text (upval)
			local Theme = p1.Theme
			
			return ReactModule.createElement("TextLabel", {
				TextSize = 20,
				TextWrapped = true,
				BackgroundTransparency = 1,
				Text = Text,
				Font = p1.Font.Header2.Font,
				TextColor3 = Theme.TextEmphasis.Color,
				TextTransparency = Theme.TextEmphasis.Transparency,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				Size = UDim2.new(1, 0, 1, 0)
			})
		end)
	end
end

local _ = function(OnActivated, OnActivated1, OnActivated2, p1, p2)
	-- upvalues: ReactModule (copy), IconButton (copy), IconSize (copy), Images (copy)
	local P5 = p1 or p2
	
	return function()
		-- upvalues: ReactModule (upval), IconButton (upval), IconSize (upval), Images (upval), OnActivated (copy), P5 (copy), p2 (copy), OnActivated1 (copy), p1 (copy), OnActivated2 (copy)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 120, 1, 0)
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			BackButton = ReactModule.createElement(IconButton, {
				layoutOrder = 1,
				iconSize = IconSize.Medium,
				icon = Images["icons/navigation/pushBack"],
				onActivated = OnActivated
			}),
			UndoButton = P5 and ReactModule.createElement(IconButton, {
				layoutOrder = 2,
				iconSize = IconSize.Medium,
				icon = Images["icons/actions/edit/undo"],
				isDisabled = not p2,
				onActivated = OnActivated1
			}),
			RedoButton = P5 and ReactModule.createElement(IconButton, {
				layoutOrder = 3,
				iconSize = IconSize.Medium,
				icon = Images["icons/actions/edit/redo"],
				isDisabled = not p1,
				onActivated = OnActivated2
			})
		})
	end
end

local _ = function(p1, p2)
	-- upvalues: ReactModule (copy), ButtonStack (copy), ButtonType (copy), GetFFlagReportAnythingLocalizationEnabledModule (copy), RobloxTranslatorModule (copy)
	return function()
		-- upvalues: ReactModule (upval), ButtonStack (upval), ButtonType (upval), p1 (copy), p2 (copy), GetFFlagReportAnythingLocalizationEnabledModule (upval), RobloxTranslatorModule (upval)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 144, 1, 0)
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			Buttons = ReactModule.createElement(ButtonStack, {
				buttons = {
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							onActivated = function()
								-- upvalues: p1 (upval), p2 (upval)
								p1(p2)
							end,
							text = if GetFFlagReportAnythingLocalizationEnabledModule() then RobloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.Next") else "Next"
						}
					}
				}
			})
		})
	end
end

return function(p1)
	-- upvalues: ReactModule (copy), HeaderBar (copy), IconButton (copy), IconSize (copy), Images (copy), ButtonStack (copy), ButtonType (copy), GetFFlagReportAnythingLocalizationEnabledModule (copy), RobloxTranslatorModule (copy), WithStyleFunction (copy)
	local CreateElementFunction1 = ReactModule.createElement
	local v1 = "Frame"
	local config = {
		BackgroundTransparency = 0,
		LayoutOrder = 1,
		ZIndex = 2,
		BackgroundColor3 = Color3.fromHex("#4F545F"),
		Size = UDim2.new(1, 0, 0, 47)
	}
	local t = {}
	local CreateElementFunction = ReactModule.createElement
	local BackAction = p1.backAction
	local UndoAnnotationPoints = p1.undoAnnotationPoints
	local RedoAnnotationPoints = p1.redoAnnotationPoints
	local IsRedoEnabled = p1.isRedoEnabled
	local IsUndoEnabled = p1.isUndoEnabled
	local IsRedoEnabled1 = IsRedoEnabled or IsUndoEnabled
	
	local function RenderLeft()
		-- upvalues: ReactModule (upval), IconButton (upval), IconSize (upval), Images (upval), BackAction (copy), IsRedoEnabled1 (copy), IsUndoEnabled (copy), UndoAnnotationPoints (copy), IsRedoEnabled (copy), RedoAnnotationPoints (copy)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 120, 1, 0)
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			BackButton = ReactModule.createElement(IconButton, {
				layoutOrder = 1,
				iconSize = IconSize.Medium,
				icon = Images["icons/navigation/pushBack"],
				onActivated = BackAction
			}),
			UndoButton = IsRedoEnabled1 and ReactModule.createElement(IconButton, {
				layoutOrder = 2,
				iconSize = IconSize.Medium,
				icon = Images["icons/actions/edit/undo"],
				isDisabled = not IsUndoEnabled,
				onActivated = UndoAnnotationPoints
			}),
			RedoButton = IsRedoEnabled1 and ReactModule.createElement(IconButton, {
				layoutOrder = 3,
				iconSize = IconSize.Medium,
				icon = Images["icons/actions/edit/redo"],
				isDisabled = not IsRedoEnabled,
				onActivated = RedoAnnotationPoints
			})
		})
	end
	
	local ReportActionFunction = p1.reportAction
	local AnnotationPoints = p1.annotationPoints
	local config1 = {
		backgroundTransparency = 1,
		barHeight = 48,
		renderLeft = RenderLeft,
		renderRight = function()
			-- upvalues: ReactModule (upval), ButtonStack (upval), ButtonType (upval), ReportActionFunction (copy), AnnotationPoints (copy), GetFFlagReportAnythingLocalizationEnabledModule (upval), RobloxTranslatorModule (upval)
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 144, 1, 0)
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				Buttons = ReactModule.createElement(ButtonStack, {
					buttons = {
						{
							buttonType = ButtonType.PrimarySystem,
							props = {
								onActivated = function()
									-- upvalues: ReportActionFunction (upval), AnnotationPoints (upval)
									ReportActionFunction(AnnotationPoints)
								end,
								text = if GetFFlagReportAnythingLocalizationEnabledModule() then RobloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Action.Next") else "Next"
							}
						}
					}
				})
			})
		end,
		title = if GetFFlagReportAnythingLocalizationEnabledModule() then nil else p1.titleText
	}
	
	if GetFFlagReportAnythingLocalizationEnabledModule() then
		local TitleText = p1.titleText
		
		local function RenderCenter()
			-- upvalues: WithStyleFunction (upval), ReactModule (upval), TitleText (copy)
			return WithStyleFunction(function(p2)
				-- upvalues: ReactModule (upval), TitleText (upval)
				local Theme = p2.Theme
				
				return ReactModule.createElement("TextLabel", {
					TextSize = 20,
					TextWrapped = true,
					BackgroundTransparency = 1,
					Text = TitleText,
					Font = p2.Font.Header2.Font,
					TextColor3 = Theme.TextEmphasis.Color,
					TextTransparency = Theme.TextEmphasis.Transparency,
					TextXAlignment = Enum.TextXAlignment.Center,
					TextYAlignment = Enum.TextYAlignment.Center,
					Size = UDim2.new(1, 0, 1, 0)
				})
			end)
		end
	else
		local RenderCenter: (() -> any)? = nil
	end
	config1.renderCenter = RenderCenter
	t.Bar = CreateElementFunction(HeaderBar, config1)
	
	return CreateElementFunction1(v1, config, t)
end