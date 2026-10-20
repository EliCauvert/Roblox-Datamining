local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local _ = require(Parent.DataHydration)
local ReactModule = require(Parent.React)
local PublishBottomSheetContainerModule = require(script.Parent.PublishBottomSheetContainer)
local VersionHistoryContainerModule = require(BuildExperience.Components.VersionHistory.VersionHistoryContainer)
local GameInfoUtilsModule = require(BuildExperience.utils.GameInfoUtils)
local Screens = require(BuildExperience.Components.BuildPillMenu.BuildOverflowMenuScreens).Screens

local function _(p1, p2)
	-- upvalues: GameInfoUtilsModule (copy)
	return if p1.placeId == nil then if GameInfoUtilsModule.isGameInfoReady(p2) then tonumber(p2.rootPlaceId) else nil else p1.placeId
end

return function(p1)
	-- upvalues: ReactModule (copy), GameInfoUtilsModule (copy), Screens (copy), PublishBottomSheetContainerModule (copy), VersionHistoryContainerModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local NavigateToSubPageFunction = p1.navigateToSubPage
	local OnCloseFunction = p1.onClose
	local Target = p1.target
	local UseGameInfoResult = GameInfoUtilsModule.useGameInfo(Target.universeId)
	local Number = if Target.placeId == nil then if GameInfoUtilsModule.isGameInfoReady(UseGameInfoResult) then tonumber(UseGameInfoResult.rootPlaceId) else nil else Target.placeId
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Target (copy), Number (copy)
		return {
			universeId = Target.universeId,
			placeId = Number,
			sessionId = Target.sessionId,
			experienceName = Target.experienceName,
			gameIcon = Target.gameIcon,
			isNewGameTarget = Target.isNewGameTarget
		}
	end, {
		Target.universeId, Number, Target.sessionId, Target.experienceName,
		Target.gameIcon, Target.isNewGameTarget
	})
	local IsTitleDescriptionReady = GameInfoUtilsModule.isTitleDescriptionReady(UseGameInfoResult)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: IsTitleDescriptionReady (copy), OnCloseFunction (copy), NavigateToSubPageFunction (copy), Screens (upval), UseMemoResult (copy)
		if IsTitleDescriptionReady then
			OnCloseFunction()
			NavigateToSubPageFunction(Screens.BuildTitleDescription, UseMemoResult)
			
			return
		end
	end, {
		OnCloseFunction,
		NavigateToSubPageFunction,
		IsTitleDescriptionReady,
		UseMemoResult
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: OnCloseFunction (copy), NavigateToSubPageFunction (copy), Screens (upval), UseMemoResult (copy)
		OnCloseFunction()
		NavigateToSubPageFunction(Screens.BuildMediaSelection, UseMemoResult)
	end, {
		OnCloseFunction,
		NavigateToSubPageFunction,
		UseMemoResult
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: Number (copy), OnCloseFunction (copy), NavigateToSubPageFunction (copy), Screens (upval), UseMemoResult (copy)
		if Number ~= nil then
			OnCloseFunction()
			NavigateToSubPageFunction(Screens.BuildVersionTitleDescription, UseMemoResult)
			
			return
		end
	end, {
		OnCloseFunction,
		NavigateToSubPageFunction,
		Number,
		UseMemoResult
	})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: Number (copy), OnCloseFunction (copy), UseStateResult2 (copy)
		if Number ~= nil then
			OnCloseFunction()
			UseStateResult2(true)
			
			return
		end
	end, { OnCloseFunction, Number })
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, {})
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		PublishSheet = if p1.isOpen then ReactModule.createElement(PublishBottomSheetContainerModule, {
			isOpen = true,
			target = UseMemoResult,
			gameInfo = UseGameInfoResult,
			onClose = OnCloseFunction,
			onOpenTitleDescriptionPage = UseResult,
			onOpenMediaSelectionPage = UseResult1,
			onOpenVersionTitleDescriptionPage = UseResult2,
			onOpenVersionHistory = UseResult3,
			showPreviewButton = p1.showPreviewButton
		}) else nil,
		VersionHistory = if UseStateResult and Number ~= nil then ReactModule.createElement(VersionHistoryContainerModule, {
			isOpen = true,
			testId = "build-publish-version-history",
			placeId = Number,
			onClose = UseResult4
		}) else nil
	})
end