local ChromeShared = script:FindFirstAncestor("ChromeShared")
local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local GamepadConnectorModule = require(ChromeShared.Parent.Parent.TopBar.Components.GamepadConnector)
local ReactModule = require(CorePackages.Packages.React)
local ReactRobloxModule = require(CorePackages.Packages.ReactRoblox)
local ShortcutBar = require(CorePackages.Packages.UIBlox).App.Navigation.ShortcutBar
local _ = require(CorePackages.Workspace.Packages.Chrome)
local ConstantsModule = require(ChromeShared.Unibar.Constants)
local ViewportUtilModule = require(ChromeShared.Service.ViewportUtil)
local UseObservableValueModule = require(ChromeShared.Hooks.useObservableValue)
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local UseDrawerAnimatingFunction = require(CorePackages.Workspace.Packages.Drawer).Hooks.useDrawerAnimating
local ServiceModule = require(ChromeShared.Service)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableConsoleExpControls = SharedFlagsModule.FFlagEnableConsoleExpControls
local IsSpatialFunction = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
local FFlagGamepadIconSupportCheck = SharedFlagsModule.FFlagGamepadIconSupportCheck
local IsSideSheetEnabledModule = require(CorePackages.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local FFlagSideSheetFocusNav = SharedFlagsModule.FFlagSideSheetFocusNav
local FFlagEnableDrawerAnimatingHook = SharedFlagsModule.FFlagEnableDrawerAnimatingHook
local GetSideSheetVisibilityFunction = require(CorePackages.Workspace.Packages.InExperienceSideSheet).getSideSheetVisibility

function ChromeShortcutBar(_) --[[ Line: 34 ]]
	-- upvalues: ReactModule (copy), UseTokensFunction (copy), UseObservableValueModule (copy), ViewportUtilModule (copy), FFlagGamepadIconSupportCheck (copy), GamepadConnectorModule (copy), ServiceModule (copy), UserInputService (copy), IsSpatialFunction (copy), FFlagEnableConsoleExpControls (copy), IsSideSheetEnabledModule (copy), FFlagSideSheetFocusNav (copy), FFlagEnableDrawerAnimatingHook (copy), GetSideSheetVisibilityFunction (copy), UseDrawerAnimatingFunction (copy), ReactRobloxModule (copy), ConstantsModule (copy), ShortcutBar (copy), CoreGui (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState({})
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(false)
	local UseTokensResult = UseTokensFunction()
	local UseObservableValueModuleResult = UseObservableValueModule(ViewportUtilModule.screenSize)
	local UseRefResult = ReactModule.useRef(0)
	
	local function checkOverflow() --[[ Line: 43 ]]
		-- upvalues: UseRefResult (copy), UseObservableValueModuleResult (copy), UseStateResult (copy), UseStateResult2_1 (copy)
		if UseObservableValueModuleResult.X < UseRefResult.current then
			local Index = 1
			
			for i, value in UseStateResult do
				if value.displayPriority <= UseStateResult[Index].displayPriority then
					Index = i
				end
			end
			local Copy = table.clone(UseStateResult)
			table.remove(Copy, Index)
			UseStateResult2_1(Copy)
		end
	end
	
	ReactModule.useEffect(function() --[[ Line: 60 ]]
		-- upvalues: UseStateResult2_1 (copy), checkOverflow (copy)
		UseStateResult2_1({})
		checkOverflow()
	end, { UseObservableValueModuleResult })
	ReactModule.useEffect(function() --[[ Line: 65 ]]
		-- upvalues: FFlagGamepadIconSupportCheck (upval), GamepadConnectorModule (upval), ServiceModule (upval), UseStateResult2 (copy), UseStateResult2_1 (copy), UserInputService (upval), IsSpatialFunction (upval), FFlagEnableConsoleExpControls (upval), UseBindingResult2 (copy)
		local function updateShortcuts() --[[ Line: 66 ]]
			-- upvalues: FFlagGamepadIconSupportCheck (upval), GamepadConnectorModule (upval), ServiceModule (upval), UseStateResult2 (upval), UseStateResult2_1 (upval)
			if not FFlagGamepadIconSupportCheck or GamepadConnectorModule:getGamepadActive():get() then
				UseStateResult2((ServiceModule:getCurrentShortcuts()))
				UseStateResult2_1({})
				
				return
			end
		end
		
		ServiceModule:onShortcutBarChanged():connect(updateShortcuts)
		
		if FFlagGamepadIconSupportCheck then
			UserInputService.LastInputTypeChanged:Connect(updateShortcuts)
		end
		if not IsSpatialFunction() then
			local ShowTopBar = GamepadConnectorModule:getShowTopBar()
			local GamepadActive = GamepadConnectorModule:getGamepadActive()
			
			if FFlagEnableConsoleExpControls then
				local function shouldHideShortcutBar() --[[ Line: 85 ]]
					-- upvalues: ShowTopBar (copy), GamepadActive (copy), ServiceModule (upval)
					ServiceModule:setHideShortcutBar("TopBar", not ShowTopBar:get() or not GamepadActive:get())
				end
				
				ServiceModule:setHideShortcutBar("TopBar", not ShowTopBar:get() or not GamepadActive:get())
				ShowTopBar:connect(shouldHideShortcutBar)
				GamepadActive:connect(shouldHideShortcutBar)
				
				return
			else
				local function shouldShowShortcutBar() --[[ Line: 93 ]]
					-- upvalues: ShowTopBar (copy), GamepadActive (copy), UseBindingResult2 (upval)
					UseBindingResult2(ShowTopBar:get() and GamepadActive:get())
				end
				
				ShowTopBar:connect(shouldShowShortcutBar)
				GamepadActive:connect(shouldShowShortcutBar)
			end
		end
	end, {})
	
	if IsSideSheetEnabledModule and FFlagSideSheetFocusNav and FFlagEnableDrawerAnimatingHook then
		local SideSheetVisibility = GetSideSheetVisibilityFunction(false)
		local UseDrawerAnimatingResult = UseDrawerAnimatingFunction()
		ReactModule.useEffect(function() --[[ Line: 110 ]]
			-- upvalues: ServiceModule (upval), SideSheetVisibility (copy), UseDrawerAnimatingResult (copy)
			ServiceModule:setHideShortcutBar("SideSheet", SideSheetVisibility or UseDrawerAnimatingResult)
		end, { SideSheetVisibility, UseDrawerAnimatingResult })
	end
	local Items = {}
	
	for _, value in if #UseStateResult1 > 0 then UseStateResult1 else UseStateResult do
		if value.label then
			local config = { icon = "", text = "" }
			
			if value.icon then
				config.icon = value.icon
			end
			config.text = value.label
			table.insert(Items, config)
		end
	end
	return ReactRobloxModule.createPortal({
		Name = ReactModule.createElement("ScreenGui", {
			Name = "ShortcutBar",
			DisplayOrder = ConstantsModule.SHORTCUTBAR_DISPLAYORDER,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			Enabled = if FFlagEnableConsoleExpControls then nil else UseBindingResult
		}, {
			ReactModule.createElement("Frame", {
				Name = "ShortcutBarWrapper",
				AutomaticSize = Enum.AutomaticSize.XY,
				Position = UDim2.new(0.5, 0, 1, if UseTokensResult then -UseTokensResult.Gap.Medium else 0),
				AnchorPoint = Vector2.new(0.5, 1),
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				[ReactModule.Change.AbsoluteSize] = function(Frame) --[[ Line: 145 ]]
					-- upvalues: UseRefResult (copy), checkOverflow (copy)
					UseRefResult.current = Frame.AbsoluteSize.X
					checkOverflow()
				end
			}, {
				Layout = ReactModule.createElement("UIListLayout"),
				ReactModule.createElement(ShortcutBar, { items = Items })
			})
		})
	}, CoreGui)
end

return ChromeShortcutBar