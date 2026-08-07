local promiseModule = require(script:FindFirstAncestor("RobloxAppUpdate").Parent.Promise)
local t = {}
t.__index = t

function t.new(p0) --[[ line: 9 ]]
	-- upvalues: t (ref)
	local t_1 = { _appUpdate = p0 }
	setmetatable(t_1, t)
	
	return t_1
end

function t.checkForUpdate(p1) --[[ line: 18 ]]
	-- upvalues: promiseModule (ref)
	return promiseModule.new(function(p2, _) --[[ line: 19 ]]
		-- upvalues: p1 (ref)
		local ok, status = pcall(function() --[[ line: 20 ]]
			-- upvalues: p1 (copy), p2 (ref)
			p1._appUpdate:CheckForUpdate(function(p3) --[[ line: 21 ]]
				-- upvalues: p2 (copy)
				p2({ appUpdateStatus = p3 })
			end)
		end)
		
		if not ok then
			p2({ errorMessage = status })
		end
	end)
end

function t:performManagedUpdate() --[[ line: 36 ]]
	self._appUpdate:PerformManagedUpdate()
end

function t:canPerformBinaryUpdate() --[[ line: 40 ]]
	return self._appUpdate:CanPerformBinaryUpdate()
end

return t