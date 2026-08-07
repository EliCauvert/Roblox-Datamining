local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)

if require(script.Parent.Parent.Parent.Flags.FFlagTopBarDeprecateDisplayOptionsRodux) then
	return nil
end
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local chatSelectorModule = require(robloxGui.Modules.ChatSelector)
local fFlagEnableNewBackpack = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local var7 = if not fFlagEnableNewBackpack then require(robloxGui.Modules.BackpackScript) else nil
local emotesMenuMasterModule = require(robloxGui.Modules.EmotesMenu.EmotesMenuMaster)
local playerListManagerModule = require(robloxGui.Modules.PlayerList.PlayerListManager)
local coreGuiCEnabledNotifieronnector = roactModule.PureComponent:extend("CoreGuiCEnabledNotifieronnector")
coreGuiCEnabledNotifieronnector.validateProps = tModule.strictInterface({ topBarEnabled = tModule.boolean })

function coreGuiCEnabledNotifieronnector.notifyEnabled(p0) --[[ line: 29 ]]
	-- upvalues: playerListManagerModule (ref), chatSelectorModule (ref), fFlagEnableNewBackpack (ref), var7 (ref), emotesMenuMasterModule (ref)
	playerListManagerModule:SetTopBarEnabled(p0.props.topBarEnabled)
	chatSelectorModule:TopbarEnabledChanged(p0.props.topBarEnabled)
	
	if not fFlagEnableNewBackpack and var7 then
		var7:TopbarEnabledChanged(p0.props.topBarEnabled)
	end
	emotesMenuMasterModule:setTopBarEnabled(p0.props.topBarEnabled)
end

function coreGuiCEnabledNotifieronnector.didMount(p1) --[[ line: 38 ]]
	p1:notifyEnabled()
end

function coreGuiCEnabledNotifieronnector.render(_) --[[ line: 42 ]]
	return nil
end

function coreGuiCEnabledNotifieronnector.didUpdate(p2, p3, _) --[[ line: 46 ]]
	if p2.props.topBarEnabled ~= p3.topBarEnabled then
		p2:notifyEnabled()
	end
end

return roactRoduxModule.UNSTABLE_connect2(function(p4) --[[ line: 52 | named "mapStateToProps" ]]
	return { topBarEnabled = p4.displayOptions.topbarEnabled }
end, nil)(coreGuiCEnabledNotifieronnector)