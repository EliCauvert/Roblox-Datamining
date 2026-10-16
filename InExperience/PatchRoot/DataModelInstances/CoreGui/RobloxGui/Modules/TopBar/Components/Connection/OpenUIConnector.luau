local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local Parent = script.Parent.Parent.Parent

if require(Parent.Flags.FFlagTopBarDeprecateMoreMenuRodux) then
	return nil
else
	local SetBackpackOpenModule = require(Parent.Actions.SetBackpackOpen)
	local SetEmotesOpenModule = require(Parent.Actions.SetEmotesOpen)
	local SetLeaderboardOpenModule = require(Parent.Actions.SetLeaderboardOpen)
	local SetEmotesEnabledModule = require(Parent.Actions.SetEmotesEnabled)
	local EventConnectionModule = require(Parent.Parent.Common.EventConnection)
	local RobloxGui = CoreGui:WaitForChild("RobloxGui")
	local FFlagEnableNewBackpack = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
	local BackpackScriptModule = if FFlagEnableNewBackpack then nil else require(RobloxGui.Modules.BackpackScript)
	local Features = if FFlagEnableNewBackpack then require(CorePackages.Workspace.Packages.System).Features else nil
	local EmotesMenuMasterModule = require(RobloxGui.Modules.EmotesMenu.EmotesMenuMaster)
	local PlayerListManagerModule = require(RobloxGui.Modules.PlayerList.PlayerListManager)
	local OpenUIConnector = RoactModule.PureComponent:extend("OpenUIConnector")
	OpenUIConnector.validateProps = TModule.strictInterface({
		setBackpackOpen = TModule.callback,
		setEmotesOpen = TModule.callback,
		setLeaderboardOpen = TModule.callback,
		setEmotesEnabled = TModule.callback
	})
	
	function OpenUIConnector.didMount(p1) --[[ Line: 42 ]]
		-- upvalues: PlayerListManagerModule (copy), FFlagEnableNewBackpack (copy), Features (copy), BackpackScriptModule (copy), EmotesMenuMasterModule (copy)
		p1.props.setLeaderboardOpen(PlayerListManagerModule:GetSetVisible())
		
		if FFlagEnableNewBackpack then
			p1.props.setBackpackOpen(Features.getVisibility(Features.FeatureName.Backpack))
			p1.disposeBackpackListener = Features.onVisibilityChanged(Features.FeatureName.Backpack, function(p2) --[[ Line: 47 ]]
				-- upvalues: p1 (copy)
				p1.props.setBackpackOpen(p2)
			end)
		else
			p1.props.setBackpackOpen(BackpackScriptModule.IsOpen)
		end
		p1.props.setEmotesOpen(EmotesMenuMasterModule:isOpen())
		p1.props.setEmotesEnabled(EmotesMenuMasterModule.MenuIsVisible)
	end
	
	function OpenUIConnector.willUnmount(p1) --[[ Line: 57 ]]
		if p1.disposeBackpackListener then
			p1.disposeBackpackListener()
			p1.disposeBackpackListener = nil
		end
	end
	
	function OpenUIConnector.render(p1) --[[ Line: 64 ]]
		-- upvalues: PlayerListManagerModule (copy), RoactModule (copy), EventConnectionModule (copy), FFlagEnableNewBackpack (copy), BackpackScriptModule (copy), EmotesMenuMasterModule (copy)
		return RoactModule.createFragment({
			LeaderboardOpenChangedConnection = RoactModule.createElement(EventConnectionModule, {
				event = PlayerListManagerModule:GetSetVisibleChangedEvent().Event,
				callback = function(p2) --[[ Line: 70 ]]
					-- upvalues: p1 (copy)
					p1.props.setLeaderboardOpen(p2)
				end
			}),
			BackpackOpenChangedConnection = if FFlagEnableNewBackpack then nil else RoactModule.createElement(EventConnectionModule, {
				event = BackpackScriptModule.StateChanged.Event,
				callback = function(p2) --[[ Line: 77 ]]
					-- upvalues: p1 (copy)
					p1.props.setBackpackOpen(p2)
				end
			}),
			EmotesOpenChangedConnection = RoactModule.createElement(EventConnectionModule, {
				event = EmotesMenuMasterModule.EmotesMenuToggled.Event,
				callback = function(p2) --[[ Line: 84 ]]
					-- upvalues: p1 (copy)
					p1.props.setEmotesOpen(p2)
				end
			}),
			EmotesEnabledChangedConnection = RoactModule.createElement(EventConnectionModule, {
				event = EmotesMenuMasterModule.MenuVisibilityChanged.Event,
				callback = function(p2) --[[ Line: 91 ]]
					-- upvalues: p1 (copy)
					p1.props.setEmotesEnabled(p2)
				end
			})
		})
	end
	
	return RoactRoduxModule.UNSTABLE_connect2(nil, function(Callback) --[[ Line: 98 | Named "mapDispatchToProps" ]]
		-- upvalues: SetBackpackOpenModule (copy), SetEmotesOpenModule (copy), SetLeaderboardOpenModule (copy), SetEmotesEnabledModule (copy)
		return {
			setBackpackOpen = function(p1) --[[ Line: 100 ]]
				-- upvalues: Callback (copy), SetBackpackOpenModule (upval)
				return Callback(SetBackpackOpenModule(p1))
			end,
			setEmotesOpen = function(p1) --[[ Line: 104 ]]
				-- upvalues: Callback (copy), SetEmotesOpenModule (upval)
				return Callback(SetEmotesOpenModule(p1))
			end,
			setLeaderboardOpen = function(p1) --[[ Line: 108 ]]
				-- upvalues: Callback (copy), SetLeaderboardOpenModule (upval)
				return Callback(SetLeaderboardOpenModule(p1))
			end,
			setEmotesEnabled = function(p1) --[[ Line: 112 ]]
				-- upvalues: Callback (copy), SetEmotesEnabledModule (upval)
				return Callback(SetEmotesEnabledModule(p1))
			end
		}
	end)(OpenUIConnector)
end