local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local ReactModule = require(VirtualEvents.Parent.React)
local UIBloxModule = require(VirtualEvents.Parent.UIBlox)
local UseLocalizationFunction = require(VirtualEvents.Parent.Localization).Hooks.useLocalization
local FormatNumberWithShortUnitsModule = require(VirtualEvents.Common.formatNumberWithShortUnits)
local _ = require(VirtualEvents.Parent.VirtualEventsState)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local IconsStatusGamesPeoplePlayingSmall = UIBloxModule.App.ImageSet.Images["icons/status/games/people-playing_small"]
local _UDim = UDim.new(0, 6)

return function(p1) --[[ Line: 25 | Named "AttendanceCount" ]]
	-- upvalues: UseStyleFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), _UDim (copy), ImageSetLabel (copy), IconsStatusGamesPeoplePlayingSmall (copy), StyledTextLabel (copy), FormatNumberWithShortUnitsModule (copy)
	local UseStyleResult = UseStyleFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		interested = "Feature.VirtualEvents.AttendanceBeforeEvent",
		attendingNow = "Feature.VirtualEvents.AttendanceDuringEvent"
	})
	local IsOngoing = p1.eventStatus == "Ongoing"
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		AutomaticSize = Enum.AutomaticSize.XY
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = _UDim
		}),
		Icon = ReactModule.createElement(ImageSetLabel, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(18, 18),
			Image = IconsStatusGamesPeoplePlayingSmall,
			ImageColor3 = UseStyleResult.Theme.IconEmphasis.Color
		}),
		Label = ReactModule.createElement(StyledTextLabel, {
			layoutOrder = 2,
			fontStyle = UseStyleResult.Font.Header1,
			colorStyle = UseStyleResult.Theme.TextEmphasis,
			text = ("%s %s"):format(FormatNumberWithShortUnitsModule(if IsOngoing then p1.attending else p1.interested), if IsOngoing then UseLocalizationResult.attendingNow else UseLocalizationResult.interested)
		})
	})
end