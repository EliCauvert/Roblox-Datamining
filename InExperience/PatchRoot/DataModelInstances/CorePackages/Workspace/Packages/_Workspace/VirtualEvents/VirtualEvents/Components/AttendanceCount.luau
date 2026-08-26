local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local reactModule = require(virtualEvents.Parent.React)
local UIBloxModule = require(virtualEvents.Parent.UIBlox)
local useLocalization = require(virtualEvents.Parent.Localization).Hooks.useLocalization
local formatNumberWithShortUnitsModule = require(virtualEvents.Common.formatNumberWithShortUnits)
local _ = require(virtualEvents.Parent.VirtualEventsState)
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local images = UIBloxModule.App.ImageSet.Images
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local useStyle = UIBloxModule.Core.Style.useStyle
local var1 = images["icons/status/games/people-playing_small"]
local uDim = UDim.new(0, 6)

return function(p1)
	-- upvalues: useStyle (ref), useLocalization (ref), reactModule (ref), uDim (ref), imageSetLabel (ref), var1 (ref), styledTextLabel (ref), formatNumberWithShortUnitsModule (ref)
	local var2 = useStyle()
	local var3 = useLocalization({
		interested = "Feature.VirtualEvents.AttendanceBeforeEvent",
		attendingNow = "Feature.VirtualEvents.AttendanceDuringEvent"
	})
	local isOngoing = p1.eventStatus == "Ongoing"
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = uDim
		}),
		Icon = reactModule.createElement(imageSetLabel, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(18, 18),
			Image = var1,
			ImageColor3 = var2.Theme.IconEmphasis.Color
		}),
		Label = reactModule.createElement(styledTextLabel, {
			layoutOrder = 2,
			fontStyle = var2.Font.Header1,
			colorStyle = var2.Theme.TextEmphasis,
			text = ("%s %s"):format(formatNumberWithShortUnitsModule(if isOngoing then p1.attending else p1.interested), if isOngoing then var3.attendingNow else var3.interested)
		})
	})
end