local AppStorageService = game:GetService("AppStorageService")
local Parent = script.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local UseSelectorFunction = require(Parent.Parent.RoactUtils).Hooks.RoactRodux.useSelector

local function v3() --[[ Line: 19 ]]
	-- upvalues: AppStorageService (copy), ConstantsModule (copy)
	pcall(function() --[[ Line: 20 ]]
		-- upvalues: AppStorageService (upval), ConstantsModule (upval)
		AppStorageService:SetItem(ConstantsModule.LastFlashOccurrenceTsLocalStorageKey, (tostring(DateTime.now().UnixTimestampMillis)))
		AppStorageService:Flush()
	end)
end

return function(p1) --[[ Line: 29 ]]
	-- upvalues: AppStorageService (copy), UseSelectorFunction (copy), ConstantsModule (copy), v3 (copy)
	local AppStorageService1 = if p1 then p1 else AppStorageService
	
	if not UseSelectorFunction(function(p2) --[[ Line: 32 ]]
		-- upvalues: ConstantsModule (upval)
		return p2[ConstantsModule.RoduxKey].IsOverlayFlashActive
	end) then
		return false, v3
	end
	local Success, Result = pcall(function() --[[ Line: 40 ]]
		-- upvalues: AppStorageService1 (copy), ConstantsModule (upval)
		return AppStorageService1:GetItem(ConstantsModule.LastFlashOccurrenceTsLocalStorageKey)
	end)
	
	if not Success then
		return false, v3
	end
	local Number: number? = tonumber(Result)
	
	if Number == nil then
		return false, v3
	end
	assert(Number ~= nil, "lastFlashOccurrenceTs cannot be nil")
	
	if DateTime.now().UnixTimestampMillis - Number < 500 then
		return false, v3
	else
		return true, v3
	end
end