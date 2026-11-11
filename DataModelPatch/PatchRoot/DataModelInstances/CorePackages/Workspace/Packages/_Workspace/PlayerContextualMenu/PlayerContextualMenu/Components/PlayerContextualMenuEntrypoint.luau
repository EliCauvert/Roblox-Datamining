local PlayerContextualMenu = script:FindFirstAncestor("PlayerContextualMenu")
local ReactModule = require(PlayerContextualMenu.Parent.React)
local HttpRequestContextModule = require(script.Parent.HttpRequest.HttpRequestContext)
local DefaultHttpRequestInstanceModule = require(script.Parent.HttpRequest.DefaultHttpRequestInstance)
local PlayerContextualMenuContainerModule = require(PlayerContextualMenu.Components.PlayerContextualMenuContainer)

return function(p1)
	-- upvalues: ReactModule (copy), HttpRequestContextModule (copy), DefaultHttpRequestInstanceModule (copy), PlayerContextualMenuContainerModule (copy)
	return ReactModule.createElement(HttpRequestContextModule.Provider, {
		value = p1.httpRequest or DefaultHttpRequestInstanceModule
	}, {
		app = ReactModule.createElement(PlayerContextualMenuContainerModule, p1)
	})
end