local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local ScrollingListTable = UIBloxModule.App.Table.ScrollingListTable
local CellHeadDetail = UIBloxModule.App.Table.CellHeadDetail
local Cell = UIBloxModule.App.Table.Cell
local DashModule = require(CorePackages.Packages.Dash)
local StyleModule = require(CorePackages.Workspace.Packages.Style)
local UseDesignTokensFunction = StyleModule.useDesignTokens
local MapTypographyVariantToFontEnumFunction = StyleModule.mapTypographyVariantToFontEnum
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local IsSelectedDataDSAIllegalContentFunction = require(CorePackages.Workspace.Packages.DsaIllegalContentReporting).isSelectedDataDSAIllegalContent
local IsShowEUDSAIllegalContentReportingLinkFunction = require(CorePackages.Workspace.Packages.DsaIllegalContentReporting).isShowEUDSAIllegalContentReportingLink
local GetFFlagDSAIllegalContentReportingFunction = SharedFlagsModule.GetFFlagDSAIllegalContentReporting
local GetFFlagDSAVRSkipFrontendGeoCheckFunction = SharedFlagsModule.GetFFlagDSAVRSkipFrontendGeoCheck

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), UseStyleFunction (copy), ReactModule (copy), IsSelectedDataDSAIllegalContentFunction (copy), GetFFlagDSAVRSkipFrontendGeoCheckFunction (copy), GetFFlagDSAIllegalContentReportingFunction (copy), IsShowEUDSAIllegalContentReportingLinkFunction (copy), MapTypographyVariantToFontEnumFunction (copy), ScrollingListTable (copy), DashModule (copy), Cell (copy), CellHeadDetail (copy), StyledTextLabel (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local SelectionData = p1.selectionData
	local UseStyleResult = UseStyleFunction()
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy)
		p1.onSummaryPageMounted()
	end, {})
	local IsSelectedDataDSAIllegalContent = p1.dsaText ~= nil and IsSelectedDataDSAIllegalContentFunction(p1.selectionData)
	local FFlagDSAIllegalContentReporting = if GetFFlagDSAVRSkipFrontendGeoCheckFunction() then IsSelectedDataDSAIllegalContent and GetFFlagDSAIllegalContentReportingFunction() else IsSelectedDataDSAIllegalContent and IsShowEUDSAIllegalContentReportingLinkFunction()
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 460)
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Heading = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_1200)
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, UseDesignTokensResult.Size.Size_400),
				PaddingBottom = UDim.new(0, UseDesignTokensResult.Size.Size_400)
			}),
			Prompt = ReactModule.createElement("TextLabel", {
				LayoutOrder = 1,
				TextWrapped = true,
				BackgroundTransparency = 1,
				Text = p1.heading,
				Font = MapTypographyVariantToFontEnumFunction(UseDesignTokensResult.Typography.TitleLarge),
				TextColor3 = UseDesignTokensResult.Color.Content.Emphasis.Color3,
				TextTransparency = UseDesignTokensResult.Color.Content.Emphasis.Transparency,
				TextSize = UseDesignTokensResult.Typography.TitleLarge.FontSize,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Typography.TitleLarge.FontSize)
			})
		}),
		SelectionList = ReactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = if FFlagDSAIllegalContentReporting then UDim2.new(1, 0, 0, 120) else UDim2.new(1, 0, 1, 0)
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			ListTable = ReactModule.createElement(ScrollingListTable, {
				cells = DashModule.map(SelectionData, function(p2)
					-- upvalues: ReactModule (upval), Cell (upval), UseDesignTokensResult (copy), CellHeadDetail (upval), UseStyleResult (copy)
					return ReactModule.createElement(Cell, {
						userInteractionEnabled = false,
						size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_1600),
						head = ReactModule.createElement(CellHeadDetail, {
							labelText = p2.heading,
							labelTextColor = UseStyleResult.Theme.TextMuted,
							labelTextFont = UseStyleResult.Font.SubHeader1,
							subLabelText = p2.humanReadableText,
							subLabelTextColor = UseStyleResult.Theme.TextEmphasis,
							subLabelTextFont = UseStyleResult.Font.Body
						})
					})
				end)
			})
		}),
		DSANotice = if FFlagDSAIllegalContentReporting then ReactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 120)
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			Content = ReactModule.createElement(StyledTextLabel, {
				layoutOrder = 2,
				lineHeight = 1,
				fluidSizing = true,
				richText = false,
				size = UDim2.new(1, 0, 0, 60),
				text = p1.dsaText,
				textXAlignment = Enum.TextXAlignment.Center,
				textYAlignment = Enum.TextYAlignment.Top,
				fontStyle = UseStyleResult.Font.Body,
				colorStyle = UseStyleResult.Theme.TextEmphasis
			})
		}) else nil
	})
end