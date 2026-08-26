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

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), text (ref), getEventCategoryModule (ref), getVirtualEventDatesModule (ref), useLocalization (ref), attendanceChipModule (ref), text_1 (ref), descriptionExpanderModule (ref), icon (ref), iconSize (ref), formatDateModule (ref)
	local var1 = useTokens()
	local var2 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), text (copy)
		return if p1.virtualEvent.description == nil then nil else text.Trim(p1.virtualEvent.description)
	end, { p1.virtualEvent.description })
	local var3 = reactModule.useMemo(function()
		-- upvalues: getEventCategoryModule (copy), p1 (ref)
		return getEventCategoryModule(p1.virtualEvent)
	end, { p1.virtualEvent })
	local var4 = useLocalization({
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
				virtualEvent = p1.virtualEvent,
				eventStatus = p1.eventStatus
			}),
			EventTitle = reactModule.createElement(text_1, {
				LayoutOrder = 2,
				RichText = true,
				TextWrapped = false,
				Size = UDim2.new(1, 0, 0, 0),
				Text = p1.virtualEvent.title,
				TextTruncate = Enum.TextTruncate.None,
				AutomaticSize = Enum.AutomaticSize.Y,
				textStyle = var1.Color.Content.Emphasis,
				fontStyle = var1.Typography.TitleLarge,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			Description = if var2 and var2 ~= "" then reactModule.createElement(descriptionExpanderModule, {
				layoutOrder = 3,
				description = var2,
				width = p1.containerSize.X - 32 - 16,
				maxHeight = p1.containerSize.Y * 0.3,
				isExpanded = p1.isExpanded,
				setIsExpanded = p1.setIsExpanded
			}) else nil,
			EventCategory = if var3 and var4[var3] then reactModule.createElement("Frame", {
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
					style = var1.Color.Content.Emphasis
				}),
				Label = reactModule.createElement(text_1, {
					LayoutOrder = 2,
					TextWrapped = false,
					Text = var4[var3],
					TextTruncate = Enum.TextTruncate.None,
					textStyle = var1.Color.Content.Emphasis,
					fontStyle = var1.Typography.BodyLarge,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			}) else nil,
			EventTime = if p1.eventStatus == "Upcoming" then reactModule.createElement("Frame", {
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
					style = var1.Color.Content.Emphasis
				}),
				Label = reactModule.createElement(text_1, {
					LayoutOrder = 2,
					TextWrapped = false,
					Text = formatDateModule(reactModule.useMemo(function()
						-- upvalues: getVirtualEventDatesModule (copy), p1 (ref)
						return getVirtualEventDatesModule(p1.virtualEvent)
					end, { p1.virtualEvent }).startDate, true),
					TextTruncate = Enum.TextTruncate.None,
					textStyle = var1.Color.Content.Emphasis,
					fontStyle = var1.Typography.BodyLarge,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			}) else nil
		})
	})
end