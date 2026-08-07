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
local var3 = urlBuilder.new({
	path = "user-settings-api/v1/user-settings",
	base = urlBase.APIS
})

return {
	updateUserSetting = function(value, p0, p1) --[[ line: 28 ]]
		-- upvalues: var3 (ref), promise (ref), fetch_1 (ref), httpService (ref), response (ref)
		local var4 = var3()
		
		return promise.new(function(p2, p3) --[[ line: 30 ]]
			-- upvalues: fetch_1 (copy), var4 (ref), httpService (copy), value (ref), p0 (ref), p1 (ref), response (copy)
			local ok, status = pcall(function() --[[ line: 31 ]]
				-- upvalues: fetch_1 (copy), var4 (copy), httpService (copy), value (copy), p0 (copy), p1 (copy), response (copy)
				return fetch_1(var4, {
					method = "POST",
					body = httpService:JSONEncode({ [value] = p0 }),
					headers = {
						["Content-Type"] = "application/json",
						Accept = "application/json",
						["rbx-audit-data"] = p1
					}
				}):catch(function(_) --[[ line: 43 ]]
					-- upvalues: response (copy)
					return response.error()
				end):expect()
			end)
			
			if not ok then
				p3("Failed to make request: " .. tostring(status))
				
				return
			elseif status.ok then
				p2()
				
				return
			end
			p3(string.format("Got update user setting HTTP Response: %d - %s", status.status, status.statusText))
		end)
	end,
	updateUserSettings = if require(parent_1.SharedFlags).FFlagLuaAppSduiUpdateUserSettingsAction then function(value, p4) --[[ line: 72 | named "updateUserSettings" ]]
		-- upvalues: userSettingModule (ref), promise (ref), var3 (ref), fetch_1 (ref), httpService (ref), response (ref)
		for i, v in value do
			if not userSettingModule[i] then
				return promise.reject(`Invalid setting name: {i}`)
			end
		end
		local var5 = var3()
		
		return promise.new(function(p5, p6) --[[ line: 80 ]]
			-- upvalues: fetch_1 (copy), var5 (ref), httpService (copy), value (ref), p4 (ref), response (copy)
			local ok, status = pcall(function() --[[ line: 81 ]]
				-- upvalues: fetch_1 (copy), var5 (copy), httpService (copy), value (copy), p4 (copy), response (copy)
				return fetch_1(var5, {
					method = "POST",
					body = httpService:JSONEncode(value),
					headers = {
						["Content-Type"] = "application/json",
						Accept = "application/json",
						["rbx-audit-data"] = p4
					}
				}):catch(function(_) --[[ line: 91 ]]
					-- upvalues: response (copy)
					return response.error()
				end):expect()
			end)
			
			if not ok or not status then
				p6(`Failed to make request: {status}`)
				
				return
			elseif status.ok then
				p5(status)
				
				return
			end
			p6(`Got update user setting HTTP Response: {status.status} - {status.statusText}`)
		end)
	end else nil
}