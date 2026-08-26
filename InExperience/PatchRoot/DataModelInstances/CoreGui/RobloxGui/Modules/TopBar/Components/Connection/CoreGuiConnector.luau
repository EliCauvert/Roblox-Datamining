local corePackagesService = game:GetService("CorePackages")
local starterGuiService = game:GetService("StarterGui")
local modules = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local parent = script.Parent.Parent.Parent
local updateCoreGuiEnabledModule = require(parent.Actions.UpdateCoreGuiEnabled)
local eventConnectionModule = require(parent.Parent.Common.EventConnection)
local fFlagMountCoreGuiBackpackModule = require(modules.Flags.FFlagMountCoreGuiBackpack)

if require(parent.Flags.FFlagTopBarDeprecateCoreGuiRodux) then
	return nil
end
local fFlagTopBarSignalizeHealthBar = require(corePackagesService.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeHealthBar
local coreGuiConnector = roactModule.PureComponent:extend("CoreGuiConnector")
coreGuiConnector.validateProps = tModule.strictInterface({ updateCoreGuiEnabled = tModule.callback })

function coreGuiConnector.didMount(p1)
	-- upvalues: fFlagMountCoreGuiBackpackModule (ref), fFlagTopBarSignalizeHealthBar (ref), starterGuiService (ref)
	for i, v in ipairs(Enum.CoreGuiType:GetEnumItems()) do
		if (not fFlagMountCoreGuiBackpackModule or v ~= Enum.CoreGuiType.Backpack) and (not fFlagTopBarSignalizeHealthBar or v ~= Enum.CoreGuiType.Health) and v ~= Enum.CoreGuiType.All then
			p1.props.updateCoreGuiEnabled(v, starterGuiService:GetCoreGuiEnabled(v))
		end
	end
end

function coreGuiConnector.render(p2)
	-- upvalues: roactModule (ref), eventConnectionModule (ref), starterGuiService (ref), fFlagMountCoreGuiBackpackModule (ref)
	return roactModule.createFragment({
		CoreGuiChangedConnection = roactModule.createElement(eventConnectionModule, {
			event = starterGuiService.CoreGuiChangedSignal,
			callback = function(p3, p4)
				-- upvalues: fFlagMountCoreGuiBackpackModule (copy), p2 (ref)
				if fFlagMountCoreGuiBackpackModule then
					if p3 == Enum.CoreGuiType.Backpack then
						return
					else
						p2.props.updateCoreGuiEnabled(p3, p4)
						
						return
					end
				else
					p2.props.updateCoreGuiEnabled(p3, p4)
				end
			end
		})
	})
end

return roactRoduxModule.UNSTABLE_connect2(nil, function(p2)
	-- upvalues: updateCoreGuiEnabledModule (ref)
	return {
		updateCoreGuiEnabled = function(p3, p4)
			-- upvalues: p2 (ref), updateCoreGuiEnabledModule (copy)
			return p2(updateCoreGuiEnabledModule(p3, p4))
		end
	}
end)(coreGuiConnector)