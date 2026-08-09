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
local fFlagUpdateActionNeededPlayButtonUi = require(parent.SharedFlags).FFlagUpdateActionNeededPlayButtonUi
local getFFlagUIBloxUseFoundationButton = require(parent.SharedFlags).UIBlox.GetFFlagUIBloxUseFoundationButton
local fFlagLuaAppPlayButtonOptOutFoundationButton = require(parent.SharedFlags).FFlagLuaAppPlayButtonOptOutFoundationButton
local fFlagLuaAppPlayButtonLoadingDurationTelemetry = require(parent.SharedFlags).FFlagLuaAppPlayButtonLoadingDurationTelemetry
local fFlagLuaAppTextOnlyPlayButton = require(parent.SharedFlags).FFlagLuaAppTextOnlyPlayButton
local fFlagLuaAppIconTextPlayButton = require(parent.SharedFlags).FFlagLuaAppIconTextPlayButton
local fFlagLuaAppUpdatePlayButtonText = require(parent.SharedFlags).FFlagLuaAppUpdatePlayButtonText
local fFlagLuaAppLogExposurePlayButtonUX = require(parent.SharedFlags).FFlagLuaAppLogExposurePlayButtonUX
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

local function _(p0) --[[ line: 116 | named "modifyPlayButtonState" ]]
	-- upvalues: playButtonStates (ref)
	return if p0 == playButtonStates.Loading then playButtonStates.Playable else p0
end

function appExperienceActionRow.init(p1) --[[ line: 125 ]]
	-- upvalues: setGamePlaySession (ref), sessionType (ref), fFlagLuaAppUnifyPlayButtonTile (ref)
	function p1.onPlayPressed() --[[ line: 126 ]]
		-- upvalues: p1 (ref), setGamePlaySession (copy), sessionType (copy)
		if p1:requiresPurchase() or p1:requiresFiatPurchase() then
			p1.props.openGameDetails()
			
			return
		elseif p1:isButtonEnabled() then
			setGamePlaySession(p1.props.sessionService, sessionType.StructuralIdentifier.GamePlayFromHoverTile, true)
			p1.props.onPlayButtonActivated(p1.props.playButtonState, if p1.props.reportExperienceLaunched then p1.reportExperienceLaunched else nil)
		end
	end
	
	function p1.reportExperienceLaunched() --[[ line: 140 ]]
		-- upvalues: fFlagLuaAppUnifyPlayButtonTile (copy), setGamePlaySession (copy), p1 (ref), sessionType (copy)
		if fFlagLuaAppUnifyPlayButtonTile then
			setGamePlaySession(p1.props.sessionService, sessionType.StructuralIdentifier.GamePlayFromHoverTile, true)
		end
		p1.props.reportExperienceLaunched(p1.props.entry, p1.props.referralSource, p1.props.launchSource, p1.props.launchExperienceEventContext, p1.props.index)
	end
end

function appExperienceActionRow.willUnmount(p2) --[[ line: 155 ]]
	-- upvalues: fFlagLuaAppEnablePlaySquadButton (ref), centralOverlayType (ref)
	if fFlagLuaAppEnablePlaySquadButton and p2.props.centralOverlayType == centralOverlayType.GameDetailsSquad then
		p2.props.closeCentralOverlay()
	end
end

function appExperienceActionRow.render(p3) --[[ line: 162 ]]
	-- upvalues: fFlagLuaAppUnifyPlayButtonTile (ref), fFlagLuaAppUnifyPlayButtonAllSurfacesIxp (ref), fFlagLuaAppUnifyPlayButtonTileIxp (ref), gameTileExperimentationModule (ref), withLocalization (ref), roactModule (ref), playButton (ref), buttonSize (ref), var13 (ref), fFlagUpdateActionNeededPlayButtonUi (ref), fFlagLuaAppTextOnlyPlayButton (ref), fFlagLuaAppIconTextPlayButton (ref), fFlagLuaAppUpdatePlayButtonText (ref), experienceActionRow (ref), fFlagLuaAppSupportDisablePlayableWhenLoading (ref), playButtonStates (ref), fFlagLuaAppEnablePlaySquadButton (ref), getFFlagUIBloxUseFoundationButton (ref), fFlagLuaAppPlayButtonOptOutFoundationButton (ref)
	if fFlagLuaAppUnifyPlayButtonTile then
		if p3.props.isUnifiedGameTileEnabled and (not fFlagLuaAppUnifyPlayButtonTileIxp and not fFlagLuaAppUnifyPlayButtonAllSurfacesIxp or (if fFlagLuaAppUnifyPlayButtonAllSurfacesIxp then p3.props.hasUnifiedPlayButtonIxp else fFlagLuaAppUnifyPlayButtonTileIxp and gameTileExperimentationModule.getIsPlayButtonMigrationEnabled())) then
			local horizontalPadding = p3.props.horizontalPadding or 0
			local verticalPadding = p3.props.verticalPadding or 0
			
			return withLocalization({ buyText = "Feature.ExperienceDetails.PlayButtonText.Buy" })(function(p4) --[[ line: 182 ]]
				-- upvalues: roactModule (copy), playButton (copy), p3 (ref), buttonSize (copy), var13 (copy), horizontalPadding (ref), verticalPadding (ref)
				return roactModule.createElement(playButton, {
					isPlayableWhenLoading = true,
					universeId = p3.props.universeId,
					placeId = p3.props.placeIdOverride,
					referralSource = p3.props.referralSource,
					eventContext = p3.props.launchExperienceEventContext,
					launchSource = p3.props.launchSource,
					experienceJoinData = if p3.props.launchDataOverride then { launchData = p3.props.launchDataOverride } else nil,
					reportExperienceLaunched = p3.reportExperienceLaunched,
					fiatText = p4.buyText,
					hideOptionalText = not p3.props.showButtonText,
					buttonSize = buttonSize.Medium,
					useUIBloxButton = p3.props.unifyToUIBloxIxp,
					onPurchaseRequiredCallback = p3.props.openGameDetails,
					fillBehavior = if not p3.props.width then "Fill" else nil,
					width = p3.props.width,
					squadButtonHeight = UDim.new(0, var13),
					Position = UDim2.new(0, horizontalPadding, 1, (-verticalPadding) - var13)
				})
			end)
		end
	end
	return withLocalization({
		actionNeededText = "Feature.ExperienceDetails.PlayButtonText.ActionNeeded",
		unavailableText = "Feature.ExperienceDetails.PlayButtonText.Unavailable",
		buyText = "Feature.ExperienceDetails.PlayButtonText.Buy",
		unlockText = if fFlagUpdateActionNeededPlayButtonUi then "Feature.ExperienceDetails.PlayButtonText.Unlock" else nil,
		playText = if fFlagLuaAppTextOnlyPlayButton or fFlagLuaAppIconTextPlayButton then if fFlagLuaAppUpdatePlayButtonText then "Feature.ExperienceDetails.PlayButtonText.Play" else "Feature.ExperienceDetails.PlayButtonText.ActionNeeded" else nil
	})(function(p5) --[[ line: 221 ]]
		-- upvalues: roactModule (copy), experienceActionRow (copy), p3 (ref), fFlagLuaAppSupportDisablePlayableWhenLoading (copy), playButtonStates (copy), fFlagLuaAppEnablePlaySquadButton (copy), getFFlagUIBloxUseFoundationButton (copy), fFlagLuaAppPlayButtonOptOutFoundationButton (copy)
		local var18
		local createElement = roactModule.createElement
		local t = { isActionable = p3:isButtonEnabled() }
		
		if fFlagLuaAppSupportDisablePlayableWhenLoading then
			var18 = p3.props.playButtonState == playButtonStates.Loading
			var18 = nil
		else
			var18 = nil
		end
		t.buttonLoading = var18
		t.text = p3:getButtonText(p5)
		t.icon = p3:getButtonIcon()
		t.buttonType = p3:getButtonType()
		t.onPlayPressed = p3.onPlayPressed
		t.onOverflowPressed = if fFlagLuaAppEnablePlaySquadButton and p3:isOverflowButtonVisible() then p3.props.onPlaySquadButtonActivated else nil
		t.horizontalPadding = p3.props.horizontalPadding
		t.verticalPadding = p3.props.verticalPadding
		t.height = p3.props.height
		t.DO_NOT_USE_useUIBloxButton = if getFFlagUIBloxUseFoundationButton() or fFlagLuaAppPlayButtonOptOutFoundationButton then true else nil
		
		return createElement(experienceActionRow, t)
	end)
end

function appExperienceActionRow.isOverflowButtonVisible(p6) --[[ line: 245 ]]
	-- upvalues: fFlagLuaAppEnablePlaySquadButton (ref), playButtonStates (ref)
	return fFlagLuaAppEnablePlaySquadButton and (if p6.props.playButtonState ~= playButtonStates.PlayableWithParty then p6.props.playButtonState == playButtonStates.WaitingForParty else true)
end

function appExperienceActionRow.isButtonEnabled(p7) --[[ line: 255 ]]
	-- upvalues: fFlagLuaAppEnablePlayableStateWhenLoading (ref), getFFlagIsSquadEnabled (ref), playButtonStates (ref), fFlagLuaAppSupportDisablePlayableWhenLoading (ref)
	return if fFlagLuaAppEnablePlayableStateWhenLoading and p7.props.playabilityStatus == nil and (getFFlagIsSquadEnabled() and p7.props.playButtonState == playButtonStates.WaitingForParty) then false elseif p7.props.playabilityStatus ~= nil then if p7.props.playButtonState ~= playButtonStates.Playable then not fFlagLuaAppSupportDisablePlayableWhenLoading or (if getFFlagIsSquadEnabled() then true else p7:isActionNeeded() or (p7:requiresPurchase() or p7:requiresFiatPurchase())) else true else true
end

function appExperienceActionRow.requiresFiatPurchase(p8) --[[ line: 280 ]]
	-- upvalues: playButtonStates (ref)
	return p8.props.playButtonState == playButtonStates.FiatPaidAccess
end

function appExperienceActionRow.requiresPurchase(p9) --[[ line: 284 ]]
	-- upvalues: playButtonStates (ref)
	return p9.props.playButtonState == playButtonStates.PaidAccess
end

function appExperienceActionRow.isActionNeeded(p10) --[[ line: 288 ]]
	-- upvalues: playButtonStates (ref)
	return p10.props.playButtonState == playButtonStates.ActionNeeded
end

function appExperienceActionRow.getButtonText(p11, p12) --[[ line: 292 ]]
	-- upvalues: fFlagUpdateActionNeededPlayButtonUi (ref), fFlagLuaAppEnablePlaySquadButton (ref), playButtonStates (ref), fFlagLuaAppTextOnlyPlayButton (ref), fFlagLuaAppIconTextPlayButton (ref)
	if p11.props.showButtonText then
		return if not (not fFlagUpdateActionNeededPlayButtonUi and p11:isActionNeeded()) then if p11:isButtonEnabled() then if fFlagUpdateActionNeededPlayButtonUi and p11:isActionNeeded() then p12.unlockText elseif p11:requiresPurchase() then tostring(p11.props.price or "--") elseif p11:requiresFiatPurchase() then p12.buyText elseif (fFlagLuaAppTextOnlyPlayButton or fFlagLuaAppIconTextPlayButton) and p11.props.playButtonState == playButtonStates.Playable then p12.playText else nil elseif fFlagLuaAppEnablePlaySquadButton and p11.props.playButtonState == playButtonStates.WaitingForParty then nil else p12.unavailableText else p12.actionNeededText
	end
end

function appExperienceActionRow.getButtonType(p13) --[[ line: 325 ]]
	-- upvalues: fFlagLuaAppSupportDisablePlayableWhenLoading (ref), luaAppFixAppExperienceActionRowLoadingState (ref), fFlagLuaAppPlayButtonLoadingPrimary (ref), playButtonStates (ref), buttonType (ref), fFlagUpdateActionNeededPlayButtonUi (ref)
	return if fFlagLuaAppSupportDisablePlayableWhenLoading and (luaAppFixAppExperienceActionRowLoadingState or not fFlagLuaAppPlayButtonLoadingPrimary) and p13.props.playButtonState == playButtonStates.Loading then if luaAppFixAppExperienceActionRowLoadingState then if fFlagLuaAppPlayButtonLoadingPrimary then buttonType.PrimaryContextual else buttonType.Secondary else buttonType.Secondary elseif not (not fFlagUpdateActionNeededPlayButtonUi and p13:isActionNeeded()) then if p13:isButtonEnabled() then buttonType.PrimaryContextual else buttonType.Secondary else buttonType.PrimarySystem
end

function appExperienceActionRow.getButtonIcon(p14) --[[ line: 345 ]]
	-- upvalues: fFlagLuaAppSupportDisablePlayableWhenLoading (ref), playButtonStates (ref), fFlagUpdateActionNeededPlayButtonUi (ref), images (ref), fFlagLuaAppTextOnlyPlayButton (ref), fFlagLuaAppEnablePlaySquadButton (ref)
	return if fFlagLuaAppSupportDisablePlayableWhenLoading and p14.props.playButtonState == playButtonStates.Loading then nil elseif not (not fFlagUpdateActionNeededPlayButtonUi and p14:isActionNeeded()) then if p14:requiresPurchase() then images["icons/common/robux"] elseif p14:requiresFiatPurchase() or fFlagUpdateActionNeededPlayButtonUi and p14:isActionNeeded() then nil elseif fFlagLuaAppTextOnlyPlayButton and p14.props.playButtonState == playButtonStates.Playable then nil elseif p14:isButtonEnabled() then images["icons/common/play"] elseif fFlagLuaAppEnablePlaySquadButton and p14.props.playButtonState == playButtonStates.WaitingForParty then images["icons/common/play"] else images["icons/status/unavailable"] else images["icons/status/private"]
end

return roactServices.connect({ sessionService = appSessionService })(roactRoduxModule.connect(function(p18, p19) --[[ line: 447 ]]
	-- upvalues: gamesProductInfoReducer (ref), fFlagLuaAppEnablePlaySquadButton (ref)
	local var30 = if p18[gamesProductInfoReducer.key] then p18[gamesProductInfoReducer.key][p19.universeId] else nil
	
	return {
		price = if var30 ~= nil then nil else var30.price,
		centralOverlayType = if fFlagLuaAppEnablePlaySquadButton then p18.CentralOverlay.OverlayType else nil
	}
end, function(p20) --[[ line: 456 ]]
	-- upvalues: closeCentralOverlay (ref)
	return {
		closeCentralOverlay = function() --[[ line: 458 ]]
			-- upvalues: p20 (ref), closeCentralOverlay (copy)
			return p20(closeCentralOverlay())
		end
	}
end)(function(p15) --[[ line: 368 ]]
	-- upvalues: useRoactService (ref), roactNetworking (ref), usePlayButtonState (ref), fFlagLuaAppEnablePlayableStateWhenLoading (ref), fFlagLuaAppPlayButtonLoadingDurationTelemetry (ref), useOnPlayButtonCallback (ref), fFlagLuaAppEnablePlaySquadButton (ref), useOnPlaySquadButtonCallback (ref), menuDirection (ref), fFlagLuaAppUnifyPlayButtonAllSurfacesIxp (ref), useUserExperiment (ref), appUserLayers (ref), fFlagLuaAppLogExposurePlayButtonUX (ref), reactModule (ref), IXPService (ref), fFlagLuaAppSupportDisablePlayableWhenLoading (ref), useAppPolicy (ref), fFlagLuaAppDisablePlayableWhenLoadingForce (ref), cryoModule (ref), playButtonStates (ref), roactModule (ref), appExperienceActionRow (ref)
	local var19 = usePlayButtonState(useRoactService(roactNetworking), p15.universeId, p15.fetchDelayInSeconds, if fFlagLuaAppEnablePlayableStateWhenLoading then true else nil, if fFlagLuaAppPlayButtonLoadingDurationTelemetry then true else nil, if fFlagLuaAppPlayButtonLoadingDurationTelemetry then p15.launchExperienceEventContext else nil)
	local var20 = useOnPlayButtonCallback(p15.universeId, p15.referralSource, p15.launchExperienceEventContext or "PlayButton", nil, p15.launchSource or "UnknownLaunchSource", if p15.launchDataOverride then { launchData = p15.launchDataOverride } else nil, p15.placeIdOverride)
	local var21 = if fFlagLuaAppEnablePlaySquadButton then useOnPlaySquadButtonCallback(menuDirection.Up, var19.playButtonState, p15.referralSource, p15.universeId) else nil
	local var22 = nil
	local var23 = nil
	
	if fFlagLuaAppUnifyPlayButtonAllSurfacesIxp then
		local var24, var25 = useUserExperiment({ appUserLayers.PlayButtonUXExposureLayer }, function(p16) --[[ line: 408 ]]
			-- upvalues: appUserLayers (copy)
			local playButtonUXExposureLayer = p16[appUserLayers.PlayButtonUXExposureLayer] or {}
			
			return playButtonUXExposureLayer.HasUnifiedPlayButton, playButtonUXExposureLayer.UnifyToUIBlox
		end, true)
		var22 = var24
		var23 = var25
	end
	if fFlagLuaAppLogExposurePlayButtonUX then
		reactModule.useEffect(function() --[[ line: 417 ]]
			-- upvalues: IXPService (copy), appUserLayers (copy)
			IXPService:LogUserLayerExposure(appUserLayers.PlayButtonUXExposureLayer)
		end, {})
	end
	local var28
	local var26 = if fFlagLuaAppSupportDisablePlayableWhenLoading then fFlagLuaAppDisablePlayableWhenLoadingForce or useAppPolicy(function(p17) --[[ line: 424 ]]
		return p17.getDisablePlayableWhenLoading()
	end) else nil
	local join = cryoModule.Dictionary.join
	local t = {
		playabilityStatus = var19.playabilityStatus,
		onPlayButtonActivated = var20,
		onPlaySquadButtonActivated = var21
	}
	
	if fFlagLuaAppEnablePlayableStateWhenLoading or fFlagLuaAppSupportDisablePlayableWhenLoading and var26 then
		var28 = var19.playButtonState
	else
		local playButtonState = var19.playButtonState
		var28 = if playButtonState == playButtonStates.Loading then playButtonStates.Playable else playButtonState
	end
	t.playButtonState = var28
	t.hasUnifiedPlayButtonIxp = if fFlagLuaAppUnifyPlayButtonAllSurfacesIxp then var22 else nil
	t.unifyToUIBloxIxp = if fFlagLuaAppUnifyPlayButtonAllSurfacesIxp then var23 else nil
	
	return roactModule.createElement(appExperienceActionRow, join(p15, t))
end))