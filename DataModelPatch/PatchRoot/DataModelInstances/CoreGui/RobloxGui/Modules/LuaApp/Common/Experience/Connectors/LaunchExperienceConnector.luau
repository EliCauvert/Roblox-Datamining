local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local DashModule = require(CorePackages.Packages.Dash)
local TModule = require(CorePackages.Packages.t)
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local GamePlayButtonModule = require(CorePackages.Workspace.Packages.GamePlayButton)
local UsePlayButtonState = GamePlayButtonModule.usePlayButtonState
local UseOnPlayButtonCallback = GamePlayButtonModule.useOnPlayButtonCallback
local UseOnPlaySquadButtonCallback = GamePlayButtonModule.useOnPlaySquadButtonCallback
local UsePlayButtonContextualMessage = GamePlayButtonModule.usePlayButtonContextualMessage
local UseRoactService = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local GameInfosReducer = require(CorePackages.Workspace.Packages.GameInfosRodux).GameInfosReducer
local MenuDirection = require(CorePackages.Packages.UIBlox).App.Menu.MenuDirection
local WrapComponentModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Common.wrapComponent)
local GetFFlagLuaAppEnableVirtualEventPlaceId = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableVirtualEventPlaceId
local FFlagLuaAppEnablePlaySquadButton = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEnablePlaySquadButton
local FFlagLuaAppPlayButtonLoadingDurationTelemetry = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppPlayButtonLoadingDurationTelemetry

return {
	connect = function(Callback1, Callback)
		-- upvalues: RoactModule (copy), TModule (copy), FFlagLuaAppPlayButtonLoadingDurationTelemetry (copy), FFlagLuaAppEnablePlaySquadButton (copy), DashModule (copy), UseRoactService (copy), RoactNetworking (copy), UsePlayButtonState (copy), UseOnPlayButtonCallback (copy), GetFFlagLuaAppEnableVirtualEventPlaceId (copy), UsePlayButtonContextualMessage (copy), UseOnPlaySquadButtonCallback (copy), MenuDirection (copy), CryoModule (copy), RoactRoduxModule (copy), GameInfosReducer (copy), WrapComponentModule (copy)
		return function(p1)
			-- upvalues: RoactModule (upval), TModule (upval), FFlagLuaAppPlayButtonLoadingDurationTelemetry (upval), FFlagLuaAppEnablePlaySquadButton (upval), DashModule (upval), Callback (copy), UseRoactService (upval), RoactNetworking (upval), UsePlayButtonState (upval), UseOnPlayButtonCallback (upval), GetFFlagLuaAppEnableVirtualEventPlaceId (upval), UsePlayButtonContextualMessage (upval), UseOnPlaySquadButtonCallback (upval), MenuDirection (upval), CryoModule (upval), RoactRoduxModule (upval), GameInfosReducer (upval), WrapComponentModule (upval), Callback1 (copy)
			local ExtendResult = RoactModule.PureComponent:extend("LaunchExperienceConnector(" .. tostring(p1) .. ")")
			ExtendResult.validateProps = TModule.interface({
				componentProps = TModule.table,
				universeId = TModule.string,
				extraParams = TModule.optional(TModule.table),
				launchSource = TModule.optional(TModule.string),
				eventContext = TModule.optional(TModule.string),
				referralSource = TModule.optional(TModule.string),
				fetchDelayInSeconds = TModule.optional(TModule.number),
				placeId = TModule.optional(TModule.string),
				shouldReportLoadingDurationTelemetry = if FFlagLuaAppPlayButtonLoadingDurationTelemetry then TModule.optional(TModule.boolean) else nil
			})
			
			function ExtendResult.init(p2)
				-- upvalues: FFlagLuaAppEnablePlaySquadButton (upval)
				function p2.onPlayButtonActivated(p3, p4)
					-- upvalues: p2 (copy)
					p2.props.onPlayButtonCallback(p3 or p2.props.playButtonState, p4)
				end
				
				if FFlagLuaAppEnablePlaySquadButton then
					function p2.onPlaySquadButtonActivated(p3)
						-- upvalues: p2 (copy)
						p2.props.onPlaySquadButtonCallback(p3)
					end
				end
			end
			
			function ExtendResult.render(p2)
				-- upvalues: FFlagLuaAppEnablePlaySquadButton (upval), RoactModule (upval), p1 (copy), DashModule (upval), Callback (upval)
				return RoactModule.createElement(p1, DashModule.assign({}, p2.props.componentProps, Callback({
					playabilityStatus = p2.props.playabilityStatus,
					playButtonState = p2.props.playButtonState,
					onPlayButtonActivated = p2.onPlayButtonActivated,
					onPlaySquadButtonActivated = if FFlagLuaAppEnablePlaySquadButton then p2.onPlaySquadButtonActivated else nil,
					playButtonContextualMessage = p2.props.playButtonContextualMessage,
					gameName = p2.props.gameName,
					fetchDelayInSeconds = p2.props.fetchDelayInSeconds
				}, p2.props.componentProps)))
			end
			
			return WrapComponentModule(function(p2, ComponentProps)
				-- upvalues: Callback1 (upval), RoactModule (upval), FFlagLuaAppPlayButtonLoadingDurationTelemetry (upval)
				local CallbackResult = Callback1(ComponentProps)
				
				return RoactModule.createElement(p2, {
					componentProps = ComponentProps,
					universeId = CallbackResult.universeId,
					extraParams = CallbackResult.extraParams,
					launchSource = CallbackResult.launchSource,
					eventContext = CallbackResult.eventContext,
					referralSource = CallbackResult.referralSource,
					fetchDelayInSeconds = CallbackResult.fetchDelayInSeconds,
					placeId = CallbackResult.placeId,
					shouldReportLoadingDurationTelemetry = if FFlagLuaAppPlayButtonLoadingDurationTelemetry then CallbackResult.shouldReportLoadingDurationTelemetry else nil
				})
			end)((RoactRoduxModule.connect(function(p2, p3)
				-- upvalues: GameInfosReducer (upval)
				local GameDetail = p2.GameDetails[p3.universeId]
				local PersonalizationEntry = p2.Personalization[GameInfosReducer.key][p3.universeId]
				
				return {
					gameName = GameDetail and GameDetail.name or (PersonalizationEntry and PersonalizationEntry.name or nil)
				}
			end)(function(p2)
				-- upvalues: UseRoactService (upval), RoactNetworking (upval), FFlagLuaAppPlayButtonLoadingDurationTelemetry (upval), UsePlayButtonState (upval), UseOnPlayButtonCallback (upval), GetFFlagLuaAppEnableVirtualEventPlaceId (upval), UsePlayButtonContextualMessage (upval), FFlagLuaAppEnablePlaySquadButton (upval), UseOnPlaySquadButtonCallback (upval), MenuDirection (upval), CryoModule (upval), RoactModule (upval), ExtendResult (copy)
				local EventContext = if FFlagLuaAppPlayButtonLoadingDurationTelemetry then p2.eventContext or "PlayButton" else nil
				local v1 = UsePlayButtonState(UseRoactService(RoactNetworking), p2.universeId, p2.fetchDelayInSeconds, nil, if FFlagLuaAppPlayButtonLoadingDurationTelemetry then p2.shouldReportLoadingDurationTelemetry else nil, if FFlagLuaAppPlayButtonLoadingDurationTelemetry then EventContext else nil)
				local v2 = if FFlagLuaAppEnablePlaySquadButton then UseOnPlaySquadButtonCallback(MenuDirection.Down, v1.playButtonState, p2.referralSource, p2.universeId) else nil
				
				return RoactModule.createElement(ExtendResult, (CryoModule.Dictionary.join(p2, {
					onPlayButtonCallback = UseOnPlayButtonCallback(p2.universeId, p2.referralSource, if FFlagLuaAppPlayButtonLoadingDurationTelemetry then EventContext else p2.eventContext or "PlayButton", nil, p2.launchSource or "UnknownLaunchSource", p2.extraParams, if GetFFlagLuaAppEnableVirtualEventPlaceId() then p2.placeId else nil),
					onPlaySquadButtonCallback = if FFlagLuaAppEnablePlaySquadButton then v2 else nil,
					playButtonState = v1.playButtonState,
					playabilityStatus = v1.playabilityStatus,
					playButtonContextualMessage = UsePlayButtonContextualMessage(p2.universeId, v1.playButtonState, v1.playabilityStatus)
				})))
			end)))
		end
	end
}