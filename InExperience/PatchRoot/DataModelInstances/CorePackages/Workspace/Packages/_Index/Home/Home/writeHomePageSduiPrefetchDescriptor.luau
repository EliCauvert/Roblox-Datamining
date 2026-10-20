local HttpService = game:GetService("HttpService")
local AppStorageService = game:GetService("AppStorageService")

return function(EnabledCapabilities)
	-- upvalues: HttpService (copy), AppStorageService (copy)
	local Json = HttpService:JSONEncode({ enabledCapabilities = EnabledCapabilities })
	local Success, Result = pcall(function()
		-- upvalues: AppStorageService (upval)
		return AppStorageService:GetItem("HomePageSduiCapabilities")
	end)
	
	if not Success or Result ~= Json then
		pcall(function()
			-- upvalues: AppStorageService (upval), Json (copy)
			AppStorageService:SetItem("HomePageSduiCapabilities", Json)
			AppStorageService:Flush()
		end)
		
		return
	end
end