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

return function(p0) --[[ line: 23 | named "ShopChromeWrapper" ]]
	-- upvalues: reactModule (ref), guiService (ref), useEventConnection (ref), viewportUtilModule (ref), serviceModule (ref), constantsModule (ref), shopContainer (ref)
	local windowSize = p0.windowSize
	local var7, var8 = reactModule.useState(false)
	local var9 = reactModule.useCallback(function(p1) --[[ line: 27 ]]
		-- upvalues: guiService (copy), p0 (ref), windowSize (ref), var8 (ref)
		local y = guiService.TopbarInset.Max.Y
		local var10 = if p1.X >= p0.maxWindowWidth then p1.Y - y < p0.maxWindowHeight else true
		
		if var10 then
			windowSize:requestSize(p1.X, p1.Y - y)
		else
			windowSize:requestSize(math.min(p0.maxWindowWidth, p1.X), math.min(p0.maxWindowHeight, p1.Y - y))
		end
		var8(var10)
	end, { windowSize, p0.maxWindowWidth, p0.maxWindowHeight })
	useEventConnection(guiService:GetPropertyChangedSignal("TopbarInset"), function() --[[ line: 42 ]]
		-- upvalues: var9 (ref), viewportUtilModule (copy)
		var9(viewportUtilModule.screenSize:get())
	end)
	reactModule.useEffect(function() --[[ line: 46 ]]
		-- upvalues: viewportUtilModule (copy), var9 (ref)
		local screenSizeConnection = viewportUtilModule.screenSize:connect(var9)
		var9(viewportUtilModule.screenSize:get())
		
		return function() --[[ line: 49 ]]
			-- upvalues: screenSizeConnection (ref)
			screenSizeConnection:disconnect()
		end
	end, { var9 })
	
	return reactModule.createElement(shopContainer, {
		fullScreen = var7,
		toggleWindow = reactModule.useCallback(function() --[[ line: 54 ]]
			-- upvalues: serviceModule (copy), constantsModule (copy)
			serviceModule:toggleWindow(constantsModule.IN_EXPERIENCE_SHOP_ID)
		end, {})
	})
end