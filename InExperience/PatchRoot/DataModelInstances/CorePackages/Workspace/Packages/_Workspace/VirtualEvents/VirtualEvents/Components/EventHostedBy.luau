local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local cryoModule = require(virtualEvents.Parent.Cryo)
local reactModule = require(virtualEvents.Parent.React)
local UIBloxModule = require(virtualEvents.Parent.UIBlox)
local useLocalization = require(virtualEvents.Parent.Localization).Hooks.useLocalization
local eventHostNameModule = require(virtualEvents.Components.EventHostName)
local _ = require(virtualEvents.Parent.VirtualEventsState)
local foundationModule = require(virtualEvents.Parent.Foundation)
local useCursor = foundationModule.Hooks.useCursor
local cell = UIBloxModule.App.Table.Cell
local cellHeadDetail = UIBloxModule.App.Table.CellHeadDetail
local cellTailDescription = UIBloxModule.App.Table.CellTailDescription
local useStyle = UIBloxModule.Core.Style.useStyle
local t = { size = UDim2.new(1, 0, 0, 52) }

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), useLocalization (ref), useCursor (ref), foundationModule (ref), reactModule (ref), cell (ref), cellHeadDetail (ref), cellTailDescription (ref), eventHostNameModule (ref)
	p1 = cryoModule.Dictionary.join(t, p1)
	local var1 = useStyle()
	
	return reactModule.createElement(cell, {
		userInteractionEnabled = true,
		horizontalPadding = 0,
		layoutWraps = true,
		selectionCursor = useCursor(foundationModule.Enums.CursorType.RoundedRect),
		size = p1.size,
		onActivated = reactModule.useCallback(function()
			-- upvalues: p1 (write)
			if p1.onActivated then
				p1.onActivated(p1.host)
			end
		end, { p1 }),
		head = reactModule.createElement(cellHeadDetail, {
			labelText = useLocalization({ hostedBy = "Feature.VirtualEvents.HostedByLabel" }).hostedBy,
			labelTextColor = var1.Theme.TextDefault,
			labelTextFont = var1.Font.Body
		}),
		tail = reactModule.createElement(cellTailDescription, {
			text = "",
			showArrow = true,
			renderTextOverride = function()
				-- upvalues: reactModule (copy), eventHostNameModule (copy), p1 (write)
				return reactModule.createElement(eventHostNameModule, { host = p1.host })
			end
		})
	})
end