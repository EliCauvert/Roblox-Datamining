local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local reactModule = require(corePackagesService.Packages.React)
local useEventConnection = require(corePackagesService.Packages.ReactUtils).useEventConnection
local serviceModule = require(chrome.Service)
local viewportUtilModule = require(chrome.ChromeShared.Service.ViewportUtil)
local _ = require(chrome.ChromeShared.Service.WindowSizeSignal)
local constantsModule = require(chrome.ChromeShared.Unibar.Constants)
local shopContainer = require(corePackagesService.Workspace.Packages.InExperienceShop).ShopContainer

return function(p1)
	-- upvalues: reactModule (ref), guiService (ref), useEventConnection (ref), viewportUtilModule (ref), serviceModule (ref), constantsModule (ref), shopContainer (ref)
	local windowSize = p1.windowSize
	local var1, var2 = reactModule.useState(false)
	local var3 = reactModule.useCallback(function(p2)
		-- upvalues: guiService (copy), p1 (ref), windowSize (ref), var2 (ref)
		local y = guiService.TopbarInset.Max.Y
		local var4 = if p2.X >= p1.maxWindowWidth then p2.Y - y < p1.maxWindowHeight else true
		
		if var4 then
			windowSize:requestSize(p2.X, p2.Y - y)
		else
			windowSize:requestSize(math.min(p1.maxWindowWidth, p2.X), math.min(p1.maxWindowHeight, p2.Y - y))
		end
		var2(var4)
	end, { windowSize, p1.maxWindowWidth, p1.maxWindowHeight })
	useEventConnection(guiService:GetPropertyChangedSignal("TopbarInset"), function()
		-- upvalues: var3 (ref), viewportUtilModule (copy)
		var3(viewportUtilModule.screenSize:get())
	end)
	reactModule.useEffect(function()
		-- upvalues: viewportUtilModule (copy), var3 (ref)
		local screenSizeConnection = viewportUtilModule.screenSize:connect(var3)
		var3(viewportUtilModule.screenSize:get())
		
		return function()
			-- upvalues: screenSizeConnection (ref)
			screenSizeConnection:disconnect()
		end
	end, { var3 })
	
	return reactModule.createElement(shopContainer, {
		fullScreen = var1,
		toggleWindow = reactModule.useCallback(function()
			-- upvalues: serviceModule (copy), constantsModule (copy)
			serviceModule:toggleWindow(constantsModule.IN_EXPERIENCE_SHOP_ID)
		end, {})
	})
end