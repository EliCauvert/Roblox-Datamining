local Parent = script:FindFirstAncestor("ServerUI").Parent
local HttpRequestModule = require(Parent.HttpRequest)
local UIConfiguration = require(Parent.Lumberyak).Logger.new(nil, "UIConfiguration")
local RoduxNetworkingModule = require(Parent.RoduxNetworking)
local Url = require(Parent.Http).Url
local UIConfigurationModule = {}
UIConfigurationModule.__index = UIConfigurationModule

function UIConfigurationModule.new(p1)
	-- upvalues: UIConfiguration (copy), HttpRequestModule (copy), RoduxNetworkingModule (copy), UIConfigurationModule (copy)
	local UIConfigurationNetworking = if p1 and p1.enableLogging then UIConfiguration:new("UIConfiguration Networking") else nil
	local config = {
		networking = RoduxNetworkingModule.config({
			keyPath = p1 and p1.roduxKeyPath or "UIConfiguration.NetworkStatus",
			networkImpl = HttpRequestModule.config({
				requestFunction = function(p2, p3, p4)
					-- upvalues: UIConfigurationNetworking (copy), HttpRequestModule (upval)
					if UIConfigurationNetworking then
						UIConfigurationNetworking:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p3, p2))
					end
					return HttpRequestModule.requestFunctions.HttpRbxApi(p2, p3, p4)
				end,
				postRequestFunction = function(p2, p3)
					-- upvalues: UIConfigurationNetworking (copy)
					if UIConfigurationNetworking then
						UIConfigurationNetworking:debug("Returned: {}", string.format("[ requestMethod = %q, url = %q, statusCode = %s, body = %s ]", p3.requestMethod, p3.url, p2.StatusCode, p2.Body))
					end
				end,
				maxRetryCount = p1 and p1.maxRetryCount or 0
			})
		})
	}
	setmetatable(config, UIConfigurationModule)
	
	return config
end

function UIConfigurationModule:fetch(p1, p2)
	-- upvalues: Url (copy)
	return self.networking.GET(script.Name, function(Callback)
		-- upvalues: Url (upval), p1 (copy), p2 (copy)
		return Callback(Url.APIS_URL):path(p1):queryArgs(p2)
	end).API()
end

return UIConfigurationModule