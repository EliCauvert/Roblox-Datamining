local AbuseReporting = script:FindFirstAncestor("AbuseReporting")
local Parent = AbuseReporting.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseNavigatorFunction = require(Parent.ServerUI).Hooks.useNavigator
local UseAbuseReportingDesignTokensModule = require(AbuseReporting.Hooks.useAbuseReportingDesignTokens)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(script.Parent.Parent.Common.Types)
local ReportStepModule = require(script.Parent.ReportStep)
local ScrollingListTable = UIBloxModule.App.Table.ScrollingListTable
local CellTailDescription = UIBloxModule.App.Table.CellTailDescription
local CellHeadDetail = UIBloxModule.App.Table.CellHeadDetail
local Cell = UIBloxModule.App.Table.Cell
local _UDim2 = UDim2.new(1, 0, 0, 64)

return function(p1)
	-- upvalues: UseAbuseReportingDesignTokensModule (copy), UseNavigatorFunction (copy), ReactModule (copy), Cell (copy), _UDim2 (copy), CellHeadDetail (copy), CellTailDescription (copy), UseLocalizationFunction (copy), ReportStepModule (copy), ScrollingListTable (copy)
	local ReportListSelection = UseAbuseReportingDesignTokensModule().ReportListSelection
	local Cells = {}
	local Params = p1.params
	local UseNavigatorResult = UseNavigatorFunction()
	
	if Params.listItems then
		for i, listItem in Params.listItems do
			Cells[i] = ReactModule.createElement(Cell, {
				size = ReportListSelection.listEntrySize or _UDim2,
				head = ReactModule.createElement(CellHeadDetail, { labelText = listItem.humanReadableText }),
				tail = ReactModule.createElement(CellTailDescription, { text = "", showArrow = true }),
				background = ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }),
				onActivated = function()
					-- upvalues: p1 (copy), listItem (copy), UseNavigatorResult (copy), Params (copy)
					p1.onItemSelected(p1, listItem)
					
					if listItem.nextPage and listItem.nextPage.componentRefs then
						UseNavigatorResult.push(listItem.nextPage.componentRefs)
						
						return
					end
					if listItem.nextList then
						UseNavigatorResult.pushParams(listItem.nextList)
						
						return
					end
					if Params.nextPage and Params.nextPage.componentRefs then
						UseNavigatorResult.push(Params.nextPage.componentRefs)
					end
				end
			})
		end
	end
	local UseLocalizationResult = UseLocalizationFunction({
		cancelText = "Feature.Chat.Action.Cancel",
		skipText = "Feature.VerificationUpsell.Action.GenericSkip"
	})
	local Buttons = {
		{
			text = UseLocalizationResult.cancelText,
			onActivated = function()
				-- upvalues: p1 (copy)
				p1.onCancel(p1)
			end
		}
	}
	
	if Params.skippable then
		table.insert(Buttons, {
			text = UseLocalizationResult.skipText,
			onActivated = function()
				-- upvalues: Params (copy), UseNavigatorResult (copy)
				if Params.nextPage and Params.nextPage.componentRefs then
					UseNavigatorResult.push(Params.nextPage.componentRefs)
				end
			end
		})
	end
	return ReactModule.createElement(ReportStepModule, { title = Params.heading, buttons = Buttons }, {
		ListTable = ReactModule.createElement(ScrollingListTable, { selectable = false, cells = Cells })
	})
end