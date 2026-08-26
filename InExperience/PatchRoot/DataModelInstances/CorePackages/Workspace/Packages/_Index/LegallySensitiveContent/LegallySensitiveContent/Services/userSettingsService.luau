local httpService = game:GetService("HttpService")
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local dependenciesModule = require(parent.dependencies)
local promise = dependenciesModule.Promise
local urlBuilder = dependenciesModule.UrlBuilder
local urlBase = dependenciesModule.UrlBase
local fetch = dependenciesModule.Fetch
local fetch_1 = fetch.fetch
local response = fetch.Response
local userSettingModule = require(parent.Enums.UserSetting)
local var1 = urlBuilder.new({
	path = "user-settings-api/v1/user-settings",
	base = urlBase.APIS
})

return {
	updateUserSetting = function(value, p1, p2)
		-- upvalues: var1 (ref), promise (ref), fetch_1 (ref), httpService (ref), response (ref)
		local var2 = var1()
		
		return promise.new(function(p3, p4)
			-- upvalues: fetch_1 (copy), var2 (ref), httpService (copy), value (ref), p1 (ref), p2 (ref), response (copy)
			local ok, status = pcall(function()
				-- upvalues: fetch_1 (copy), var2 (copy), httpService (copy), value (copy), p1 (copy), p2 (copy), response (copy)
				return fetch_1(var2, {
					method = "POST",
					body = httpService:JSONEncode({ [value] = p1 }),
					headers = {
						["Content-Type"] = "application/json",
						Accept = "application/json",
						["rbx-audit-data"] = p2
					}
				}):catch(function(_)
					-- upvalues: response (copy)
					return response.error()
				end):expect()
			end)
			
			if not ok then
				p4("Failed to make request: " .. tostring(status))
				
				return
			elseif status.ok then
				p3()
				
				return
			end
			p4(string.format("Got update user setting HTTP Response: %d - %s", status.status, status.statusText))
		end)
	end,
	updateUserSettings = if require(parent_1.SharedFlags).FFlagLuaAppSduiUpdateUserSettingsAction then function(value, p1)
		-- upvalues: userSettingModule (ref), promise (ref), var1 (ref), fetch_1 (ref), httpService (ref), response (ref)
		for i, v in value do
			if not userSettingModule[i] then
				return promise.reject(`Invalid setting name: {i}`)
			end
		end
		local var2 = var1()
		
		return promise.new(function(p2, p3)
			-- upvalues: fetch_1 (copy), var2 (ref), httpService (copy), value (ref), p1 (ref), response (copy)
			local ok, status = pcall(function()
				-- upvalues: fetch_1 (copy), var2 (copy), httpService (copy), value (copy), p1 (copy), response (copy)
				return fetch_1(var2, {
					method = "POST",
					body = httpService:JSONEncode(value),
					headers = {
						["Content-Type"] = "application/json",
						Accept = "application/json",
						["rbx-audit-data"] = p1
					}
				}):catch(function(_)
					-- upvalues: response (copy)
					return response.error()
				end):expect()
			end)
			
			if not ok or not status then
				p3(`Failed to make request: {status}`)
				
				return
			elseif status.ok then
				p2(status)
				
				return
			end
			p3(`Got update user setting HTTP Response: {status.status} - {status.statusText}`)
		end)
	end else nil
}