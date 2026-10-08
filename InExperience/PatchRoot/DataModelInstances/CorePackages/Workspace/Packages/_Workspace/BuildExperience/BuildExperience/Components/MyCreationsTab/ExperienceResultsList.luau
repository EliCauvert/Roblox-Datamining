local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(buildExperience.Chat.chatTypes)
local _ = require(buildExperience.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local fFlagBuildExperienceMyCreationsLongPressMenuModule = require(buildExperience.Flags.FFlagBuildExperienceMyCreationsLongPressMenu)
local fFlagBuildExperienceMyCreationsUseUniverseListModule = require(buildExperience.Flags.FFlagBuildExperienceMyCreationsUseUniverseList)
local fFlagBuildExperienceStableMyCreationsListItemsModule = require(buildExperience.Flags.FFlagBuildExperienceStableMyCreationsListItems)
local experienceResultsLoadingSkeletonModule = require(script.Parent.ExperienceResultsLoadingSkeleton)
local experienceRowActionsMenuContainerModule = require(script.Parent.ExperienceRowActionsMenu.ExperienceRowActionsMenuContainer)
local longPressListItemContainerModule = require(script.Parent.LongPressListItem.LongPressListItemContainer)
local _ = require(script.Parent.useMyCreationsResults)
local badge = foundationModule.Badge
local list = foundationModule.List
local view = foundationModule.View
local badgeShape = foundationModule.Enums.BadgeShape
local badgeSize = foundationModule.Enums.BadgeSize
local badgeVariant = foundationModule.Enums.BadgeVariant
local inputSize = foundationModule.Enums.InputSize

local function useRowActionsMenu()
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(nil)
	local var3, var4 = reactModule.useState(false)
	
	return {
		rowActions = var1,
		isOpen = var3,
		open = reactModule.useCallback(function(p1, p2, p3)
			-- upvalues: var2 (ref), var4 (ref)
			var2({ target = p1, anchor = p2, isAtPointer = p3 })
			var4(true)
		end, {}),
		close = reactModule.useCallback(function()
			-- upvalues: var4 (ref)
			var4(false)
		end, {})
	}
end

local var1 = reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), fFlagBuildExperienceMyCreationsLongPressMenuModule (ref), view (ref), badge (ref), badgeShape (ref), badgeSize (ref), badgeVariant (ref), list (ref), longPressListItemContainerModule (ref)
	local var2 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		return { type = nil, iconVariant = nil, iconName = p1.gameIcon }
	end, { p1.gameIcon })
	local var3 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		p1.onOpenChat({
			universeId = p1.universeId,
			placeId = p1.placeId,
			sessionId = p1.sessionId,
			experienceName = p1.experienceName,
			creatorName = p1.creatorName,
			gameIcon = p1.gameIcon
		})
	end, {
		p1.creatorName, p1.experienceName, p1.gameIcon, p1.onOpenChat, p1.placeId,
		p1.sessionId, p1.universeId
	})
	local onLongPress = p1.onLongPress
	local var4 = if fFlagBuildExperienceMyCreationsLongPressMenuModule then reactModule.useCallback(function(p2, p3)
		-- upvalues: onLongPress (ref), p1 (ref)
		if onLongPress ~= nil then
			onLongPress({
				universeId = p1.universeId,
				placeId = p1.placeId,
				sessionId = p1.sessionId,
				experienceName = p1.experienceName,
				creatorName = p1.creatorName,
				gameIcon = p1.gameIcon
			}, p2, p3)
		end
	end, {
		onLongPress, p1.creatorName, p1.experienceName, p1.gameIcon, p1.placeId,
		p1.sessionId, p1.universeId
	}) else nil
	local var5 = reactModule.createElement(list.Item, {
		LayoutOrder = p1.LayoutOrder,
		leading = var2,
		title = p1.experienceName,
		description = p1.description,
		testId = `{p1.testIdPrefix}.ExperienceRow.{p1.universeId}`,
		onActivated = if onLongPress == nil then var3 else nil,
		trailing = reactModule.useMemo(function()
			-- upvalues: p1 (ref), reactModule (copy), view (copy), badge (copy), badgeShape (copy), badgeSize (copy), badgeVariant (copy)
			return if p1.visibilityLabel == nil then nil else reactModule.createElement(view, { tag = "row align-y-center auto-xy" }, {
				VisibilityBadge = reactModule.createElement(badge, {
					text = p1.visibilityLabel,
					shape = badgeShape.Box,
					size = badgeSize.Small,
					variant = badgeVariant.Neutral,
					testId = `{p1.testIdPrefix}.VisibilityBadge.{p1.universeId}`
				})
			})
		end, { p1.testIdPrefix, p1.universeId, p1.visibilityLabel })
	})
	
	return if var4 == nil or onLongPress == nil then var5 else reactModule.createElement(longPressListItemContainerModule, {
		LayoutOrder = p1.LayoutOrder,
		isHighlighted = p1.isHighlighted == true,
		onActivated = var3,
		onLongPress = var4,
		testId = `{p1.testIdPrefix}.ExperienceRowPressable.{p1.universeId}`
	}, var5)
end)

return reactModule.memo(function(p1)
	-- upvalues: fFlagBuildExperienceMyCreationsLongPressMenuModule (ref), fFlagBuildExperienceStableMyCreationsListItemsModule (ref), useRowActionsMenu (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (ref), reactModule (ref), var1 (ref), list (ref), view (ref), badge (ref), badgeShape (ref), badgeSize (ref), badgeVariant (ref), experienceResultsLoadingSkeletonModule (ref), experienceRowActionsMenuContainerModule (ref), inputSize (ref)
	local testIdPrefix = p1.testIdPrefix or "MyCreationsTab"
	local firstResultLayoutOrder = p1.firstResultLayoutOrder or 1
	local cloned = table.clone(p1.leadingItems or {})
	local onOpenConfigurationPage = p1.onOpenConfigurationPage
	local var2 = nil
	
	if fFlagBuildExperienceMyCreationsLongPressMenuModule and fFlagBuildExperienceStableMyCreationsListItemsModule then
		local var3 = useRowActionsMenu()
		
		if onOpenConfigurationPage ~= nil then
			var2 = var3
		end
	end
	local var4 = if var2 ~= nil then nil else var2.rowActions
	local var5 = if var2 == nil or not var2.isOpen or var4 == nil then nil else var4.target.universeId
	
	if p1.hasDisplayedResult and p1.hasDisplayedItems then
		local var6, var7
		for i_1, v in p1.items do
			var6 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then "U" .. v.universeId else "S" .. v.sessionId
			var7 = i_1 + firstResultLayoutOrder - 1
			
			if not fFlagBuildExperienceStableMyCreationsListItemsModule then
				local experienceName = v.experienceName
				local gameIcon = v.gameIcon
				local placeId = v.placeId
				local visibilityLabel = v.visibilityLabel
				cloned[var6] = reactModule.createElement(list.Item, {
					LayoutOrder = var7,
					leading = { iconName = gameIcon },
					title = experienceName,
					description = v.description,
					testId = `{testIdPrefix}.ExperienceRow.{v.universeId}`,
					onActivated = function()
						-- upvalues: p1 (ref), v (ref), placeId (ref), experienceName (ref), gameIcon (ref)
						p1.onOpenChat({
							universeId = v.universeId,
							placeId = placeId,
							sessionId = v.sessionId,
							experienceName = experienceName,
							creatorName = v.creatorName,
							gameIcon = gameIcon
						})
					end,
					trailing = if visibilityLabel ~= nil then nil else reactModule.createElement(view, { tag = "row align-y-center auto-xy" }, {
						VisibilityBadge = reactModule.createElement(badge, {
							text = visibilityLabel,
							shape = badgeShape.Box,
							size = badgeSize.Small,
							variant = badgeVariant.Neutral,
							testId = `{testIdPrefix}.VisibilityBadge.{v.universeId}`
						})
					})
				})
				continue
			end
			local var8
			local createElement = reactModule.createElement
			local var9 = var1
			local t = {
				LayoutOrder = var7,
				sessionId = v.sessionId,
				universeId = v.universeId,
				placeId = v.placeId,
				experienceName = v.experienceName,
				creatorName = v.creatorName,
				description = v.description,
				visibilityLabel = v.visibilityLabel,
				gameIcon = v.gameIcon,
				onOpenChat = p1.onOpenChat,
				onLongPress = if var2 ~= nil then nil else var2.open
			}
			
			if var2 == nil then
				var8 = nil
			else
				var8 = false
				
				if var5 ~= nil then
					local _ = var5 == v.universeId
				end
			end
			t.isHighlighted = var8
			t.testIdPrefix = testIdPrefix
			cloned[var6] = createElement(var9, t)
		end
	elseif p1.listStatus == "NotReady" or p1.hasPendingSummary then
		for i = 1, 2 do
			cloned[`Loading{i}`] = reactModule.createElement(experienceResultsLoadingSkeletonModule, {
				LayoutOrder = i + firstResultLayoutOrder - 1,
				index = i,
				testIdPrefix = testIdPrefix
			})
		end
	elseif p1.listStatus == "Failed" then
		cloned.Error = reactModule.createElement(list.Item, {
			LayoutOrder = firstResultLayoutOrder,
			title = p1.loadError
		})
	end
	if p1.failedLoadMore then
		cloned.LoadMoreError = reactModule.createElement(list.Item, {
			LayoutOrder = #p1.items + firstResultLayoutOrder,
			title = p1.loadError,
			testId = `{testIdPrefix}.LoadMoreError`,
			onActivated = p1.retryLoadMore
		})
	end
	if var2 ~= nil then
		cloned.RowActionsMenu = reactModule.createElement(experienceRowActionsMenuContainerModule, {
			target = if var4 ~= nil then nil else var4.target,
			anchor = if var4 ~= nil then nil else var4.anchor,
			isAtPointer = if var4 ~= nil then nil else var4.isAtPointer,
			isOpen = var2.isOpen,
			onClose = var2.close,
			onOpenConfigurationPage = onOpenConfigurationPage
		})
	end
	return reactModule.createElement(list.Root, {
		hasDivider = false,
		isContained = { isContained = false, hasMargin = false },
		size = inputSize.Large
	}, cloned)
end)