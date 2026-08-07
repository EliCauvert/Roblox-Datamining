local virtualEvents = script:FindFirstAncestor("VirtualEvents")
local reactModule = require(virtualEvents.Parent.React)
local foundationModule = require(virtualEvents.Parent.Foundation)
local _ = require(virtualEvents.Parent.GraphQLServer)
local text = require(virtualEvents.Parent.AppCommonLib).Text
local useLocalization = require(virtualEvents.Parent.Localization).Hooks.useLocalization
local formatDateModule = require(virtualEvents.Common.formatDate)
local getVirtualEventDatesModule = require(virtualEvents.Common.getVirtualEventDates)
local getEventCategoryModule = require(virtualEvents.Common.getEventCategory)
local attendanceChipModule = require(virtualEvents.Components.AttendanceChip)
local descriptionExpanderModule = require(virtualEvents.Components.DescriptionExpander)
local _ = require(virtualEvents.Parent.VirtualEventsState)
local useTokens = foundationModule.Hooks.useTokens
local text_1 = foundationModule.Text
local icon = foundationModule.Icon
local iconSize = foundationModule.Enums.IconSize

return function(p0) --[[ line: 36 | named "EventDetailsBody" ]]
	-- upvalues: useTokens (ref), reactModule (ref), text (ref), getEventCategoryModule (ref), getVirtualEventDatesModule (ref), useLocalization (ref), attendanceChipModule (ref), text_1 (ref), descriptionExpanderModule (ref), icon (ref), iconSize (ref), formatDateModule (ref)
	local var8 = useTokens()
	local var9 = reactModule.useMemo(function() --[[ line: 39 ]]
		-- upvalues: p0 (ref), text (copy)
		return if p0.virtualEvent.description == nil then nil else text.Trim(p0.virtualEvent.description)
	end, { p0.virtualEvent.description })
	local var10 = reactModule.useMemo(function() --[[ line: 46 ]]
		-- upvalues: getEventCategoryModule (copy), p0 (ref)
		return getEventCategoryModule(p0.virtualEvent)
	end, { p0.virtualEvent })
	local var11 = useLocalization({
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
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0)
	}, {
		BodyContainer = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 1,
			Size = UDim2.fromScale(1, 1)
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 8)
			}),
			EventAttendace = reactModule.createElement(attendanceChipModule, {
				LayoutOrder = 1,
				virtualEvent = p0.virtualEvent,
				eventStatus = p0.eventStatus
			}),
			EventTitle = reactModule.createElement(text_1, {
				LayoutOrder = 2,
				RichText = true,
				TextWrapped = false,
				Size = UDim2.new(1, 0, 0, 0),
				Text = p0.virtualEvent.title,
				TextTruncate = Enum.TextTruncate.None,
				AutomaticSize = Enum.AutomaticSize.Y,
				textStyle = var8.Color.Content.Emphasis,
				fontStyle = var8.Typography.TitleLarge,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			Description = if var9 and var9 ~= "" then reactModule.createElement(descriptionExpanderModule, {
				layoutOrder = 3,
				description = var9,
				width = p0.containerSize.X - 32 - 16,
				maxHeight = p0.containerSize.Y * 0.3,
				isExpanded = p0.isExpanded,
				setIsExpanded = p0.setIsExpanded
			}) else nil,
			EventCategory = if var10 and var11[var10] then reactModule.createElement("Frame", {
				LayoutOrder = 4,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 6)
				}),
				Icon = reactModule.createElement(icon, {
					LayoutOrder = 1,
					name = "icons/common/poi_small",
					size = iconSize.Small,
					style = var8.Color.Content.Emphasis
				}),
				Label = reactModule.createElement(text_1, {
					LayoutOrder = 2,
					TextWrapped = false,
					Text = var11[var10],
					TextTruncate = Enum.TextTruncate.None,
					textStyle = var8.Color.Content.Emphasis,
					fontStyle = var8.Typography.BodyLarge,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			}) else nil,
			EventTime = if p0.eventStatus == "Upcoming" then reactModule.createElement("Frame", {
				LayoutOrder = 5,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, 6)
				}),
				Icon = reactModule.createElement(icon, {
					LayoutOrder = 1,
					name = "icons/actions/calendar_small",
					size = iconSize.Small,
					style = var8.Color.Content.Emphasis
				}),
				Label = reactModule.createElement(text_1, {
					LayoutOrder = 2,
					TextWrapped = false,
					Text = formatDateModule(reactModule.useMemo(function() --[[ line: 50 ]]
						-- upvalues: getVirtualEventDatesModule (copy), p0 (ref)
						return getVirtualEventDatesModule(p0.virtualEvent)
					end, { p0.virtualEvent }).startDate, true),
					TextTruncate = Enum.TextTruncate.None,
					textStyle = var8.Color.Content.Emphasis,
					fontStyle = var8.Typography.BodyLarge,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			}) else nil
		})
	})
end