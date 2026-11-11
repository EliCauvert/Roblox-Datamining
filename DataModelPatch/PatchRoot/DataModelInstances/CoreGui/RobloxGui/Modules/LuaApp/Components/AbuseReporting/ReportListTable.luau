local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ScrollingListTable = UIBloxModule.App.Table.ScrollingListTable
local CellTailDescription = UIBloxModule.App.Table.CellTailDescription
local CellHeadDetail = UIBloxModule.App.Table.CellHeadDetail
local _ = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.AbuseReporting.ReportTypes)
local Cell = UIBloxModule.App.Table.Cell
local DashModule = require(CorePackages.Packages.Dash)
local StyleModule = require(CorePackages.Workspace.Packages.Style)
local UseDesignTokensFunction = StyleModule.useDesignTokens
local MapTypographyVariantToFontEnumFunction = StyleModule.mapTypographyVariantToFontEnum
local GetFFlagLuafiedReportThumbnailFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagLuafiedReportThumbnail

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), ReactModule (copy), MapTypographyVariantToFontEnumFunction (copy), ScrollingListTable (copy), DashModule (copy), Cell (copy), GetFFlagLuafiedReportThumbnailFunction (copy), CellHeadDetail (copy), CellTailDescription (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local CurrentList = p1.currentList
	
	return ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Heading = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, UseDesignTokensResult.Size.Size_1400)
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, UseDesignTokensResult.Size.Size_600),
				PaddingBottom = UDim.new(0, UseDesignTokensResult.Size.Size_600)
			}),
			HeadingText = ReactModule.createElement("TextLabel", {
				LayoutOrder = 1,
				TextWrapped = true,
				BackgroundTransparency = 1,
				Text = CurrentList.heading,
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
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			ListTable = ReactModule.createElement(ScrollingListTable, {
				cells = DashModule.map(CurrentList.listItems, function(p2)
					-- upvalues: ReactModule (upval), Cell (upval), GetFFlagLuafiedReportThumbnailFunction (upval), UseDesignTokensResult (copy), CellHeadDetail (upval), CellTailDescription (upval), p1 (copy), CurrentList (copy)
					return ReactModule.createElement(Cell, {
						size = UDim2.new(1, 0, 0, if GetFFlagLuafiedReportThumbnailFunction() then UseDesignTokensResult.Size.Size_1000 else UseDesignTokensResult.Size.Size_1400),
						head = ReactModule.createElement(CellHeadDetail, { labelText = p2.humanReadableText }),
						tail = ReactModule.createElement(CellTailDescription, { text = "", showArrow = true }),
						onActivated = function()
							-- upvalues: p1 (upval), p2 (copy), CurrentList (upval)
							p1.onSelect(p2.tagValues, CurrentList.heading, p2.humanReadableText, p2.nextList)
						end
					})
				end)
			})
		})
	})
end