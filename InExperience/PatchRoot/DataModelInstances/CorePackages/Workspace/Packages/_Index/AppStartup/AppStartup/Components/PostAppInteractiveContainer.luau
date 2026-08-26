local appStartup = script:FindFirstAncestor("AppStartup")
local parent = appStartup.Parent
local _ = require(appStartup.AppStartupSequence)
local _ = require(parent.AppCommonLib)
local reactModule = require(parent.React)

return function(p1)
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(p1.appStartupSequence.isInteractive)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref)
		local changedConnection = nil
		
		if p1.appStartupSequence.isInteractive then
			var2(true)
		else
			changedConnection = p1.appStartupSequence.changed:connect(function()
				-- upvalues: var2 (copy), p1 (copy), changedConnection (write)
				var2(p1.appStartupSequence.isInteractive)
				
				if changedConnection ~= nil and p1.appStartupSequence.isInteractive then
					changedConnection:disconnect()
					changedConnection = nil
				end
			end)
		end
		return if changedConnection then changedConnection.disconnect else nil
	end, { p1.appStartupSequence })
	
	return reactModule.createElement(reactModule.Fragment, nil, if var1 then p1.children else {})
end