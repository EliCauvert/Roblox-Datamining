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
local var1 = if not fFlagEnableNewBackpack then require(robloxGui.Modules.BackpackScript) else nil
local emotesMenuMasterModule = require(robloxGui.Modules.EmotesMenu.EmotesMenuMaster)
local playerListManagerModule = require(robloxGui.Modules.PlayerList.PlayerListManager)
local coreGuiCEnabledNotifieronnector = roactModule.PureComponent:extend("CoreGuiCEnabledNotifieronnector")
coreGuiCEnabledNotifieronnector.validateProps = tModule.strictInterface({ topBarEnabled = tModule.boolean })

function coreGuiCEnabledNotifieronnector.notifyEnabled(p1)
	-- upvalues: playerListManagerModule (ref), chatSelectorModule (ref), fFlagEnableNewBackpack (ref), var1 (ref), emotesMenuMasterModule (ref)
	playerListManagerModule:SetTopBarEnabled(p1.props.topBarEnabled)
	chatSelectorModule:TopbarEnabledChanged(p1.props.topBarEnabled)
	
	if not fFlagEnableNewBackpack and var1 then
		var1:TopbarEnabledChanged(p1.props.topBarEnabled)
	end
	emotesMenuMasterModule:setTopBarEnabled(p1.props.topBarEnabled)
end

function coreGuiCEnabledNotifieronnector.didMount(p1)
	p1:notifyEnabled()
end

function coreGuiCEnabledNotifieronnector.render(_)
	return nil
end

function coreGuiCEnabledNotifieronnector.didUpdate(p1, p2, _)
	if p1.props.topBarEnabled ~= p2.topBarEnabled then
		p1:notifyEnabled()
	end
end

return roactRoduxModule.UNSTABLE_connect2(function(p1)
	return { topBarEnabled = p1.displayOptions.topbarEnabled }
end, nil)(coreGuiCEnabledNotifieronnector)