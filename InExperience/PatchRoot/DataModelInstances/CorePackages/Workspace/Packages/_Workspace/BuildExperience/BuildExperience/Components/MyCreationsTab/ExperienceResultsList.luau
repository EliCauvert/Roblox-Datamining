local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(BuildExperience.Chat.chatTypes)
local _ = require(BuildExperience.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local FFlagBuildExperienceMyCreationsLongPressMenuModule = require(BuildExperience.Flags.FFlagBuildExperienceMyCreationsLongPressMenu)
local FFlagBuildExperienceUnreadServiceModule = require(BuildExperience.Flags.FFlagBuildExperienceUnreadService)
local DescriptionWithGroupIconModule = require(BuildExperience.utils.descriptionWithGroupIcon)
local ExperienceResultsLoadingSkeletonModule = require(script.Parent.ExperienceResultsLoadingSkeleton)
local ExperienceRowActionsMenuModule = require(script.Parent.ExperienceRowActionsMenu)
local _ = require(script.Parent.useMyCreationsResults)
local Badge = FoundationModule.Badge
local List = FoundationModule.List
local StatusIndicator = FoundationModule.StatusIndicator
local View = FoundationModule.View
local UseMeasurableRefFunction = FoundationModule.Hooks.useMeasurableRef
local BadgeShape = FoundationModule.Enums.BadgeShape
local BadgeSize = FoundationModule.Enums.BadgeSize
local BadgeVariant = FoundationModule.Enums.BadgeVariant
local InputSize = FoundationModule.Enums.InputSize
local ListItemInputType = FoundationModule.Enums.ListItemInputType
local StatusIndicatorShape = FoundationModule.Enums.StatusIndicatorShape
local StatusIndicatorVariant = FoundationModule.Enums.StatusIndicatorVariant

local function useRowActionsMenu()
	-- upvalues: UseMeasurableRefFunction (copy), ReactModule (copy)
	local UseMeasurableRefResult = UseMeasurableRefFunction(Vector2.zero, Vector2.zero)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	
	return {
		rowActions = UseStateResult,
		anchor = UseMeasurableRefResult.current,
		isOpen = UseStateResult1,
		open = ReactModule.useCallback(function(Target, p1, IsAtPointer)
			-- upvalues: UseMeasurableRefResult (copy), UseStateResult2 (copy), UseStateResult2_1 (copy)
			UseMeasurableRefResult.current:SetPosition(p1)
			UseStateResult2({ target = Target, isAtPointer = IsAtPointer })
			UseStateResult2_1(true)
		end, { UseMeasurableRefResult }),
		close = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2_1 (copy)
			UseStateResult2_1(false)
		end, {})
	}
end

local MemoResult = ReactModule.memo(function(Frame)
	-- upvalues: ReactModule (copy), FFlagBuildExperienceUnreadServiceModule (copy), FFlagBuildExperienceMyCreationsLongPressMenuModule (copy), View (copy), StatusIndicator (copy), StatusIndicatorVariant (copy), StatusIndicatorShape (copy), Badge (copy), BadgeShape (copy), BadgeSize (copy), BadgeVariant (copy), List (copy), DescriptionWithGroupIconModule (copy), ListItemInputType (copy)
	local OnLongPressFunction = Frame.onLongPress
	local UseResult = if FFlagBuildExperienceMyCreationsLongPressMenuModule then ReactModule.useCallback(function(Frame1: Frame, Input)
		-- upvalues: OnLongPressFunction (copy), Frame (copy)
		if OnLongPressFunction == nil then return end
		local config = {
			universeId = Frame.universeId,
			placeId = Frame.placeId,
			sessionId = Frame.sessionId,
			experienceName = Frame.experienceName,
			creatorName = Frame.creatorName,
			gameIcon = Frame.gameIcon
		}
		
		if Input.UserInputType == Enum.UserInputType.MouseButton2 then
			OnLongPressFunction(config, Vector2.new(Input.Position.X, Input.Position.Y), true)
			
			return
		else
			OnLongPressFunction(config, Frame1.AbsolutePosition + Vector2.new(Frame1.AbsoluteSize.X, 0), false)
		end
	end, {
		OnLongPressFunction, Frame.creatorName, Frame.experienceName, Frame.gameIcon,
		Frame.placeId, Frame.sessionId, Frame.universeId
	}) else nil
	local IsHasUnseenAttention: boolean = FFlagBuildExperienceUnreadServiceModule and Frame.hasUnseenAttention == true
	local HasOnLongPressFunction: boolean = UseResult ~= nil and OnLongPressFunction ~= nil
	
	return ReactModule.createElement(List.Item, {
		LayoutOrder = Frame.LayoutOrder,
		leading = ReactModule.useMemo(function()
			-- upvalues: Frame (copy)
			return { type = nil, iconVariant = nil, iconName = Frame.gameIcon }
		end, { Frame.gameIcon }),
		title = Frame.experienceName,
		description = DescriptionWithGroupIconModule(Frame.description, Frame.isGroupGame, Frame.creatorName),
		testId = `{Frame.testIdPrefix}.ExperienceRow.{Frame.universeId}`,
		onActivated = ReactModule.useCallback(function()
			-- upvalues: Frame (copy), FFlagBuildExperienceUnreadServiceModule (upval)
			Frame.onOpenChat({
				universeId = Frame.universeId,
				placeId = Frame.placeId,
				sessionId = Frame.sessionId,
				experienceName = Frame.experienceName,
				creatorName = Frame.creatorName,
				gameIcon = Frame.gameIcon
			})
			
			if FFlagBuildExperienceUnreadServiceModule and Frame.hasUnseenAttention == true then
				Frame.onRowOpened(Frame.universeId)
			end
		end, {
			Frame.creatorName, Frame.experienceName, Frame.gameIcon,
			Frame.hasUnseenAttention or false, Frame.onOpenChat,
			Frame.onRowOpened or false, Frame.placeId, Frame.sessionId, Frame.universeId
		}),
		onSecondaryActivated = if HasOnLongPressFunction then UseResult else nil,
		input = if HasOnLongPressFunction then ListItemInputType.None else nil,
		trailing = ReactModule.useMemo(function()
			-- upvalues: Frame (copy), IsHasUnseenAttention (copy), ReactModule (upval), View (upval), FFlagBuildExperienceUnreadServiceModule (upval), StatusIndicator (upval), StatusIndicatorVariant (upval), StatusIndicatorShape (upval), Badge (upval), BadgeShape (upval), BadgeSize (upval), BadgeVariant (upval)
			return if Frame.visibilityLabel == nil and not IsHasUnseenAttention then nil else ReactModule.createElement(View, {
				tag = if FFlagBuildExperienceUnreadServiceModule then {
					["row align-y-center auto-xy"] = true,
					["gap-large"] = IsHasUnseenAttention
				} else "row align-y-center auto-xy"
			}, {
				AttentionDot = if IsHasUnseenAttention then ReactModule.createElement(StatusIndicator, {
					LayoutOrder = 2,
					variant = StatusIndicatorVariant.Emphasis,
					shape = StatusIndicatorShape.Circle,
					testId = `{Frame.testIdPrefix}.AttentionDot.{Frame.universeId}`
				}) else nil,
				VisibilityBadge = if Frame.visibilityLabel == nil then nil else ReactModule.createElement(Badge, {
					LayoutOrder = if FFlagBuildExperienceUnreadServiceModule then 1 else nil,
					text = Frame.visibilityLabel,
					shape = BadgeShape.Box,
					size = BadgeSize.Small,
					variant = BadgeVariant.Neutral,
					testId = `{Frame.testIdPrefix}.VisibilityBadge.{Frame.universeId}`
				})
			})
		end, {
			Frame.testIdPrefix,
			Frame.universeId,
			Frame.visibilityLabel,
			IsHasUnseenAttention
		})
	})
end)

return ReactModule.memo(function(p1)
	-- upvalues: FFlagBuildExperienceMyCreationsLongPressMenuModule (copy), useRowActionsMenu (copy), ReactModule (copy), MemoResult (copy), ExperienceResultsLoadingSkeletonModule (copy), List (copy), ExperienceRowActionsMenuModule (copy), InputSize (copy)
	local TestIdPrefix = p1.testIdPrefix or "MyCreationsTab"
	local FirstResultLayoutOrder = p1.firstResultLayoutOrder or 1
	local Copy = table.clone(p1.leadingItems or {})
	local OnOpenConfigurationPage = p1.onOpenConfigurationPage
	local v1 = nil
	
	if FFlagBuildExperienceMyCreationsLongPressMenuModule then
		local UseRowActionsMenuResult = useRowActionsMenu()
		
		if OnOpenConfigurationPage ~= nil then
			v1 = UseRowActionsMenuResult
		end
	end
	local RowActions = if v1 == nil then nil else v1.rowActions
	
	if p1.hasDisplayedResult and p1.hasDisplayedItems then
		for i, item in p1.items do
			Copy["U" .. item.universeId] = ReactModule.createElement(MemoResult, {
				LayoutOrder = i + FirstResultLayoutOrder - 1,
				sessionId = item.sessionId,
				universeId = item.universeId,
				placeId = item.placeId,
				experienceName = item.experienceName,
				creatorName = item.creatorName,
				description = item.description,
				visibilityLabel = item.visibilityLabel,
				gameIcon = item.gameIcon,
				isGroupGame = item.isGroupGame,
				hasUnseenAttention = item.hasUnseenAttention,
				onOpenChat = p1.onOpenChat,
				onRowOpened = p1.onRowOpened,
				onLongPress = if v1 == nil then nil else v1.open,
				testIdPrefix = TestIdPrefix
			})
		end
	elseif p1.listStatus == "NotReady" or p1.hasPendingSummary then
		for i1 = 1, 2 do
			Copy[`Loading{i1}`] = ReactModule.createElement(ExperienceResultsLoadingSkeletonModule, {
				LayoutOrder = i1 + FirstResultLayoutOrder - 1,
				index = i1,
				testIdPrefix = TestIdPrefix
			})
		end
	elseif p1.listStatus == "Failed" then
		Copy.Error = ReactModule.createElement(List.Item, {
			LayoutOrder = FirstResultLayoutOrder,
			title = p1.loadError
		})
	end
	if p1.failedLoadMore then
		Copy.LoadMoreError = ReactModule.createElement(List.Item, {
			LayoutOrder = #p1.items + FirstResultLayoutOrder,
			title = p1.loadError,
			testId = `{TestIdPrefix}.LoadMoreError`,
			onActivated = p1.retryLoadMore
		})
	end
	if v1 ~= nil then
		Copy.RowActionsMenu = ReactModule.createElement(ExperienceRowActionsMenuModule, {
			target = if RowActions == nil then nil else RowActions.target,
			anchor = if RowActions == nil then nil else v1.anchor,
			isAtPointer = if RowActions == nil then nil else RowActions.isAtPointer,
			isOpen = v1.isOpen,
			onClose = v1.close,
			onOpenConfigurationPage = OnOpenConfigurationPage
		})
	end
	return ReactModule.createElement(List.Root, {
		hasDivider = false,
		isContained = { isContained = false, hasMargin = false },
		size = InputSize.Large
	}, Copy)
end)