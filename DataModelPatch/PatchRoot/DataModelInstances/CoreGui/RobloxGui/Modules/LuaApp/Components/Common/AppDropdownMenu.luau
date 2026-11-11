local GuiService = game:GetService("GuiService")
local CorePackages = game:GetService("CorePackages")
local ContextActionService = game:GetService("ContextActionService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local FocusNavigationUtilsModule = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseEventMapFunction = require(CorePackages.Packages.ReactFocusNavigation).useEventMap
local UseLastInputMethodFunction = FocusNavigationUtilsModule.useLastInputMethod
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local GetFFlagDisableUADPadNavigationInVRModule = require(Modules.LuaApp.Flags.GetFFlagDisableUADPadNavigationInVR)
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local DropdownMenu = require(CorePackages.Packages.UIBlox).App.Menu.DropdownMenu

return function(p1)
	-- upvalues: UseRoactServiceModule (copy), RoactAnalyticsModule (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), UseEventMapFunction (copy), UseLastInputMethodFunction (copy), GetFFlagDisableUADPadNavigationInVRModule (copy), IsVRAppBuildFunction (copy), GuiService (copy), ContextActionService (copy), CryoModule (copy), DropdownMenu (copy)
	local UseRoactServiceModuleResult = UseRoactServiceModule(RoactAnalyticsModule)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseEventMapResult = UseEventMapFunction(ReactModule.useMemo(function()
		-- upvalues: UseStateResult1 (copy), FocusNavigationEventNameEnum (upval)
		return if UseStateResult1 then {
			[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NoOpEvent,
			[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NoOpEvent
		} else {}
	end, { UseStateResult1 }), UseStateResult2)
	local UseLastInputMethodResult = UseLastInputMethodFunction()
	local Inverted: boolean = if GetFFlagDisableUADPadNavigationInVRModule() then if UseLastInputMethodResult == "Gamepad" then not IsVRAppBuildFunction() else UseLastInputMethodResult == "Keyboard" and not IsVRAppBuildFunction() else UseLastInputMethodResult == "Gamepad" or UseLastInputMethodResult == "Keyboard"
	local UseResult = ReactModule.useCallback(function(MenuOpen)
		-- upvalues: p1 (copy), UseRoactServiceModuleResult (copy)
		if p1.analyticsContext then
			UseRoactServiceModuleResult.EventStream:setRBXEvent(p1.analyticsContext, "DropdownMenuState", { menuOpen = MenuOpen })
		end
	end, { UseRoactServiceModuleResult, p1.analyticsContext })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Selectable = false,
		Size = UDim2.fromScale(1, 1),
		ref = UseEventMapResult
	}, {
		DropdownMenu = ReactModule.createElement(DropdownMenu, (CryoModule.Dictionary.join(p1, {
			selectionOrder = 1,
			onMenuOpenChange = ReactModule.useCallback(function(p2)
				-- upvalues: UseStateResult2_1 (copy), UseResult (copy), UseStateResult2_2 (copy), UseStateResult (copy), p1 (copy), GuiService (upval), ContextActionService (upval), Inverted (copy)
				UseStateResult2_1(p2)
				UseResult(p2)
				UseStateResult2_2(false)
				
				if UseStateResult and p1.selectionGroupName then
					if p2 then
						GuiService:AddSelectionParent(p1.selectionGroupName, UseStateResult)
						ContextActionService:BindAction("CloseDropdownBind", function()
							-- upvalues: UseStateResult2_2 (upval)
							UseStateResult2_2(true)
						end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Escape)
					else
						ContextActionService:UnbindAction("CloseDropdownBind")
						UseStateResult2_2(false)
						GuiService:RemoveSelectionGroup(p1.selectionGroupName)
						
						if Inverted then
							GuiService:Select(UseStateResult)
						end
					end
				end
				if p1.onMenuOpenChange then
					p1.onMenuOpenChange(p2)
				end
			end, {
				UseStateResult,
				p1.selectionGroupName,
				p1.onMenuOpenChange
			}),
			onChange = ReactModule.useCallback(function(p2)
				-- upvalues: p1 (copy), UseRoactServiceModuleResult (copy)
				if p1.analyticsContext then
					UseRoactServiceModuleResult.EventStream:setRBXEvent(p1.analyticsContext, "DropdownMenuSelect", { selection = tostring(p2) })
				end
				return p1.onChange(p2)
			end, {
				UseRoactServiceModuleResult,
				p1.analyticsContext,
				p1.onChange
			}),
			selectionGroupName = CryoModule.None,
			analyticsContext = CryoModule.None,
			isForcedClosed = UseStateResult3
		})))
	})
end