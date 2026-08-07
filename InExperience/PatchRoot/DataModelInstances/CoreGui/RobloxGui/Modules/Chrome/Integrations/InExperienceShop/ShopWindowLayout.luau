local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local serviceModule = require(chrome.Service)
local viewportUtilModule = require(chrome.ChromeShared.Service.ViewportUtil)
local constantsModule = require(chrome.ChromeShared.Unibar.Constants)
local fFlagCenterInExperienceShopWindow = require(corePackagesService.Workspace.Packages.InExperienceShop).FFlagCenterInExperienceShopWindow
local var6 = false

local function getCenteredShopWindowPosition() --[[ line: 20 ]]
	-- upvalues: viewportUtilModule (ref), guiService (ref)
	local var8 = viewportUtilModule.screenSize:get()
	local y = guiService.TopbarInset.Max.Y
	local var9 = var8.Y - y
	local var10 = if var8.X >= 844 then var9 < 754 else true
	
	return UDim2.fromOffset((var8.X - (if var10 then var8.X else math.min(844, var8.X))) / 2, y + (var9 - (if var10 then var9 else math.min(754, var9))) / 2)
end

local function _() --[[ line: 34 | named "applyInitialWindowPositionIfNeeded" ]]
	-- upvalues: fFlagCenterInExperienceShopWindow (ref), var6 (write), serviceModule (ref), constantsModule (ref), getCenteredShopWindowPosition (ref)
	if fFlagCenterInExperienceShopWindow and not var6 then
		serviceModule:updateWindowPosition(constantsModule.IN_EXPERIENCE_SHOP_ID, getCenteredShopWindowPosition())
		var6 = true
		
		return
	end
end

return {
	MAX_WINDOW_WIDTH = 844,
	MAX_WINDOW_HEIGHT = 754,
	getCenteredShopWindowPosition = getCenteredShopWindowPosition,
	getStartingWindowPosition = function() --[[ line: 42 ]]
		-- upvalues: fFlagCenterInExperienceShopWindow (ref), getCenteredShopWindowPosition (ref)
		return if fFlagCenterInExperienceShopWindow then getCenteredShopWindowPosition() else nil
	end,
	toggleInExperienceShopWindow = function() --[[ line: 49 ]]
		-- upvalues: serviceModule (ref), constantsModule (ref), fFlagCenterInExperienceShopWindow (ref), var6 (write), getCenteredShopWindowPosition (ref)
		if not serviceModule:isWindowOpen(constantsModule.IN_EXPERIENCE_SHOP_ID) and fFlagCenterInExperienceShopWindow and not var6 then
			serviceModule:updateWindowPosition(constantsModule.IN_EXPERIENCE_SHOP_ID, getCenteredShopWindowPosition())
			var6 = true
		end
		serviceModule:toggleWindow(constantsModule.IN_EXPERIENCE_SHOP_ID)
	end
}