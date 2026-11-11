local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local ReactModule = require(CorePackages.Packages.React)
local UseEventConnectionFunction = require(CorePackages.Packages.ReactUtils).useEventConnection
local ServiceModule = require(Chrome.Service)
local ViewportUtilModule = require(Chrome.ChromeShared.Service.ViewportUtil)
local _ = require(Chrome.ChromeShared.Service.WindowSizeSignal)
local ConstantsModule = require(Chrome.ChromeShared.Unibar.Constants)
local ShopContainer = require(CorePackages.Workspace.Packages.InExperienceShop).ShopContainer

return function(p1)
	-- upvalues: ReactModule (copy), GuiService (copy), UseEventConnectionFunction (copy), ViewportUtilModule (copy), ServiceModule (copy), ConstantsModule (copy), ShopContainer (copy)
	local WindowSize = p1.windowSize
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(function(Vector)
		-- upvalues: GuiService (upval), p1 (copy), WindowSize (copy), UseStateResult2 (copy)
		local Y = GuiService.TopbarInset.Max.Y
		local IsXBelow: boolean = Vector.X < p1.maxWindowWidth or Vector.Y - Y < p1.maxWindowHeight
		
		if IsXBelow then
			WindowSize:requestSize(Vector.X, Vector.Y - Y)
		else
			WindowSize:requestSize(math.min(p1.maxWindowWidth, Vector.X), (math.min(p1.maxWindowHeight, Vector.Y - Y)))
		end
		UseStateResult2(IsXBelow)
	end, { WindowSize, p1.maxWindowWidth, p1.maxWindowHeight })
	UseEventConnectionFunction(GuiService:GetPropertyChangedSignal("TopbarInset"), function()
		-- upvalues: UseResult (copy), ViewportUtilModule (upval)
		UseResult(ViewportUtilModule.screenSize:get())
	end)
	ReactModule.useEffect(function()
		-- upvalues: ViewportUtilModule (upval), UseResult (copy)
		local ScreenSizeConnection = ViewportUtilModule.screenSize:connect(UseResult)
		UseResult(ViewportUtilModule.screenSize:get())
		
		return function()
			-- upvalues: ScreenSizeConnection (copy)
			ScreenSizeConnection:disconnect()
		end
	end, { UseResult })
	
	return ReactModule.createElement(ShopContainer, {
		fullScreen = UseStateResult,
		toggleWindow = ReactModule.useCallback(function()
			-- upvalues: ServiceModule (upval), ConstantsModule (upval)
			ServiceModule:toggleWindow(ConstantsModule.IN_EXPERIENCE_SHOP_ID)
		end, {})
	})
end