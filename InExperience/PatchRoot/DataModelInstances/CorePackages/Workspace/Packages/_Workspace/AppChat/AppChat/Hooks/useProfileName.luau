local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(Parent.DataHydration)
local ReactModule = require(Parent.React)
local UseProfileNamesModule = require(AppChat.Hooks.useProfileNames)

return function(p1)
	-- upvalues: ReactModule (copy), UseProfileNamesModule (copy)
	local UseProfileNamesModuleResult = UseProfileNamesModule((ReactModule.useMemo(function()
		-- upvalues: p1 (copy)
		return if p1 then { p1 } else {}
	end, { p1 })))
	
	return ReactModule.useMemo(function()
		-- upvalues: p1 (copy), UseProfileNamesModuleResult (copy)
		local NamesByUserIdEntry = if p1 then UseProfileNamesModuleResult.namesByUserId[p1] else nil
		
		return {
			status = UseProfileNamesModuleResult.status,
			combinedName = if NamesByUserIdEntry then NamesByUserIdEntry.combinedName else nil,
			username = if NamesByUserIdEntry then NamesByUserIdEntry.username else nil
		}
	end, { UseProfileNamesModuleResult, p1 })
end