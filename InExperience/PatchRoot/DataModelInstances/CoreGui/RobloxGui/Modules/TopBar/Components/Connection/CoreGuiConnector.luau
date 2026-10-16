local CorePackages = game:GetService("CorePackages")
local StarterGui = game:GetService("StarterGui")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local Parent = script.Parent.Parent.Parent
local UpdateCoreGuiEnabledModule = require(Parent.Actions.UpdateCoreGuiEnabled)
local EventConnectionModule = require(Parent.Parent.Common.EventConnection)
local FFlagMountCoreGuiBackpackModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Flags.FFlagMountCoreGuiBackpack)

if require(Parent.Flags.FFlagTopBarDeprecateCoreGuiRodux) then
	return nil
else
	local FFlagTopBarSignalizeHealthBar = require(CorePackages.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeHealthBar
	local CoreGuiConnector = RoactModule.PureComponent:extend("CoreGuiConnector")
	CoreGuiConnector.validateProps = TModule.strictInterface({ updateCoreGuiEnabled = TModule.callback })
	
	function CoreGuiConnector.didMount(p1) --[[ Line: 37 ]]
		-- upvalues: FFlagMountCoreGuiBackpackModule (copy), FFlagTopBarSignalizeHealthBar (copy), StarterGui (copy)
		for _, enumItem in ipairs((Enum.CoreGuiType:GetEnumItems())) do
			if (not FFlagMountCoreGuiBackpackModule or enumItem ~= Enum.CoreGuiType.Backpack) and (not FFlagTopBarSignalizeHealthBar or enumItem ~= Enum.CoreGuiType.Health) and enumItem ~= Enum.CoreGuiType.All then
				p1.props.updateCoreGuiEnabled(enumItem, StarterGui:GetCoreGuiEnabled(enumItem))
			end
		end
	end
	
	function CoreGuiConnector.render(p2) --[[ Line: 50 ]]
		-- upvalues: RoactModule (copy), EventConnectionModule (copy), StarterGui (copy), FFlagMountCoreGuiBackpackModule (copy)
		return RoactModule.createFragment({
			CoreGuiChangedConnection = RoactModule.createElement(EventConnectionModule, {
				event = StarterGui.CoreGuiChangedSignal,
				callback = function(CoreGuiType, p3) --[[ Line: 54 ]]
					-- upvalues: FFlagMountCoreGuiBackpackModule (upval), p2 (copy)
					if not FFlagMountCoreGuiBackpackModule then
						p2.props.updateCoreGuiEnabled(CoreGuiType, p3)
					elseif CoreGuiType ~= Enum.CoreGuiType.Backpack then
						p2.props.updateCoreGuiEnabled(CoreGuiType, p3)
						
						return
					end
				end
			})
		})
	end
	
	return RoactRoduxModule.UNSTABLE_connect2(nil, function(Callback) --[[ Line: 68 | Named "mapDispatchToProps" ]]
		-- upvalues: UpdateCoreGuiEnabledModule (copy)
		return {
			updateCoreGuiEnabled = function(p2, p3) --[[ Line: 70 ]]
				-- upvalues: Callback (copy), UpdateCoreGuiEnabledModule (upval)
				return Callback(UpdateCoreGuiEnabledModule(p2, p3))
			end
		}
	end)(CoreGuiConnector)
end