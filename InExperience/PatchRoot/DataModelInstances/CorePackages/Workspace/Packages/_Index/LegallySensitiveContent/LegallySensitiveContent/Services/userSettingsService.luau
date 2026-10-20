local HttpService = game:GetService("HttpService")
local Parent = script.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local Promise = DependenciesModule.Promise
local UrlBuilder = DependenciesModule.UrlBuilder
local UrlBase = DependenciesModule.UrlBase
local Fetch = DependenciesModule.Fetch
local FetchFunction = Fetch.fetch
local Response = Fetch.Response
local UserSettingModule = require(Parent.Enums.UserSetting)
local NewUrlBuilder = UrlBuilder.new({
	path = "user-settings-api/v1/user-settings",
	base = UrlBase.APIS
})
local NewUrlBuilder1 = UrlBuilder.new({
	path = "user-settings-api/v2/user-settings",
	base = UrlBase.APIS
})

local function updateUserSettings(List, p1)
	-- upvalues: UserSettingModule (copy), Promise (copy), NewUrlBuilder (copy), FetchFunction (copy), HttpService (copy), Response (copy)
	for i, _ in List do
		if not UserSettingModule[i] then
			return Promise.reject(`Invalid setting name: {i}`)
		end
	end
	local UrlBuilder = NewUrlBuilder()
	
	return Promise.new(function(Callback1: (any) -> (), Callback: (any) -> ())
		-- upvalues: FetchFunction (upval), UrlBuilder (copy), HttpService (upval), List (copy), p1 (copy), Response (upval)
		local Success, Result = pcall(function()
			-- upvalues: FetchFunction (upval), UrlBuilder (upval), HttpService (upval), List (upval), p1 (upval), Response (upval)
			return FetchFunction(UrlBuilder, {
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
		
		if not Success or not Result then
			Callback(`Failed to make request: {Result}`)
			
			return
		end
		if Result.ok then
			Callback1(Result)
			
			return
		else
			Callback(`Got update user setting HTTP Response: {Result.status} - {Result.statusText}`)
		end
	end)
end

return {
	updateUserSetting = function(p2, p3, p4)
		-- upvalues: NewUrlBuilder (copy), Promise (copy), FetchFunction (copy), HttpService (copy), Response (copy)
		local UrlBuilder = NewUrlBuilder()
		
		return Promise.new(function(Callback1: () -> (), Callback: (any) -> ())
			-- upvalues: FetchFunction (upval), UrlBuilder (copy), HttpService (upval), p2 (copy), p3 (copy), p4 (copy), Response (upval)
			local Success, Result = pcall(function()
				-- upvalues: FetchFunction (upval), UrlBuilder (upval), HttpService (upval), p2 (upval), p3 (upval), p4 (upval), Response (upval)
				return FetchFunction(UrlBuilder, {
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
				Callback("Failed to make request: " .. tostring(Result))
				
				return
			end
			if Result.ok then
				Callback1()
				
				return
			else
				Callback((string.format("Got update user setting HTTP Response: %d - %s", Result.status, Result.statusText)))
			end
		end)
	end,
	updateUserSettings = if require(Parent.Parent.SharedFlags).FFlagLuaAppSduiUpdateUserSettingsAction then updateUserSettings else nil,
	updateUserSettingV2 = function(p2, p3, p4)
		-- upvalues: UserSettingModule (copy), Promise (copy), NewUrlBuilder1 (copy), FetchFunction (copy), HttpService (copy), Response (copy)
		if UserSettingModule[p2] then
			local UrlBuilder = NewUrlBuilder1()
			
			return Promise.new(function(Callback1: () -> (), Callback: (any) -> ())
				-- upvalues: FetchFunction (upval), UrlBuilder (copy), HttpService (upval), p2 (copy), p3 (copy), p4 (copy), Response (upval)
				local Success, Result = pcall(function()
					-- upvalues: FetchFunction (upval), UrlBuilder (upval), HttpService (upval), p2 (upval), p3 (upval), p4 (upval), Response (upval)
					return FetchFunction(UrlBuilder, {
						method = "POST",
						body = HttpService:JSONEncode({ [p2] = p3 }),
						headers = {
							["Content-Type"] = "application/json",
							Accept = "application/json",
							["rbx-audit-data"] = p4
						}
					}):catch(function()
						-- upvalues: Response (upval)
						return Response.error()
					end):expect()
				end)
				
				if not Success or not Result then
					Callback({ message = `Failed to make request: {Result}` })
					
					return
				end
				if Result.ok then
					Callback1()
					
					return
				else
					Callback({
						statusCode = Result.status,
						message = `Got update user setting HTTP Response: {Result.status} - {Result.statusText}`
					})
				end
			end)
		else
			return Promise.reject({ message = `Invalid setting name: {p2}` })
		end
	end
}