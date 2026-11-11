local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local ReactModule = require(CorePackages.Packages.React)
local UseEventConnectionFunction = require(CorePackages.Packages.ReactUtils).useEventConnection
local FoundationModule = require(CorePackages.Packages.Foundation)
local ServiceModule = require(Chrome.Service)
local ViewportUtilModule = require(Chrome.ChromeShared.Service.ViewportUtil)
local _ = require(Chrome.ChromeShared.Service.WindowSizeSignal)
local ConstantsModule = require(Chrome.ChromeShared.Unibar.Constants)
local AvatarSwitcherContainer = require(CorePackages.Workspace.Packages.AvatarSwitcher).Components.AvatarSwitcherContainer

local function _(Vector): boolean
	return Vector.X.Offset / Vector.Y.Offset < 1.2
end

return function(p1)
	-- upvalues: ReactModule (copy), RobloxGui (copy), GuiService (copy), UseEventConnectionFunction (copy), ViewportUtilModule (copy), FoundationModule (copy), AvatarSwitcherContainer (copy), ServiceModule (copy), ConstantsModule (copy)
	local WindowSize = p1.windowSize
	local GetResult = WindowSize:get()
	local UseStateResult, UseStateResult2 = ReactModule.useState(GetResult.X.Offset / GetResult.Y.Offset < 1.2)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local SettingsHubModule = require(RobloxGui.Modules.Settings.SettingsHub)
	local UseResult = ReactModule.useCallback(function(Vector)
		-- upvalues: GuiService (upval), p1 (copy), WindowSize (copy), UseStateResult2_1 (copy)
		local Y = GuiService.TopbarInset.Max.Y
		local IsXBelow: boolean = Vector.X < p1.maxWindowWidth or Vector.Y - Y < p1.maxWindowHeight
		
		if IsXBelow then
			WindowSize:requestSize(Vector.X, Vector.Y - Y)
		else
			WindowSize:requestSize(math.min(p1.maxWindowWidth, Vector.X), (math.min(p1.maxWindowHeight, Vector.Y - Y)))
		end
		UseStateResult2_1(IsXBelow)
	end, {
		WindowSize,
		p1.maxWindowWidth,
		p1.maxWindowHeight,
		UseStateResult1
	})
	UseEventConnectionFunction(GuiService:GetPropertyChangedSignal("TopbarInset"), function()
		-- upvalues: UseResult (copy), ViewportUtilModule (upval)
		UseResult(ViewportUtilModule.screenSize:get())
	end)
	ReactModule.useEffect(function()
		-- upvalues: ViewportUtilModule (upval), UseResult (copy), WindowSize (copy), UseStateResult2 (copy)
		local ScreenSizeConnection = ViewportUtilModule.screenSize:connect(UseResult)
		local Connection = WindowSize:connect(function(Vector)
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(Vector.X.Offset / Vector.Y.Offset < 1.2)
		end)
		UseResult(ViewportUtilModule.screenSize:get())
		
		return function()
			-- upvalues: ScreenSizeConnection (copy), Connection (copy)
			ScreenSizeConnection:disconnect()
			Connection:disconnect()
		end
	end, { UseResult })
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = `size-full {if UseStateResult1 then "padding-x-large padding-top-medium padding-bottom-xlarge" else ""}`
	}, {
		AvatarSwitcherContainer = ReactModule.createElement(AvatarSwitcherContainer, {
			getRespawnBehaviour = SettingsHubModule.GetRespawnBehaviour,
			respawnBehaviorChangedEvent = SettingsHubModule.RespawnBehaviourChangedEvent,
			toggleWindow = function()
				-- upvalues: ServiceModule (upval), ConstantsModule (upval)
				ServiceModule:toggleWindow(ConstantsModule.AVATAR_SWITCHER_ID)
			end,
			verticalLayout = UseStateResult
		})
	})
end