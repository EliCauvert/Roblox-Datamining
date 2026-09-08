local httpService = game:GetService("HttpService")
local appStorageService = game:GetService("AppStorageService")

return function(p1)
	-- upvalues: httpService (ref), appStorageService (ref)
	local var1 = httpService:JSONEncode({ enabledCapabilities = p1 })
	local ok, status = pcall(function()
		-- upvalues: appStorageService (copy)
		return appStorageService:GetItem("HomePageSduiCapabilities")
	end)
	
	if ok and status == var1 then
		return
	end
	pcall(function()
		-- upvalues: appStorageService (copy), var1 (ref)
		appStorageService:SetItem("HomePageSduiCapabilities", var1)
		appStorageService:Flush()
	end)
end