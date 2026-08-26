local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local _ = require(parent.DataHydration)
local reactModule = require(parent.React)
local publishBottomSheetContainerModule = require(script.Parent.PublishBottomSheetContainer)
local versionHistoryContainerModule = require(buildExperience.Components.VersionHistory.VersionHistoryContainer)
local gameInfoUtilsModule = require(buildExperience.utils.GameInfoUtils)
local screens = require(buildExperience.Components.BuildPillMenu.BuildOverflowMenuScreens).Screens

local function _(p1, p2)
	-- upvalues: gameInfoUtilsModule (ref)
	return if p1.placeId == nil then if gameInfoUtilsModule.isGameInfoReady(p2) then tonumber(p2.rootPlaceId) else nil else p1.placeId
end

return function(p1)
	-- upvalues: reactModule (ref), gameInfoUtilsModule (ref), screens (ref), publishBottomSheetContainerModule (ref), versionHistoryContainerModule (ref)
	local var1, var2 = reactModule.useState(false)
	local navigateToSubPage = p1.navigateToSubPage
	local onClose = p1.onClose
	local target = p1.target
	local var3 = gameInfoUtilsModule.useGameInfo(target.universeId)
	local var4 = if target.placeId ~= nil then if gameInfoUtilsModule.isGameInfoReady(var3) then tonumber(var3.rootPlaceId) else nil else target.placeId
	local var5 = reactModule.useMemo(function()
		-- upvalues: target (ref), var4 (ref)
		return {
			universeId = target.universeId,
			placeId = var4,
			sessionId = target.sessionId,
			experienceName = target.experienceName,
			gameIcon = target.gameIcon,
			isNewGameTarget = target.isNewGameTarget
		}
	end, {
		target.universeId, var4, target.sessionId, target.experienceName,
		target.gameIcon, target.isNewGameTarget
	})
	local var6 = gameInfoUtilsModule.isTitleDescriptionReady(var3)
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		PublishSheet = if p1.isOpen then reactModule.createElement(publishBottomSheetContainerModule, {
			isOpen = true,
			target = var5,
			gameInfo = var3,
			onClose = onClose,
			onOpenTitleDescriptionPage = reactModule.useCallback(function()
				-- upvalues: var6 (ref), onClose (ref), navigateToSubPage (ref), screens (copy), var5 (ref)
				if var6 then
					onClose()
					navigateToSubPage(screens.BuildTitleDescription, var5)
					
					return
				end
			end, { onClose, navigateToSubPage, var6, var5 }),
			onOpenMediaSelectionPage = reactModule.useCallback(function()
				-- upvalues: onClose (ref), navigateToSubPage (ref), screens (copy), var5 (ref)
				onClose()
				navigateToSubPage(screens.BuildMediaSelection, var5)
			end, { onClose, navigateToSubPage, var5 }),
			onOpenVersionTitleDescriptionPage = reactModule.useCallback(function()
				-- upvalues: var4 (ref), onClose (ref), navigateToSubPage (ref), screens (copy), var5 (ref)
				if var4 == nil then
					return
				end
				onClose()
				navigateToSubPage(screens.BuildVersionTitleDescription, var5)
			end, { onClose, navigateToSubPage, var4, var5 }),
			onOpenVersionHistory = reactModule.useCallback(function()
				-- upvalues: var4 (ref), onClose (ref), var2 (ref)
				if var4 == nil then
					return
				end
				onClose()
				var2(true)
			end, { onClose, var4 }),
			showPreviewButton = p1.showPreviewButton
		}) else nil,
		VersionHistory = if var1 and var4 ~= nil then reactModule.createElement(versionHistoryContainerModule, {
			isOpen = true,
			testId = "build-publish-version-history",
			placeId = var4,
			onClose = reactModule.useCallback(function()
				-- upvalues: var2 (ref)
				var2(false)
			end, {})
		}) else nil
	})
end