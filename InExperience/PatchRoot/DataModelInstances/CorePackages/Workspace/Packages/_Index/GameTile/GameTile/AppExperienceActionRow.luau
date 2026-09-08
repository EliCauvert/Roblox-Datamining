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
local fFlagLuaAppDemoModePlayButtonTelemetry = require(parent.SharedFlags).FFlagLuaAppDemoModePlayButtonTelemetry
local luaAppFixAppExperienceActionRowLoadingState = game:DefineFastFlag("LuaAppFixAppExperienceActionRowLoadingState", false)
local gameTileExperimentationModule = require(gameTile.GameTileExperimentation)
local var1 = if fFlagLuaAppUnifyPlayButtonTile then 40 else nil
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

local function _(p1)
	-- upvalues: playButtonStates (ref)
	return if p1 == playButtonStates.Loading then playButtonStates.Playable else p1
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

function appExperienceActionRow.willUnmount(p1)
	-- upvalues: fFlagLuaAppEnablePlaySquadButton (ref), centralOverlayType (ref)
	if fFlagLuaAppEnablePlaySquadButton and p1.props.centralOverlayType == centralOverlayType.GameDetailsSquad then
		p1.props.closeCentralOverlay()
	end
end

function appExperienceActionRow.render(p1)
	-- upvalues: fFlagLuaAppUnifyPlayButtonTile (ref), fFlagLuaAppUnifyPlayButtonAllSurfacesIxp (ref), fFlagLuaAppUnifyPlayButtonTileIxp (ref), gameTileExperimentationModule (ref), withLocalization (ref), roactModule (ref), playButton (ref), buttonSize (ref), var1 (ref), fFlagLuaAppTextOnlyPlayButton (ref), fFlagLuaAppIconTextPlayButton (ref), fFlagLuaAppUpdatePlayButtonText (ref), experienceActionRow (ref), fFlagLuaAppSupportDisablePlayableWhenLoading (ref), playButtonStates (ref), fFlagLuaAppEnablePlaySquadButton (ref), getFFlagUIBloxUseFoundationButton (ref), fFlagLuaAppPlayButtonOptOutFoundationButton (ref)
	if fFlagLuaAppUnifyPlayButtonTile then
		if p1.props.isUnifiedGameTileEnabled and (not fFlagLuaAppUnifyPlayButtonTileIxp and not fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or (if fFlagLuaAppUnifyPlayButtonAllSurfacesIxp then p1.props.hasUnifiedPlayButtonIxp else fFlagLuaAppUnifyPlayButtonTileIxp and gameTileExperimentationModule.getIsPlayButtonMigrationEnabled())) then
			local horizontalPadding = p1.props.horizontalPadding or 0
			local verticalPadding = p1.props.verticalPadding or 0
			
			return withLocalization({ buyText = "Feature.ExperienceDetails.PlayButtonText.Buy" })(function(p2)
				-- upvalues: roactModule (copy), playButton (copy), p1 (ref), buttonSize (copy), horizontalPadding (ref), verticalPadding (ref), var1 (copy)
				return roactModule.createElement(playButton, {
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
					buttonSize = buttonSize.Medium,
					useUIBloxButton = p1.props.unifyToUIBloxIxp,
					onPurchaseRequiredCallback = p1.props.openGameDetails,
					fillBehavior = if not p1.props.width then "Fill" else nil,
					width = p1.props.width,
					Position = UDim2.new(0, horizontalPadding, 1, (-verticalPadding) - var1)
				})
			end)
		end
	end
	return withLocalization({
		unlockText = "Feature.ExperienceDetails.PlayButtonText.Unlock",
		unavailableText = "Feature.ExperienceDetails.PlayButtonText.Unavailable",
		buyText = "Feature.ExperienceDetails.PlayButtonText.Buy",
		playDemoText = "Feature.ExperienceDetails.PlayButtonText.PlayDemo",
		playText = if fFlagLuaAppTextOnlyPlayButton or fFlagLuaAppIconTextPlayButton then if fFlagLuaAppUpdatePlayButtonText then "Feature.ExperienceDetails.PlayButtonText.Play" else "Feature.ExperienceDetails.PlayButtonText.ActionNeeded" else nil
	})(function(p2)
		-- upvalues: roactModule (copy), experienceActionRow (copy), p1 (ref), fFlagLuaAppSupportDisablePlayableWhenLoading (copy), playButtonStates (copy), fFlagLuaAppEnablePlaySquadButton (copy), getFFlagUIBloxUseFoundationButton (copy), fFlagLuaAppPlayButtonOptOutFoundationButton (copy)
		local var2
		local createElement = roactModule.createElement
		local t = { isActionable = p1:isButtonEnabled() }
		
		if fFlagLuaAppSupportDisablePlayableWhenLoading then
			var2 = p1.props.playButtonState == playButtonStates.Loading
			var2 = nil
		else
			var2 = nil
		end
		t.buttonLoading = var2
		t.text = p1:getButtonText(p2)
		t.icon = p1:getButtonIcon()
		t.buttonType = p1:getButtonType()
		t.onPlayPressed = p1.onPlayPressed
		t.onOverflowPressed = if fFlagLuaAppEnablePlaySquadButton and p1:isOverflowButtonVisible() then p1.props.onPlaySquadButtonActivated else nil
		t.horizontalPadding = p1.props.horizontalPadding
		t.verticalPadding = p1.props.verticalPadding
		t.height = p1.props.height
		t.DO_NOT_USE_useUIBloxButton = if getFFlagUIBloxUseFoundationButton() or fFlagLuaAppPlayButtonOptOutFoundationButton then true else nil
		
		return createElement(experienceActionRow, t)
	end)
end

function appExperienceActionRow.isOverflowButtonVisible(p1)
	-- upvalues: fFlagLuaAppEnablePlaySquadButton (ref), playButtonStates (ref)
	return fFlagLuaAppEnablePlaySquadButton and (if p1.props.playButtonState ~= playButtonStates.PlayableWithParty then p1.props.playButtonState == playButtonStates.WaitingForParty else true)
end

function appExperienceActionRow.isButtonEnabled(p1)
	-- upvalues: fFlagLuaAppEnablePlayableStateWhenLoading (ref), getFFlagIsSquadEnabled (ref), playButtonStates (ref), fFlagLuaAppSupportDisablePlayableWhenLoading (ref)
	return if fFlagLuaAppEnablePlayableStateWhenLoading and p1.props.playabilityStatus == nil and (getFFlagIsSquadEnabled() and p1.props.playButtonState == playButtonStates.WaitingForParty) then false elseif p1.props.playabilityStatus ~= nil then if p1.props.playButtonState ~= playButtonStates.Playable then not fFlagLuaAppSupportDisablePlayableWhenLoading or (if getFFlagIsSquadEnabled() then true else p1:isActionNeeded() or (p1:requiresPurchase() or (p1:requiresFiatPurchase() or p1.props.playButtonState == playButtonStates.DemoMode))) else true else true
end

function appExperienceActionRow.requiresFiatPurchase(p1)
	-- upvalues: playButtonStates (ref)
	return p1.props.playButtonState == playButtonStates.FiatPaidAccess
end

function appExperienceActionRow.requiresPurchase(p1)
	-- upvalues: playButtonStates (ref)
	return p1.props.playButtonState == playButtonStates.PaidAccess
end

function appExperienceActionRow.isActionNeeded(p1)
	-- upvalues: playButtonStates (ref)
	return p1.props.playButtonState == playButtonStates.ActionNeeded
end

function appExperienceActionRow.getButtonText(p1, p2)
	-- upvalues: fFlagLuaAppEnablePlaySquadButton (ref), playButtonStates (ref), fFlagLuaAppTextOnlyPlayButton (ref), fFlagLuaAppIconTextPlayButton (ref)
	return if p1.props.showButtonText and not p1:isButtonEnabled() then if fFlagLuaAppEnablePlaySquadButton and p1.props.playButtonState == playButtonStates.WaitingForParty then nil else p2.unavailableText elseif p1:isActionNeeded() then p2.unlockText elseif p1:requiresPurchase() then tostring(p1.props.price or "--") elseif p1:requiresFiatPurchase() then p2.buyText elseif p1.props.playButtonState == playButtonStates.DemoMode then p2.playDemoText elseif (fFlagLuaAppTextOnlyPlayButton or fFlagLuaAppIconTextPlayButton) and p1.props.playButtonState == playButtonStates.Playable then p2.playText else nil
end

function appExperienceActionRow.getButtonType(p1)
	-- upvalues: fFlagLuaAppSupportDisablePlayableWhenLoading (ref), luaAppFixAppExperienceActionRowLoadingState (ref), fFlagLuaAppPlayButtonLoadingPrimary (ref), playButtonStates (ref), buttonType (ref)
	return if fFlagLuaAppSupportDisablePlayableWhenLoading and (luaAppFixAppExperienceActionRowLoadingState or not fFlagLuaAppPlayButtonLoadingPrimary) and p1.props.playButtonState == playButtonStates.Loading then if luaAppFixAppExperienceActionRowLoadingState then if fFlagLuaAppPlayButtonLoadingPrimary then buttonType.PrimaryContextual else buttonType.Secondary else buttonType.Secondary elseif p1.props.playButtonState == playButtonStates.DemoMode then buttonType.PrimarySystem elseif p1:isButtonEnabled() then buttonType.PrimaryContextual else buttonType.Secondary
end

function appExperienceActionRow.getButtonIcon(p1)
	-- upvalues: fFlagLuaAppSupportDisablePlayableWhenLoading (ref), playButtonStates (ref), images (ref), fFlagLuaAppTextOnlyPlayButton (ref), fFlagLuaAppEnablePlaySquadButton (ref)
	return if fFlagLuaAppSupportDisablePlayableWhenLoading and p1.props.playButtonState == playButtonStates.Loading then nil elseif p1:requiresPurchase() then images["icons/common/robux"] elseif p1:requiresFiatPurchase() or p1.props.playButtonState == playButtonStates.DemoMode or p1:isActionNeeded() then nil elseif fFlagLuaAppTextOnlyPlayButton and p1.props.playButtonState == playButtonStates.Playable then nil elseif p1:isButtonEnabled() then images["icons/common/play"] elseif fFlagLuaAppEnablePlaySquadButton and p1.props.playButtonState == playButtonStates.WaitingForParty then images["icons/common/play"] else images["icons/status/unavailable"]
end

return roactServices.connect({ sessionService = appSessionService })(roactRoduxModule.connect(function(p1, p2)
	-- upvalues: gamesProductInfoReducer (ref), fFlagLuaAppEnablePlaySquadButton (ref)
	local var2 = if p1[gamesProductInfoReducer.key] then p1[gamesProductInfoReducer.key][p2.universeId] else nil
	
	return {
		price = if var2 ~= nil then nil else var2.price,
		centralOverlayType = if fFlagLuaAppEnablePlaySquadButton then p1.CentralOverlay.OverlayType else nil
	}
end, function(p1)
	-- upvalues: closeCentralOverlay (ref)
	return {
		closeCentralOverlay = function()
			-- upvalues: p1 (ref), closeCentralOverlay (copy)
			return p1(closeCentralOverlay())
		end
	}
end)(function(p1)
	-- upvalues: useRoactService (ref), roactNetworking (ref), usePlayButtonState (ref), fFlagLuaAppEnablePlayableStateWhenLoading (ref), fFlagLuaAppPlayButtonLoadingDurationTelemetry (ref), useOnPlayButtonCallback (ref), fFlagLuaAppEnablePlaySquadButton (ref), useOnPlaySquadButtonCallback (ref), menuDirection (ref), fFlagLuaAppUnifyPlayButtonAllSurfacesIxp (ref), useUserExperiment (ref), appUserLayers (ref), fFlagLuaAppLogExposurePlayButtonUX (ref), reactModule (ref), IXPService (ref), fFlagLuaAppSupportDisablePlayableWhenLoading (ref), useAppPolicy (ref), fFlagLuaAppDisablePlayableWhenLoadingForce (ref), playButtonStates (ref), cryoModule (ref), roactModule (ref), appExperienceActionRow (ref)
	local var2
	local var3 = usePlayButtonState(useRoactService(roactNetworking), p1.universeId, p1.fetchDelayInSeconds, if fFlagLuaAppEnablePlayableStateWhenLoading then true else nil, if fFlagLuaAppPlayButtonLoadingDurationTelemetry then true else nil, if fFlagLuaAppPlayButtonLoadingDurationTelemetry then p1.launchExperienceEventContext else nil)
	local var4 = useOnPlayButtonCallback(p1.universeId, p1.referralSource, p1.launchExperienceEventContext or "PlayButton", nil, p1.launchSource or "UnknownLaunchSource", if p1.launchDataOverride then { launchData = p1.launchDataOverride } else nil, p1.placeIdOverride)
	local var5 = if fFlagLuaAppEnablePlaySquadButton then useOnPlaySquadButtonCallback(menuDirection.Up, var3.playButtonState, p1.referralSource, p1.universeId) else nil
	local var6 = nil
	local var7 = nil
	
	if fFlagLuaAppUnifyPlayButtonAllSurfacesIxp then
		local var8, var9 = useUserExperiment({ appUserLayers.PlayButtonUXExposureLayer }, function(p2)
			-- upvalues: appUserLayers (copy)
			local playButtonUXExposureLayer = p2[appUserLayers.PlayButtonUXExposureLayer] or {}
			
			return playButtonUXExposureLayer.HasUnifiedPlayButton, playButtonUXExposureLayer.UnifyToUIBlox
		end, true)
		var6 = var8
		var7 = var9
	end
	if fFlagLuaAppLogExposurePlayButtonUX then
		reactModule.useEffect(function()
			-- upvalues: IXPService (copy), appUserLayers (copy)
			IXPService:LogUserLayerExposure(appUserLayers.PlayButtonUXExposureLayer)
		end, {})
	end
	if fFlagLuaAppEnablePlayableStateWhenLoading or fFlagLuaAppSupportDisablePlayableWhenLoading and (if fFlagLuaAppSupportDisablePlayableWhenLoading then fFlagLuaAppDisablePlayableWhenLoadingForce or useAppPolicy(function(p2)
		return p2.getDisablePlayableWhenLoading()
	end) else nil) then
		var2 = var3.playButtonState
	else
		local playButtonState = var3.playButtonState
		var2 = if playButtonState == playButtonStates.Loading then playButtonStates.Playable else playButtonState
	end
	if var3.secondaryPlayButtonState ~= nil then
		var2 = var3.secondaryPlayButtonState
	end
	return roactModule.createElement(appExperienceActionRow, cryoModule.Dictionary.join(p1, {
		playabilityStatus = var3.playabilityStatus,
		onPlayButtonActivated = var4,
		onPlaySquadButtonActivated = var5,
		playButtonState = var2,
		hasUnifiedPlayButtonIxp = if fFlagLuaAppUnifyPlayButtonAllSurfacesIxp then var6 else nil,
		unifyToUIBloxIxp = if fFlagLuaAppUnifyPlayButtonAllSurfacesIxp then var7 else nil
	}))
end))