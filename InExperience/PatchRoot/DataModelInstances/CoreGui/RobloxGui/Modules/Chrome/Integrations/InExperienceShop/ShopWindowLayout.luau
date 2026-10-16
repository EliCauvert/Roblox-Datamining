local Chrome = script:FindFirstAncestor("Chrome")
local GuiService = game:GetService("GuiService")
local ServiceModule = require(Chrome.Service)
local ViewportUtilModule = require(Chrome.ChromeShared.Service.ViewportUtil)
local ConstantsModule = require(Chrome.ChromeShared.Unibar.Constants)
local FFlagCenterInExperienceShopWindow = require(game:GetService("CorePackages").Workspace.Packages.InExperienceShop).FFlagCenterInExperienceShopWindow
local Flag = false

local function getCenteredShopWindowPosition(): UDim2 --[[ Line: 20 ]]
	-- upvalues: ViewportUtilModule (copy), GuiService (copy)
	local GetResult = ViewportUtilModule.screenSize:get()
	local Y = GuiService.TopbarInset.Max.Y
	local YDelta = GetResult.Y - Y
	local IsXBelow: boolean = GetResult.X < 844 or YDelta < 754
	
	return UDim2.fromOffset((GetResult.X - (if IsXBelow then GetResult.X else math.min(844, GetResult.X))) / 2, Y + (YDelta - (if IsXBelow then YDelta else math.min(754, YDelta))) / 2)
end

local function _() --[[ Line: 34 | Named "applyInitialWindowPositionIfNeeded" ]]
	-- upvalues: FFlagCenterInExperienceShopWindow (copy), Flag (ref), ServiceModule (copy), ConstantsModule (copy), getCenteredShopWindowPosition (copy)
	if FFlagCenterInExperienceShopWindow and not Flag then
		ServiceModule:updateWindowPosition(ConstantsModule.IN_EXPERIENCE_SHOP_ID, getCenteredShopWindowPosition())
		Flag = true
		
		return
	end
end

return {
	MAX_WINDOW_WIDTH = 844,
	MAX_WINDOW_HEIGHT = 754,
	getCenteredShopWindowPosition = getCenteredShopWindowPosition,
	getStartingWindowPosition = function() --[[ Line: 42 ]]
		-- upvalues: FFlagCenterInExperienceShopWindow (copy), getCenteredShopWindowPosition (copy)
		return if FFlagCenterInExperienceShopWindow then getCenteredShopWindowPosition() else nil
	end,
	toggleInExperienceShopWindow = function() --[[ Line: 49 ]]
		-- upvalues: ServiceModule (copy), ConstantsModule (copy), FFlagCenterInExperienceShopWindow (copy), Flag (ref), getCenteredShopWindowPosition (copy)
		if not ServiceModule:isWindowOpen(ConstantsModule.IN_EXPERIENCE_SHOP_ID) and FFlagCenterInExperienceShopWindow and not Flag then
			ServiceModule:updateWindowPosition(ConstantsModule.IN_EXPERIENCE_SHOP_ID, getCenteredShopWindowPosition())
			Flag = true
		end
		ServiceModule:toggleWindow(ConstantsModule.IN_EXPERIENCE_SHOP_ID)
	end
}