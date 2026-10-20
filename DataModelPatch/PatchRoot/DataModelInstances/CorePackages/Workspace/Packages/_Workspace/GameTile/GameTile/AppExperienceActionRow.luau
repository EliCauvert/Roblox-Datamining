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
local FFlagLuaAppEnablePlaySquadButton = require(Parent.SharedFlags).FFlagLuaAppEnablePlaySquadButton
local FFlagLuaAppEnablePlayableStateWhenLoading = require(Parent.SharedFlags).FFlagLuaAppEnablePlayableStateWhenLoading
local FFlagLuaAppSupportDisablePlayableWhenLoading = require(Parent.SharedFlags).FFlagLuaAppSupportDisablePlayableWhenLoading
local FFlagLuaAppDisablePlayableWhenLoadingForce = require(Parent.SharedFlags).FFlagLuaAppDisablePlayableWhenLoadingForce
local FFlagLuaAppPlayButtonLoadingPrimary = require(Parent.SharedFlags).FFlagLuaAppPlayButtonLoadingPrimary
local FFlagLuaAppUnifyPlayButtonTile = require(Parent.SharedFlags).FFlagLuaAppUnifyPlayButtonTile
local FFlagLuaAppUnifyPlayButtonTileIxp = require(Parent.SharedFlags).FFlagLuaAppUnifyPlayButtonTileIxp
local FFlagLuaAppUnifyPlayButtonAllSurfacesIxp = require(Parent.SharedFlags).FFlagLuaAppUnifyPlayButtonAllSurfacesIxp
local FFlagUpdateActionNeededPlayButtonUi = require(Parent.SharedFlags).FFlagUpdateActionNeededPlayButtonUi
local GetFFlagUIBloxUseFoundationButtonFunction = require(Parent.SharedFlags).UIBlox.GetFFlagUIBloxUseFoundationButton
local FFlagLuaAppPlayButtonOptOutFoundationButton = require(Parent.SharedFlags).FFlagLuaAppPlayButtonOptOutFoundationButton
local FFlagLuaAppPlayButtonLoadingDurationTelemetry = require(Parent.SharedFlags).FFlagLuaAppPlayButtonLoadingDurationTelemetry
local FFlagLuaAppTextOnlyPlayButton = require(Parent.SharedFlags).FFlagLuaAppTextOnlyPlayButton
local FFlagLuaAppIconTextPlayButton = require(Parent.SharedFlags).FFlagLuaAppIconTextPlayButton
local FFlagLuaAppUpdatePlayButtonText = require(Parent.SharedFlags).FFlagLuaAppUpdatePlayButtonText
local FFlagLuaAppLogExposurePlayButtonUX = require(Parent.SharedFlags).FFlagLuaAppLogExposurePlayButtonUX
local LuaAppFixAppExperienceActionRowLoadingState = game:DefineFastFlag("LuaAppFixAppExperienceActionRowLoadingState", false)
local GameTileExperimentationModule = require(GameTile.GameTileExperimentation)
local Offset = if FFlagLuaAppUnifyPlayButtonTile then 40 else nil
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
	-- upvalues: SetGamePlaySessionFunction (copy), SessionType (copy), FFlagLuaAppUnifyPlayButtonTile (copy)
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
	
	function p1.reportExperienceLaunched()
		-- upvalues: FFlagLuaAppUnifyPlayButtonTile (upval), SetGamePlaySessionFunction (upval), p1 (copy), SessionType (upval)
		if FFlagLuaAppUnifyPlayButtonTile then
			SetGamePlaySessionFunction(p1.props.sessionService, SessionType.StructuralIdentifier.GamePlayFromHoverTile, true)
		end
		p1.props.reportExperienceLaunched(p1.props.entry, p1.props.referralSource, p1.props.launchSource, p1.props.launchExperienceEventContext, p1.props.index)
	end
end

function AppExperienceActionRow.willUnmount(p1)
	-- upvalues: FFlagLuaAppEnablePlaySquadButton (copy), CentralOverlayType (copy)
	if FFlagLuaAppEnablePlaySquadButton and p1.props.centralOverlayType == CentralOverlayType.GameDetailsSquad then
		p1.props.closeCentralOverlay()
	end
end

function AppExperienceActionRow.render(p1)
	-- upvalues: FFlagLuaAppUnifyPlayButtonTile (copy), FFlagLuaAppUnifyPlayButtonAllSurfacesIxp (copy), FFlagLuaAppUnifyPlayButtonTileIxp (copy), GameTileExperimentationModule (copy), WithLocalizationFunction (copy), RoactModule (copy), PlayButton (copy), ButtonSize (copy), Offset (copy), FFlagUpdateActionNeededPlayButtonUi (copy), FFlagLuaAppTextOnlyPlayButton (copy), FFlagLuaAppIconTextPlayButton (copy), FFlagLuaAppUpdatePlayButtonText (copy), ExperienceActionRow (copy), FFlagLuaAppSupportDisablePlayableWhenLoading (copy), PlayButtonStates (copy), FFlagLuaAppEnablePlaySquadButton (copy), GetFFlagUIBloxUseFoundationButtonFunction (copy), FFlagLuaAppPlayButtonOptOutFoundationButton (copy)
	if FFlagLuaAppUnifyPlayButtonTile then
		local HasUnifiedPlayButtonIxp = FFlagLuaAppUnifyPlayButtonAllSurfacesIxp and p1.props.hasUnifiedPlayButtonIxp or FFlagLuaAppUnifyPlayButtonTileIxp and GameTileExperimentationModule.getIsPlayButtonMigrationEnabled()
		
		if p1.props.isUnifiedGameTileEnabled and (not FFlagLuaAppUnifyPlayButtonTileIxp and not FFlagLuaAppUnifyPlayButtonAllSurfacesIxp or HasUnifiedPlayButtonIxp) then
			local HorizontalPadding = p1.props.horizontalPadding or 0
			local VerticalPadding = p1.props.verticalPadding or 0
			
			return WithLocalizationFunction({ buyText = "Feature.ExperienceDetails.PlayButtonText.Buy" })(function(p2)
				-- upvalues: RoactModule (upval), PlayButton (upval), p1 (copy), ButtonSize (upval), Offset (upval), HorizontalPadding (copy), VerticalPadding (copy)
				return RoactModule.createElement(PlayButton, {
					isPlayableWhenLoading = true,
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
					squadButtonHeight = UDim.new(0, Offset),
					Position = UDim2.new(0, HorizontalPadding, 1, -VerticalPadding - Offset)
				})
			end)
		end
	end
	return WithLocalizationFunction({
		actionNeededText = "Feature.ExperienceDetails.PlayButtonText.ActionNeeded",
		unavailableText = "Feature.ExperienceDetails.PlayButtonText.Unavailable",
		buyText = "Feature.ExperienceDetails.PlayButtonText.Buy",
		unlockText = if FFlagUpdateActionNeededPlayButtonUi then "Feature.ExperienceDetails.PlayButtonText.Unlock" else nil,
		playText = if FFlagLuaAppTextOnlyPlayButton or FFlagLuaAppIconTextPlayButton then if FFlagLuaAppUpdatePlayButtonText then "Feature.ExperienceDetails.PlayButtonText.Play" else "Feature.ExperienceDetails.PlayButtonText.ActionNeeded" else nil
	})(function(p2)
		-- upvalues: RoactModule (upval), ExperienceActionRow (upval), p1 (copy), FFlagLuaAppSupportDisablePlayableWhenLoading (upval), PlayButtonStates (upval), FFlagLuaAppEnablePlaySquadButton (upval), GetFFlagUIBloxUseFoundationButtonFunction (upval), FFlagLuaAppPlayButtonOptOutFoundationButton (upval)
		return RoactModule.createElement(ExperienceActionRow, {
			isActionable = p1:isButtonEnabled(),
			buttonLoading = if FFlagLuaAppSupportDisablePlayableWhenLoading then p1.props.playButtonState == PlayButtonStates.Loading else nil,
			text = p1:getButtonText(p2),
			icon = p1:getButtonIcon(),
			buttonType = p1:getButtonType(),
			onPlayPressed = p1.onPlayPressed,
			onOverflowPressed = if FFlagLuaAppEnablePlaySquadButton and p1:isOverflowButtonVisible() then p1.props.onPlaySquadButtonActivated else nil,
			horizontalPadding = p1.props.horizontalPadding,
			verticalPadding = p1.props.verticalPadding,
			height = p1.props.height,
			DO_NOT_USE_useUIBloxButton = if GetFFlagUIBloxUseFoundationButtonFunction() or FFlagLuaAppPlayButtonOptOutFoundationButton then true else nil
		})
	end)
end

function AppExperienceActionRow.isOverflowButtonVisible(p1): boolean
	-- upvalues: FFlagLuaAppEnablePlaySquadButton (copy), PlayButtonStates (copy)
	return FFlagLuaAppEnablePlaySquadButton and (p1.props.playButtonState == PlayButtonStates.PlayableWithParty or p1.props.playButtonState == PlayButtonStates.WaitingForParty)
end

function AppExperienceActionRow.isButtonEnabled(p1)
	-- upvalues: FFlagLuaAppEnablePlayableStateWhenLoading (copy), GetFFlagIsSquadEnabledFunction (copy), PlayButtonStates (copy), FFlagLuaAppSupportDisablePlayableWhenLoading (copy)
	return (not FFlagLuaAppEnablePlayableStateWhenLoading or p1.props.playabilityStatus ~= nil or not GetFFlagIsSquadEnabledFunction() or p1.props.playButtonState ~= PlayButtonStates.WaitingForParty) and (p1.props.playabilityStatus == nil or (p1.props.playButtonState == PlayButtonStates.Playable or ((if FFlagLuaAppSupportDisablePlayableWhenLoading then GetFFlagIsSquadEnabledFunction() and p1.props.playButtonState == PlayButtonStates.PlayableWithParty else p1.props.playButtonState == PlayButtonStates.Loading or GetFFlagIsSquadEnabledFunction() and p1.props.playButtonState == PlayButtonStates.PlayableWithParty) or (p1:isActionNeeded() or (p1:requiresPurchase() or p1:requiresFiatPurchase())))))
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
	-- upvalues: FFlagUpdateActionNeededPlayButtonUi (copy), FFlagLuaAppEnablePlaySquadButton (copy), PlayButtonStates (copy), FFlagLuaAppTextOnlyPlayButton (copy), FFlagLuaAppIconTextPlayButton (copy)
	if p1.props.showButtonText then
		if not FFlagUpdateActionNeededPlayButtonUi and p1:isActionNeeded() then
			return p2.actionNeededText
		elseif not p1:isButtonEnabled() then
			return if FFlagLuaAppEnablePlaySquadButton and p1.props.playButtonState == PlayButtonStates.WaitingForParty then nil else p2.unavailableText
		end
	end
	return if FFlagUpdateActionNeededPlayButtonUi and p1:isActionNeeded() then p2.unlockText elseif p1:requiresPurchase() then tostring(p1.props.price or "--") elseif p1:requiresFiatPurchase() then p2.buyText elseif (FFlagLuaAppTextOnlyPlayButton or FFlagLuaAppIconTextPlayButton) and p1.props.playButtonState == PlayButtonStates.Playable then p2.playText else nil
end

function AppExperienceActionRow.getButtonType(p1)
	-- upvalues: FFlagLuaAppSupportDisablePlayableWhenLoading (copy), LuaAppFixAppExperienceActionRowLoadingState (copy), FFlagLuaAppPlayButtonLoadingPrimary (copy), PlayButtonStates (copy), ButtonType (copy), FFlagUpdateActionNeededPlayButtonUi (copy)
	return if FFlagLuaAppSupportDisablePlayableWhenLoading and (LuaAppFixAppExperienceActionRowLoadingState or not FFlagLuaAppPlayButtonLoadingPrimary) and p1.props.playButtonState == PlayButtonStates.Loading then if LuaAppFixAppExperienceActionRowLoadingState and FFlagLuaAppPlayButtonLoadingPrimary then ButtonType.PrimaryContextual else ButtonType.Secondary elseif FFlagUpdateActionNeededPlayButtonUi or not p1:isActionNeeded() then if p1:isButtonEnabled() then ButtonType.PrimaryContextual else ButtonType.Secondary else ButtonType.PrimarySystem
end

function AppExperienceActionRow.getButtonIcon(p1)
	-- upvalues: FFlagLuaAppSupportDisablePlayableWhenLoading (copy), PlayButtonStates (copy), FFlagUpdateActionNeededPlayButtonUi (copy), Images (copy), FFlagLuaAppTextOnlyPlayButton (copy), FFlagLuaAppEnablePlaySquadButton (copy)
	return if FFlagLuaAppSupportDisablePlayableWhenLoading and p1.props.playButtonState == PlayButtonStates.Loading then nil elseif FFlagUpdateActionNeededPlayButtonUi or not p1:isActionNeeded() then if p1:requiresPurchase() then Images["icons/common/robux"] elseif p1:requiresFiatPurchase() or FFlagUpdateActionNeededPlayButtonUi and p1:isActionNeeded() then nil elseif FFlagLuaAppTextOnlyPlayButton and p1.props.playButtonState == PlayButtonStates.Playable then nil elseif p1:isButtonEnabled() then Images["icons/common/play"] elseif FFlagLuaAppEnablePlaySquadButton and p1.props.playButtonState == PlayButtonStates.WaitingForParty then Images["icons/common/play"] else Images["icons/status/unavailable"] else Images["icons/status/private"]
end

return (RoactServices.connect({ sessionService = AppSessionService })((RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: GamesProductInfoReducer (copy), FFlagLuaAppEnablePlaySquadButton (copy)
	local UniverseId = p2.universeId
	local v1 = if p1[GamesProductInfoReducer.key] then p1[GamesProductInfoReducer.key][UniverseId] else nil
	
	return {
		price = if v1 == nil then nil else v1.price,
		centralOverlayType = if FFlagLuaAppEnablePlaySquadButton then p1.CentralOverlay.OverlayType else nil
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
	-- upvalues: UseRoactService (copy), RoactNetworking (copy), UsePlayButtonState (copy), FFlagLuaAppEnablePlayableStateWhenLoading (copy), FFlagLuaAppPlayButtonLoadingDurationTelemetry (copy), UseOnPlayButtonCallback (copy), FFlagLuaAppEnablePlaySquadButton (copy), UseOnPlaySquadButtonCallback (copy), MenuDirection (copy), FFlagLuaAppUnifyPlayButtonAllSurfacesIxp (copy), UseUserExperiment (copy), AppUserLayers (copy), FFlagLuaAppLogExposurePlayButtonUX (copy), ReactModule (copy), IXPService (copy), FFlagLuaAppSupportDisablePlayableWhenLoading (copy), UseAppPolicy (copy), FFlagLuaAppDisablePlayableWhenLoadingForce (copy), CryoModule (copy), PlayButtonStates (copy), RoactModule (copy), AppExperienceActionRow (copy)
	local v1 = UsePlayButtonState(UseRoactService(RoactNetworking), p1.universeId, p1.fetchDelayInSeconds, if FFlagLuaAppEnablePlayableStateWhenLoading then true else nil, if FFlagLuaAppPlayButtonLoadingDurationTelemetry then true else nil, if FFlagLuaAppPlayButtonLoadingDurationTelemetry then p1.launchExperienceEventContext else nil)
	local OnPlayButtonActivated = UseOnPlayButtonCallback(p1.universeId, p1.referralSource, p1.launchExperienceEventContext or "PlayButton", nil, p1.launchSource or "UnknownLaunchSource", if p1.launchDataOverride then { launchData = p1.launchDataOverride } else nil, p1.placeIdOverride)
	local OnPlaySquadButtonActivated = if FFlagLuaAppEnablePlaySquadButton then UseOnPlaySquadButtonCallback(MenuDirection.Up, v1.playButtonState, p1.referralSource, p1.universeId) else nil
	local v2 = nil
	local v3 = nil
	
	if FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then
		v2, v58 = UseUserExperiment({ AppUserLayers.PlayButtonUXExposureLayer }, function(p2)
			-- upvalues: AppUserLayers (upval)
			local v4 = p2[AppUserLayers.PlayButtonUXExposureLayer] or {}
			
			return v4.HasUnifiedPlayButton, v4.UnifyToUIBlox
		end, true)
	end
	if FFlagLuaAppLogExposurePlayButtonUX then
		ReactModule.useEffect(function()
			-- upvalues: IXPService (upval), AppUserLayers (upval)
			IXPService:LogUserLayerExposure(AppUserLayers.PlayButtonUXExposureLayer)
		end, {})
	end
	local v4 = nil
	
	if FFlagLuaAppSupportDisablePlayableWhenLoading then
		local v5 = UseAppPolicy(function(p2)
			return p2.getDisablePlayableWhenLoading()
		end)
		v4 = FFlagLuaAppDisablePlayableWhenLoadingForce or v5
	end
	local JoinFunction = CryoModule.Dictionary.join
	local config = {
		playabilityStatus = v1.playabilityStatus,
		onPlayButtonActivated = OnPlayButtonActivated,
		onPlaySquadButtonActivated = OnPlaySquadButtonActivated
	}
	local PlayButtonState = nil
	
	if FFlagLuaAppEnablePlayableStateWhenLoading or FFlagLuaAppSupportDisablePlayableWhenLoading and v4 then
		PlayButtonState = v1.playButtonState
	else
		local PlayButtonState1 = v1.playButtonState
		PlayButtonState = if PlayButtonState1 == PlayButtonStates.Loading then PlayButtonStates.Playable else PlayButtonState1
	end
	config.playButtonState = PlayButtonState
	config.hasUnifiedPlayButtonIxp = if FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then v2 else nil
	config.unifyToUIBloxIxp = if FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then v3 else nil
	
	return RoactModule.createElement(AppExperienceActionRow, (JoinFunction(p1, config)))
end))))