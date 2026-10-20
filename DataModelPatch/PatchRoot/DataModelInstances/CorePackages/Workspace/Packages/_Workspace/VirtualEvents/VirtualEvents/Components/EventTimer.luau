local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local _ = require(VirtualEvents.Parent.GraphQLServer)
local ReactModule = require(VirtualEvents.Parent.React)
local UIBloxModule = require(VirtualEvents.Parent.UIBlox)
local UseLocalizationFunction = require(VirtualEvents.Parent.Localization).Hooks.useLocalization
local FormatDateModule = require(VirtualEvents.Common.formatDate)
local GetVirtualEventDatesModule = require(VirtualEvents.Common.getVirtualEventDates)
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local Character = utf8.char(8226)

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), GetVirtualEventDatesModule (copy), StyledTextLabel (copy), FormatDateModule (copy), Character (copy)
	local UseStyleResult = UseStyleFunction()
	local UseLocalizationResult = UseLocalizationFunction({ cancelled = "Feature.VirtualEvents.EventCancelledText" })
	local IsCancelled = p1.virtualEvent.eventStatus == "cancelled"
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetVirtualEventDatesModule (upval), p1 (copy)
		return GetVirtualEventDatesModule(p1.virtualEvent)
	end, { p1.virtualEvent })
	
	return ReactModule.createElement(StyledTextLabel, {
		text = if IsCancelled then UseLocalizationResult.cancelled else ("%s %s %s"):format(FormatDateModule(UseMemoResult.startDate), Character, FormatDateModule(UseMemoResult.endDate)),
		automaticSize = Enum.AutomaticSize.XY,
		fontStyle = UseStyleResult.Font.CaptionHeader,
		colorStyle = if IsCancelled then UseStyleResult.Theme.Alert else UseStyleResult.Theme.TextMuted
	})
end