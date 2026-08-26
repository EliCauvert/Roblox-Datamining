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

local function _(p1)
	return p1.X.Offset / p1.Y.Offset < 1.2
end

return function(p1)
	-- upvalues: reactModule (ref), robloxGui (ref), guiService (ref), useEventConnection (ref), viewportUtilModule (ref), foundationModule (ref), avatarSwitcherContainer (ref), serviceModule (ref), constantsModule (ref)
	local windowSize = p1.windowSize
	local var1 = windowSize:get()
	local var2, var3 = reactModule.useState(var1.X.Offset / var1.Y.Offset < 1.2)
	local var4, var5 = reactModule.useState(false)
	local settingsHubModule = require(robloxGui.Modules.Settings.SettingsHub)
	local var6 = reactModule.useCallback(function(p2)
		-- upvalues: guiService (copy), p1 (ref), windowSize (ref), var5 (ref)
		local y = guiService.TopbarInset.Max.Y
		local var7 = if p2.X >= p1.maxWindowWidth then p2.Y - y < p1.maxWindowHeight else true
		
		if var7 then
			windowSize:requestSize(p2.X, p2.Y - y)
		else
			windowSize:requestSize(math.min(p1.maxWindowWidth, p2.X), math.min(p1.maxWindowHeight, p2.Y - y))
		end
		var5(var7)
	end, { windowSize, p1.maxWindowWidth, p1.maxWindowHeight, var4 })
	useEventConnection(guiService:GetPropertyChangedSignal("TopbarInset"), function()
		-- upvalues: var6 (ref), viewportUtilModule (copy)
		var6(viewportUtilModule.screenSize:get())
	end)
	reactModule.useEffect(function()
		-- upvalues: viewportUtilModule (copy), var6 (ref), windowSize (ref), var3 (ref)
		local screenSizeConnection = viewportUtilModule.screenSize:connect(var6)
		local var7 = windowSize:connect(function(p2)
			-- upvalues: var3 (copy)
			var3(p2.X.Offset / p2.Y.Offset < 1.2)
		end)
		var6(viewportUtilModule.screenSize:get())
		
		return function()
			-- upvalues: screenSizeConnection (ref), var7 (ref)
			screenSizeConnection:disconnect()
			var7:disconnect()
		end
	end, { var6 })
	
	return reactModule.createElement(foundationModule.View, {
		tag = `size-full {if var4 then "padding-x-large padding-top-medium padding-bottom-xlarge" else ""}`
	}, {
		AvatarSwitcherContainer = reactModule.createElement(avatarSwitcherContainer, {
			getRespawnBehaviour = settingsHubModule.GetRespawnBehaviour,
			respawnBehaviorChangedEvent = settingsHubModule.RespawnBehaviourChangedEvent,
			toggleWindow = function()
				-- upvalues: serviceModule (copy), constantsModule (copy)
				serviceModule:toggleWindow(constantsModule.AVATAR_SWITCHER_ID)
			end,
			verticalLayout = var2
		})
	})
end