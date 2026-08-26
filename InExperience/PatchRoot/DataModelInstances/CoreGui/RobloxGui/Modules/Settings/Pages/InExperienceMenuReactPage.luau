local corePackagesService = game:GetService("CorePackages")
local settingsShowSignal = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local reactModule = require(corePackagesService.Packages.React)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local parent = script.Parent.Parent
local enumReactPageModule = require(parent.EnumReactPage)
local portalWithFoundationStylelinkModule = require(parent.Components.PortalWithFoundationStylelink)
local reactPageSignalModule = require(parent.ReactPageSignal)
local traversalHistoryPage = require(parent.Components.Traversal).TraversalHistoryPage

return reactModule.memo(reactModule.forwardRef(function(p1, _)
	-- upvalues: reactPageSignalModule (ref), signalsReactModule (ref), enumReactPageModule (ref), reactModule (ref), traversalHistoryPage (ref), settingsShowSignal (ref), portalWithFoundationStylelinkModule (ref)
	local var1 = signalsReactModule.useSignalState(reactPageSignalModule(false).currentReactPage)
	local var2 = if var1 == enumReactPageModule.TraversalHistory then reactModule.createElement(traversalHistoryPage) else nil
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), p1 (ref)
		if var1 then
			p1.onMount()
			
			return p1.onUnmount
		end
	end, { var1 })
	reactModule.useEffect(function()
		-- upvalues: settingsShowSignal (copy), p1 (ref)
		local var3 = settingsShowSignal:connect(function(p2)
			-- upvalues: p1 (copy)
			if not p2 then
				p1.onUnmount()
			end
		end)
		
		return function()
			-- upvalues: var3 (ref)
			var3:Disconnect()
		end
	end, {})
	
	return reactModule.createElement(portalWithFoundationStylelinkModule, { parent = p1.mountTo }, { Page = var2 })
end))