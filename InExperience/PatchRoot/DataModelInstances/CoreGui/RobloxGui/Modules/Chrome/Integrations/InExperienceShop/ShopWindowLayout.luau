local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local serviceModule = require(chrome.Service)
local viewportUtilModule = require(chrome.ChromeShared.Service.ViewportUtil)
local constantsModule = require(chrome.ChromeShared.Unibar.Constants)
local fFlagCenterInExperienceShopWindow = require(corePackagesService.Workspace.Packages.InExperienceShop).FFlagCenterInExperienceShopWindow
local var1 = false

local function getCenteredShopWindowPosition()
	-- upvalues: viewportUtilModule (ref), guiService (ref)
	local var2 = viewportUtilModule.screenSize:get()
	local y = guiService.TopbarInset.Max.Y
	local var3 = var2.Y - y
	local var4 = if var2.X >= 844 then var3 < 754 else true
	
	return UDim2.fromOffset((var2.X - (if var4 then var2.X else math.min(844, var2.X))) / 2, y + (var3 - (if var4 then var3 else math.min(754, var3))) / 2)
end

local function _()
	-- upvalues: fFlagCenterInExperienceShopWindow (ref), var1 (write), serviceModule (ref), constantsModule (ref), getCenteredShopWindowPosition (ref)
	if fFlagCenterInExperienceShopWindow and not var1 then
		serviceModule:updateWindowPosition(constantsModule.IN_EXPERIENCE_SHOP_ID, getCenteredShopWindowPosition())
		var1 = true
		
		return
	end
end

return {
	MAX_WINDOW_WIDTH = 844,
	MAX_WINDOW_HEIGHT = 754,
	getCenteredShopWindowPosition = getCenteredShopWindowPosition,
	getStartingWindowPosition = function()
		-- upvalues: fFlagCenterInExperienceShopWindow (ref), getCenteredShopWindowPosition (ref)
		return if fFlagCenterInExperienceShopWindow then getCenteredShopWindowPosition() else nil
	end,
	toggleInExperienceShopWindow = function()
		-- upvalues: serviceModule (ref), constantsModule (ref), fFlagCenterInExperienceShopWindow (ref), var1 (write), getCenteredShopWindowPosition (ref)
		if not serviceModule:isWindowOpen(constantsModule.IN_EXPERIENCE_SHOP_ID) and fFlagCenterInExperienceShopWindow and not var1 then
			serviceModule:updateWindowPosition(constantsModule.IN_EXPERIENCE_SHOP_ID, getCenteredShopWindowPosition())
			var1 = true
		end
		serviceModule:toggleWindow(constantsModule.IN_EXPERIENCE_SHOP_ID)
	end
}