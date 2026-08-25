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

return function(p0)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), useLocalization (ref), useCursor (ref), foundationModule (ref), reactModule (ref), cell (ref), cellHeadDetail (ref), cellTailDescription (ref), eventHostNameModule (ref)
	p0 = cryoModule.Dictionary.join(t, p0)
	local var7 = useStyle()
	
	return reactModule.createElement(cell, {
		userInteractionEnabled = true,
		horizontalPadding = 0,
		layoutWraps = true,
		selectionCursor = useCursor(foundationModule.Enums.CursorType.RoundedRect),
		size = p0.size,
		onActivated = reactModule.useCallback(function()
			-- upvalues: p0 (write)
			if p0.onActivated then
				p0.onActivated(p0.host)
			end
		end, { p0 }),
		head = reactModule.createElement(cellHeadDetail, {
			labelText = useLocalization({ hostedBy = "Feature.VirtualEvents.HostedByLabel" }).hostedBy,
			labelTextColor = var7.Theme.TextDefault,
			labelTextFont = var7.Font.Body
		}),
		tail = reactModule.createElement(cellTailDescription, {
			text = "",
			showArrow = true,
			renderTextOverride = function()
				-- upvalues: reactModule (copy), eventHostNameModule (copy), p0 (write)
				return reactModule.createElement(eventHostNameModule, { host = p0.host })
			end
		})
	})
end