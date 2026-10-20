local VirtualEvents = script:FindFirstAncestor("VirtualEvents")
local ReactModule = require(VirtualEvents.Parent.React)
local FoundationModule = require(VirtualEvents.Parent.Foundation)
local _ = require(VirtualEvents.Parent.GraphQLServer)
local Text = require(VirtualEvents.Parent.AppCommonLib).Text
local UseLocalizationFunction = require(VirtualEvents.Parent.Localization).Hooks.useLocalization
local FormatDateModule = require(VirtualEvents.Common.formatDate)
local GetVirtualEventDatesModule = require(VirtualEvents.Common.getVirtualEventDates)
local GetEventCategoryModule = require(VirtualEvents.Common.getEventCategory)
local AttendanceChipModule = require(VirtualEvents.Components.AttendanceChip)
local DescriptionExpanderModule = require(VirtualEvents.Components.DescriptionExpander)
local _ = require(VirtualEvents.Parent.VirtualEventsState)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Text1 = FoundationModule.Text
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Text (copy), GetEventCategoryModule (copy), GetVirtualEventDatesModule (copy), UseLocalizationFunction (copy), AttendanceChipModule (copy), Text1 (copy), DescriptionExpanderModule (copy), Icon (copy), IconSize (copy), FormatDateModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), Text (upval)
		return if p1.virtualEvent.description == nil then nil else Text.Trim(p1.virtualEvent.description)
	end, { p1.virtualEvent.description })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: GetEventCategoryModule (upval), p1 (copy)
		return GetEventCategoryModule(p1.virtualEvent)
	end, { p1.virtualEvent })
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: GetVirtualEventDatesModule (upval), p1 (copy)
		return GetVirtualEventDatesModule(p1.virtualEvent)
	end, { p1.virtualEvent })
	local UseLocalizationResult = UseLocalizationFunction({
		interested = "Feature.VirtualEvents.AttendanceBeforeEvent",
		newContent = "Feature.VirtualEvents.Label.NewContent",
		itemDrop = "Feature.VirtualEvents.Label.ItemDrop",
		newSeason = "Feature.VirtualEvents.Label.NewSeason",
		newLocation = "Feature.VirtualEvents.Label.NewLocation",
		newMap = "Feature.VirtualEvents.Label.NewMap",
		moreLevels = "Feature.VirtualEvents.Label.MoreLevels",
		newFeature = "Feature.VirtualEvents.Label.NewFeature",
		earlyAccess = "Feature.VirtualEvents.Label.EarlyAccess",
		expansion = "Feature.VirtualEvents.Label.Expansion",
		challenge = "Feature.VirtualEvents.Label.Challenge",
		quest = "Feature.VirtualEvents.Label.Quest",
		festival = "Feature.VirtualEvents.Label.Festival"
	})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0)
	}, {
		BodyContainer = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 1,
			Size = UDim2.fromScale(1, 1)
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 8)
			}),
			EventAttendace = ReactModule.createElement(AttendanceChipModule, {
				LayoutOrder = 1,
				virtualEvent = p1.virtualEvent,
				eventStatus = p1.eventStatus
			}),
			EventTitle = ReactModule.createElement(Text1, {
				LayoutOrder = 2,
				RichText = true,
				TextWrapped = false,
				Size = UDim2.new(1, 0, 0, 0),
				Text = p1.virtualEvent.title,
				TextTruncate = Enum.TextTruncate.None,
				AutomaticSize = Enum.AutomaticSize.Y,
				textStyle = UseTokensResult.Color.Content.Emphasis,
				fontStyle = UseTokensResult.Typography.TitleLarge,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			Description = if UseMemoResult and UseMemoResult ~= "" then ReactModule.createElement(DescriptionExpanderModule, {
				layoutOrder = 3,
				description = UseMemoResult,
				width = p1.containerSize.X - 32 - 16,
				maxHeight = p1.containerSize.Y * 0.3,
				isExpanded = p1.isExpanded,
				setIsExpanded = p1.setIsExpanded
			}) else nil,
			EventCategory = if UseMemoResult1 and UseLocalizationResult[UseMemoResult1] then ReactModule.createElement("Frame", {
				LayoutOrder = 4,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 6)
				}),
				Icon = ReactModule.createElement(Icon, {
					LayoutOrder = 1,
					name = "icons/common/poi_small",
					size = IconSize.Small,
					style = UseTokensResult.Color.Content.Emphasis
				}),
				Label = ReactModule.createElement(Text1, {
					LayoutOrder = 2,
					TextWrapped = false,
					Text = UseLocalizationResult[UseMemoResult1],
					TextTruncate = Enum.TextTruncate.None,
					textStyle = UseTokensResult.Color.Content.Emphasis,
					fontStyle = UseTokensResult.Typography.BodyLarge,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			}) else nil,
			EventTime = if p1.eventStatus == "Upcoming" then ReactModule.createElement("Frame", {
				LayoutOrder = 5,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 6)
				}),
				Icon = ReactModule.createElement(Icon, {
					LayoutOrder = 1,
					name = "icons/actions/calendar_small",
					size = IconSize.Small,
					style = UseTokensResult.Color.Content.Emphasis
				}),
				Label = ReactModule.createElement(Text1, {
					LayoutOrder = 2,
					TextWrapped = false,
					Text = FormatDateModule(UseMemoResult2.startDate, true),
					TextTruncate = Enum.TextTruncate.None,
					textStyle = UseTokensResult.Color.Content.Emphasis,
					fontStyle = UseTokensResult.Typography.BodyLarge,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			}) else nil
		})
	})
end