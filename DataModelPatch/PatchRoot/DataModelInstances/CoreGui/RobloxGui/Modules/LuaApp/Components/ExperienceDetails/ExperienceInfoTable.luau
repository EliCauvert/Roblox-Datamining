local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local DashModule = require(CorePackages.Packages.Dash)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseExperienceInfoDataModule = require(Modules.LuaApp.Components.ExperienceDetails.Hooks.useExperienceInfoData)
local UseUiModeInfoFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useUiModeInfo
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local UseAppPolicyModule = require(Modules.LuaApp.Hooks.useAppPolicy)
local AppEventIngestServiceModule = require(Modules.LuaApp.Services.AppEventIngestService)
local AppLinking = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLinking
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp
local FFlagLuaAppAddUniverseIdToGameDetailsEvents = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppAddUniverseIdToGameDetailsEvents
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local OpenCentralOverlayForLeaveRobloxAlertModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForLeaveRobloxAlert)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local FFlagEnableBlackbirdPageCloseCallback = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableBlackbirdPageCloseCallback
local ListTable = require(CorePackages.Packages.UIBlox).App.Table.ListTable
local ExperienceInfoTableRowModule = require(script.Parent.ExperienceInfoTableRow)
local ExperienceDetailsPanelModule = require(script.Parent.ExperienceDetailsPanel)

return ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseExperienceInfoDataModule (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), UseRoactServiceModule (copy), AppEventIngestServiceModule (copy), UseDispatchFunction (copy), ReactModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy), AppLinking (copy), OpenCentralOverlayForLeaveRobloxAlertModule (copy), CloseCentralOverlayModule (copy), UseAppPolicyModule (copy), UseLocalizationFunction (copy), UseUiModeInfoFunction (copy), UiMode (copy), UseTokensFunction (copy), ListTable (copy), DashModule (copy), ExperienceInfoTableRowModule (copy), FFlagEnableBlackbirdPageCloseCallback (copy), FFlagLuaAppAddUniverseIdToGameDetailsEvents (copy), ExperienceDetailsPanelModule (copy)
	local UseExperienceInfoDataModuleResult = UseExperienceInfoDataModule(p1.universeId, if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1.shouldHydrateLegacyIxp else nil, p1.hideCloseButton)
	local UseRoactServiceModuleResult = UseRoactServiceModule(AppEventIngestServiceModule)
	local UseDispatchResult = UseDispatchFunction()
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownModule (upval)
		if FFlagSignalsNavP3Dispatch then
			NavigationCommands.down(NavigationCommands.fromLegacyPage(p2))
			
			return
		else
			UseDispatchResult(NavigateDownModule(p2))
		end
	end)
	local UseRoactServiceModuleResult1 = UseRoactServiceModule(AppLinking)
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: UseDispatchResult (copy), OpenCentralOverlayForLeaveRobloxAlertModule (upval)
		UseDispatchResult(OpenCentralOverlayForLeaveRobloxAlertModule(p2))
	end, { UseDispatchResult })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), CloseCentralOverlayModule (upval)
		UseDispatchResult(CloseCentralOverlayModule())
	end, { UseDispatchResult })
	local UseAppPolicyModuleResult = UseAppPolicyModule(function(p2)
		return p2.enableExperienceDetailsPanel()
	end)
	local UseLocalizationResult = UseLocalizationFunction({
		StatsInfoTitle = "Feature.ExperienceDetails.Body.StatsInfoTitle"
	})
	local IsUiModeMatch = UseUiModeInfoFunction().uiMode == UiMode.TenFoot
	local UseTokensResult = UseTokensFunction()
	local Element = ReactModule.createElement(ListTable, {
		cells = DashModule.map(UseExperienceInfoDataModuleResult.rows, function(p2)
			-- upvalues: ReactModule (upval), ExperienceInfoTableRowModule (upval), UseAppPolicyModuleResult (copy), UseTokensResult (copy), p1 (copy), IsUiModeMatch (copy), UseRoactServiceModuleResult (copy), UseExperienceInfoDataModuleResult (copy), UseResult (copy), FFlagEnableBlackbirdPageCloseCallback (upval), UseResult1 (copy), UseResult2 (copy), UseRoactServiceModuleResult1 (copy), FFlagLuaAppAddUniverseIdToGameDetailsEvents (upval)
			return ReactModule.createElement(ExperienceInfoTableRowModule, {
				horizontalPadding = if UseAppPolicyModuleResult then nil else UseTokensResult.Padding.Medium,
				infoName = p2.infoName,
				infoData = p2.infoData or "",
				infoIcon = p2.infoIcon,
				renderTextOverride = if p2.infoDataOverride and p1.renderTextOverride then function()
					-- upvalues: p2 (copy), p1 (upval)
					return p2.infoDataOverride(p1.renderTextOverride)
				end else nil,
				linkProps = if p2.linkPage or p2.navigateOverride then if IsUiModeMatch then nil else {
					eventIngest = UseRoactServiceModuleResult,
					rootPlaceId = UseExperienceInfoDataModuleResult.rootPlaceId,
					linkPage = p2.linkPage,
					linkUrl = p2.linkUrl,
					navigate = p2.navigateOverride or UseResult,
					analyticsSubPage = p2.analyticsSubPage,
					onClose = if FFlagEnableBlackbirdPageCloseCallback then p2.onClose else nil
				} else nil,
				externalLinkProps = if p2.linkUrl and not IsUiModeMatch then {
					linkUrl = p2.linkUrl,
					openLeaveRobloxAlert = UseResult1,
					closeAlert = UseResult2,
					linking = UseRoactServiceModuleResult1,
					clickCallback = p2.linkClickCallback
				} else nil,
				universeId = if FFlagLuaAppAddUniverseIdToGameDetailsEvents then p1.universeId else nil,
				testId = p2.testId
			})
		end),
		automaticSize = Enum.AutomaticSize.Y,
		dividerStartOffset = if UseAppPolicyModuleResult then nil else 0
	})
	
	return if UseAppPolicyModuleResult then ReactModule.createElement(ExperienceDetailsPanelModule, {
		roundContentCorners = true,
		ref = Ref,
		title = UseLocalizationResult.StatsInfoTitle
	}, Element) else Element
end)