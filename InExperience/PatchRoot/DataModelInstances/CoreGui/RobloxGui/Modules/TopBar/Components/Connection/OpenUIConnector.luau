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
local var11 = if not fFlagEnableNewBackpack then require(robloxGui.Modules.BackpackScript) else nil
local var12 = if fFlagEnableNewBackpack then require(corePackagesService.Workspace.Packages.System).Features else nil
local emotesMenuMasterModule = require(robloxGui.Modules.EmotesMenu.EmotesMenuMaster)
local playerListManagerModule = require(robloxGui.Modules.PlayerList.PlayerListManager)
local openUIConnector = roactModule.PureComponent:extend("OpenUIConnector")
openUIConnector.validateProps = tModule.strictInterface({
	setBackpackOpen = tModule.callback,
	setEmotesOpen = tModule.callback,
	setLeaderboardOpen = tModule.callback,
	setEmotesEnabled = tModule.callback
})

function openUIConnector.didMount(p0)
	-- upvalues: playerListManagerModule (ref), fFlagEnableNewBackpack (ref), var12 (ref), var11 (ref), emotesMenuMasterModule (ref)
	p0.props.setLeaderboardOpen(playerListManagerModule:GetSetVisible())
	
	if fFlagEnableNewBackpack then
		p0.props.setBackpackOpen(var12.getVisibility(var12.FeatureName.Backpack))
		p0.disposeBackpackListener = var12.onVisibilityChanged(var12.FeatureName.Backpack, function(p1)
			-- upvalues: p0 (ref)
			p0.props.setBackpackOpen(p1)
		end)
	else
		p0.props.setBackpackOpen(var11.IsOpen)
	end
	p0.props.setEmotesOpen(emotesMenuMasterModule:isOpen())
	p0.props.setEmotesEnabled(emotesMenuMasterModule.MenuIsVisible)
end

function openUIConnector.willUnmount(p2)
	if p2.disposeBackpackListener then
		p2.disposeBackpackListener()
		p2.disposeBackpackListener = nil
	end
end

function openUIConnector.render(p3)
	-- upvalues: playerListManagerModule (ref), roactModule (ref), eventConnectionModule (ref), fFlagEnableNewBackpack (ref), var11 (ref), emotesMenuMasterModule (ref)
	return roactModule.createFragment({
		LeaderboardOpenChangedConnection = roactModule.createElement(eventConnectionModule, {
			event = playerListManagerModule:GetSetVisibleChangedEvent().Event,
			callback = function(p4)
				-- upvalues: p3 (ref)
				p3.props.setLeaderboardOpen(p4)
			end
		}),
		BackpackOpenChangedConnection = if not fFlagEnableNewBackpack then roactModule.createElement(eventConnectionModule, {
			event = var11.StateChanged.Event,
			callback = function(p5)
				-- upvalues: p3 (ref)
				p3.props.setBackpackOpen(p5)
			end
		}) else nil,
		EmotesOpenChangedConnection = roactModule.createElement(eventConnectionModule, {
			event = emotesMenuMasterModule.EmotesMenuToggled.Event,
			callback = function(p6)
				-- upvalues: p3 (ref)
				p3.props.setEmotesOpen(p6)
			end
		}),
		EmotesEnabledChangedConnection = roactModule.createElement(eventConnectionModule, {
			event = emotesMenuMasterModule.MenuVisibilityChanged.Event,
			callback = function(p7)
				-- upvalues: p3 (ref)
				p3.props.setEmotesEnabled(p7)
			end
		})
	})
end

return roactRoduxModule.UNSTABLE_connect2(nil, function(p8)
	-- upvalues: setBackpackOpenModule (ref), setEmotesOpenModule (ref), setLeaderboardOpenModule (ref), setEmotesEnabledModule (ref)
	return {
		setBackpackOpen = function(value)
			-- upvalues: p8 (ref), setBackpackOpenModule (copy)
			return p8(setBackpackOpenModule(value))
		end,
		setEmotesOpen = function(value)
			-- upvalues: p8 (ref), setEmotesOpenModule (copy)
			return p8(setEmotesOpenModule(value))
		end,
		setLeaderboardOpen = function(value)
			-- upvalues: p8 (ref), setLeaderboardOpenModule (copy)
			return p8(setLeaderboardOpenModule(value))
		end,
		setEmotesEnabled = function(value)
			-- upvalues: p8 (ref), setEmotesEnabledModule (copy)
			return p8(setEmotesEnabledModule(value))
		end
	}
end)(openUIConnector)