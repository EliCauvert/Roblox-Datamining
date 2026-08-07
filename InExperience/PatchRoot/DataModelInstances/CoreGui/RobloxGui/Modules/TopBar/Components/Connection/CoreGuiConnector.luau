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

function coreGuiConnector.didMount(p0) --[[ line: 37 ]]
	-- upvalues: fFlagMountCoreGuiBackpackModule (ref), fFlagTopBarSignalizeHealthBar (ref), starterGuiService (ref)
	for i, v in ipairs(Enum.CoreGuiType:GetEnumItems()) do
		if (not fFlagMountCoreGuiBackpackModule or v ~= Enum.CoreGuiType.Backpack) and (not fFlagTopBarSignalizeHealthBar or v ~= Enum.CoreGuiType.Health) and v ~= Enum.CoreGuiType.All then
			p0.props.updateCoreGuiEnabled(v, starterGuiService:GetCoreGuiEnabled(v))
		end
	end
end

function coreGuiConnector.render(p1) --[[ line: 50 ]]
	-- upvalues: roactModule (ref), eventConnectionModule (ref), starterGuiService (ref), fFlagMountCoreGuiBackpackModule (ref)
	return roactModule.createFragment({
		CoreGuiChangedConnection = roactModule.createElement(eventConnectionModule, {
			event = starterGuiService.CoreGuiChangedSignal,
			callback = function(p2, p3) --[[ line: 54 ]]
				-- upvalues: fFlagMountCoreGuiBackpackModule (copy), p1 (ref)
				if fFlagMountCoreGuiBackpackModule then
					if p2 == Enum.CoreGuiType.Backpack then
						return
					else
						p1.props.updateCoreGuiEnabled(p2, p3)
						
						return
					end
				else
					p1.props.updateCoreGuiEnabled(p2, p3)
				end
			end
		})
	})
end

return roactRoduxModule.UNSTABLE_connect2(nil, function(p4) --[[ line: 68 | named "mapDispatchToProps" ]]
	-- upvalues: updateCoreGuiEnabledModule (ref)
	return {
		updateCoreGuiEnabled = function(p5, p6) --[[ line: 70 ]]
			-- upvalues: p4 (ref), updateCoreGuiEnabledModule (copy)
			return p4(updateCoreGuiEnabledModule(p5, p6))
		end
	}
end)(coreGuiConnector)