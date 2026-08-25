local parent = script:FindFirstAncestor("GamePlayButton").Parent
local cryoModule = require(parent.Cryo)
local tModule = require(parent.t)
local gamesProductInfoReducer = require(parent.GameProductInfoRodux).GamesProductInfoReducer
local roactModule = require(parent.Roact)
local roactRoduxModule = require(parent.RoactRodux)
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local playButtonStatesModule = require(script.Parent.PlayButtonStates)
local useOnPlayButtonCallbackModule = require(script.Parent.useOnPlayButtonCallback)
local useOnPlaySquadButtonCallbackModule = require(script.Parent.useOnPlaySquadButtonCallback)
local usePlayButtonStateModule = require(script.Parent.usePlayButtonState)
local playButtonViewModule = require(script.Parent.PlayButtonView)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local foundationModule = require(parent.Foundation)
local inputSize = foundationModule.Enums.InputSize
local useTokens = foundationModule.Hooks.useTokens
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local menuDirection = require(parent.UIBlox).App.Menu.MenuDirection
local legacyPlayButtonModule = require(script.Parent.LegacyPlayButton)
local fFlagLuaAppEnablePlaySquadButton = require(parent.SharedFlags).FFlagLuaAppEnablePlaySquadButton
local fFlagLuaAppPlayButtonLoadingDurationTelemetry = require(parent.SharedFlags).FFlagLuaAppPlayButtonLoadingDurationTelemetry
local fFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP = require(parent.SharedFlags).FFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP
local fIntLuaAppPlayButtonSecondaryButtonGap = require(parent.SharedFlags).FIntLuaAppPlayButtonSecondaryButtonGap

local var11 = function(p0)
	-- upvalues: useLocalization (ref), useTokens (ref), roactModule (ref), playButtonViewModule (ref), menuDirection (ref), inputSize (ref)
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = p0.Size,
		LayoutOrder = p0.LayoutOrder
	}, {
		PlayButtonView = roactModule.createElement(playButtonViewModule, {
			shouldLaunchWhenLoading = false,
			shouldLaunchOnReleaseAfterUnmount = false,
			useUIBloxButton = true,
			playButtonState = p0.playButtonState,
			gameProductInfo = p0.gameProductInfo,
			localized = useLocalization({
				join = "Feature.ExperienceDetails.PlayButtonText.ActionNeeded",
				play = "Feature.ExperienceDetails.PlayButtonText.Play",
				playDemo = "Feature.ExperienceDetails.PlayButtonText.PlayDemo",
				unlock = "Feature.ExperienceDetails.PlayButtonText.Unlock",
				joinWithParty = "Feature.Squads.Action.JoinWithParty",
				unavailable = "Feature.ExperienceDetails.PlayButtonText.Unavailable",
				waitingForParty = "Feature.Squads.Action.WaitingForParty"
			}),
			tokens = useTokens(),
			onPlayButtonActivated = p0.onPlayButtonActivated,
			onPlaySquadButtonActivated = p0.onPlaySquadButtonActivated or function() end,
			squadButtonMenuDirection = menuDirection.Up,
			buttonSize = inputSize.Large,
			width = UDim.new(1, 0),
			testId = p0.testId
		})
	})
end

local playButtonContainer = roactModule.PureComponent:extend("PlayButtonContainer")
playButtonContainer.validateProps = tModule.strictInterface({
	universeId = tModule.string,
	Size = tModule.optional(tModule.UDim2),
	LayoutOrder = tModule.optional(tModule.number),
	referralSource = tModule.optional(tModule.string),
	experienceJoinData = tModule.optional(tModule.table),
	placeId = tModule.optional(tModule.string),
	testId = tModule.optional(tModule.string),
	shouldUseUnifiedPlayButtonView = if fFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP then tModule.optional(tModule.boolean) else nil,
	onPlayButtonCallback = tModule.callback,
	onPlaySquadButtonCallback = if fFlagLuaAppEnablePlaySquadButton then tModule.callback else nil,
	playButtonState = tModule.string,
	secondaryPlayButtonState = tModule.optional(tModule.string),
	gameProductInfo = tModule.optional(tModule.table)
})

function playButtonContainer.init(p1)
	-- upvalues: fFlagLuaAppEnablePlaySquadButton (ref)
	p1.isMounted = false
	
	function p1.onPlayButtonActivated()
		-- upvalues: p1 (ref)
		if p1.isMounted then
			p1.props.onPlayButtonCallback(p1.props.playButtonState)
			
			return
		end
	end
	
	function p1.onSecondaryPlayButtonActivated()
		-- upvalues: p1 (ref)
		if p1.isMounted then
			p1.props.onPlayButtonCallback(p1.props.secondaryPlayButtonState)
			
			return
		end
	end
	
	p1.onPlaySquadButtonActivated = if fFlagLuaAppEnablePlaySquadButton then function(p2)
		-- upvalues: p1 (ref)
		if p1.isMounted then
			p1.props.onPlaySquadButtonCallback(p2)
			
			return
		end
	end else nil
end

function playButtonContainer.didMount(p3)
	p3.isMounted = true
end

function playButtonContainer.willUnmount(p4)
	p4.isMounted = false
end

function playButtonContainer.render(p5)
	-- upvalues: fFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP (ref), fIntLuaAppPlayButtonSecondaryButtonGap (ref), roactModule (ref), var11 (ref), legacyPlayButtonModule (ref), fFlagLuaAppEnablePlaySquadButton (ref)
	local size = p5.props.Size
	local layoutOrder = p5.props.LayoutOrder
	local playButtonState = p5.props.playButtonState
	local gameProductInfo = p5.props.gameProductInfo
	local var13 = if gameProductInfo then gameProductInfo.price else 0
	
	if fFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP and p5.props.shouldUseUnifiedPlayButtonView then
		if p5.props.secondaryPlayButtonState == nil then
			return roactModule.createElement(var11, {
				Size = size,
				LayoutOrder = layoutOrder,
				playButtonState = playButtonState,
				gameProductInfo = gameProductInfo,
				onPlayButtonActivated = p5.onPlayButtonActivated,
				onPlaySquadButtonActivated = p5.onPlaySquadButtonActivated,
				testId = p5.props.testId
			})
		end
		local uDim2 = UDim2.new(0.5, -fIntLuaAppPlayButtonSecondaryButtonGap / 2, 1, 0)
		
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = size,
			LayoutOrder = layoutOrder
		}, {
			Layout = roactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, fIntLuaAppPlayButtonSecondaryButtonGap)
			}),
			PlayButton = roactModule.createElement(var11, {
				LayoutOrder = 1,
				Size = uDim2,
				playButtonState = playButtonState,
				gameProductInfo = gameProductInfo,
				onPlayButtonActivated = p5.onPlayButtonActivated,
				onPlaySquadButtonActivated = p5.onPlaySquadButtonActivated,
				testId = p5.props.testId
			}),
			SecondaryPlayButton = roactModule.createElement(var11, {
				LayoutOrder = 2,
				Size = uDim2,
				playButtonState = p5.props.secondaryPlayButtonState,
				gameProductInfo = gameProductInfo,
				onPlayButtonActivated = p5.onSecondaryPlayButtonActivated,
				onPlaySquadButtonActivated = p5.onPlaySquadButtonActivated,
				testId = if p5.props.testId then p5.props.testId .. "--secondary" else nil
			})
		})
	elseif p5.props.secondaryPlayButtonState == nil then
		return roactModule.createElement(legacyPlayButtonModule, {
			Size = size,
			LayoutOrder = layoutOrder,
			playButtonState = playButtonState,
			price = var13,
			localizedFiatPrice = if gameProductInfo then gameProductInfo.localizedFiatPrice else "",
			onPlayButtonActivated = p5.onPlayButtonActivated,
			onPlaySquadButtonActivated = if fFlagLuaAppEnablePlaySquadButton then p5.onPlaySquadButtonActivated else nil,
			testId = p5.props.testId
		})
	end
	local uDim2 = UDim2.new(0.5, -fIntLuaAppPlayButtonSecondaryButtonGap / 2, 1, 0)
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = size,
		LayoutOrder = layoutOrder
	}, {
		Layout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, fIntLuaAppPlayButtonSecondaryButtonGap)
		}),
		PlayButton = roactModule.createElement(legacyPlayButtonModule, {
			LayoutOrder = 1,
			Size = uDim2,
			playButtonState = playButtonState,
			price = var13,
			localizedFiatPrice = if gameProductInfo then gameProductInfo.localizedFiatPrice else "",
			onPlayButtonActivated = p5.onPlayButtonActivated,
			onPlaySquadButtonActivated = if fFlagLuaAppEnablePlaySquadButton then p5.onPlaySquadButtonActivated else nil,
			testId = p5.props.testId
		}),
		SecondaryPlayButton = roactModule.createElement(legacyPlayButtonModule, {
			LayoutOrder = 2,
			Size = uDim2,
			playButtonState = p5.props.secondaryPlayButtonState,
			price = var13,
			localizedFiatPrice = if gameProductInfo then gameProductInfo.localizedFiatPrice else "",
			onPlayButtonActivated = p5.onSecondaryPlayButtonActivated,
			onPlaySquadButtonActivated = if fFlagLuaAppEnablePlaySquadButton then p5.onPlaySquadButtonActivated else nil,
			testId = if p5.props.testId then p5.props.testId .. "--secondary" else nil
		})
	})
end

return roactRoduxModule.connect(function(p7, p8)
	-- upvalues: gamesProductInfoReducer (ref)
	return {
		gameProductInfo = p7[gamesProductInfoReducer.key][p8.universeId]
	}
end)(function(p6)
	-- upvalues: useRoactService (ref), roactNetworking (ref), usePlayButtonStateModule (ref), fFlagLuaAppPlayButtonLoadingDurationTelemetry (ref), useOnPlayButtonCallbackModule (ref), fFlagLuaAppEnablePlaySquadButton (ref), useOnPlaySquadButtonCallbackModule (ref), menuDirection (ref), playButtonStatesModule (ref), cryoModule (ref), roactModule (ref), playButtonContainer (ref)
	local var16 = usePlayButtonStateModule(useRoactService(roactNetworking), p6.universeId, nil, nil, if fFlagLuaAppPlayButtonLoadingDurationTelemetry then true else nil, if fFlagLuaAppPlayButtonLoadingDurationTelemetry then "PlayButton" else nil)
	local var17 = useOnPlayButtonCallbackModule(p6.universeId, p6.referralSource, "PlayButton", nil, "LuaGameCard", p6.experienceJoinData, p6.placeId)
	local var18 = if fFlagLuaAppEnablePlaySquadButton then useOnPlaySquadButtonCallbackModule(menuDirection.Up, var16.playButtonState, p6.referralSource, p6.universeId) else nil
	local playButtonState = var16.playButtonState
	local secondaryPlayButtonState = var16.secondaryPlayButtonState
	
	if secondaryPlayButtonState ~= nil then
		local var19 = secondaryPlayButtonState == playButtonStatesModule.UnplayableOther
		
		if playButtonState == playButtonStatesModule.UnplayableOther and not var19 then
			playButtonState = secondaryPlayButtonState
			secondaryPlayButtonState = nil
		elseif var19 then
			secondaryPlayButtonState = nil
		end
	end
	return roactModule.createElement(playButtonContainer, cryoModule.Dictionary.join(p6, {
		onPlayButtonCallback = var17,
		onPlaySquadButtonCallback = var18,
		playButtonState = playButtonState,
		secondaryPlayButtonState = secondaryPlayButtonState
	}))
end)