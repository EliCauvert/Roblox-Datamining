local GameTile = script:FindFirstAncestor("GameTile")
local Parent = GameTile.Parent
local IXPService = game:GetService("IXPService")
local CryoModule = require(Parent.Cryo)
local RoactServices = require(Parent.RoactServices).RoactServices
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local AppSessionService = RoactServiceTagsModule.AppSessionService
local RoactNetworking = RoactServiceTagsModule.RoactNetworking
local RoactModule = require(Parent.Roact)
local ReactModule = require(Parent.React)
local RoactRoduxModule = require(Parent.RoactRodux)
local TModule = require(Parent.t)
local ButtonSize = require(Parent.Foundation).Enums.ButtonSize
local UIBloxModule = require(Parent.UIBlox)
local ExperienceActionRow = UIBloxModule.App.Tile.ExperienceActionRow
local Images = UIBloxModule.App.ImageSet.Images
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local MenuDirection = UIBloxModule.App.Menu.MenuDirection
local RobloxAppSessionizationModule = require(Parent.RobloxAppSessionization)
local SetGamePlaySessionFunction = RobloxAppSessionizationModule.SetGamePlaySession
local SessionType = RobloxAppSessionizationModule.SessionType
local WithLocalizationFunction = require(Parent.Localization).withLocalization
local GamePlayButtonModule = require(Parent.GamePlayButton)
local PlayButton = GamePlayButtonModule.PlayButton
local PlayButtonStates = GamePlayButtonModule.PlayButtonStates
local UsePlayButtonState = GamePlayButtonModule.usePlayButtonState
local UseOnPlaySquadButtonCallback = GamePlayButtonModule.useOnPlaySquadButtonCallback
local UseOnPlayButtonCallback = GamePlayButtonModule.useOnPlayButtonCallback
local UseRoactService = require(Parent.RobloxAppHooks).useRoactService
local GamesProductInfoReducer = require(Parent.GameProductInfoRodux).GamesProductInfoReducer
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local CloseCentralOverlayFunction = require(Parent.CentralOverlay).Thunks.CloseCentralOverlay
local AppUserLayers = require(Parent.ExperimentLayers).AppUserLayers
local UseUserExperiment = require(Parent.RoactAppExperiment).useUserExperiment
local UseAppPolicy = require(Parent.UniversalAppPolicy).useAppPolicy
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local FFlagDebugEnablePopForcePicker = require(Parent.SharedFlags).FFlagDebugEnablePopForcePicker
local FFlagLuaAppEnablePlayableStateWhenLoading = require(Parent.SharedFlags).FFlagLuaAppEnablePlayableStateWhenLoading
local FFlagLuaAppSupportDisablePlayableWhenLoading = require(Parent.SharedFlags).FFlagLuaAppSupportDisablePlayableWhenLoading
local FFlagLuaAppDisablePlayableWhenLoadingForce = require(Parent.SharedFlags).FFlagLuaAppDisablePlayableWhenLoadingForce
local FFlagLuaAppPlayButtonLoadingPrimary = require(Parent.SharedFlags).FFlagLuaAppPlayButtonLoadingPrimary
local FFlagLuaAppUnifyPlayButtonTile = require(Parent.SharedFlags).FFlagLuaAppUnifyPlayButtonTile
local FFlagLuaAppUnifyPlayButtonTileIxp = require(Parent.SharedFlags).FFlagLuaAppUnifyPlayButtonTileIxp
local FFlagLuaAppUnifyPlayButtonAllSurfacesIxp = require(Parent.SharedFlags).FFlagLuaAppUnifyPlayButtonAllSurfacesIxp
local GetFFlagUIBloxUseFoundationButtonFunction = require(Parent.SharedFlags).UIBlox.GetFFlagUIBloxUseFoundationButton
local FFlagLuaAppPlayButtonOptOutFoundationButton = require(Parent.SharedFlags).FFlagLuaAppPlayButtonOptOutFoundationButton
local FFlagLuaAppPlayButtonLoadingDurationTelemetry = require(Parent.SharedFlags).FFlagLuaAppPlayButtonLoadingDurationTelemetry
local FFlagLuaAppTextOnlyPlayButton = require(Parent.SharedFlags).FFlagLuaAppTextOnlyPlayButton
local FFlagLuaAppIconTextPlayButton = require(Parent.SharedFlags).FFlagLuaAppIconTextPlayButton
local FFlagLuaAppUpdatePlayButtonText = require(Parent.SharedFlags).FFlagLuaAppUpdatePlayButtonText
local FFlagLuaAppLogExposurePlayButtonUX = require(Parent.SharedFlags).FFlagLuaAppLogExposurePlayButtonUX
local FFlagLuaAppDemoModePlayButtonTelemetry = require(Parent.SharedFlags).FFlagLuaAppDemoModePlayButtonTelemetry
local FFlagLuaAppPlayButtonPrivatePT = require(Parent.SharedFlags).FFlagLuaAppPlayButtonPrivatePT
local LuaAppFixAppExperienceActionRowLoadingState = game:DefineFastFlag("LuaAppFixAppExperienceActionRowLoadingState", false)
local GameTileExperimentationModule = require(GameTile.GameTileExperimentation)
local v1 = if FFlagLuaAppUnifyPlayButtonTile then 40 else nil
local AppExperienceActionRow = RoactModule.PureComponent:extend("AppExperienceActionRow")
AppExperienceActionRow.validateProps = TModule.strictInterface({
	universeId = TModule.string,
	launchExperienceEventContext = TModule.optional(TModule.string),
	referralSource = TModule.optional(TModule.string),
	launchSource = TModule.string,
	reportExperienceLaunched = TModule.optional(TModule.callback),
	entry = TModule.table,
	openGameDetails = TModule.callback,
	horizontalPadding = TModule.optional(TModule.number),
	verticalPadding = TModule.optional(TModule.number),
	height = TModule.optional(TModule.number),
	fetchDelayInSeconds = TModule.optional(TModule.number),
	index = TModule.optional(TModule.number),
	showButtonText = TModule.optional(TModule.boolean),
	width = if FFlagLuaAppUnifyPlayButtonTile then TModule.optional(TModule.UDim) else nil,
	placeIdOverride = TModule.optional(TModule.string),
	launchDataOverride = TModule.optional(TModule.string),
	price = TModule.optional(TModule.number),
	centralOverlayType = TModule.optional(TModule.string),
	closeCentralOverlay = TModule.optional(TModule.callback),
	playButtonState = TModule.string,
	playabilityStatus = TModule.optional(TModule.table),
	onPlayButtonActivated = TModule.callback,
	onPlaySquadButtonActivated = TModule.optional(TModule.callback),
	sessionService = TModule.optional(TModule.union(TModule.Instance, TModule.table)),
	isUnifiedGameTileEnabled = TModule.optional(TModule.boolean),
	hasUnifiedPlayButtonIxp = if FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then TModule.optional(TModule.boolean) else nil,
	unifyToUIBloxIxp = if FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then TModule.optional(TModule.boolean) else nil
})

local function _(Loading)
	-- upvalues: PlayButtonStates (copy)
	return if Loading == PlayButtonStates.Loading then PlayButtonStates.Playable else Loading
end

function AppExperienceActionRow.init(p1)
	-- upvalues: SetGamePlaySessionFunction (copy), SessionType (copy), FFlagLuaAppUnifyPlayButtonTile (copy), FFlagLuaAppDemoModePlayButtonTelemetry (copy)
	function p1.onPlayPressed()
		-- upvalues: p1 (copy), SetGamePlaySessionFunction (upval), SessionType (upval)
		if p1:requiresPurchase() or p1:requiresFiatPurchase() then
			p1.props.openGameDetails()
			
			return
		end
		if p1:isButtonEnabled() then
			SetGamePlaySessionFunction(p1.props.sessionService, SessionType.StructuralIdentifier.GamePlayFromHoverTile, true)
			p1.props.onPlayButtonActivated(p1.props.playButtonState, if p1.props.reportExperienceLaunched then p1.reportExperienceLaunched else nil)
		end
	end
	
	function p1.reportExperienceLaunched(p2)
		-- upvalues: FFlagLuaAppUnifyPlayButtonTile (upval), SetGamePlaySessionFunction (upval), p1 (copy), SessionType (upval), FFlagLuaAppDemoModePlayButtonTelemetry (upval)
		if FFlagLuaAppUnifyPlayButtonTile then
			SetGamePlaySessionFunction(p1.props.sessionService, SessionType.StructuralIdentifier.GamePlayFromHoverTile, true)
		end
		p1.props.reportExperienceLaunched(p1.props.entry, p1.props.referralSource, p1.props.launchSource, p1.props.launchExperienceEventContext, p1.props.index, if FFlagLuaAppDemoModePlayButtonTelemetry then p2 else nil)
	end
end

function AppExperienceActionRow.willUnmount(p1)
	-- upvalues: GetFFlagIsSquadEnabledFunction (copy), CentralOverlayType (copy)
	if GetFFlagIsSquadEnabledFunction() and p1.props.centralOverlayType == CentralOverlayType.GameDetailsSquad then
		p1.props.closeCentralOverlay()
	end
end

function AppExperienceActionRow.render(p1)
	-- upvalues: FFlagLuaAppUnifyPlayButtonTile (copy), FFlagLuaAppUnifyPlayButtonAllSurfacesIxp (copy), FFlagLuaAppUnifyPlayButtonTileIxp (copy), GameTileExperimentationModule (copy), WithLocalizationFunction (copy), RoactModule (copy), PlayButton (copy), ButtonSize (copy), v1 (copy), FFlagLuaAppPlayButtonPrivatePT (copy), FFlagLuaAppTextOnlyPlayButton (copy), FFlagLuaAppIconTextPlayButton (copy), FFlagLuaAppUpdatePlayButtonText (copy), ExperienceActionRow (copy), FFlagLuaAppSupportDisablePlayableWhenLoading (copy), PlayButtonStates (copy), GetFFlagIsSquadEnabledFunction (copy), GetFFlagUIBloxUseFoundationButtonFunction (copy), FFlagLuaAppPlayButtonOptOutFoundationButton (copy), FFlagDebugEnablePopForcePicker (copy), Parent (copy)
	if FFlagLuaAppUnifyPlayButtonTile then
		local HasUnifiedPlayButtonIxp = FFlagLuaAppUnifyPlayButtonAllSurfacesIxp and p1.props.hasUnifiedPlayButtonIxp or FFlagLuaAppUnifyPlayButtonTileIxp and GameTileExperimentationModule.getIsPlayButtonMigrationEnabled()
		
		if p1.props.isUnifiedGameTileEnabled and (not FFlagLuaAppUnifyPlayButtonTileIxp and not FFlagLuaAppUnifyPlayButtonAllSurfacesIxp or HasUnifiedPlayButtonIxp) then
			local HorizontalPadding = p1.props.horizontalPadding or 0
			local VerticalPadding = p1.props.verticalPadding or 0
			
			return WithLocalizationFunction({ buyText = "Feature.ExperienceDetails.PlayButtonText.Buy" })(function(p2)
				-- upvalues: RoactModule (upval), PlayButton (upval), p1 (copy), ButtonSize (upval), HorizontalPadding (copy), VerticalPadding (copy), v1 (upval)
				return RoactModule.createElement(PlayButton, {
					isPlayableWhenLoading = true,
					preferSecondaryPlayButton = true,
					universeId = p1.props.universeId,
					placeId = p1.props.placeIdOverride,
					referralSource = p1.props.referralSource,
					eventContext = p1.props.launchExperienceEventContext,
					launchSource = p1.props.launchSource,
					experienceJoinData = if p1.props.launchDataOverride then { launchData = p1.props.launchDataOverride } else nil,
					reportExperienceLaunched = p1.reportExperienceLaunched,
					fiatText = p2.buyText,
					hideOptionalText = not p1.props.showButtonText,
					buttonSize = ButtonSize.Medium,
					useUIBloxButton = p1.props.unifyToUIBloxIxp,
					onPurchaseRequiredCallback = p1.props.openGameDetails,
					fillBehavior = if p1.props.width then nil else "Fill",
					width = p1.props.width,
					Position = UDim2.new(0, HorizontalPadding, 1, -VerticalPadding - v1)
				})
			end)
		end
	end
	local AppExperienceActionRow = WithLocalizationFunction({
		unlockText = "Feature.ExperienceDetails.PlayButtonText.Unlock",
		unavailableText = "Feature.ExperienceDetails.PlayButtonText.Unavailable",
		buyText = "Feature.ExperienceDetails.PlayButtonText.Buy",
		playDemoText = "Feature.ExperienceDetails.PlayButtonText.PlayDemo",
		playtestText = if FFlagLuaAppPlayButtonPrivatePT then "Feature.ExperienceDetails.PlayButtonText.Playtest" else nil,
		playText = if FFlagLuaAppTextOnlyPlayButton or FFlagLuaAppIconTextPlayButton then if FFlagLuaAppUpdatePlayButtonText then "Feature.ExperienceDetails.PlayButtonText.Play" else "Feature.ExperienceDetails.PlayButtonText.ActionNeeded" else nil
	})(function(p2)
		-- upvalues: RoactModule (upval), ExperienceActionRow (upval), p1 (copy), FFlagLuaAppSupportDisablePlayableWhenLoading (upval), PlayButtonStates (upval), GetFFlagIsSquadEnabledFunction (upval), GetFFlagUIBloxUseFoundationButtonFunction (upval), FFlagLuaAppPlayButtonOptOutFoundationButton (upval)
		return RoactModule.createElement(ExperienceActionRow, {
			isActionable = p1:isButtonEnabled(),
			buttonLoading = if FFlagLuaAppSupportDisablePlayableWhenLoading then p1.props.playButtonState == PlayButtonStates.Loading else nil,
			text = p1:getButtonText(p2),
			icon = p1:getButtonIcon(),
			buttonType = p1:getButtonType(),
			onPlayPressed = p1.onPlayPressed,
			onOverflowPressed = if GetFFlagIsSquadEnabledFunction() and p1:isOverflowButtonVisible() then p1.props.onPlaySquadButtonActivated else nil,
			horizontalPadding = p1.props.horizontalPadding,
			verticalPadding = p1.props.verticalPadding,
			height = p1.props.height,
			DO_NOT_USE_useUIBloxButton = if GetFFlagUIBloxUseFoundationButtonFunction() or FFlagLuaAppPlayButtonOptOutFoundationButton then true else nil
		})
	end)
	
	return if FFlagDebugEnablePopForcePicker then RoactModule.createElement("Frame", {
		Name = "PopForcePickerWrapper",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1)
	}, {
		Layout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 8)
		}),
		PlaySlot = RoactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(0, 1)
		}, {
			Flex = RoactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
			AppExperienceActionRow = AppExperienceActionRow
		}),
		PopForcePickerAnchor = RoactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromOffset(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			Picker = RoactModule.createElement(require(Parent.GamePlayButton.PopForcePicker), { compact = true })
		})
	}) else AppExperienceActionRow
end

function AppExperienceActionRow.isOverflowButtonVisible(p1): boolean
	-- upvalues: GetFFlagIsSquadEnabledFunction (copy), PlayButtonStates (copy)
	return GetFFlagIsSquadEnabledFunction() and (p1.props.playButtonState == PlayButtonStates.PlayableWithParty or p1.props.playButtonState == PlayButtonStates.WaitingForParty)
end

function AppExperienceActionRow.isButtonEnabled(p1)
	-- upvalues: FFlagLuaAppEnablePlayableStateWhenLoading (copy), GetFFlagIsSquadEnabledFunction (copy), PlayButtonStates (copy), FFlagLuaAppSupportDisablePlayableWhenLoading (copy), FFlagLuaAppPlayButtonPrivatePT (copy)
	return (not FFlagLuaAppEnablePlayableStateWhenLoading or p1.props.playabilityStatus ~= nil or not GetFFlagIsSquadEnabledFunction() or p1.props.playButtonState ~= PlayButtonStates.WaitingForParty) and (p1.props.playabilityStatus == nil or (p1.props.playButtonState == PlayButtonStates.Playable or ((if FFlagLuaAppSupportDisablePlayableWhenLoading then GetFFlagIsSquadEnabledFunction() and p1.props.playButtonState == PlayButtonStates.PlayableWithParty else p1.props.playButtonState == PlayButtonStates.Loading or GetFFlagIsSquadEnabledFunction() and p1.props.playButtonState == PlayButtonStates.PlayableWithParty) or (p1:isActionNeeded() or (p1:requiresPurchase() or (p1:requiresFiatPurchase() or (p1.props.playButtonState == PlayButtonStates.DemoMode or FFlagLuaAppPlayButtonPrivatePT and p1.props.playButtonState == PlayButtonStates.Playtest)))))))
end

function AppExperienceActionRow.requiresFiatPurchase(p1): boolean
	-- upvalues: PlayButtonStates (copy)
	return p1.props.playButtonState == PlayButtonStates.FiatPaidAccess
end

function AppExperienceActionRow.requiresPurchase(p1): boolean
	-- upvalues: PlayButtonStates (copy)
	return p1.props.playButtonState == PlayButtonStates.PaidAccess
end

function AppExperienceActionRow.isActionNeeded(p1): boolean
	-- upvalues: PlayButtonStates (copy)
	return p1.props.playButtonState == PlayButtonStates.ActionNeeded
end

function AppExperienceActionRow.getButtonText(p1, p2)
	-- upvalues: GetFFlagIsSquadEnabledFunction (copy), PlayButtonStates (copy), FFlagLuaAppPlayButtonPrivatePT (copy), FFlagLuaAppTextOnlyPlayButton (copy), FFlagLuaAppIconTextPlayButton (copy)
	return if p1.props.showButtonText and not p1:isButtonEnabled() then if GetFFlagIsSquadEnabledFunction() and p1.props.playButtonState == PlayButtonStates.WaitingForParty then nil else p2.unavailableText elseif p1:isActionNeeded() then p2.unlockText elseif p1:requiresPurchase() then tostring(p1.props.price or "--") elseif p1:requiresFiatPurchase() then p2.buyText elseif p1.props.playButtonState == PlayButtonStates.DemoMode then p2.playDemoText elseif FFlagLuaAppPlayButtonPrivatePT and p1.props.playButtonState == PlayButtonStates.Playtest then p2.playtestText elseif (FFlagLuaAppTextOnlyPlayButton or FFlagLuaAppIconTextPlayButton) and p1.props.playButtonState == PlayButtonStates.Playable then p2.playText else nil
end

function AppExperienceActionRow.getButtonType(p1)
	-- upvalues: FFlagLuaAppSupportDisablePlayableWhenLoading (copy), LuaAppFixAppExperienceActionRowLoadingState (copy), FFlagLuaAppPlayButtonLoadingPrimary (copy), PlayButtonStates (copy), ButtonType (copy), FFlagLuaAppPlayButtonPrivatePT (copy)
	return if FFlagLuaAppSupportDisablePlayableWhenLoading and (LuaAppFixAppExperienceActionRowLoadingState or not FFlagLuaAppPlayButtonLoadingPrimary) and p1.props.playButtonState == PlayButtonStates.Loading then if LuaAppFixAppExperienceActionRowLoadingState and FFlagLuaAppPlayButtonLoadingPrimary then ButtonType.PrimaryContextual else ButtonType.Secondary elseif p1.props.playButtonState == PlayButtonStates.DemoMode or FFlagLuaAppPlayButtonPrivatePT and p1.props.playButtonState == PlayButtonStates.Playtest then ButtonType.PrimarySystem elseif p1:isButtonEnabled() then ButtonType.PrimaryContextual else ButtonType.Secondary
end

function AppExperienceActionRow.getButtonIcon(p1)
	-- upvalues: FFlagLuaAppSupportDisablePlayableWhenLoading (copy), PlayButtonStates (copy), Images (copy), FFlagLuaAppPlayButtonPrivatePT (copy), FFlagLuaAppTextOnlyPlayButton (copy), GetFFlagIsSquadEnabledFunction (copy)
	return if FFlagLuaAppSupportDisablePlayableWhenLoading and p1.props.playButtonState == PlayButtonStates.Loading then nil elseif p1:requiresPurchase() then Images["icons/common/robux"] elseif p1:requiresFiatPurchase() or p1.props.playButtonState == PlayButtonStates.DemoMode or FFlagLuaAppPlayButtonPrivatePT and p1.props.playButtonState == PlayButtonStates.Playtest or p1:isActionNeeded() then nil elseif FFlagLuaAppTextOnlyPlayButton and p1.props.playButtonState == PlayButtonStates.Playable then nil elseif p1:isButtonEnabled() then Images["icons/common/play"] elseif GetFFlagIsSquadEnabledFunction() and p1.props.playButtonState == PlayButtonStates.WaitingForParty then Images["icons/common/play"] else Images["icons/status/unavailable"]
end

return (RoactServices.connect({ sessionService = AppSessionService })((RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: GamesProductInfoReducer (copy), GetFFlagIsSquadEnabledFunction (copy)
	local UniverseId = p2.universeId
	local v2 = if p1[GamesProductInfoReducer.key] then p1[GamesProductInfoReducer.key][UniverseId] else nil
	
	return {
		price = if v2 == nil then nil else v2.price,
		centralOverlayType = if GetFFlagIsSquadEnabledFunction() then p1.CentralOverlay.OverlayType else nil
	}
end, function(Callback)
	-- upvalues: CloseCentralOverlayFunction (copy)
	return {
		closeCentralOverlay = function()
			-- upvalues: Callback (copy), CloseCentralOverlayFunction (upval)
			return Callback(CloseCentralOverlayFunction())
		end
	}
end)(function(p1)
	-- upvalues: UseRoactService (copy), RoactNetworking (copy), UsePlayButtonState (copy), FFlagLuaAppEnablePlayableStateWhenLoading (copy), FFlagLuaAppPlayButtonLoadingDurationTelemetry (copy), UseOnPlayButtonCallback (copy), GetFFlagIsSquadEnabledFunction (copy), UseOnPlaySquadButtonCallback (copy), MenuDirection (copy), FFlagLuaAppUnifyPlayButtonAllSurfacesIxp (copy), UseUserExperiment (copy), AppUserLayers (copy), FFlagLuaAppLogExposurePlayButtonUX (copy), ReactModule (copy), IXPService (copy), FFlagLuaAppSupportDisablePlayableWhenLoading (copy), UseAppPolicy (copy), FFlagLuaAppDisablePlayableWhenLoadingForce (copy), PlayButtonStates (copy), CryoModule (copy), RoactModule (copy), AppExperienceActionRow (copy)
	local v2 = UsePlayButtonState(UseRoactService(RoactNetworking), p1.universeId, p1.fetchDelayInSeconds, if FFlagLuaAppEnablePlayableStateWhenLoading then true else nil, if FFlagLuaAppPlayButtonLoadingDurationTelemetry then true else nil, if FFlagLuaAppPlayButtonLoadingDurationTelemetry then p1.launchExperienceEventContext else nil)
	local OnPlayButtonActivated = UseOnPlayButtonCallback(p1.universeId, p1.referralSource, p1.launchExperienceEventContext or "PlayButton", nil, p1.launchSource or "UnknownLaunchSource", if p1.launchDataOverride then { launchData = p1.launchDataOverride } else nil, p1.placeIdOverride)
	local OnPlaySquadButtonActivated = if GetFFlagIsSquadEnabledFunction() then UseOnPlaySquadButtonCallback(MenuDirection.Up, v2.playButtonState, p1.referralSource, p1.universeId) else nil
	local v3 = nil
	local v4 = nil
	
	if FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then
		v3, v61 = UseUserExperiment({ AppUserLayers.PlayButtonUXExposureLayer }, function(p2)
			-- upvalues: AppUserLayers (upval)
			local v5 = p2[AppUserLayers.PlayButtonUXExposureLayer] or {}
			
			return v5.HasUnifiedPlayButton, v5.UnifyToUIBlox
		end, true)
	end
	if FFlagLuaAppLogExposurePlayButtonUX then
		ReactModule.useEffect(function()
			-- upvalues: IXPService (upval), AppUserLayers (upval)
			IXPService:LogUserLayerExposure(AppUserLayers.PlayButtonUXExposureLayer)
		end, {})
	end
	local v5 = nil
	
	if FFlagLuaAppSupportDisablePlayableWhenLoading then
		local v6 = UseAppPolicy(function(p2)
			return p2.getDisablePlayableWhenLoading()
		end)
		v5 = FFlagLuaAppDisablePlayableWhenLoadingForce or v6
	end
	local PlayButtonState = nil
	if FFlagLuaAppEnablePlayableStateWhenLoading or FFlagLuaAppSupportDisablePlayableWhenLoading and v5 then
		PlayButtonState = v2.playButtonState
	else
		local PlayButtonState1 = v2.playButtonState
		PlayButtonState = if PlayButtonState1 == PlayButtonStates.Loading then PlayButtonStates.Playable else PlayButtonState1
	end
	if v2.secondaryPlayButtonState ~= nil then
		PlayButtonState = v2.secondaryPlayButtonState
	end
	return RoactModule.createElement(AppExperienceActionRow, (CryoModule.Dictionary.join(p1, {
		playabilityStatus = v2.playabilityStatus,
		onPlayButtonActivated = OnPlayButtonActivated,
		onPlaySquadButtonActivated = OnPlaySquadButtonActivated,
		playButtonState = PlayButtonState,
		hasUnifiedPlayButtonIxp = if FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then v3 else nil,
		unifyToUIBloxIxp = if FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then v4 else nil
	})))
end))))