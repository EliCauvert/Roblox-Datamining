local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Packages.Signals)
local CreateSessionScopedSignalFunction = require(CorePackages.Workspace.Packages.SignalsUtils).createSessionScopedSignal

local function _()
	return { left = 0, top = 0, right = 0, bottom = 0 }
end

return function()
	-- upvalues: CreateSessionScopedSignalFunction (copy)
	local SessionScopedSignal, SessionScopedSignal2 = CreateSessionScopedSignalFunction({ left = 0, top = 0, right = 0, bottom = 0 })
	
	return {
		getGlobalContextMenuInset = SessionScopedSignal,
		setGlobalContextMenuInset = function(Left, Top, Right, Bottom)
			-- upvalues: SessionScopedSignal2 (copy)
			SessionScopedSignal2({ left = Left, top = Top, right = Right, bottom = Bottom })
		end,
		reset = function()
			-- upvalues: SessionScopedSignal2 (copy)
			SessionScopedSignal2({ left = 0, top = 0, right = 0, bottom = 0 })
		end
	}
end