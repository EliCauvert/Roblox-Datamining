local appStorageService = game:GetService("AppStorageService")
local parent = script.Parent.Parent
local constantsModule = require(parent.Constants)
local useSelector = require(parent.Parent.RoactUtils).Hooks.RoactRodux.useSelector

local var2 = function()
	-- upvalues: appStorageService (ref), constantsModule (ref)
	pcall(function()
		-- upvalues: appStorageService (copy), constantsModule (copy)
		appStorageService:SetItem(constantsModule.LastFlashOccurrenceTsLocalStorageKey, tostring(DateTime.now().UnixTimestampMillis))
		appStorageService:Flush()
	end)
end

return function(p0)
	-- upvalues: appStorageService (ref), useSelector (ref), constantsModule (ref), var2 (ref)
	local var3 = p0 or appStorageService
	
	if not useSelector(function(p1)
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].IsOverlayFlashActive
	end) then
		return false, var2
	end
	local ok, status = pcall(function()
		-- upvalues: var3 (ref), constantsModule (copy)
		return var3:GetItem(constantsModule.LastFlashOccurrenceTsLocalStorageKey)
	end)
	
	if not ok then
		return false, var2
	end
	local var4 = tonumber(status)
	
	if var4 == nil then
		return false, var2
	end
	assert(var4 ~= nil, "lastFlashOccurrenceTs cannot be nil")
	
	if DateTime.now().UnixTimestampMillis - var4 < 500 then
		return false, var2
	end
	return true, var2
end