local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local CryoModule = require(VirtualEvents.Parent.Cryo)
local ReactModule = require(VirtualEvents.Parent.React)
local UIBloxModule = require(VirtualEvents.Parent.UIBlox)
local UseLocalizationFunction = require(VirtualEvents.Parent.Localization).Hooks.useLocalization
local EventHostNameModule = require(VirtualEvents.Components.EventHostName)
local _ = require(VirtualEvents.Parent.VirtualEventsState)
local FoundationModule = require(VirtualEvents.Parent.Foundation)
local UseCursorFunction = FoundationModule.Hooks.useCursor
local Cell = UIBloxModule.App.Table.Cell
local CellHeadDetail = UIBloxModule.App.Table.CellHeadDetail
local CellTailDescription = UIBloxModule.App.Table.CellTailDescription
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local config = { size = UDim2.new(1, 0, 0, 52) }

return function(p1) --[[ Line: 29 | Named "EventHostedBy" ]]
	-- upvalues: CryoModule (copy), config (copy), UseStyleFunction (copy), UseLocalizationFunction (copy), UseCursorFunction (copy), FoundationModule (copy), ReactModule (copy), Cell (copy), CellHeadDetail (copy), CellTailDescription (copy), EventHostNameModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseStyleResult = UseStyleFunction()
	
	return ReactModule.createElement(Cell, {
		userInteractionEnabled = true,
		horizontalPadding = 0,
		layoutWraps = true,
		selectionCursor = UseCursorFunction(FoundationModule.Enums.CursorType.RoundedRect),
		size = JoinResult.size,
		onActivated = ReactModule.useCallback(function() --[[ Line: 38 ]]
			-- upvalues: JoinResult (ref)
			if JoinResult.onActivated then
				JoinResult.onActivated(JoinResult.host)
			end
		end, { JoinResult }),
		head = ReactModule.createElement(CellHeadDetail, {
			labelText = UseLocalizationFunction({ hostedBy = "Feature.VirtualEvents.HostedByLabel" }).hostedBy,
			labelTextColor = UseStyleResult.Theme.TextDefault,
			labelTextFont = UseStyleResult.Font.Body
		}),
		tail = ReactModule.createElement(CellTailDescription, {
			text = "",
			showArrow = true,
			renderTextOverride = function() --[[ Line: 57 ]]
				-- upvalues: ReactModule (upval), EventHostNameModule (upval), JoinResult (ref)
				return ReactModule.createElement(EventHostNameModule, { host = JoinResult.host })
			end
		})
	})
end