local appStartup = script:FindFirstAncestor("AppStartup")
local parent = appStartup.Parent
local _ = require(appStartup.AppStartupSequence)
local _ = require(parent.AppCommonLib)
local reactModule = require(parent.React)

return function(p0) --[[ line: 14 ]]
	-- upvalues: reactModule (ref)
	local var2, var3 = reactModule.useState(p0.appStartupSequence.isInteractive)
	reactModule.useEffect(function() --[[ line: 17 ]]
		-- upvalues: p0 (ref), var3 (ref)
		local changedConnection = nil
		
		if p0.appStartupSequence.isInteractive then
			var3(true)
		else
			changedConnection = p0.appStartupSequence.changed:connect(function() --[[ line: 23 ]]
				-- upvalues: var3 (copy), p0 (copy), changedConnection (write)
				var3(p0.appStartupSequence.isInteractive)
				
				if changedConnection ~= nil and p0.appStartupSequence.isInteractive then
					changedConnection:disconnect()
					changedConnection = nil
				end
			end)
		end
		return if changedConnection then changedConnection.disconnect else nil
	end, { p0.appStartupSequence })
	
	return reactModule.createElement(reactModule.Fragment, nil, if var2 then p0.children else {})
end