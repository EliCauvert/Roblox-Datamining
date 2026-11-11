local HttpService = game:GetService("HttpService")
local Parent = script.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local Promise = DependenciesModule.Promise
local Fetch = DependenciesModule.Fetch
local FetchFunction = Fetch.fetch
local Response = Fetch.Response
local UserSettingModule = require(Parent.Enums.UserSetting)
local NewResult = DependenciesModule.UrlBuilder.new({
	path = "user-settings-api/v1/user-settings",
	base = DependenciesModule.UrlBase.APIS
})

local function updateUserSettings(List, p1)
	-- upvalues: UserSettingModule (copy), Promise (copy), NewResult (copy), FetchFunction (copy), HttpService (copy), Response (copy)
	for i, _ in List do
		if not UserSettingModule[i] then
			return Promise.reject(`Invalid setting name: {i}`)
		end
	end
	local Result = NewResult()
	
	return Promise.new(function(Callback1: (any) -> (), Callback: (any) -> ())
		-- upvalues: FetchFunction (upval), Result (copy), HttpService (upval), List (copy), p1 (copy), Response (upval)
		local Success, Result1 = pcall(function()
			-- upvalues: FetchFunction (upval), Result (upval), HttpService (upval), List (upval), p1 (upval), Response (upval)
			return FetchFunction(Result, {
				method = "POST",
				body = HttpService:JSONEncode(List),
				headers = {
					["Content-Type"] = "application/json",
					Accept = "application/json",
					["rbx-audit-data"] = p1
				}
			}):catch(function(_)
				-- upvalues: Response (upval)
				return Response.error()
			end):expect()
		end)
		
		if not Success or not Result1 then
			Callback(`Failed to make request: {Result1}`)
			
			return
		end
		if Result1.ok then
			Callback1(Result1)
			
			return
		else
			Callback(`Got update user setting HTTP Response: {Result1.status} - {Result1.statusText}`)
		end
	end)
end

return {
	updateUserSetting = function(p2, p3, p4)
		-- upvalues: NewResult (copy), Promise (copy), FetchFunction (copy), HttpService (copy), Response (copy)
		local Result = NewResult()
		
		return Promise.new(function(Callback1: () -> (), Callback: (any) -> ())
			-- upvalues: FetchFunction (upval), Result (copy), HttpService (upval), p2 (copy), p3 (copy), p4 (copy), Response (upval)
			local Success, Result1 = pcall(function()
				-- upvalues: FetchFunction (upval), Result (upval), HttpService (upval), p2 (upval), p3 (upval), p4 (upval), Response (upval)
				return FetchFunction(Result, {
					method = "POST",
					body = HttpService:JSONEncode({ [p2] = p3 }),
					headers = {
						["Content-Type"] = "application/json",
						Accept = "application/json",
						["rbx-audit-data"] = p4
					}
				}):catch(function(_)
					-- upvalues: Response (upval)
					return Response.error()
				end):expect()
			end)
			
			if not Success then
				Callback("Failed to make request: " .. tostring(Result1))
				
				return
			end
			if Result1.ok then
				Callback1()
				
				return
			else
				Callback((string.format("Got update user setting HTTP Response: %d - %s", Result1.status, Result1.statusText)))
			end
		end)
	end,
	updateUserSettings = if require(Parent.Parent.SharedFlags).FFlagLuaAppSduiUpdateUserSettingsAction then updateUserSettings else nil
}