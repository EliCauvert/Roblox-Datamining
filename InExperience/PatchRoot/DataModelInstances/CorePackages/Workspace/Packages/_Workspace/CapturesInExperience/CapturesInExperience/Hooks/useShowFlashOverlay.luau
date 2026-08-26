local appStorageService = game:GetService("AppStorageService")
local parent = script.Parent.Parent
local constantsModule = require(parent.Constants)
local useSelector = require(parent.Parent.RoactUtils).Hooks.RoactRodux.useSelector

local var1 = function()
	-- upvalues: appStorageService (ref), constantsModule (ref)
	pcall(function()
		-- upvalues: appStorageService (copy), constantsModule (copy)
		appStorageService:SetItem(constantsModule.LastFlashOccurrenceTsLocalStorageKey, tostring(DateTime.now().UnixTimestampMillis))
		appStorageService:Flush()
	end)
end

return function(p1)
	-- upvalues: appStorageService (ref), useSelector (ref), constantsModule (ref), var1 (ref)
	local var2 = p1 or appStorageService
	
	if not useSelector(function(p2)
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].IsOverlayFlashActive
	end) then
		return false, var1
	end
	local ok, status = pcall(function()
		-- upvalues: var2 (ref), constantsModule (copy)
		return var2:GetItem(constantsModule.LastFlashOccurrenceTsLocalStorageKey)
	end)
	
	if not ok then
		return false, var1
	end
	local var3 = tonumber(status)
	
	if var3 == nil then
		return false, var1
	end
	assert(var3 ~= nil, "lastFlashOccurrenceTs cannot be nil")
	
	if DateTime.now().UnixTimestampMillis - var3 < 500 then
		return false, var1
	end
	return true, var1
end