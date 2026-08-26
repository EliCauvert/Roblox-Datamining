local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local _ = require(virtualEvents.Parent.GraphQLServer)
local reactModule = require(virtualEvents.Parent.React)
local UIBloxModule = require(virtualEvents.Parent.UIBlox)
local useLocalization = require(virtualEvents.Parent.Localization).Hooks.useLocalization
local formatDateModule = require(virtualEvents.Common.formatDate)
local getVirtualEventDatesModule = require(virtualEvents.Common.getVirtualEventDates)
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local useStyle = UIBloxModule.Core.Style.useStyle
local char = utf8.char(8226)

return function(p1)
	-- upvalues: useStyle (ref), useLocalization (ref), reactModule (ref), getVirtualEventDatesModule (ref), styledTextLabel (ref), formatDateModule (ref), char (ref)
	local var1 = useStyle()
	local var2 = useLocalization({ cancelled = "Feature.VirtualEvents.EventCancelledText" })
	local isCancelled = p1.virtualEvent.eventStatus == "cancelled"
	local var3 = reactModule.useMemo(function()
		-- upvalues: getVirtualEventDatesModule (copy), p1 (ref)
		return getVirtualEventDatesModule(p1.virtualEvent)
	end, { p1.virtualEvent })
	
	return reactModule.createElement(styledTextLabel, {
		text = if isCancelled then var2.cancelled else ("%s %s %s"):format(formatDateModule(var3.startDate), char, formatDateModule(var3.endDate)),
		automaticSize = Enum.AutomaticSize.XY,
		fontStyle = var1.Font.CaptionHeader,
		colorStyle = if isCancelled then var1.Theme.Alert else var1.Theme.TextMuted
	})
end