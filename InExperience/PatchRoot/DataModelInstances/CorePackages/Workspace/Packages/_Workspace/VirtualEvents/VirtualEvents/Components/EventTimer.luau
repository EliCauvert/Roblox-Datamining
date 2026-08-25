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

return function(p0)
	-- upvalues: useStyle (ref), useLocalization (ref), reactModule (ref), getVirtualEventDatesModule (ref), styledTextLabel (ref), formatDateModule (ref), char (ref)
	local var6 = useStyle()
	local var7 = useLocalization({ cancelled = "Feature.VirtualEvents.EventCancelledText" })
	local isCancelled = p0.virtualEvent.eventStatus == "cancelled"
	local var9 = reactModule.useMemo(function()
		-- upvalues: getVirtualEventDatesModule (copy), p0 (ref)
		return getVirtualEventDatesModule(p0.virtualEvent)
	end, { p0.virtualEvent })
	
	return reactModule.createElement(styledTextLabel, {
		text = if isCancelled then var7.cancelled else ("%s %s %s"):format(formatDateModule(var9.startDate), char, formatDateModule(var9.endDate)),
		automaticSize = Enum.AutomaticSize.XY,
		fontStyle = var6.Font.CaptionHeader,
		colorStyle = if isCancelled then var6.Theme.Alert else var6.Theme.TextMuted
	})
end