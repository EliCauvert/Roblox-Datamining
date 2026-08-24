local gameTile = script:FindFirstAncestor("GameTile")
local parent = gameTile.Parent
local IXPService = game:GetService("IXPService")
local cryoModule = require(parent.Cryo)
local roactServices = require(parent.RoactServices).RoactServices
local roactServiceTagsModule = require(parent.RoactServiceTags)
local appSessionService = roactServiceTagsModule.AppSessionService
local roactNetworking = roactServiceTagsModule.RoactNetworking
local roactModule = require(parent.Roact)
local reactModule = require(parent.React)
local roactRoduxModule = require(parent.RoactRodux)
local tModule = require(parent.t)
local buttonSize = require(parent.Foundation).Enums.ButtonSize
local UIBloxModule = require(parent.UIBlox)
local experienceActionRow = UIBloxModule.App.Tile.ExperienceActionRow
local images = UIBloxModule.App.ImageSet.Images
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local menuDirection = UIBloxModule.App.Menu.MenuDirection
local robloxAppSessionizationModule = require(parent.RobloxAppSessionization)
local setGamePlaySession = robloxAppSessionizationModule.SetGamePlaySession
local sessionType = robloxAppSessionizationModule.SessionType
local withLocalization = require(parent.Localization).withLocalization
local gamePlayButtonModule = require(parent.GamePlayButton)
local playButton = gamePlayButtonModule.PlayButton
local playButtonStates = gamePlayButtonModule.PlayButtonStates
local usePlayButtonState = gamePlayButtonModule.usePlayButtonState
local useOnPlaySquadButtonCallback = gamePlayButtonModule.useOnPlaySquadButtonCallback
local useOnPlayButtonCallback = gamePlayButtonModule.useOnPlayButtonCallback
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local gamesProductInfoReducer = require(parent.GameProductInfoRodux).GamesProductInfoReducer
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local closeCentralOverlay = require(parent.CentralOverlay).Thunks.CloseCentralOverlay
local appUserLayers = require(parent.ExperimentLayers).AppUserLayers
local useUserExperiment = require(parent.RoactAppExperiment).useUserExperiment
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local getFFlagIsSquadEnabled = require(parent.SharedFlags).GetFFlagIsSquadEnabled
local fFlagLuaAppEnablePlaySquadButton = require(parent.SharedFlags).FFlagLuaAppEnablePlaySquadButton
local fFlagLuaAppEnablePlayableStateWhenLoading = require(parent.SharedFlags).FFlagLuaAppEnablePlayableStateWhenLoading
local fFlagLuaAppSupportDisablePlayableWhenLoading = require(parent.SharedFlags).FFlagLuaAppSupportDisablePlayableWhenLoading
local fFlagLuaAppDisablePlayableWhenLoadingForce = require(parent.SharedFlags).FFlagLuaAppDisablePlayableWhenLoadingForce
local fFlagLuaAppPlayButtonLoadingPrimary = require(parent.SharedFlags).FFlagLuaAppPlayButtonLoadingPrimary
local fFlagLuaAppUnifyPlayButtonTile = require(parent.SharedFlags).FFlagLuaAppUnifyPlayButtonTile
local fFlagLuaAppUnifyPlayButtonTileIxp = require(parent.SharedFlags).FFlagLuaAppUnifyPlayButtonTileIxp
local fFlagLuaAppUnifyPlayButtonAllSurfacesIxp = require(parent.SharedFlags).FFlagLuaAppUnifyPlayButtonAllSurfacesIxp
local getFFlagUIBloxUseFoundationButton = require(parent.SharedFlags).UIBlox.GetFFlagUIBloxUseFoundationButton
local fFlagLuaAppPlayButtonOptOutFoundationButton = require(parent.SharedFlags).FFlagLuaAppPlayButtonOptOutFoundationButton
local fFlagLuaAppPlayButtonLoadingDurationTelemetry = require(parent.SharedFlags).FFlagLuaAppPlayButtonLoadingDurationTelemetry
local fFlagLuaAppTextOnlyPlayButton = require(parent.SharedFlags).FFlagLuaAppTextOnlyPlayButton
local fFlagLuaAppIconTextPlayButton = require(parent.SharedFlags).FFlagLuaAppIconTextPlayButton
local fFlagLuaAppUpdatePlayButtonText = require(parent.SharedFlags).FFlagLuaAppUpdatePlayButtonText
local fFlagLuaAppLogExposurePlayButtonUX = require(parent.SharedFlags).FFlagLuaAppLogExposurePlayButtonUX
local fFlagLuaAppDemoModePlayButton = require(parent.SharedFlags).FFlagLuaAppDemoModePlayButton
local fFlagLuaAppDemoModePlayButtonTelemetry = require(parent.SharedFlags).FFlagLuaAppDemoModePlayButtonTelemetry
local luaAppFixAppExperienceActionRowLoadingState = game:DefineFastFlag("LuaAppFixAppExperienceActionRowLoadingState", false)
local gameTileExperimentationModule = require(gameTile.GameTileExperimentation)
local var13 = if fFlagLuaAppUnifyPlayButtonTile then 40 else nil
local appExperienceActionRow = roactModule.PureComponent:extend("AppExperienceActionRow")
appExperienceActionRow.validateProps = tModule.strictInterface({
	universeId = tModule.string,
	launchExperienceEventContext = tModule.optional(tModule.string),
	referralSource = tModule.optional(tModule.string),
	launchSource = tModule.string,
	reportExperienceLaunched = tModule.optional(tModule.callback),
	entry = tModule.table,
	openGameDetails = tModule.callback,
	horizontalPadding = tModule.optional(tModule.number),
	verticalPadding = tModule.optional(tModule.number),
	height = tModule.optional(tModule.number),
	fetchDelayInSeconds = tModule.optional(tModule.number),
	index = tModule.optional(tModule.number),
	showButtonText = tModule.optional(tModule.boolean),
	width = if fFlagLuaAppUnifyPlayButtonTile then tModule.optional(tModule.UDim) else nil,
	placeIdOverride = tModule.optional(tModule.string),
	launchDataOverride = tModule.optional(tModule.string),
	price = tModule.optional(tModule.number),
	centralOverlayType = tModule.optional(tModule.string),
	closeCentralOverlay = tModule.optional(tModule.callback),
	playButtonState = tModule.string,
	playabilityStatus = tModule.optional(tModule.table),
	onPlayButtonActivated = tModule.callback,
	onPlaySquadButtonActivated = tModule.optional(tModule.callback),
	sessionService = tModule.optional(tModule.union(tModule.Instance, tModule.table)),
	isUnifiedGameTileEnabled = tModule.optional(tModule.boolean),
	hasUnifiedPlayButtonIxp = if fFlagLuaAppUnifyPlayButtonAllSurfacesIxp then tModule.optional(tModule.boolean) else nil,
	unifyToUIBloxIxp = if fFlagLuaAppUnifyPlayButtonAllSurfacesIxp then tModule.optional(tModule.boolean) else nil
})

local function _(p0)
	-- upvalues: playButtonStates (ref)
	return if p0 == playButtonStates.Loading then playButtonStates.Playable else p0
end

function appExperienceActionRow.init(p1)
	-- upvalues: setGamePlaySession (ref), sessionType (ref), fFlagLuaAppUnifyPlayButtonTile (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref)
	function p1.onPlayPressed()
		-- upvalues: p1 (ref), setGamePlaySession (copy), sessionType (copy)
		if p1:requiresPurchase() or p1:requiresFiatPurchase() then
			p1.props.openGameDetails()
			
			return
		elseif p1:isButtonEnabled() then
			setGamePlaySession(p1.props.sessionService, sessionType.StructuralIdentifier.GamePlayFromHoverTile, true)
			p1.props.onPlayButtonActivated(p1.props.playButtonState, if p1.props.reportExperienceLaunched then p1.reportExperienceLaunched else nil)
		end
	end
	
	function p1.reportExperienceLaunched(p2)
		-- upvalues: fFlagLuaAppUnifyPlayButtonTile (copy), setGamePlaySession (copy), p1 (ref), sessionType (copy), fFlagLuaAppDemoModePlayButtonTelemetry (copy)
		if fFlagLuaAppUnifyPlayButtonTile then
			setGamePlaySession(p1.props.sessionService, sessionType.StructuralIdentifier.GamePlayFromHoverTile, true)
		end
		p1.props.reportExperienceLaunched(p1.props.entry, p1.props.referralSource, p1.props.launchSource, p1.props.launchExperienceEventContext, p1.props.index, if fFlagLuaAppDemoModePlayButtonTelemetry then p2 else nil)
	end
end

function appExperienceActionRow.willUnmount(p3)
	-- upvalues: fFlagLuaAppEnablePlaySquadButton (ref), centralOverlayType (ref)
	if fFlagLuaAppEnablePlaySquadButton and p3.props.centralOverlayType == centralOverlayType.GameDetailsSquad then
		p3.props.closeCentralOverlay()
	end
end

function appExperienceActionRow.render(p4)
	-- upvalues: fFlagLuaAppUnifyPlayButtonTile (ref), fFlagLuaAppUnifyPlayButtonAllSurfacesIxp (ref), fFlagLuaAppUnifyPlayButtonTileIxp (ref), gameTileExperimentationModule (ref), withLocalization (ref), roactModule (ref), playButton (ref), buttonSize (ref), fFlagLuaAppDemoModePlayButton (ref), var13 (ref), fFlagLuaAppTextOnlyPlayButton (ref), fFlagLuaAppIconTextPlayButton (ref), fFlagLuaAppUpdatePlayButtonText (ref), experienceActionRow (ref), fFlagLuaAppSupportDisablePlayableWhenLoading (ref), playButtonStates (ref), fFlagLuaAppEnablePlaySquadButton (ref), getFFlagUIBloxUseFoundationButton (ref), fFlagLuaAppPlayButtonOptOutFoundationButton (ref)
	if fFlagLuaAppUnifyPlayButtonTile then
		if p4.props.isUnifiedGameTileEnabled and (not fFlagLuaAppUnifyPlayButtonTileIxp and not fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or (if fFlagLuaAppUnifyPlayButtonAllSurfacesIxp then p4.props.hasUnifiedPlayButtonIxp else fFlagLuaAppUnifyPlayButtonTileIxp and gameTileExperimentationModule.getIsPlayButtonMigrationEnabled())) then
			local horizontalPadding = p4.props.horizontalPadding or 0
			local verticalPadding = p4.props.verticalPadding or 0
			
			return withLocalization({ buyText = "Feature.ExperienceDetails.PlayButtonText.Buy" })(function(p5)
				-- upvalues: roactModule (copy), playButton (copy), p4 (ref), buttonSize (copy), fFlagLuaAppDemoModePlayButton (copy), horizontalPadding (ref), verticalPadding (ref), var13 (copy)
				return roactModule.createElement(playButton, {
					isPlayableWhenLoading = true,
					universeId = p4.props.universeId,
					placeId = p4.props.placeIdOverride,
					referralSource = p4.props.referralSource,
					eventContext = p4.props.launchExperienceEventContext,
					launchSource = p4.props.launchSource,
					experienceJoinData = if p4.props.launchDataOverride then { launchData = p4.props.launchDataOverride } else nil,
					reportExperienceLaunched = p4.reportExperienceLaunched,
					fiatText = p5.buyText,
					hideOptionalText = not p4.props.showButtonText,
					buttonSize = buttonSize.Medium,
					useUIBloxButton = p4.props.unifyToUIBloxIxp,
					onPurchaseRequiredCallback = p4.props.openGameDetails,
					preferSecondaryPlayButton = if fFlagLuaAppDemoModePlayButton then true else nil,
					fillBehavior = if not p4.props.width then "Fill" else nil,
					width = p4.props.width,
					Position = UDim2.new(0, horizontalPadding, 1, (-verticalPadding) - var13)
				})
			end)
		end
	end
	return withLocalization({
		unlockText = "Feature.ExperienceDetails.PlayButtonText.Unlock",
		unavailableText = "Feature.ExperienceDetails.PlayButtonText.Unavailable",
		buyText = "Feature.ExperienceDetails.PlayButtonText.Buy",
		playDemoText = if fFlagLuaAppDemoModePlayButton then "Feature.ExperienceDetails.PlayButtonText.PlayDemo" else nil,
		playText = if fFlagLuaAppTextOnlyPlayButton or fFlagLuaAppIconTextPlayButton then if fFlagLuaAppUpdatePlayButtonText then "Feature.ExperienceDetails.PlayButtonText.Play" else "Feature.ExperienceDetails.PlayButtonText.ActionNeeded" else nil
	})(function(p6)
		-- upvalues: roactModule (copy), experienceActionRow (copy), p4 (ref), fFlagLuaAppSupportDisablePlayableWhenLoading (copy), playButtonStates (copy), fFlagLuaAppEnablePlaySquadButton (copy), getFFlagUIBloxUseFoundationButton (copy), fFlagLuaAppPlayButtonOptOutFoundationButton (copy)
		local var18
		local createElement = roactModule.createElement
		local t = { isActionable = p4:isButtonEnabled() }
		
		if fFlagLuaAppSupportDisablePlayableWhenLoading then
			var18 = p4.props.playButtonState == playButtonStates.Loading
			var18 = nil
		else
			var18 = nil
		end
		t.buttonLoading = var18
		t.text = p4:getButtonText(p6)
		t.icon = p4:getButtonIcon()
		t.buttonType = p4:getButtonType()
		t.onPlayPressed = p4.onPlayPressed
		t.onOverflowPressed = if fFlagLuaAppEnablePlaySquadButton and p4:isOverflowButtonVisible() then p4.props.onPlaySquadButtonActivated else nil
		t.horizontalPadding = p4.props.horizontalPadding
		t.verticalPadding = p4.props.verticalPadding
		t.height = p4.props.height
		t.DO_NOT_USE_useUIBloxButton = if getFFlagUIBloxUseFoundationButton() or fFlagLuaAppPlayButtonOptOutFoundationButton then true else nil
		
		return createElement(experienceActionRow, t)
	end)
end

function appExperienceActionRow.isOverflowButtonVisible(p7)
	-- upvalues: fFlagLuaAppEnablePlaySquadButton (ref), playButtonStates (ref)
	return fFlagLuaAppEnablePlaySquadButton and (if p7.props.playButtonState ~= playButtonStates.PlayableWithParty then p7.props.playButtonState == playButtonStates.WaitingForParty else true)
end

function appExperienceActionRow.isButtonEnabled(p8)
	-- upvalues: fFlagLuaAppEnablePlayableStateWhenLoading (ref), getFFlagIsSquadEnabled (ref), playButtonStates (ref), fFlagLuaAppSupportDisablePlayableWhenLoading (ref), fFlagLuaAppDemoModePlayButton (ref)
	return if fFlagLuaAppEnablePlayableStateWhenLoading and p8.props.playabilityStatus == nil and (getFFlagIsSquadEnabled() and p8.props.playButtonState == playButtonStates.WaitingForParty) then false elseif p8.props.playabilityStatus ~= nil then if p8.props.playButtonState ~= playButtonStates.Playable then not fFlagLuaAppSupportDisablePlayableWhenLoading or (if getFFlagIsSquadEnabled() then true else p8:isActionNeeded() or (p8:requiresPurchase() or (p8:requiresFiatPurchase() or fFlagLuaAppDemoModePlayButton and p8.props.playButtonState == playButtonStates.DemoMode))) else true else true
end

function appExperienceActionRow.requiresFiatPurchase(p9)
	-- upvalues: playButtonStates (ref)
	return p9.props.playButtonState == playButtonStates.FiatPaidAccess
end

function appExperienceActionRow.requiresPurchase(p10)
	-- upvalues: playButtonStates (ref)
	return p10.props.playButtonState == playButtonStates.PaidAccess
end

function appExperienceActionRow.isActionNeeded(p11)
	-- upvalues: playButtonStates (ref)
	return p11.props.playButtonState == playButtonStates.ActionNeeded
end

function appExperienceActionRow.getButtonText(p12, p13)
	-- upvalues: fFlagLuaAppEnablePlaySquadButton (ref), playButtonStates (ref), fFlagLuaAppDemoModePlayButton (ref), fFlagLuaAppTextOnlyPlayButton (ref), fFlagLuaAppIconTextPlayButton (ref)
	return if p12.props.showButtonText and not p12:isButtonEnabled() then if fFlagLuaAppEnablePlaySquadButton and p12.props.playButtonState == playButtonStates.WaitingForParty then nil else p13.unavailableText elseif p12:isActionNeeded() then p13.unlockText elseif p12:requiresPurchase() then tostring(p12.props.price or "--") elseif p12:requiresFiatPurchase() then p13.buyText elseif fFlagLuaAppDemoModePlayButton and p12.props.playButtonState == playButtonStates.DemoMode then p13.playDemoText elseif (fFlagLuaAppTextOnlyPlayButton or fFlagLuaAppIconTextPlayButton) and p12.props.playButtonState == playButtonStates.Playable then p13.playText else nil
end

function appExperienceActionRow.getButtonType(p14)
	-- upvalues: fFlagLuaAppSupportDisablePlayableWhenLoading (ref), luaAppFixAppExperienceActionRowLoadingState (ref), fFlagLuaAppPlayButtonLoadingPrimary (ref), playButtonStates (ref), buttonType (ref), fFlagLuaAppDemoModePlayButton (ref)
	return if fFlagLuaAppSupportDisablePlayableWhenLoading and (luaAppFixAppExperienceActionRowLoadingState or not fFlagLuaAppPlayButtonLoadingPrimary) and p14.props.playButtonState == playButtonStates.Loading then if luaAppFixAppExperienceActionRowLoadingState then if fFlagLuaAppPlayButtonLoadingPrimary then buttonType.PrimaryContextual else buttonType.Secondary else buttonType.Secondary elseif fFlagLuaAppDemoModePlayButton and p14.props.playButtonState == playButtonStates.DemoMode then buttonType.PrimarySystem elseif p14:isButtonEnabled() then buttonType.PrimaryContextual else buttonType.Secondary
end

function appExperienceActionRow.getButtonIcon(p15)
	-- upvalues: fFlagLuaAppSupportDisablePlayableWhenLoading (ref), playButtonStates (ref), images (ref), fFlagLuaAppDemoModePlayButton (ref), fFlagLuaAppTextOnlyPlayButton (ref), fFlagLuaAppEnablePlaySquadButton (ref)
	return if fFlagLuaAppSupportDisablePlayableWhenLoading and p15.props.playButtonState == playButtonStates.Loading then nil elseif p15:requiresPurchase() then images["icons/common/robux"] elseif p15:requiresFiatPurchase() or fFlagLuaAppDemoModePlayButton and p15.props.playButtonState == playButtonStates.DemoMode or p15:isActionNeeded() then nil elseif fFlagLuaAppTextOnlyPlayButton and p15.props.playButtonState == playButtonStates.Playable then nil elseif p15:isButtonEnabled() then images["icons/common/play"] elseif fFlagLuaAppEnablePlaySquadButton and p15.props.playButtonState == playButtonStates.WaitingForParty then images["icons/common/play"] else images["icons/status/unavailable"]
end

return roactServices.connect({ sessionService = appSessionService })(roactRoduxModule.connect(function(p19, p20)
	-- upvalues: gamesProductInfoReducer (ref), fFlagLuaAppEnablePlaySquadButton (ref)
	local var28 = if p19[gamesProductInfoReducer.key] then p19[gamesProductInfoReducer.key][p20.universeId] else nil
	
	return {
		price = if var28 ~= nil then nil else var28.price,
		centralOverlayType = if fFlagLuaAppEnablePlaySquadButton then p19.CentralOverlay.OverlayType else nil
	}
end, function(p21)
	-- upvalues: closeCentralOverlay (ref)
	return {
		closeCentralOverlay = function()
			-- upvalues: p21 (ref), closeCentralOverlay (copy)
			return p21(closeCentralOverlay())
		end
	}
end)(function(p16)
	-- upvalues: useRoactService (ref), roactNetworking (ref), usePlayButtonState (ref), fFlagLuaAppEnablePlayableStateWhenLoading (ref), fFlagLuaAppPlayButtonLoadingDurationTelemetry (ref), useOnPlayButtonCallback (ref), fFlagLuaAppEnablePlaySquadButton (ref), useOnPlaySquadButtonCallback (ref), menuDirection (ref), fFlagLuaAppUnifyPlayButtonAllSurfacesIxp (ref), useUserExperiment (ref), appUserLayers (ref), fFlagLuaAppLogExposurePlayButtonUX (ref), reactModule (ref), IXPService (ref), fFlagLuaAppSupportDisablePlayableWhenLoading (ref), useAppPolicy (ref), fFlagLuaAppDisablePlayableWhenLoadingForce (ref), playButtonStates (ref), fFlagLuaAppDemoModePlayButton (ref), cryoModule (ref), roactModule (ref), appExperienceActionRow (ref)
	local var26
	local var19 = usePlayButtonState(useRoactService(roactNetworking), p16.universeId, p16.fetchDelayInSeconds, if fFlagLuaAppEnablePlayableStateWhenLoading then true else nil, if fFlagLuaAppPlayButtonLoadingDurationTelemetry then true else nil, if fFlagLuaAppPlayButtonLoadingDurationTelemetry then p16.launchExperienceEventContext else nil)
	local var20 = useOnPlayButtonCallback(p16.universeId, p16.referralSource, p16.launchExperienceEventContext or "PlayButton", nil, p16.launchSource or "UnknownLaunchSource", if p16.launchDataOverride then { launchData = p16.launchDataOverride } else nil, p16.placeIdOverride)
	local var21 = if fFlagLuaAppEnablePlaySquadButton then useOnPlaySquadButtonCallback(menuDirection.Up, var19.playButtonState, p16.referralSource, p16.universeId) else nil
	local var22 = nil
	local var23 = nil
	
	if fFlagLuaAppUnifyPlayButtonAllSurfacesIxp then
		local var24, var25 = useUserExperiment({ appUserLayers.PlayButtonUXExposureLayer }, function(p17)
			-- upvalues: appUserLayers (copy)
			local playButtonUXExposureLayer = p17[appUserLayers.PlayButtonUXExposureLayer] or {}
			
			return playButtonUXExposureLayer.HasUnifiedPlayButton, playButtonUXExposureLayer.UnifyToUIBlox
		end, true)
		var22 = var24
		var23 = var25
	end
	if fFlagLuaAppLogExposurePlayButtonUX then
		reactModule.useEffect(function()
			-- upvalues: IXPService (copy), appUserLayers (copy)
			IXPService:LogUserLayerExposure(appUserLayers.PlayButtonUXExposureLayer)
		end, {})
	end
	if fFlagLuaAppEnablePlayableStateWhenLoading or fFlagLuaAppSupportDisablePlayableWhenLoading and (if fFlagLuaAppSupportDisablePlayableWhenLoading then fFlagLuaAppDisablePlayableWhenLoadingForce or useAppPolicy(function(p18)
		return p18.getDisablePlayableWhenLoading()
	end) else nil) then
		var26 = var19.playButtonState
	else
		local playButtonState = var19.playButtonState
		var26 = if playButtonState == playButtonStates.Loading then playButtonStates.Playable else playButtonState
	end
	if fFlagLuaAppDemoModePlayButton and var19.secondaryPlayButtonState ~= nil then
		var26 = var19.secondaryPlayButtonState
	end
	return roactModule.createElement(appExperienceActionRow, cryoModule.Dictionary.join(p16, {
		playabilityStatus = var19.playabilityStatus,
		onPlayButtonActivated = var20,
		onPlaySquadButtonActivated = var21,
		playButtonState = var26,
		hasUnifiedPlayButtonIxp = if fFlagLuaAppUnifyPlayButtonAllSurfacesIxp then var22 else nil,
		unifyToUIBloxIxp = if fFlagLuaAppUnifyPlayButtonAllSurfacesIxp then var23 else nil
	}))
end))