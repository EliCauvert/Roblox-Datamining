local corePackagesService = game:GetService("CorePackages")
local settingsShowSignal = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local reactModule = require(corePackagesService.Packages.React)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local parent = script.Parent.Parent
local enumReactPageModule = require(parent.EnumReactPage)
local portalWithFoundationStylelinkModule = require(parent.Components.PortalWithFoundationStylelink)
local reactPageSignalModule = require(parent.ReactPageSignal)
local traversalHistoryPage = require(parent.Components.Traversal).TraversalHistoryPage

return reactModule.memo(reactModule.forwardRef(function(p0, _) --[[ line: 25 | named "InExperienceMenuReactPage" ]]
	-- upvalues: reactPageSignalModule (ref), signalsReactModule (ref), enumReactPageModule (ref), reactModule (ref), traversalHistoryPage (ref), settingsShowSignal (ref), portalWithFoundationStylelinkModule (ref)
	local var6 = signalsReactModule.useSignalState(reactPageSignalModule(false).currentReactPage)
	local var7 = if var6 == enumReactPageModule.TraversalHistory then reactModule.createElement(traversalHistoryPage) else nil
	reactModule.useEffect(function() --[[ line: 34 ]]
		-- upvalues: var6 (ref), p0 (ref)
		if var6 then
			p0.onMount()
			
			return p0.onUnmount
		end
	end, { var6 })
	reactModule.useEffect(function() --[[ line: 42 ]]
		-- upvalues: settingsShowSignal (copy), p0 (ref)
		local var8 = settingsShowSignal:connect(function(p1) --[[ line: 43 ]]
			-- upvalues: p0 (copy)
			if not p1 then
				p0.onUnmount()
			end
		end)
		
		return function() --[[ line: 48 ]]
			-- upvalues: var8 (ref)
			var8:Disconnect()
		end
	end, {})
	
	return reactModule.createElement(portalWithFoundationStylelinkModule, { parent = p0.mountTo }, { Page = var7 })
end))