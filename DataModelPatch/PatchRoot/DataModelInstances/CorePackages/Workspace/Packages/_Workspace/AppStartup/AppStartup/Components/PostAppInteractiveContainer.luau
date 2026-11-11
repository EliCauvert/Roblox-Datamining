local AppStartup = script:FindFirstAncestor("AppStartup")
local Parent = AppStartup.Parent
local _ = require(AppStartup.AppStartupSequence)
local _ = require(Parent.AppCommonLib)
local ReactModule = require(Parent.React)

return function(p1)
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.appStartupSequence.isInteractive)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult2 (copy)
		local ChangedConnection = nil
		
		if p1.appStartupSequence.isInteractive then
			UseStateResult2(true)
		else
			ChangedConnection = p1.appStartupSequence.changed:connect(function()
				-- upvalues: UseStateResult2 (upval), p1 (upval), ChangedConnection (ref)
				UseStateResult2(p1.appStartupSequence.isInteractive)
				
				if ChangedConnection ~= nil and p1.appStartupSequence.isInteractive then
					ChangedConnection:disconnect()
					ChangedConnection = nil
				end
			end)
		end
		return if ChangedConnection then ChangedConnection.disconnect else nil
	end, { p1.appStartupSequence })
	
	return ReactModule.createElement(ReactModule.Fragment, nil, if UseStateResult then p1.children else {})
end