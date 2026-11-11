local HttpService = game:GetService("HttpService")
local CorePackages = game:GetService("CorePackages")
local Logger = require(CorePackages.Workspace.Packages.Loggers).Logger
local StatusCodes = require(CorePackages.Workspace.Packages.Http).StatusCodes

return function(p1): boolean
	-- upvalues: StatusCodes (copy), HttpService (copy), Logger (copy)
	if p1.StatusCode == StatusCodes.FORBIDDEN then
		local Success, Result = pcall(HttpService.JSONDecode, HttpService, p1.Body)
		
		if not Success then
			Logger:info("Failed to parse JSON error body for moderation")
			Logger:info(p1.Body)
			
			return false
		end
		local Errors = Result and Result.errors or nil
		
		if Errors == nil then
			return false
		end
		for _, _error in pairs(Errors) do
			for i, value in pairs(_error) do
				if i == "message" and value == "User is moderated" then
					return true
				end
			end
		end
	end
	return false
end