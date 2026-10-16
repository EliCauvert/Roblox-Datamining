local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(buildExperience.Chat.chatTypes)
local fFlagBuildExperienceMyCreationsUseUniverseListModule = require(buildExperience.Flags.FFlagBuildExperienceMyCreationsUseUniverseList)
local fFlagBuildExperienceStableMyCreationsListItemsModule = require(buildExperience.Flags.FFlagBuildExperienceStableMyCreationsListItems)
local experienceResultsLoadingSkeletonModule = require(script.Parent.ExperienceResultsLoadingSkeleton)
local _ = require(script.Parent.useMyCreationsResults)
local badge = foundationModule.Badge
local list = foundationModule.List
local view = foundationModule.View
local badgeShape = foundationModule.Enums.BadgeShape
local badgeSize = foundationModule.Enums.BadgeSize
local badgeVariant = foundationModule.Enums.BadgeVariant
local inputSize = foundationModule.Enums.InputSize
local var1 = reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), view (ref), badge (ref), badgeShape (ref), badgeSize (ref), badgeVariant (ref), list (ref)
	return reactModule.createElement(list.Item, {
		LayoutOrder = p1.LayoutOrder,
		leading = reactModule.useMemo(function()
			-- upvalues: p1 (ref)
			return { type = nil, iconVariant = nil, iconName = p1.gameIcon }
		end, { p1.gameIcon }),
		title = p1.experienceName,
		description = p1.description,
		testId = `{p1.testIdPrefix}.ExperienceRow.{p1.universeId}`,
		onActivated = reactModule.useCallback(function()
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
		}),
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
end)

return reactModule.memo(function(p1)
	-- upvalues: fFlagBuildExperienceMyCreationsUseUniverseListModule (ref), fFlagBuildExperienceStableMyCreationsListItemsModule (ref), reactModule (ref), var1 (ref), list (ref), view (ref), badge (ref), badgeShape (ref), badgeSize (ref), badgeVariant (ref), experienceResultsLoadingSkeletonModule (ref), inputSize (ref)
	local testIdPrefix = p1.testIdPrefix or "MyCreationsTab"
	local firstResultLayoutOrder = p1.firstResultLayoutOrder or 1
	local cloned = table.clone(p1.leadingItems or {})
	
	if p1.hasDisplayedResult and p1.hasDisplayedItems then
		for i_1, v in p1.items do
			local var2 = if fFlagBuildExperienceMyCreationsUseUniverseListModule then "U" .. v.universeId else "S" .. v.sessionId
			local var3 = i_1 + firstResultLayoutOrder - 1
			
			if fFlagBuildExperienceStableMyCreationsListItemsModule then
				cloned[var2] = reactModule.createElement(var1, {
					LayoutOrder = var3,
					sessionId = v.sessionId,
					universeId = v.universeId,
					placeId = v.placeId,
					experienceName = v.experienceName,
					creatorName = v.creatorName,
					description = v.description,
					visibilityLabel = v.visibilityLabel,
					gameIcon = v.gameIcon,
					onOpenChat = p1.onOpenChat,
					testIdPrefix = testIdPrefix
				})
			else
				local experienceName = v.experienceName
				local gameIcon = v.gameIcon
				local placeId = v.placeId
				local visibilityLabel = v.visibilityLabel
				cloned[var2] = reactModule.createElement(list.Item, {
					LayoutOrder = var3,
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
			end
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
	return reactModule.createElement(list.Root, {
		hasDivider = false,
		isContained = { isContained = false, hasMargin = false },
		size = inputSize.Large
	}, cloned)
end)