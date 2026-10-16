local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local PerfUtilsModule = require(CoreGui:WaitForChild("RobloxGui").Modules.Common.PerfUtils)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local Parent = script.Parent.Parent.Parent
local SetMenuOpenModule = require(Parent.Actions.SetMenuOpen)
local SetRespawnBehaviourModule = require(Parent.Actions.SetRespawnBehaviour)
local EventConnectionModule = require(Parent.Parent.Common.EventConnection)
local RobloxGui = CoreGui:WaitForChild("RobloxGui")
local IsNewInGameMenuEnabledModule = require(RobloxGui.Modules.isNewInGameMenuEnabled)
local GetFFlagEnableInGameMenuDurationLoggerModule = require(RobloxGui.Modules.Common.Flags.GetFFlagEnableInGameMenuDurationLogger)
local FFlagTopBarSignalizeMenuOpen = require(CorePackages.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeMenuOpen
local FFlagTopBarDeprecateRespawnRoduxModule = require(Parent.Flags.FFlagTopBarDeprecateRespawnRodux)
local MenuConnector = RoactModule.PureComponent:extend("MenuConnector")
MenuConnector.validateProps = TModule.strictInterface({
	setMenuOpen = if FFlagTopBarSignalizeMenuOpen then nil else TModule.callback,
	setRespawnBehaviour = TModule.callback
})

function MenuConnector.didMount(p1) --[[ Line: 38 ]]
	-- upvalues: IsNewInGameMenuEnabledModule (copy), RobloxGui (copy), FFlagTopBarSignalizeMenuOpen (copy)
	if IsNewInGameMenuEnabledModule() then
		local InGameMenuInitModule = require(RobloxGui.Modules.InGameMenuInit)
		
		if not FFlagTopBarSignalizeMenuOpen then
			p1.props.setMenuOpen(InGameMenuInitModule.getOpen())
		end
		local RespawnBehaviour, RespawnBehaviour2 = InGameMenuInitModule.getRespawnBehaviour()
		p1.props.setRespawnBehaviour(RespawnBehaviour, RespawnBehaviour2)
		
		return
	else
		local SettingsHubModule = require(RobloxGui.Modules.Settings.SettingsHub)
		
		if not FFlagTopBarSignalizeMenuOpen then
			p1.props.setMenuOpen(SettingsHubModule:GetVisibility())
		end
		local RespawnBehaviour1, RespawnBehaviour2_1 = SettingsHubModule:GetRespawnBehaviour()
		p1.props.setRespawnBehaviour(RespawnBehaviour1, RespawnBehaviour2_1)
	end
end

function MenuConnector.render(p1) --[[ Line: 58 ]]
	-- upvalues: IsNewInGameMenuEnabledModule (copy), RobloxGui (copy), RoactModule (copy), FFlagTopBarSignalizeMenuOpen (copy), EventConnectionModule (copy), GetFFlagEnableInGameMenuDurationLoggerModule (copy), PerfUtilsModule (copy)
	if IsNewInGameMenuEnabledModule() then
		local InGameMenuInitModule = require(RobloxGui.Modules.InGameMenuInit)
		local OpenChangedEvent = InGameMenuInitModule.getOpenChangedEvent()
		
		return RoactModule.createFragment({
			MenuOpenChangedConnection = if FFlagTopBarSignalizeMenuOpen then nil else RoactModule.createElement(EventConnectionModule, {
				event = OpenChangedEvent.Event,
				callback = function(p2) --[[ Line: 70 ]]
					-- upvalues: p1 (copy)
					p1.props.setMenuOpen(p2)
				end
			}),
			RespawnBehaviourConnection = RoactModule.createElement(EventConnectionModule, {
				event = InGameMenuInitModule.getRespawnBehaviourChangedEvent().Event,
				callback = function(p2, p3) --[[ Line: 77 ]]
					-- upvalues: p1 (copy)
					p1.props.setRespawnBehaviour(p2, p3)
				end
			})
		})
	else
		local SettingsHubModule = require(RobloxGui.Modules.Settings.SettingsHub)
		local SettingsShowEvent = SettingsHubModule.SettingsShowEvent
		
		return RoactModule.createFragment({
			MenuOpenChangedConnection = if FFlagTopBarSignalizeMenuOpen then nil else RoactModule.createElement(EventConnectionModule, {
				event = SettingsShowEvent.Event,
				callback = function(p2) --[[ Line: 91 ]]
					-- upvalues: GetFFlagEnableInGameMenuDurationLoggerModule (upval), PerfUtilsModule (upval), p1 (copy)
					if GetFFlagEnableInGameMenuDurationLoggerModule() and p2 then
						PerfUtilsModule.menuOpenBegin()
					end
					p1.props.setMenuOpen(p2)
				end
			}),
			RespawnBehaviourConnection = RoactModule.createElement(EventConnectionModule, {
				event = SettingsHubModule.RespawnBehaviourChangedEvent.Event,
				callback = function(p2, p3) --[[ Line: 101 ]]
					-- upvalues: p1 (copy)
					p1.props.setRespawnBehaviour(p2, p3)
				end
			})
		})
	end
end

return RoactRoduxModule.UNSTABLE_connect2(nil, function(Callback) --[[ Line: 109 | Named "mapDispatchToProps" ]]
	-- upvalues: FFlagTopBarSignalizeMenuOpen (copy), SetMenuOpenModule (copy), FFlagTopBarDeprecateRespawnRoduxModule (copy), SetRespawnBehaviourModule (copy)
	return {
		setMenuOpen = if FFlagTopBarSignalizeMenuOpen then nil else function(p1) --[[ Line: 111 ]]
			-- upvalues: Callback (copy), SetMenuOpenModule (upval)
			return Callback(SetMenuOpenModule(p1))
		end,
		setRespawnBehaviour = if FFlagTopBarDeprecateRespawnRoduxModule then nil else function(p1, p2) --[[ Line: 115 ]]
			-- upvalues: Callback (copy), SetRespawnBehaviourModule (upval)
			return Callback(SetRespawnBehaviourModule(p1, p2))
		end or nil
	}
end)(MenuConnector)