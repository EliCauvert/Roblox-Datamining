local Parent = script:FindFirstAncestor("GamePlayButton").Parent
local CryoModule = require(Parent.Cryo)
local TModule = require(Parent.t)
local GamesProductInfoReducer = require(Parent.GameProductInfoRodux).GamesProductInfoReducer
local RoactModule = require(Parent.Roact)
local RoactRoduxModule = require(Parent.RoactRodux)
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local PlayButtonStatesModule = require(script.Parent.PlayButtonStates)
local UseOnPlayButtonCallbackModule = require(script.Parent.useOnPlayButtonCallback)
local UseOnPlaySquadButtonCallbackModule = require(script.Parent.useOnPlaySquadButtonCallback)
local UsePlayButtonStateModule = require(script.Parent.usePlayButtonState)
local PlayButtonViewModule = require(script.Parent.PlayButtonView)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FoundationModule = require(Parent.Foundation)
local InputSize = FoundationModule.Enums.InputSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseRoactService = require(Parent.RobloxAppHooks).useRoactService
local MenuDirection = require(Parent.UIBlox).App.Menu.MenuDirection
local LegacyPlayButtonModule = require(script.Parent.LegacyPlayButton)
local GetFFlagIsSquadEnabledFunction = require(Parent.SharedFlags).GetFFlagIsSquadEnabled
local FFlagLuaAppPlayButtonLoadingDurationTelemetry = require(Parent.SharedFlags).FFlagLuaAppPlayButtonLoadingDurationTelemetry
local FFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP = require(Parent.SharedFlags).FFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP
local FIntLuaAppPlayButtonSecondaryButtonGap = require(Parent.SharedFlags).FIntLuaAppPlayButtonSecondaryButtonGap
local FFlagLuaAppPlayButtonPrivatePT = require(Parent.SharedFlags).FFlagLuaAppPlayButtonPrivatePT

local function v21(Frame) --[[ Line: 35 ]]
	-- upvalues: UseLocalizationFunction (copy), FFlagLuaAppPlayButtonPrivatePT (copy), UseTokensFunction (copy), RoactModule (copy), PlayButtonViewModule (copy), MenuDirection (copy), InputSize (copy)
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = Frame.Size,
		LayoutOrder = Frame.LayoutOrder
	}, {
		PlayButtonView = RoactModule.createElement(PlayButtonViewModule, {
			shouldLaunchWhenLoading = false,
			shouldLaunchOnReleaseAfterUnmount = false,
			useUIBloxButton = true,
			playButtonState = Frame.playButtonState,
			gameProductInfo = Frame.gameProductInfo,
			localized = UseLocalizationFunction({
				join = "Feature.ExperienceDetails.PlayButtonText.ActionNeeded",
				play = "Feature.ExperienceDetails.PlayButtonText.Play",
				playDemo = "Feature.ExperienceDetails.PlayButtonText.PlayDemo",
				unlock = "Feature.ExperienceDetails.PlayButtonText.Unlock",
				joinWithParty = "Feature.Squads.Action.JoinWithParty",
				unavailable = "Feature.ExperienceDetails.PlayButtonText.Unavailable",
				waitingForParty = "Feature.Squads.Action.WaitingForParty",
				playtest = if FFlagLuaAppPlayButtonPrivatePT then "Feature.ExperienceDetails.PlayButtonText.Playtest" else nil
			}),
			tokens = UseTokensFunction(),
			onPlayButtonActivated = Frame.onPlayButtonActivated,
			onPlaySquadButtonActivated = Frame.onPlaySquadButtonActivated or function() --[[ Line: 60 ]] end,
			squadButtonMenuDirection = MenuDirection.Up,
			buttonSize = InputSize.Large,
			width = UDim.new(1, 0),
			testId = Frame.testId
		})
	})
end

local PlayButtonContainer = RoactModule.PureComponent:extend("PlayButtonContainer")
PlayButtonContainer.validateProps = TModule.strictInterface({
	universeId = TModule.string,
	Size = TModule.optional(TModule.UDim2),
	LayoutOrder = TModule.optional(TModule.number),
	referralSource = TModule.optional(TModule.string),
	experienceJoinData = TModule.optional(TModule.table),
	placeId = TModule.optional(TModule.string),
	testId = TModule.optional(TModule.string),
	shouldUseUnifiedPlayButtonView = if FFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP then TModule.optional(TModule.boolean) else nil,
	onPlayButtonCallback = TModule.callback,
	onPlaySquadButtonCallback = if GetFFlagIsSquadEnabledFunction() then TModule.callback else nil,
	playButtonState = TModule.string,
	secondaryPlayButtonState = TModule.optional(TModule.string),
	gameProductInfo = TModule.optional(TModule.table)
})

function PlayButtonContainer.init(p1) --[[ Line: 96 ]]
	-- upvalues: GetFFlagIsSquadEnabledFunction (copy)
	p1.isMounted = false
	
	function p1.onPlayButtonActivated() --[[ Line: 99 ]]
		-- upvalues: p1 (copy)
		if p1.isMounted then
			p1.props.onPlayButtonCallback(p1.props.playButtonState)
			
			return
		end
	end
	
	function p1.onSecondaryPlayButtonActivated() --[[ Line: 107 ]]
		-- upvalues: p1 (copy)
		if p1.isMounted then
			p1.props.onPlayButtonCallback(p1.props.secondaryPlayButtonState)
			
			return
		end
	end
	
	p1.onPlaySquadButtonActivated = if GetFFlagIsSquadEnabledFunction() then function(p2) --[[ Line: 116 ]]
		-- upvalues: p1 (copy)
		if p1.isMounted then
			p1.props.onPlaySquadButtonCallback(p2)
			
			return
		end
	end else nil
end

function PlayButtonContainer.didMount(p1) --[[ Line: 126 ]]
	p1.isMounted = true
end

function PlayButtonContainer.willUnmount(p1) --[[ Line: 130 ]]
	p1.isMounted = false
end

function PlayButtonContainer.render(p1) --[[ Line: 134 ]]
	-- upvalues: FFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP (copy), FIntLuaAppPlayButtonSecondaryButtonGap (copy), RoactModule (copy), v21 (copy), LegacyPlayButtonModule (copy), GetFFlagIsSquadEnabledFunction (copy)
	local Size = p1.props.Size
	local LayoutOrder = p1.props.LayoutOrder
	local PlayButtonState = p1.props.playButtonState
	local GameProductInfo = p1.props.gameProductInfo
	local Price = GameProductInfo and GameProductInfo.price or 0
	
	if FFlagLuaAppMobileEdpPlayButtonPartialUnificationIXP and p1.props.shouldUseUnifiedPlayButtonView then
		if p1.props.secondaryPlayButtonState == nil then
			return RoactModule.createElement(v21, {
				Size = Size,
				LayoutOrder = LayoutOrder,
				playButtonState = PlayButtonState,
				gameProductInfo = GameProductInfo,
				onPlayButtonActivated = p1.onPlayButtonActivated,
				onPlaySquadButtonActivated = p1.onPlaySquadButtonActivated,
				testId = p1.props.testId
			})
		else
			local _UDim2 = UDim2.new(0.5, -FIntLuaAppPlayButtonSecondaryButtonGap / 2, 1, 0)
			
			return RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = Size,
				LayoutOrder = LayoutOrder
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, FIntLuaAppPlayButtonSecondaryButtonGap)
				}),
				PlayButton = RoactModule.createElement(v21, {
					LayoutOrder = 1,
					Size = _UDim2,
					playButtonState = PlayButtonState,
					gameProductInfo = GameProductInfo,
					onPlayButtonActivated = p1.onPlayButtonActivated,
					onPlaySquadButtonActivated = p1.onPlaySquadButtonActivated,
					testId = p1.props.testId
				}),
				SecondaryPlayButton = RoactModule.createElement(v21, {
					LayoutOrder = 2,
					Size = _UDim2,
					playButtonState = p1.props.secondaryPlayButtonState,
					gameProductInfo = GameProductInfo,
					onPlayButtonActivated = p1.onSecondaryPlayButtonActivated,
					onPlaySquadButtonActivated = p1.onPlaySquadButtonActivated,
					testId = if p1.props.testId then p1.props.testId .. "--secondary" else nil
				})
			})
		end
	elseif p1.props.secondaryPlayButtonState == nil then
		return RoactModule.createElement(LegacyPlayButtonModule, {
			Size = Size,
			LayoutOrder = LayoutOrder,
			playButtonState = PlayButtonState,
			price = Price,
			localizedFiatPrice = GameProductInfo and GameProductInfo.localizedFiatPrice or "",
			onPlayButtonActivated = p1.onPlayButtonActivated,
			onPlaySquadButtonActivated = if GetFFlagIsSquadEnabledFunction() then p1.onPlaySquadButtonActivated else nil,
			testId = p1.props.testId
		})
	else
		local _UDim2 = UDim2.new(0.5, -FIntLuaAppPlayButtonSecondaryButtonGap / 2, 1, 0)
		
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = Size,
			LayoutOrder = LayoutOrder
		}, {
			Layout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, FIntLuaAppPlayButtonSecondaryButtonGap)
			}),
			PlayButton = RoactModule.createElement(LegacyPlayButtonModule, {
				LayoutOrder = 1,
				Size = _UDim2,
				playButtonState = PlayButtonState,
				price = Price,
				localizedFiatPrice = GameProductInfo and GameProductInfo.localizedFiatPrice or "",
				onPlayButtonActivated = p1.onPlayButtonActivated,
				onPlaySquadButtonActivated = if GetFFlagIsSquadEnabledFunction() then p1.onPlaySquadButtonActivated else nil,
				testId = p1.props.testId
			}),
			SecondaryPlayButton = RoactModule.createElement(LegacyPlayButtonModule, {
				LayoutOrder = 2,
				Size = _UDim2,
				playButtonState = p1.props.secondaryPlayButtonState,
				price = Price,
				localizedFiatPrice = GameProductInfo and GameProductInfo.localizedFiatPrice or "",
				onPlayButtonActivated = p1.onSecondaryPlayButtonActivated,
				onPlaySquadButtonActivated = if GetFFlagIsSquadEnabledFunction() then p1.onPlaySquadButtonActivated else nil,
				testId = if p1.props.testId then p1.props.testId .. "--secondary" else nil
			})
		})
	end
end

return (RoactRoduxModule.connect(function(p1, p2) --[[ Line: 293 ]]
	-- upvalues: GamesProductInfoReducer (copy)
	return {
		gameProductInfo = p1[GamesProductInfoReducer.key][p2.universeId]
	}
end)(function(p1) --[[ Line: 238 ]]
	-- upvalues: UseRoactService (copy), RoactNetworking (copy), UsePlayButtonStateModule (copy), FFlagLuaAppPlayButtonLoadingDurationTelemetry (copy), UseOnPlayButtonCallbackModule (copy), GetFFlagIsSquadEnabledFunction (copy), UseOnPlaySquadButtonCallbackModule (copy), MenuDirection (copy), PlayButtonStatesModule (copy), CryoModule (copy), RoactModule (copy), PlayButtonContainer (copy)
	local v1 = UsePlayButtonStateModule(UseRoactService(RoactNetworking), p1.universeId, nil, nil, if FFlagLuaAppPlayButtonLoadingDurationTelemetry then true else nil, if FFlagLuaAppPlayButtonLoadingDurationTelemetry then "PlayButton" else nil)
	local PlayButton = UseOnPlayButtonCallbackModule(p1.universeId, p1.referralSource, "PlayButton", nil, "LuaGameCard", p1.experienceJoinData, p1.placeId)
	local OnPlaySquadButtonCallback = if GetFFlagIsSquadEnabledFunction() then UseOnPlaySquadButtonCallbackModule(MenuDirection.Up, v1.playButtonState, p1.referralSource, p1.universeId) else nil
	local PlayButtonState = v1.playButtonState
	local SecondaryPlayButtonState = v1.secondaryPlayButtonState
	
	if SecondaryPlayButtonState ~= nil then
		local IsSecondaryPlayButtonStateMatch = SecondaryPlayButtonState == PlayButtonStatesModule.UnplayableOther
		
		if PlayButtonState == PlayButtonStatesModule.UnplayableOther and not IsSecondaryPlayButtonStateMatch then
			PlayButtonState = SecondaryPlayButtonState
			SecondaryPlayButtonState = nil
		elseif IsSecondaryPlayButtonStateMatch then
			SecondaryPlayButtonState = nil
		end
	end
	return RoactModule.createElement(PlayButtonContainer, (CryoModule.Dictionary.join(p1, {
		onPlayButtonCallback = PlayButton,
		onPlaySquadButtonCallback = OnPlaySquadButtonCallback,
		playButtonState = PlayButtonState,
		secondaryPlayButtonState = SecondaryPlayButtonState
	})))
end))