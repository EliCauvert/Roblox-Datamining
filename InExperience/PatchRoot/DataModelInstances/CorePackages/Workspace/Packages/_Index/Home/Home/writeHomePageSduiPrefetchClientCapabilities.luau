local HttpService = game:GetService("HttpService")
local AppStorageService = game:GetService("AppStorageService")

return function(p1)
	-- upvalues: HttpService (copy), AppStorageService (copy)
	local Json = HttpService:JSONEncode({ clientCapabilities = p1:jsonEncode() })
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