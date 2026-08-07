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
local var4 = images["icons/status/games/people-playing_small"]
local uDim = UDim.new(0, 6)

return function(p0) --[[ line: 25 | named "AttendanceCount" ]]
	-- upvalues: useStyle (ref), useLocalization (ref), reactModule (ref), uDim (ref), imageSetLabel (ref), var4 (ref), styledTextLabel (ref), formatNumberWithShortUnitsModule (ref)
	local var6 = useStyle()
	local var7 = useLocalization({
		interested = "Feature.VirtualEvents.AttendanceBeforeEvent",
		attendingNow = "Feature.VirtualEvents.AttendanceDuringEvent"
	})
	local isOngoing = p0.eventStatus == "Ongoing"
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p0.layoutOrder,
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
			Image = var4,
			ImageColor3 = var6.Theme.IconEmphasis.Color
		}),
		Label = reactModule.createElement(styledTextLabel, {
			layoutOrder = 2,
			fontStyle = var6.Font.Header1,
			colorStyle = var6.Theme.TextEmphasis,
			text = ("%s %s"):format(formatNumberWithShortUnitsModule(if isOngoing then p0.attending else p0.interested), if isOngoing then var7.attendingNow else var7.interested)
		})
	})
end