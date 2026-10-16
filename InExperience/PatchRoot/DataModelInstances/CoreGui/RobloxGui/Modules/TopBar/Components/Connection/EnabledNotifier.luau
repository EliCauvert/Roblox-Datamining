local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)

if require(script.Parent.Parent.Parent.Flags.FFlagTopBarDeprecateDisplayOptionsRodux) then
	return nil
else
	local RobloxGui = CoreGui:WaitForChild("RobloxGui")
	local ChatSelectorModule = require(RobloxGui.Modules.ChatSelector)
	local FFlagEnableNewBackpack = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
	local BackpackScriptModule = if FFlagEnableNewBackpack then nil else require(RobloxGui.Modules.BackpackScript)
	local EmotesMenuMasterModule = require(RobloxGui.Modules.EmotesMenu.EmotesMenuMaster)
	local PlayerListManagerModule = require(RobloxGui.Modules.PlayerList.PlayerListManager)
	local CoreGuiCEnabledNotifieronnector = RoactModule.PureComponent:extend("CoreGuiCEnabledNotifieronnector")
	CoreGuiCEnabledNotifieronnector.validateProps = TModule.strictInterface({ topBarEnabled = TModule.boolean })
	
	function CoreGuiCEnabledNotifieronnector.notifyEnabled(p1) --[[ Line: 29 ]]
		-- upvalues: PlayerListManagerModule (copy), ChatSelectorModule (copy), FFlagEnableNewBackpack (copy), BackpackScriptModule (copy), EmotesMenuMasterModule (copy)
		PlayerListManagerModule:SetTopBarEnabled(p1.props.topBarEnabled)
		ChatSelectorModule:TopbarEnabledChanged(p1.props.topBarEnabled)
		
		if not FFlagEnableNewBackpack and BackpackScriptModule then
			BackpackScriptModule:TopbarEnabledChanged(p1.props.topBarEnabled)
		end
		EmotesMenuMasterModule:setTopBarEnabled(p1.props.topBarEnabled)
	end
	
	function CoreGuiCEnabledNotifieronnector.didMount(p1) --[[ Line: 38 ]]
		p1:notifyEnabled()
	end
	
	function CoreGuiCEnabledNotifieronnector:render() --[[ Line: 42 ]]
		return nil
	end
	
	function CoreGuiCEnabledNotifieronnector.didUpdate(p1, p2, _) --[[ Line: 46 ]]
		if p1.props.topBarEnabled ~= p2.topBarEnabled then
			p1:notifyEnabled()
		end
	end
	
	return RoactRoduxModule.UNSTABLE_connect2(function(p1) --[[ Line: 52 | Named "mapStateToProps" ]]
		return { topBarEnabled = p1.displayOptions.topbarEnabled }
	end, nil)(CoreGuiCEnabledNotifieronnector)
end