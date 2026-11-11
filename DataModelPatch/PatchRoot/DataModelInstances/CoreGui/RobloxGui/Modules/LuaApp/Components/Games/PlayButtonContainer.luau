local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local TModule = require(CorePackages.Packages.t)
local GamesProductInfoReducer = require(CorePackages.Workspace.Packages.GameProductInfoRodux).GamesProductInfoReducer
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local GamePlayButtonModule = require(CorePackages.Workspace.Packages.GamePlayButton)
local UseOnPlayButtonCallback = GamePlayButtonModule.useOnPlayButtonCallback
local UseOnPlaySquadButtonCallback = GamePlayButtonModule.useOnPlaySquadButtonCallback
local UsePlayButtonState = GamePlayButtonModule.usePlayButtonState
local UseRoactService = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local MenuDirection = require(CorePackages.Packages.UIBlox).App.Menu.MenuDirection
local PlayButtonModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Components.Games.PlayButton)
local FFlagLuaAppEnablePlaySquadButton = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEnablePlaySquadButton
local FFlagLuaAppPlayButtonLoadingDurationTelemetry = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppPlayButtonLoadingDurationTelemetry
local PlayButtonContainer = RoactModule.PureComponent:extend("PlayButtonContainer")
PlayButtonContainer.validateProps = TModule.strictInterface({
	universeId = TModule.string,
	Size = TModule.optional(TModule.UDim2),
	LayoutOrder = TModule.optional(TModule.number),
	referralSource = TModule.optional(TModule.string),
	experienceJoinData = TModule.optional(TModule.table),
	placeId = TModule.optional(TModule.string),
	testId = TModule.optional(TModule.string),
	onPlayButtonCallback = TModule.callback,
	onPlaySquadButtonCallback = if FFlagLuaAppEnablePlaySquadButton then TModule.callback else nil,
	playButtonState = TModule.string,
	gameProductInfo = TModule.optional(TModule.table)
})

function PlayButtonContainer.init(p1)
	-- upvalues: FFlagLuaAppEnablePlaySquadButton (copy)
	p1.isMounted = false
	
	function p1.onPlayButtonActivated()
		-- upvalues: p1 (copy)
		if p1.isMounted then
			p1.props.onPlayButtonCallback(p1.props.playButtonState)
			
			return
		end
	end
	
	p1.onPlaySquadButtonActivated = if FFlagLuaAppEnablePlaySquadButton then function(p2)
		-- upvalues: p1 (copy)
		if p1.isMounted then
			p1.props.onPlaySquadButtonCallback(p2)
			
			return
		end
	end else nil
end

function PlayButtonContainer.didMount(p1)
	p1.isMounted = true
end

function PlayButtonContainer.willUnmount(p1)
	p1.isMounted = false
end

function PlayButtonContainer.render(p1)
	-- upvalues: RoactModule (copy), PlayButtonModule (copy), FFlagLuaAppEnablePlaySquadButton (copy)
	local GameProductInfo = p1.props.gameProductInfo
	
	return RoactModule.createElement(PlayButtonModule, {
		Size = p1.props.Size,
		LayoutOrder = p1.props.LayoutOrder,
		playButtonState = p1.props.playButtonState,
		price = GameProductInfo and GameProductInfo.price or 0,
		localizedFiatPrice = GameProductInfo and GameProductInfo.localizedFiatPrice or "",
		onPlayButtonActivated = p1.onPlayButtonActivated,
		onPlaySquadButtonActivated = if FFlagLuaAppEnablePlaySquadButton then p1.onPlaySquadButtonActivated else nil,
		testId = p1.props.testId
	})
end

return (RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: GamesProductInfoReducer (copy)
	return {
		gameProductInfo = p1[GamesProductInfoReducer.key][p2.universeId]
	}
end)(function(p1)
	-- upvalues: UseRoactService (copy), RoactNetworking (copy), UsePlayButtonState (copy), FFlagLuaAppPlayButtonLoadingDurationTelemetry (copy), UseOnPlayButtonCallback (copy), FFlagLuaAppEnablePlaySquadButton (copy), UseOnPlaySquadButtonCallback (copy), MenuDirection (copy), CryoModule (copy), RoactModule (copy), PlayButtonContainer (copy)
	local v1 = UsePlayButtonState(UseRoactService(RoactNetworking), p1.universeId, nil, nil, if FFlagLuaAppPlayButtonLoadingDurationTelemetry then true else nil, if FFlagLuaAppPlayButtonLoadingDurationTelemetry then "PlayButton" else nil)
	
	return RoactModule.createElement(PlayButtonContainer, (CryoModule.Dictionary.join(p1, {
		onPlayButtonCallback = UseOnPlayButtonCallback(p1.universeId, p1.referralSource, "PlayButton", nil, "LuaGameCard", p1.experienceJoinData, p1.placeId),
		onPlaySquadButtonCallback = if FFlagLuaAppEnablePlaySquadButton then UseOnPlaySquadButtonCallback(MenuDirection.Up, v1.playButtonState, p1.referralSource, p1.universeId) else nil,
		playButtonState = v1.playButtonState
	})))
end))