local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local ReactModule = require(CorePackages.Packages.React)
local SignalsModule = require(CorePackages.Packages.Signals)
local UseEventConnectionFunction = require(CorePackages.Packages.ReactUtils).useEventConnection
local FoundationModule = require(CorePackages.Packages.Foundation)
local ServiceModule = require(Chrome.Service)
local ViewportUtilModule = require(Chrome.ChromeShared.Service.ViewportUtil)
local CloseWindowBesideSideSheetModule = require(Chrome.Integrations.closeWindowBesideSideSheet)
local _ = require(Chrome.ChromeShared.Service.WindowSizeSignal)
local ConstantsModule = require(Chrome.ChromeShared.Unibar.Constants)
local InExperienceSideSheetModule = require(CorePackages.Workspace.Packages.InExperienceSideSheet)
local FFlagKeepSideSheetOpenBesideMenu = InExperienceSideSheetModule.Flags.FFlagKeepSideSheetOpenBesideMenu
local AvatarSwitcherContainer = require(CorePackages.Workspace.Packages.AvatarSwitcher).Components.AvatarSwitcherContainer
local FFlagAvatarWorkshopReplacesAvatarSwitcher = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAvatarWorkshopReplacesAvatarSwitcher
local AvatarWorkshopWindow = if FFlagAvatarWorkshopReplacesAvatarSwitcher then require(CorePackages.Workspace.Packages.AvatarWorkshop).Components.AvatarWorkshopWindow else nil

local function _(Vector): boolean
	return Vector.X.Offset / Vector.Y.Offset < 1.2
end

return function(p1)
	-- upvalues: ReactModule (copy), RobloxGui (copy), GuiService (copy), FFlagKeepSideSheetOpenBesideMenu (copy), InExperienceSideSheetModule (copy), UseEventConnectionFunction (copy), ViewportUtilModule (copy), SignalsModule (copy), FFlagAvatarWorkshopReplacesAvatarSwitcher (copy), AvatarWorkshopWindow (copy), FoundationModule (copy), CloseWindowBesideSideSheetModule (copy), ConstantsModule (copy), ServiceModule (copy), AvatarSwitcherContainer (copy)
	local WindowSize = p1.windowSize
	local GetResult = WindowSize:get()
	local UseStateResult, UseStateResult2 = ReactModule.useState(GetResult.X.Offset / GetResult.Y.Offset < 1.2)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local SettingsHubModule = require(RobloxGui.Modules.Settings.SettingsHub)
	local UseResult = ReactModule.useCallback(function(Vector)
		-- upvalues: GuiService (upval), FFlagKeepSideSheetOpenBesideMenu (upval), InExperienceSideSheetModule (upval), WindowSize (copy), UseStateResult2_1 (copy), p1 (copy)
		local Y = GuiService.TopbarInset.Max.Y
		
		if FFlagKeepSideSheetOpenBesideMenu then
			local BesideSideSheetWindowArea = InExperienceSideSheetModule.getBesideSideSheetWindowArea()
			
			if BesideSideSheetWindowArea then
				WindowSize:requestSize(BesideSideSheetWindowArea.size.X, BesideSideSheetWindowArea.size.Y, true)
				UseStateResult2_1(false)
				
				return
			end
		end
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
		-- upvalues: ViewportUtilModule (upval), UseResult (copy), WindowSize (copy), UseStateResult2 (copy), FFlagKeepSideSheetOpenBesideMenu (upval), SignalsModule (upval), InExperienceSideSheetModule (upval)
		local ScreenSizeConnection = ViewportUtilModule.screenSize:connect(UseResult)
		local Connection = WindowSize:connect(function(Vector)
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(Vector.X.Offset / Vector.Y.Offset < 1.2)
		end)
		local Callback = nil
		
		if FFlagKeepSideSheetOpenBesideMenu then
			Callback = SignalsModule.createEffect(function(p2)
				-- upvalues: InExperienceSideSheetModule (upval), UseResult (upval), ViewportUtilModule (upval)
				InExperienceSideSheetModule.getBesideSideSheetWindowArea(p2)
				UseResult(ViewportUtilModule.screenSize:get())
			end)
		else
			UseResult(ViewportUtilModule.screenSize:get())
		end
		return function()
			-- upvalues: ScreenSizeConnection (copy), Connection (copy), FFlagKeepSideSheetOpenBesideMenu (upval), Callback (ref)
			ScreenSizeConnection:disconnect()
			Connection:disconnect()
			
			if FFlagKeepSideSheetOpenBesideMenu and Callback then
				Callback()
			end
		end
	end, { UseResult })
	
	return if FFlagAvatarWorkshopReplacesAvatarSwitcher and AvatarWorkshopWindow then ReactModule.createElement(FoundationModule.View, {
		tag = {
			["size-full"] = true,
			["padding-x-large padding-bottom-xlarge padding-top-medium"] = UseStateResult1
		}
	}, {
		AvatarWorkshopWindow = ReactModule.createElement(AvatarWorkshopWindow, {
			verticalLayout = UseStateResult,
			onClose = function()
				-- upvalues: FFlagKeepSideSheetOpenBesideMenu (upval), CloseWindowBesideSideSheetModule (upval), ConstantsModule (upval), ServiceModule (upval)
				if FFlagKeepSideSheetOpenBesideMenu then
					CloseWindowBesideSideSheetModule(ConstantsModule.AVATAR_SWITCHER_ID)
					
					return
				else
					ServiceModule:toggleWindow(ConstantsModule.AVATAR_SWITCHER_ID)
				end
			end
		})
	}) else ReactModule.createElement(FoundationModule.View, {
		tag = `size-full {if UseStateResult1 then "padding-x-large padding-top-medium padding-bottom-xlarge" else ""}`
	}, {
		AvatarSwitcherContainer = ReactModule.createElement(AvatarSwitcherContainer, {
			getRespawnBehaviour = SettingsHubModule.GetRespawnBehaviour,
			respawnBehaviorChangedEvent = SettingsHubModule.RespawnBehaviourChangedEvent,
			toggleWindow = function()
				-- upvalues: FFlagKeepSideSheetOpenBesideMenu (upval), CloseWindowBesideSideSheetModule (upval), ConstantsModule (upval), ServiceModule (upval)
				if FFlagKeepSideSheetOpenBesideMenu then
					CloseWindowBesideSideSheetModule(ConstantsModule.AVATAR_SWITCHER_ID)
					
					return
				else
					ServiceModule:toggleWindow(ConstantsModule.AVATAR_SWITCHER_ID)
				end
			end,
			verticalLayout = UseStateResult
		})
	})
end