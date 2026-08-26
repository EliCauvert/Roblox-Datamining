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

local var1 = function(p1)
	-- upvalues: useLocalization (ref), useTokens (ref), roactModule (ref), playButtonViewModule (ref), menuDirection (ref), inputSize (ref)
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = p1.Size,
		LayoutOrder = p1.LayoutOrder
	}, {
		PlayButtonView = roactModule.createElement(playButtonViewModule, {
			shouldLaunchWhenLoading = false,
			shouldLaunchOnReleaseAfterUnmount = false,
			useUIBloxButton = true,
			playButtonState = p1.playButtonState,
			gameProductInfo = p1.gameProductInfo,
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
			onPlayButtonActivated = p1.onPlayButtonActivated,
			onPlaySquadButtonActivated = p1.onPlaySquadButtonActivated or function() end,
			squadButtonMenuDirection = menuDirection.Up,
			buttonSize = inputSize.Large,
			width = UDim.new(1, 0),
			testId = p1.testId
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

function playButtonContainer.didMount(p1)
	p1.isMounted = true
end

function playButtonContainer.willUnmount(p1)
	p1.isMounted = false
end

function playButtonContainer.render(p1)
	-- upvalues: fFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP (ref), fIntLuaAppPlayButtonSecondaryButtonGap (ref), roactModule (ref), var1 (ref), legacyPlayButtonModule (ref), fFlagLuaAppEnablePlaySquadButton (ref)
	local size = p1.props.Size
	local layoutOrder = p1.props.LayoutOrder
	local playButtonState = p1.props.playButtonState
	local gameProductInfo = p1.props.gameProductInfo
	local var2 = if gameProductInfo then gameProductInfo.price else 0
	
	if fFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP and p1.props.shouldUseUnifiedPlayButtonView then
		if p1.props.secondaryPlayButtonState == nil then
			return roactModule.createElement(var1, {
				Size = size,
				LayoutOrder = layoutOrder,
				playButtonState = playButtonState,
				gameProductInfo = gameProductInfo,
				onPlayButtonActivated = p1.onPlayButtonActivated,
				onPlaySquadButtonActivated = p1.onPlaySquadButtonActivated,
				testId = p1.props.testId
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
			PlayButton = roactModule.createElement(var1, {
				LayoutOrder = 1,
				Size = uDim2,
				playButtonState = playButtonState,
				gameProductInfo = gameProductInfo,
				onPlayButtonActivated = p1.onPlayButtonActivated,
				onPlaySquadButtonActivated = p1.onPlaySquadButtonActivated,
				testId = p1.props.testId
			}),
			SecondaryPlayButton = roactModule.createElement(var1, {
				LayoutOrder = 2,
				Size = uDim2,
				playButtonState = p1.props.secondaryPlayButtonState,
				gameProductInfo = gameProductInfo,
				onPlayButtonActivated = p1.onSecondaryPlayButtonActivated,
				onPlaySquadButtonActivated = p1.onPlaySquadButtonActivated,
				testId = if p1.props.testId then p1.props.testId .. "--secondary" else nil
			})
		})
	elseif p1.props.secondaryPlayButtonState == nil then
		return roactModule.createElement(legacyPlayButtonModule, {
			Size = size,
			LayoutOrder = layoutOrder,
			playButtonState = playButtonState,
			price = var2,
			localizedFiatPrice = if gameProductInfo then gameProductInfo.localizedFiatPrice else "",
			onPlayButtonActivated = p1.onPlayButtonActivated,
			onPlaySquadButtonActivated = if fFlagLuaAppEnablePlaySquadButton then p1.onPlaySquadButtonActivated else nil,
			testId = p1.props.testId
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
			price = var2,
			localizedFiatPrice = if gameProductInfo then gameProductInfo.localizedFiatPrice else "",
			onPlayButtonActivated = p1.onPlayButtonActivated,
			onPlaySquadButtonActivated = if fFlagLuaAppEnablePlaySquadButton then p1.onPlaySquadButtonActivated else nil,
			testId = p1.props.testId
		}),
		SecondaryPlayButton = roactModule.createElement(legacyPlayButtonModule, {
			LayoutOrder = 2,
			Size = uDim2,
			playButtonState = p1.props.secondaryPlayButtonState,
			price = var2,
			localizedFiatPrice = if gameProductInfo then gameProductInfo.localizedFiatPrice else "",
			onPlayButtonActivated = p1.onSecondaryPlayButtonActivated,
			onPlaySquadButtonActivated = if fFlagLuaAppEnablePlaySquadButton then p1.onPlaySquadButtonActivated else nil,
			testId = if p1.props.testId then p1.props.testId .. "--secondary" else nil
		})
	})
end

return roactRoduxModule.connect(function(p1, p2)
	-- upvalues: gamesProductInfoReducer (ref)
	return {
		gameProductInfo = p1[gamesProductInfoReducer.key][p2.universeId]
	}
end)(function(p1)
	-- upvalues: useRoactService (ref), roactNetworking (ref), usePlayButtonStateModule (ref), fFlagLuaAppPlayButtonLoadingDurationTelemetry (ref), useOnPlayButtonCallbackModule (ref), fFlagLuaAppEnablePlaySquadButton (ref), useOnPlaySquadButtonCallbackModule (ref), menuDirection (ref), playButtonStatesModule (ref), cryoModule (ref), roactModule (ref), playButtonContainer (ref)
	local var2 = usePlayButtonStateModule(useRoactService(roactNetworking), p1.universeId, nil, nil, if fFlagLuaAppPlayButtonLoadingDurationTelemetry then true else nil, if fFlagLuaAppPlayButtonLoadingDurationTelemetry then "PlayButton" else nil)
	local var3 = useOnPlayButtonCallbackModule(p1.universeId, p1.referralSource, "PlayButton", nil, "LuaGameCard", p1.experienceJoinData, p1.placeId)
	local var4 = if fFlagLuaAppEnablePlaySquadButton then useOnPlaySquadButtonCallbackModule(menuDirection.Up, var2.playButtonState, p1.referralSource, p1.universeId) else nil
	local playButtonState = var2.playButtonState
	local secondaryPlayButtonState = var2.secondaryPlayButtonState
	
	if secondaryPlayButtonState ~= nil then
		local var5 = secondaryPlayButtonState == playButtonStatesModule.UnplayableOther
		
		if playButtonState == playButtonStatesModule.UnplayableOther and not var5 then
			playButtonState = secondaryPlayButtonState
			secondaryPlayButtonState = nil
		elseif var5 then
			secondaryPlayButtonState = nil
		end
	end
	return roactModule.createElement(playButtonContainer, cryoModule.Dictionary.join(p1, {
		onPlayButtonCallback = var3,
		onPlaySquadButtonCallback = var4,
		playButtonState = playButtonState,
		secondaryPlayButtonState = secondaryPlayButtonState
	}))
end)