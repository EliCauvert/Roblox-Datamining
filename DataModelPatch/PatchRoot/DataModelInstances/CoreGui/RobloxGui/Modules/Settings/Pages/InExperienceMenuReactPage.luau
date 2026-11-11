local CorePackages = game:GetService("CorePackages")
local SettingsShowSignal = require(CorePackages.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local ReactModule = require(CorePackages.Packages.React)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local Parent = script.Parent.Parent
local EnumReactPageModule = require(Parent.EnumReactPage)
local PortalWithFoundationStylelinkModule = require(Parent.Components.PortalWithFoundationStylelink)
local ReactPageSignalModule = require(Parent.ReactPageSignal)
local TraversalHistoryPage = require(Parent.Components.Traversal).TraversalHistoryPage

return ReactModule.memo(ReactModule.forwardRef(function(p1, _)
	-- upvalues: ReactPageSignalModule (copy), SignalsReactModule (copy), EnumReactPageModule (copy), ReactModule (copy), TraversalHistoryPage (copy), SettingsShowSignal (copy), PortalWithFoundationStylelinkModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(ReactPageSignalModule(false).currentReactPage)
	local Element = if UseSignalStateResult == EnumReactPageModule.TraversalHistory then ReactModule.createElement(TraversalHistoryPage) else nil
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy), p1 (copy)
		if not UseSignalStateResult then return end
		p1.onMount()
		
		return p1.onUnmount
	end, { UseSignalStateResult })
	ReactModule.useEffect(function()
		-- upvalues: SettingsShowSignal (upval), p1 (copy)
		local Connection = SettingsShowSignal:connect(function(p2)
			-- upvalues: p1 (upval)
			if not p2 then
				p1.onUnmount()
			end
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	
	return ReactModule.createElement(PortalWithFoundationStylelinkModule, { parent = p1.mountTo }, { Page = Element })
end))