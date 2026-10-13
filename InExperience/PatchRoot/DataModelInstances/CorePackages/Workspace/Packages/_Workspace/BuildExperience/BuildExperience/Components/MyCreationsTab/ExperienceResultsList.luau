local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(buildExperience.Chat.chatTypes)
local _ = require(buildExperience.Stores.GetBuildOverflowMenuStore.createBuildOverflowMenuStore)
local fFlagBuildExperienceMyCreationsLongPressMenuModule = require(buildExperience.Flags.FFlagBuildExperienceMyCreationsLongPressMenu)
local fFlagBuildExperienceMyCreationsUseUniverseListModule = require(buildExperience.Flags.FFlagBuildExperienceMyCreationsUseUniverseList)
local fFlagBuildExperienceStableMyCreationsListItemsModule = require(buildExperience.Flags.FFlagBuildExperienceStableMyCreationsListItems)
local escapeRichTextModule = require(buildExperience.utils.escapeRichText)
local experienceResultsLoadingSkeletonModule = require(script.Parent.ExperienceResultsLoadingSkeleton)
local experienceRowActionsMenuModule = require(script.Parent.ExperienceRowActionsMenu)
local _ = require(script.Parent.useMyCreationsResults)
local badge = foundationModule.Badge
local list = foundationModule.List
local view = foundationModule.View
local getIconRichText = foundationModule.Utility.getIconRichText
local useMeasurableRef = foundationModule.Hooks.useMeasurableRef
local badgeShape = foundationModule.Enums.BadgeShape
local badgeSize = foundationModule.Enums.BadgeSize
local badgeVariant = foundationModule.Enums.BadgeVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local listItemInputType = foundationModule.Enums.ListItemInputType
local var1 = getIconRichText(iconName.TwoPeople)

local function _(p1, p2, p3)
	-- upvalues: escapeRichTextModule (ref), var1 (ref)
	if not p2 then
		return p1
	end
	p1 = p1 or (if p3 ~= nil then nil else escapeRichTextModule(p3))
	
	return if p1 == nil then var1 else `{var1} {p1}`
end

local function useRowActionsMenu()
	-- upvalues: useMeasurableRef (ref), reactModule (ref)
	local var2 = useMeasurableRef(Vector2.zero, Vector2.zero)
	local var3, var4 = reactModule.useState(nil)
	local var5, var6 = reactModule.useState(false)
	
	return {
		rowActions = var3,
		anchor = var2.current,
		isOpen = var5,
		open = reactModule.useCallback(function(p1, p2, p3)
			-- upvalues: var2 (ref), var4 (ref), var6 (ref)
			var2.current:SetPosition(p2)
			var4({ target = p1, isAtPointer = p3 })
			var6(true)
		end, { var2 }),
		close = reactModule.useCallback(function()
			-- upvalues: var6 (ref)
			var6(false)
		end, {})
	}
end

local var2 = reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), fFlagBuildExperienceMyCreationsLongPressMenuModule (ref), view (ref), badge (ref), badgeShape (ref), badgeSize (ref), badgeVariant (ref), list (ref), escapeRichTextModule (ref), var1 (ref), listItemInputType (ref)
	local var3
	local var4 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		return { type = nil, iconVariant = nil, iconName = p1.gameIcon }
	end, { p1.gameIcon })
	local var5 = reactModule.useCallback(function()
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
	local var6 = if fFlagBuildExperienceMyCreationsLongPressMenuModule then reactModule.useCallback(function(p2, p3)
		-- upvalues: onLongPress (ref), p1 (ref)
		if onLongPress == nil then return end
		local t = {
			universeId = p1.universeId,
			placeId = p1.placeId,
			sessionId = p1.sessionId,
			experienceName = p1.experienceName,
			creatorName = p1.creatorName,
			gameIcon = p1.gameIcon
		}
		
		if p3.UserInputType == Enum.UserInputType.MouseButton2 then
			onLongPress(t, Vector2.new(p3.Position.X, p3.Position.Y), true)
			
			return
		end
		onLongPress(t, p2.AbsolutePosition + Vector2.new(p2.AbsoluteSize.X, 0), false)
	end, {
		onLongPress, p1.creatorName, p1.experienceName, p1.gameIcon, p1.placeId,
		p1.sessionId, p1.universeId
	}) else nil
	local var7 = reactModule.useMemo(function()
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
	local var8 = var6 ~= nil and onLongPress ~= nil
	local createElement = reactModule.createElement
	local item = list.Item
	local t = {
		LayoutOrder = p1.LayoutOrder,
		leading = var4,
		title = p1.experienceName
	}
	local description = p1.description
	local creatorName = p1.creatorName
	
	if p1.isGroupGame then
		local var9 = description or (if creatorName ~= nil then nil else escapeRichTextModule(creatorName))
		var3 = if var9 ~= nil then var1 else `{var1} {var9}`
	else
		var3 = description
	end
	t.description = var3
	t.testId = `{p1.testIdPrefix}.ExperienceRow.{p1.universeId}`
	t.onActivated = var5
	t.onSecondaryActivated = if var8 then var6 else nil
	t.input = if var8 then listItemInputType.None else nil
	t.trailing = var7
	
	return createElement(item, t)
end)

return reactModule.memo(function(p1)
	-- upvalues: fFlagBuildExperienceMyCreationsLongPressMenuModule (ref), fFlagBuildExperienceStableMyCreationsListItemsModule (ref), useRowActionsMenu (ref), fFlagBuildExperienceMyCreationsUseUniverseListModule (ref), reactModule (ref), var2 (ref), list (ref), escapeRichTextModule (ref), var1 (ref), view (ref), badge (ref), badgeShape (ref), badgeSize (ref), badgeVariant (ref), experienceResultsLoadingSkeletonModule (ref), experienceRowActionsMenuModule (ref), inputSize (ref)
	local testIdPrefix = p1.testIdPrefix or "MyCreationsTab"
	local firstResultLayoutOrder = p1.firstResultLayoutOrder or 1
	local cloned = table.clone(p1.leadingItems or {})
	local onOpenConfigurationPage = p1.onOpenConfigurationPage
	local var3 = nil
	
	if fFlagBuildExperienceMyCreationsLongPressMenuModule and fFlagBuildExperienceStableMyCreationsListItemsModule then
		local var4 = useRowActionsMenu()
		
		if onOpenConfigurationPage ~= nil then
			var3 = var4
		end
	end
	local var5 = if var3 ~= nil then nil else var3.rowActions
	
	if p1.hasDisplayedResult and p1.hasDisplayedItems then
		local var6, var7
		for i_1, v in p1.items do
			var6 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then "U" .. v.universeId else "S" .. v.sessionId
			var7 = i_1 + firstResultLayoutOrder - 1
			
			if fFlagBuildExperienceStableMyCreationsListItemsModule then
				cloned[var6] = reactModule.createElement(var2, {
					LayoutOrder = var7,
					sessionId = v.sessionId,
					universeId = v.universeId,
					placeId = v.placeId,
					experienceName = v.experienceName,
					creatorName = v.creatorName,
					description = v.description,
					visibilityLabel = v.visibilityLabel,
					gameIcon = v.gameIcon,
					isGroupGame = v.isGroupGame,
					onOpenChat = p1.onOpenChat,
					onLongPress = if var3 ~= nil then nil else var3.open,
					testIdPrefix = testIdPrefix
				})
				continue
			end
			local var8
			local experienceName = v.experienceName
			local gameIcon = v.gameIcon
			local placeId = v.placeId
			local visibilityLabel = v.visibilityLabel
			local createElement = reactModule.createElement
			local item = list.Item
			local t = {
				LayoutOrder = var7,
				leading = { iconName = gameIcon },
				title = experienceName
			}
			local description = v.description
			local creatorName = v.creatorName
			
			if v.isGroupGame then
				local var9 = description or (if creatorName ~= nil then nil else escapeRichTextModule(creatorName))
				var8 = if var9 ~= nil then var1 else `{var1} {var9}`
			else
				var8 = description
			end
			t.description = var8
			t.testId = `{testIdPrefix}.ExperienceRow.{v.universeId}`
			
			function t.onActivated()
				-- upvalues: p1 (ref), v (ref), placeId (ref), experienceName (ref), gameIcon (ref)
				p1.onOpenChat({
					universeId = v.universeId,
					placeId = placeId,
					sessionId = v.sessionId,
					experienceName = experienceName,
					creatorName = v.creatorName,
					gameIcon = gameIcon
				})
			end
			
			t.trailing = if visibilityLabel ~= nil then nil else reactModule.createElement(view, { tag = "row align-y-center auto-xy" }, {
				VisibilityBadge = reactModule.createElement(badge, {
					text = visibilityLabel,
					shape = badgeShape.Box,
					size = badgeSize.Small,
					variant = badgeVariant.Neutral,
					testId = `{testIdPrefix}.VisibilityBadge.{v.universeId}`
				})
			})
			cloned[var6] = createElement(item, t)
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
	if var3 ~= nil then
		cloned.RowActionsMenu = reactModule.createElement(experienceRowActionsMenuModule, {
			target = if var5 ~= nil then nil else var5.target,
			anchor = if var5 ~= nil then nil else var3.anchor,
			isAtPointer = if var5 ~= nil then nil else var5.isAtPointer,
			isOpen = var3.isOpen,
			onClose = var3.close,
			onOpenConfigurationPage = onOpenConfigurationPage
		})
	end
	return reactModule.createElement(list.Root, {
		hasDivider = false,
		isContained = { isContained = false, hasMargin = false },
		size = inputSize.Large
	}, cloned)
end)