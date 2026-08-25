local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local reactModule = require(corePackagesService.Packages.React)
local useEventConnection = require(corePackagesService.Packages.ReactUtils).useEventConnection
local foundationModule = require(corePackagesService.Packages.Foundation)
local serviceModule = require(chrome.Service)
local viewportUtilModule = require(chrome.ChromeShared.Service.ViewportUtil)
local _ = require(chrome.ChromeShared.Service.WindowSizeSignal)
local constantsModule = require(chrome.ChromeShared.Unibar.Constants)
local avatarSwitcherContainer = require(corePackagesService.Workspace.Packages.AvatarSwitcher).Components.AvatarSwitcherContainer

local function _(p0)
	return p0.X.Offset / p0.Y.Offset < 1.2
end

return function(p1)
	-- upvalues: reactModule (ref), robloxGui (ref), guiService (ref), useEventConnection (ref), viewportUtilModule (ref), foundationModule (ref), avatarSwitcherContainer (ref), serviceModule (ref), constantsModule (ref)
	local windowSize = p1.windowSize
	local var9 = windowSize:get()
	local var10, var11 = reactModule.useState(var9.X.Offset / var9.Y.Offset < 1.2)
	local var12, var13 = reactModule.useState(false)
	local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
	local var15 = reactModule.useCallback(function(p2)
		-- upvalues: guiService (copy), p1 (ref), windowSize (ref), var13 (ref)
		local y = guiService.TopbarInset.Max.Y
		local var16 = if p2.X >= p1.maxWindowWidth then p2.Y - y < p1.maxWindowHeight else true
		
		if var16 then
			windowSize:requestSize(p2.X, p2.Y - y)
		else
			windowSize:requestSize(math.min(p1.maxWindowWidth, p2.X), math.min(p1.maxWindowHeight, p2.Y - y))
		end
		var13(var16)
	end, { windowSize, p1.maxWindowWidth, p1.maxWindowHeight, var12 })
	useEventConnection(guiService:GetPropertyChangedSignal("TopbarInset"), function()
		-- upvalues: var15 (ref), viewportUtilModule (copy)
		var15(viewportUtilModule.screenSize:get())
	end)
	reactModule.useEffect(function()
		-- upvalues: viewportUtilModule (copy), var15 (ref), windowSize (ref), var11 (ref)
		local screenSizeConnection = viewportUtilModule.screenSize:connect(var15)
		local var18 = windowSize:connect(function(p3)
			-- upvalues: var11 (copy)
			var11(p3.X.Offset / p3.Y.Offset < 1.2)
		end)
		var15(viewportUtilModule.screenSize:get())
		
		return function()
			-- upvalues: screenSizeConnection (ref), var18 (ref)
			screenSizeConnection:disconnect()
			var18:disconnect()
		end
	end, { var15 })
	
	return reactModule.createElement(foundationModule.View, {
		tag = `size-full {if var12 then "padding-x-large padding-top-medium padding-bottom-xlarge" else ""}`
	}, {
		AvatarSwitcherContainer = reactModule.createElement(avatarSwitcherContainer, {
			getRespawnBehaviour = settingsHubModule.GetRespawnBehaviour,
			respawnBehaviorChangedEvent = settingsHubModule.RespawnBehaviourChangedEvent,
			toggleWindow = function()
				-- upvalues: serviceModule (copy), constantsModule (copy)
				serviceModule:toggleWindow(constantsModule.AVATAR_SWITCHER_ID)
			end,
			verticalLayout = var10
		})
	})
end