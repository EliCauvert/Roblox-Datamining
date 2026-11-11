local AbuseReporting = script:FindFirstAncestor("AbuseReporting")
local Parent = AbuseReporting.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local DsaIllegalContentReportingModule = require(Parent.DsaIllegalContentReporting)
local UseAbuseReportingDesignTokensModule = require(AbuseReporting.Hooks.useAbuseReportingDesignTokens)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ReportStepModule = require(script.Parent.ReportStep)
local _ = require(script.Parent.Parent.Common.Types)
local ButtonType = require(Parent.UIBlox).App.Button.Enum.ButtonType
local GetFFlagDSAIllegalContentReportingFunction = require(Parent.SharedFlags).GetFFlagDSAIllegalContentReporting
local IsSelectedDataDSAIllegalContentFunction = DsaIllegalContentReportingModule.isSelectedDataDSAIllegalContent
local IsInDSAFeaturesOverrideListFunction = DsaIllegalContentReportingModule.isInDSAFeaturesOverrideList
local _UDim2 = UDim2.new(1, 0, 0, 100)
local _UDim = UDim.new(0, 5)

return function(p1)
	-- upvalues: UseAbuseReportingDesignTokensModule (copy), ReactModule (copy), UseLocalizationFunction (copy), _UDim2 (copy), _UDim (copy), GetFFlagDSAIllegalContentReportingFunction (copy), IsInDSAFeaturesOverrideListFunction (copy), IsSelectedDataDSAIllegalContentFunction (copy), ButtonType (copy), ReportStepModule (copy), CryoModule (copy)
	local ReportSubmission = UseAbuseReportingDesignTokensModule().ReportSubmission
	local Params = p1.params
	ReactModule.useEffect(ReactModule.useCallback(p1.onMounted), {})
	local UseLocalizationResult = UseLocalizationFunction({ cancelText = "Feature.Chat.Action.Cancel" })
	local EntrySize = ReportSubmission.entrySize or _UDim2
	local EntryInnerVerticalPadding = ReportSubmission.entryInnerVerticalPadding or _UDim
	local DividerVerticalPadding = ReportSubmission.dividerVerticalPadding or 5
	local DividerHeight = ReportSubmission.dividerHeight or 2
	local Transparency = ReportSubmission.dividerColor and ReportSubmission.dividerColor.Transparency or 0.8
	local Frames = {}
	
	for _, value in p1.report do
		table.insert(Frames, (ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = EntrySize,
			LayoutOrder = value.index,
			AutomaticSize = Enum.AutomaticSize.None
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = EntryInnerVerticalPadding
			}),
			Title = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.fromScale(1, 0),
				Text = value.heading,
				Font = ReportSubmission.entryFontStyle and ReportSubmission.entryFontStyle.Font,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextColor3 = ReportSubmission.entryTitleColor and ReportSubmission.entryTitleColor.Color3,
				TextSize = ReportSubmission.entryFontStyle and ReportSubmission.entryFontStyle.FontSize,
				LineHeight = ReportSubmission.entryFontStyle and ReportSubmission.entryFontStyle.LineHeight
			}),
			Subtitle = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.fromScale(1, 0),
				Text = value.humanReadableText,
				Font = ReportSubmission.entryFontStyle and ReportSubmission.entryFontStyle.Font,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextColor3 = ReportSubmission.entryTextColor and ReportSubmission.entryTextColor.Color3,
				TextSize = ReportSubmission.entryFontStyle and ReportSubmission.entryFontStyle.FontSize,
				LineHeight = ReportSubmission.entryFontStyle and ReportSubmission.entryFontStyle.LineHeight
			}),
			Decoration = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 0, DividerVerticalPadding)
			}, {
				Divider = ReactModule.createElement("Frame", {
					Size = UDim2.new(1, 0, 0, DividerHeight),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					BackgroundColor3 = ReportSubmission.dividerColor and ReportSubmission.dividerColor.Color3,
					BackgroundTransparency = Transparency
				})
			})
		})))
	end
	local Buttons = {
		{
			text = UseLocalizationResult.cancelText,
			onActivated = function()
				-- upvalues: p1 (copy)
				p1.onCancel(p1)
			end
		}
	}
	
	if if GetFFlagDSAIllegalContentReportingFunction() then Params.text ~= "" and IsSelectedDataDSAIllegalContentFunction(p1.report) else IsInDSAFeaturesOverrideListFunction() and (Params.text ~= "" and IsSelectedDataDSAIllegalContentFunction(p1.report)) then
		table.insert(Frames, (ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 10,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				HorizontalAlignment = Enum.HorizontalAlignment.Center
			}),
			Text = ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				LayoutOrder = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(0, 800, 0, 100),
				Text = Params.text,
				Font = ReportSubmission.entryFontStyle and ReportSubmission.entryFontStyle.Font,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextColor3 = ReportSubmission.entryTitleColor and ReportSubmission.entryTitleColor.Color3,
				TextSize = ReportSubmission.entryFontStyle and ReportSubmission.entryFontStyle.FontSize,
				LineHeight = ReportSubmission.entryFontStyle and ReportSubmission.entryFontStyle.LineHeight
			})
		})))
	else
		table.insert(Buttons, {
			text = Params.buttonText,
			buttonType = ButtonType.PrimarySystem,
			onActivated = function()
				-- upvalues: p1 (copy)
				p1.onSubmit(p1)
			end
		})
	end
	return ReactModule.createElement(ReportStepModule, { title = Params.heading, buttons = Buttons }, CryoModule.Dictionary.join({
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}, Frames or {}))
end