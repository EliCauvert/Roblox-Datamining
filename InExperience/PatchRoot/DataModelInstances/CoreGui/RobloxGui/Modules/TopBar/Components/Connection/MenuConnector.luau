local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local perfUtilsModule = require(coreGuiService:WaitForChild("RobloxGui").Modules.Common.PerfUtils)
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local parent = script.Parent.Parent.Parent
local setMenuOpenModule = require(parent.Actions.SetMenuOpen)
local setRespawnBehaviourModule = require(parent.Actions.SetRespawnBehaviour)
local eventConnectionModule = require(parent.Parent.Common.EventConnection)
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local isNewInGameMenuEnabledModule = require(robloxGui.Modules.isNewInGameMenuEnabled)
local getFFlagEnableInGameMenuDurationLoggerModule = require(robloxGui.Modules.Common.Flags.GetFFlagEnableInGameMenuDurationLogger)
local fFlagTopBarSignalizeMenuOpen = require(corePackagesService.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeMenuOpen
local fFlagTopBarDeprecateRespawnRoduxModule = require(parent.Flags.FFlagTopBarDeprecateRespawnRodux)
local menuConnector = roactModule.PureComponent:extend("MenuConnector")
menuConnector.validateProps = tModule.strictInterface({
	setMenuOpen = if fFlagTopBarSignalizeMenuOpen then nil else tModule.callback,
	setRespawnBehaviour = tModule.callback
})

function menuConnector.didMount(p1)
	-- upvalues: isNewInGameMenuEnabledModule (ref), robloxGui (ref), fFlagTopBarSignalizeMenuOpen (ref)
	if isNewInGameMenuEnabledModule() then
		local inGameMenuInitModule = require(robloxGui.Modules.InGameMenuInit)
		
		if not fFlagTopBarSignalizeMenuOpen then
			p1.props.setMenuOpen(inGameMenuInitModule.getOpen())
		end
		local respawnBehaviour, respawnBehaviour_1 = inGameMenuInitModule.getRespawnBehaviour()
		p1.props.setRespawnBehaviour(respawnBehaviour, respawnBehaviour_1)
		
		return
	else
		local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
		
		if not fFlagTopBarSignalizeMenuOpen then
			p1.props.setMenuOpen(settingsHubModule:GetVisibility())
		end
		local respawnBehaviour, respawnBehaviour_1 = settingsHubModule:GetRespawnBehaviour()
		p1.props.setRespawnBehaviour(respawnBehaviour, respawnBehaviour_1)
	end
end

function menuConnector.render(p1)
	-- upvalues: isNewInGameMenuEnabledModule (ref), robloxGui (ref), roactModule (ref), fFlagTopBarSignalizeMenuOpen (ref), eventConnectionModule (ref), getFFlagEnableInGameMenuDurationLoggerModule (ref), perfUtilsModule (ref)
	if isNewInGameMenuEnabledModule() then
		local inGameMenuInitModule = require(robloxGui.Modules.InGameMenuInit)
		local _ = nil
		
		return roactModule.createFragment({
			MenuOpenChangedConnection = if fFlagTopBarSignalizeMenuOpen then nil else roactModule.createElement(eventConnectionModule, {
				event = inGameMenuInitModule.getOpenChangedEvent().Event,
				callback = function(p2)
					-- upvalues: p1 (ref)
					p1.props.setMenuOpen(p2)
				end
			}),
			RespawnBehaviourConnection = roactModule.createElement(eventConnectionModule, {
				event = inGameMenuInitModule.getRespawnBehaviourChangedEvent().Event,
				callback = function(p2, p3)
					-- upvalues: p1 (ref)
					p1.props.setRespawnBehaviour(p2, p3)
				end
			})
		})
	end
	local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
	
	return roactModule.createFragment({
		MenuOpenChangedConnection = if fFlagTopBarSignalizeMenuOpen then nil else roactModule.createElement(eventConnectionModule, {
			event = settingsHubModule.SettingsShowEvent.Event,
			callback = function(p2)
				-- upvalues: getFFlagEnableInGameMenuDurationLoggerModule (copy), perfUtilsModule (copy), p1 (ref)
				if getFFlagEnableInGameMenuDurationLoggerModule() and p2 then
					perfUtilsModule.menuOpenBegin()
				end
				p1.props.setMenuOpen(p2)
			end
		}),
		RespawnBehaviourConnection = roactModule.createElement(eventConnectionModule, {
			event = settingsHubModule.RespawnBehaviourChangedEvent.Event,
			callback = function(p2, p3)
				-- upvalues: p1 (ref)
				p1.props.setRespawnBehaviour(p2, p3)
			end
		})
	})
end

return roactRoduxModule.UNSTABLE_connect2(nil, function(p1)
	-- upvalues: fFlagTopBarSignalizeMenuOpen (ref), setMenuOpenModule (ref), fFlagTopBarDeprecateRespawnRoduxModule (ref), setRespawnBehaviourModule (ref)
	return {
		setMenuOpen = if fFlagTopBarSignalizeMenuOpen then nil else function(p2)
			-- upvalues: p1 (ref), setMenuOpenModule (copy)
			return p1(setMenuOpenModule(p2))
		end,
		setRespawnBehaviour = if fFlagTopBarDeprecateRespawnRoduxModule then nil else function(p2, p3)
			-- upvalues: p1 (ref), setRespawnBehaviourModule (copy)
			return p1(setRespawnBehaviourModule(p2, p3))
		end or nil
	}
end)(menuConnector)