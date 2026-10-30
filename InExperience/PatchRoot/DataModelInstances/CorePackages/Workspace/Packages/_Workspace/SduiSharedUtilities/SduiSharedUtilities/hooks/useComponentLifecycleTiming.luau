local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local ReactModule = require(SduiSharedUtilities.Parent.React)
local _ = require(SduiSharedUtilities.SduiLoadTimer)

return function(p1, p2)
	-- upvalues: ReactModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy)
		if p1 then
			p1.logComponentMounted()
		end
	end, { p1 })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), p2 (copy)
		if p1 and p2 then
			p1.logComponentReady()
		end
	end, { p1, p2 })
end