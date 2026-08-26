local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local parent = script.Parent.Parent.Parent

if require(parent.Flags.FFlagTopBarDeprecateMoreMenuRodux) then
	return nil
end
local setBackpackOpenModule = require(parent.Actions.SetBackpackOpen)
local setEmotesOpenModule = require(parent.Actions.SetEmotesOpen)
local setLeaderboardOpenModule = require(parent.Actions.SetLeaderboardOpen)
local setEmotesEnabledModule = require(parent.Actions.SetEmotesEnabled)
local eventConnectionModule = require(parent.Parent.Common.EventConnection)
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local fFlagEnableNewBackpack = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local var1 = if not fFlagEnableNewBackpack then require(robloxGui.Modules.BackpackScript) else nil
local var2 = if fFlagEnableNewBackpack then require(corePackagesService.Workspace.Packages.System).Features else nil
local emotesMenuMasterModule = require(robloxGui.Modules.EmotesMenu.EmotesMenuMaster)
local playerListManagerModule = require(robloxGui.Modules.PlayerList.PlayerListManager)
local openUIConnector = roactModule.PureComponent:extend("OpenUIConnector")
openUIConnector.validateProps = tModule.strictInterface({
	setBackpackOpen = tModule.callback,
	setEmotesOpen = tModule.callback,
	setLeaderboardOpen = tModule.callback,
	setEmotesEnabled = tModule.callback
})

function openUIConnector.didMount(p1)
	-- upvalues: playerListManagerModule (ref), fFlagEnableNewBackpack (ref), var2 (ref), var1 (ref), emotesMenuMasterModule (ref)
	p1.props.setLeaderboardOpen(playerListManagerModule:GetSetVisible())
	
	if fFlagEnableNewBackpack then
		p1.props.setBackpackOpen(var2.getVisibility(var2.FeatureName.Backpack))
		p1.disposeBackpackListener = var2.onVisibilityChanged(var2.FeatureName.Backpack, function(p2)
			-- upvalues: p1 (ref)
			p1.props.setBackpackOpen(p2)
		end)
	else
		p1.props.setBackpackOpen(var1.IsOpen)
	end
	p1.props.setEmotesOpen(emotesMenuMasterModule:isOpen())
	p1.props.setEmotesEnabled(emotesMenuMasterModule.MenuIsVisible)
end

function openUIConnector.willUnmount(p1)
	if p1.disposeBackpackListener then
		p1.disposeBackpackListener()
		p1.disposeBackpackListener = nil
	end
end

function openUIConnector.render(p1)
	-- upvalues: playerListManagerModule (ref), roactModule (ref), eventConnectionModule (ref), fFlagEnableNewBackpack (ref), var1 (ref), emotesMenuMasterModule (ref)
	return roactModule.createFragment({
		LeaderboardOpenChangedConnection = roactModule.createElement(eventConnectionModule, {
			event = playerListManagerModule:GetSetVisibleChangedEvent().Event,
			callback = function(p2)
				-- upvalues: p1 (ref)
				p1.props.setLeaderboardOpen(p2)
			end
		}),
		BackpackOpenChangedConnection = if not fFlagEnableNewBackpack then roactModule.createElement(eventConnectionModule, {
			event = var1.StateChanged.Event,
			callback = function(p2)
				-- upvalues: p1 (ref)
				p1.props.setBackpackOpen(p2)
			end
		}) else nil,
		EmotesOpenChangedConnection = roactModule.createElement(eventConnectionModule, {
			event = emotesMenuMasterModule.EmotesMenuToggled.Event,
			callback = function(p2)
				-- upvalues: p1 (ref)
				p1.props.setEmotesOpen(p2)
			end
		}),
		EmotesEnabledChangedConnection = roactModule.createElement(eventConnectionModule, {
			event = emotesMenuMasterModule.MenuVisibilityChanged.Event,
			callback = function(p2)
				-- upvalues: p1 (ref)
				p1.props.setEmotesEnabled(p2)
			end
		})
	})
end

return roactRoduxModule.UNSTABLE_connect2(nil, function(p1)
	-- upvalues: setBackpackOpenModule (ref), setEmotesOpenModule (ref), setLeaderboardOpenModule (ref), setEmotesEnabledModule (ref)
	return {
		setBackpackOpen = function(value)
			-- upvalues: p1 (ref), setBackpackOpenModule (copy)
			return p1(setBackpackOpenModule(value))
		end,
		setEmotesOpen = function(value)
			-- upvalues: p1 (ref), setEmotesOpenModule (copy)
			return p1(setEmotesOpenModule(value))
		end,
		setLeaderboardOpen = function(value)
			-- upvalues: p1 (ref), setLeaderboardOpenModule (copy)
			return p1(setLeaderboardOpenModule(value))
		end,
		setEmotesEnabled = function(value)
			-- upvalues: p1 (ref), setEmotesEnabledModule (copy)
			return p1(setEmotesEnabledModule(value))
		end
	}
end)(openUIConnector)