local playerContextualMenu = script:FindFirstAncestor("PlayerContextualMenu")
local reactModule = require(playerContextualMenu.Parent.React)
local httpRequestContextModule = require(script.Parent.HttpRequest.HttpRequestContext)
local defaultHttpRequestInstanceModule = require(script.Parent.HttpRequest.DefaultHttpRequestInstance)
local playerContextualMenuContainerModule = require(playerContextualMenu.Components.PlayerContextualMenuContainer)

return function(p0)
	-- upvalues: reactModule (ref), httpRequestContextModule (ref), defaultHttpRequestInstanceModule (ref), playerContextualMenuContainerModule (ref)
	return reactModule.createElement(httpRequestContextModule.Provider, {
		value = p0.httpRequest or defaultHttpRequestInstanceModule
	}, {
		app = reactModule.createElement(playerContextualMenuContainerModule, p0)
	})
end