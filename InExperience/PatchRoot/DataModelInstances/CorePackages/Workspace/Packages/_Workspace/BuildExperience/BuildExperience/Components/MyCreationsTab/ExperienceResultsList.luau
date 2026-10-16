local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(BuildExperience.Chat.chatTypes)
local _ = require(BuildExperience.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local FFlagBuildExperienceMyCreationsLongPressMenuModule = require(BuildExperience.Flags.FFlagBuildExperienceMyCreationsLongPressMenu)
local FFlagBuildExperienceMyCreationsUseUniverseListModule = require(BuildExperience.Flags.FFlagBuildExperienceMyCreationsUseUniverseList)
local FFlagBuildExperienceStableMyCreationsListItemsModule = require(BuildExperience.Flags.FFlagBuildExperienceStableMyCreationsListItems)
local EscapeRichTextModule = require(BuildExperience.utils.escapeRichText)
local ExperienceResultsLoadingSkeletonModule = require(script.Parent.ExperienceResultsLoadingSkeleton)
local ExperienceRowActionsMenuModule = require(script.Parent.ExperienceRowActionsMenu)
local _ = require(script.Parent.useMyCreationsResults)
local Badge = FoundationModule.Badge
local List = FoundationModule.List
local View = FoundationModule.View
local UseMeasurableRefFunction = FoundationModule.Hooks.useMeasurableRef
local BadgeShape = FoundationModule.Enums.BadgeShape
local BadgeSize = FoundationModule.Enums.BadgeSize
local BadgeVariant = FoundationModule.Enums.BadgeVariant
local InputSize = FoundationModule.Enums.InputSize
local ListItemInputType = FoundationModule.Enums.ListItemInputType
local IconRichText = FoundationModule.Utility.getIconRichText(FoundationModule.Enums.IconName.TwoPeople)

local function _(p1, p2, p3) --[[ Line: 79 | Named "descriptionWithGroupIcon" ]]
	-- upvalues: EscapeRichTextModule (copy), IconRichText (copy)
	if p2 then
		local P0 = p1 or (if p3 == nil then nil else EscapeRichTextModule(p3))
		
		return if P0 == nil then IconRichText else `{IconRichText} {P0}`
	else
		return p1
	end
end

local function useRowActionsMenu() --[[ Line: 87 ]]
	-- upvalues: UseMeasurableRefFunction (copy), ReactModule (copy)
	local UseMeasurableRefResult = UseMeasurableRefFunction(Vector2.zero, Vector2.zero)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	
	return {
		rowActions = UseStateResult,
		anchor = UseMeasurableRefResult.current,
		isOpen = UseStateResult1,
		open = ReactModule.useCallback(function(Target, p1, IsAtPointer) --[[ Line: 92 ]]
			-- upvalues: UseMeasurableRefResult (copy), UseStateResult2 (copy), UseStateResult2_1 (copy)
			UseMeasurableRefResult.current:SetPosition(p1)
			UseStateResult2({ target = Target, isAtPointer = IsAtPointer })
			UseStateResult2_1(true)
		end, { UseMeasurableRefResult }),
		close = ReactModule.useCallback(function() --[[ Line: 100 ]]
			-- upvalues: UseStateResult2_1 (copy)
			UseStateResult2_1(false)
		end, {})
	}
end

local MemoResult = ReactModule.memo(function(Frame) --[[ Line: 112 | Named "ExperienceListItem" ]]
	-- upvalues: ReactModule (copy), FFlagBuildExperienceMyCreationsLongPressMenuModule (copy), View (copy), Badge (copy), BadgeShape (copy), BadgeSize (copy), BadgeVariant (copy), List (copy), EscapeRichTextModule (copy), IconRichText (copy), ListItemInputType (copy)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 121 ]]
		-- upvalues: Frame (copy)
		Frame.onOpenChat({
			universeId = Frame.universeId,
			placeId = Frame.placeId,
			sessionId = Frame.sessionId,
			experienceName = Frame.experienceName,
			creatorName = Frame.creatorName,
			gameIcon = Frame.gameIcon
		})
	end, {
		Frame.creatorName, Frame.experienceName, Frame.gameIcon, Frame.onOpenChat,
		Frame.placeId, Frame.sessionId, Frame.universeId
	})
	local OnLongPressFunction = Frame.onLongPress
	local UseResult1 = if FFlagBuildExperienceMyCreationsLongPressMenuModule then ReactModule.useCallback(function(Frame1: Frame, Input) --[[ Line: 145 ]]
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
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 176 ]]
		-- upvalues: Frame (copy), ReactModule (upval), View (upval), Badge (upval), BadgeShape (upval), BadgeSize (upval), BadgeVariant (upval)
		return if Frame.visibilityLabel == nil then nil else ReactModule.createElement(View, { tag = "row align-y-center auto-xy" }, {
			VisibilityBadge = ReactModule.createElement(Badge, {
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
		Frame.visibilityLabel
	})
	local HasOnLongPressFunction: boolean = UseResult1 ~= nil and OnLongPressFunction ~= nil
	local CreateElementFunction = ReactModule.createElement
	local Item = List.Item
	local config = {
		LayoutOrder = Frame.LayoutOrder,
		leading = ReactModule.useMemo(function() --[[ Line: 113 ]]
			-- upvalues: Frame (copy)
			return { type = nil, iconVariant = nil, iconName = Frame.gameIcon }
		end, { Frame.gameIcon }),
		title = Frame.experienceName
	}
	local Description = Frame.description
	local CreatorName = Frame.creatorName
	local Description1 = nil
	
	if Frame.isGroupGame then
		local Description2 = Description or (if CreatorName == nil then nil else EscapeRichTextModule(CreatorName))
		Description1 = if Description2 == nil then IconRichText else `{IconRichText} {Description2}`
	else
		Description1 = Description
	end
	config.description = Description1
	config.testId = `{Frame.testIdPrefix}.ExperienceRow.{Frame.universeId}`
	config.onActivated = UseResult
	config.onSecondaryActivated = if HasOnLongPressFunction then UseResult1 else nil
	config.input = if HasOnLongPressFunction then ListItemInputType.None else nil
	config.trailing = UseMemoResult
	
	return CreateElementFunction(Item, config)
end)

return ReactModule.memo(function(p1) --[[ Line: 211 | Named "ExperienceResultsList" ]]
	-- upvalues: FFlagBuildExperienceMyCreationsLongPressMenuModule (copy), FFlagBuildExperienceStableMyCreationsListItemsModule (copy), useRowActionsMenu (copy), FFlagBuildExperienceMyCreationsUseUniverseListModule (copy), ReactModule (copy), MemoResult (copy), List (copy), EscapeRichTextModule (copy), IconRichText (copy), View (copy), Badge (copy), BadgeShape (copy), BadgeSize (copy), BadgeVariant (copy), ExperienceResultsLoadingSkeletonModule (copy), ExperienceRowActionsMenuModule (copy), InputSize (copy)
	local TestIdPrefix = p1.testIdPrefix or "MyCreationsTab"
	local FirstResultLayoutOrder = p1.firstResultLayoutOrder or 1
	local Copy = table.clone(p1.leadingItems or {})
	local OnOpenConfigurationPage = p1.onOpenConfigurationPage
	local v1 = nil
	
	if FFlagBuildExperienceMyCreationsLongPressMenuModule and FFlagBuildExperienceStableMyCreationsListItemsModule then
		local UseRowActionsMenuResult = useRowActionsMenu()
		
		if OnOpenConfigurationPage ~= nil then
			v1 = UseRowActionsMenuResult
		end
	end
	local RowActions = if v1 == nil then nil else v1.rowActions
	
	if p1.hasDisplayedResult and p1.hasDisplayedItems then
		for i, item in p1.items do
			local Text: string = if FFlagBuildExperienceMyCreationsUseUniverseListModule then "U" .. item.universeId else "S" .. item.sessionId
			local FirstResultLayoutOrderDelta = i + FirstResultLayoutOrder - 1
			
			if FFlagBuildExperienceStableMyCreationsListItemsModule then
				Copy[Text] = ReactModule.createElement(MemoResult, {
					LayoutOrder = FirstResultLayoutOrderDelta,
					sessionId = item.sessionId,
					universeId = item.universeId,
					placeId = item.placeId,
					experienceName = item.experienceName,
					creatorName = item.creatorName,
					description = item.description,
					visibilityLabel = item.visibilityLabel,
					gameIcon = item.gameIcon,
					isGroupGame = item.isGroupGame,
					onOpenChat = p1.onOpenChat,
					onLongPress = if v1 == nil then nil else v1.open,
					testIdPrefix = TestIdPrefix
				})
				continue
			end
			local ExperienceName = item.experienceName
			local GameIcon = item.gameIcon
			local PlaceId = item.placeId
			local VisibilityLabel = item.visibilityLabel
			local CreateElementFunction = ReactModule.createElement
			local Item = List.Item
			local config = {
				LayoutOrder = FirstResultLayoutOrderDelta,
				leading = { iconName = GameIcon },
				title = ExperienceName
			}
			local Description = item.description
			local CreatorName = item.creatorName
			local Description1 = nil
			
			if item.isGroupGame then
				local Description2 = Description or (if CreatorName == nil then nil else EscapeRichTextModule(CreatorName))
				Description1 = if Description2 == nil then IconRichText else `{IconRichText} {Description2}`
			else
				Description1 = Description
			end
			config.description = Description1
			config.testId = `{TestIdPrefix}.ExperienceRow.{item.universeId}`
			
			function config.onActivated() --[[ Line: 261 ]]
				-- upvalues: p1 (copy), item (copy), PlaceId (copy), ExperienceName (copy), GameIcon (copy)
				p1.onOpenChat({
					universeId = item.universeId,
					placeId = PlaceId,
					sessionId = item.sessionId,
					experienceName = ExperienceName,
					creatorName = item.creatorName,
					gameIcon = GameIcon
				})
			end
			
			config.trailing = if VisibilityLabel == nil then nil else ReactModule.createElement(View, { tag = "row align-y-center auto-xy" }, {
				VisibilityBadge = ReactModule.createElement(Badge, {
					text = VisibilityLabel,
					shape = BadgeShape.Box,
					size = BadgeSize.Small,
					variant = BadgeVariant.Neutral,
					testId = `{TestIdPrefix}.VisibilityBadge.{item.universeId}`
				})
			})
			Copy[Text] = CreateElementFunction(Item, config)
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