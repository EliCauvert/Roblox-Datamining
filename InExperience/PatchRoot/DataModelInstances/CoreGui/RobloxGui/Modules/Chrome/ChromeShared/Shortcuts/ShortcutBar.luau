local chromeShared = script:FindFirstAncestor("ChromeShared")
local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")
local gamepadConnectorModule = require(chromeShared.Parent.Parent.TopBar.Components.GamepadConnector)
local reactModule = require(corePackagesService.Packages.React)
local reactRobloxModule = require(corePackagesService.Packages.ReactRoblox)
local foundationModule = require(corePackagesService.Packages.Foundation)
local shortcutBar = require(corePackagesService.Packages.UIBlox).App.Navigation.ShortcutBar
local _ = require(corePackagesService.Workspace.Packages.Chrome)
local constantsModule = require(chromeShared.Unibar.Constants)
local viewportUtilModule = require(chromeShared.Service.ViewportUtil)
local useObservableValueModule = require(chromeShared.Hooks.useObservableValue)
local useTokens = foundationModule.Hooks.useTokens
local useDrawerAnimating = require(corePackagesService.Workspace.Packages.Drawer).Hooks.useDrawerAnimating
local serviceModule = require(chromeShared.Service)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local isSpatial = require(corePackagesService.Workspace.Packages.AppCommonLib).isSpatial
local fFlagGamepadIconSupportCheck = sharedFlagsModule.FFlagGamepadIconSupportCheck
local fFlagEnableSideSheet = sharedFlagsModule.FFlagEnableSideSheet
local fFlagSideSheetFocusNav = sharedFlagsModule.FFlagSideSheetFocusNav
local fFlagEnableDrawerAnimatingHook = sharedFlagsModule.FFlagEnableDrawerAnimatingHook
local getSideSheetVisibility = require(corePackagesService.Workspace.Packages.InExperienceSideSheet).getSideSheetVisibility

function ChromeShortcutBar(_)
	-- upvalues: reactModule (ref), useTokens (ref), useObservableValueModule (ref), viewportUtilModule (ref), fFlagGamepadIconSupportCheck (ref), gamepadConnectorModule (ref), serviceModule (ref), userInputService (ref), isSpatial (ref), fFlagEnableConsoleExpControls (ref), fFlagEnableSideSheet (ref), fFlagSideSheetFocusNav (ref), fFlagEnableDrawerAnimatingHook (ref), getSideSheetVisibility (ref), useDrawerAnimating (ref), reactRobloxModule (ref), constantsModule (ref), shortcutBar (ref), coreGuiService (ref)
	local var1, var2 = reactModule.useState({})
	local var3, var4 = reactModule.useState({})
	local var5, var6 = reactModule.useBinding(false)
	local var7 = useTokens()
	local var8 = useObservableValueModule(viewportUtilModule.screenSize)
	local var9 = reactModule.useRef(0)
	
	local function checkOverflow()
		-- upvalues: var9 (ref), var8 (ref), var1 (ref), var4 (ref)
		if var8.X < var9.current then
			local var10 = 1
			
			for i, v in var1 do
				if v.displayPriority <= var1[var10].displayPriority then
					var10 = i
				end
			end
			local cloned = table.clone(var1)
			table.remove(cloned, var10)
			var4(cloned)
		end
	end
	
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), checkOverflow (ref)
		var4({})
		checkOverflow()
	end, { var8 })
	reactModule.useEffect(function()
		-- upvalues: fFlagGamepadIconSupportCheck (copy), gamepadConnectorModule (copy), serviceModule (copy), var2 (ref), var4 (ref), userInputService (copy), isSpatial (copy), fFlagEnableConsoleExpControls (copy), var6 (ref)
		local function updateShortcuts()
			-- upvalues: fFlagGamepadIconSupportCheck (copy), gamepadConnectorModule (copy), serviceModule (copy), var2 (copy), var4 (copy)
			if fFlagGamepadIconSupportCheck and not gamepadConnectorModule:getGamepadActive():get() then
				return
			end
			var2(serviceModule:getCurrentShortcuts())
			var4({})
		end
		
		serviceModule:onShortcutBarChanged():connect(updateShortcuts)
		
		if fFlagGamepadIconSupportCheck then
			userInputService.LastInputTypeChanged:Connect(updateShortcuts)
		end
		if not isSpatial() then
			local showTopBar = gamepadConnectorModule:getShowTopBar()
			local gamepadActive = gamepadConnectorModule:getGamepadActive()
			
			if fFlagEnableConsoleExpControls then
				local function shouldHideShortcutBar()
					-- upvalues: showTopBar (ref), gamepadActive (ref), serviceModule (copy)
					serviceModule:setHideShortcutBar("TopBar", not showTopBar:get() or not gamepadActive:get())
				end
				
				serviceModule:setHideShortcutBar("TopBar", not showTopBar:get() or not gamepadActive:get())
				showTopBar:connect(shouldHideShortcutBar)
				gamepadActive:connect(shouldHideShortcutBar)
				
				return
			end
			local function shouldShowShortcutBar()
				-- upvalues: showTopBar (ref), gamepadActive (ref), var6 (copy)
				var6(showTopBar:get() and gamepadActive:get())
			end
			
			showTopBar:connect(shouldShowShortcutBar)
			gamepadActive:connect(shouldShowShortcutBar)
		end
	end, {})
	
	if fFlagEnableSideSheet and fFlagSideSheetFocusNav and fFlagEnableDrawerAnimatingHook then
		local var11 = getSideSheetVisibility(false)
		local var12 = useDrawerAnimating()
		reactModule.useEffect(function()
			-- upvalues: serviceModule (copy), var11 (ref), var12 (ref)
			serviceModule:setHideShortcutBar("SideSheet", var11 or var12)
		end, { var11, var12 })
	end
	local t = {}
	
	for i, v in if #var3 > 0 then var3 else var1 do
		if v.label then
			local t_1 = { icon = "", text = "" }
			
			if v.icon then
				t_1.icon = v.icon
			end
			t_1.text = v.label
			table.insert(t, t_1)
		end
	end
	return reactRobloxModule.createPortal({
		Name = reactModule.createElement("ScreenGui", {
			Name = "ShortcutBar",
			DisplayOrder = constantsModule.SHORTCUTBAR_DISPLAYORDER,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			Enabled = if fFlagEnableConsoleExpControls then nil else var5
		}, {
			reactModule.createElement("Frame", {
				Name = "ShortcutBarWrapper",
				AutomaticSize = Enum.AutomaticSize.XY,
				Position = UDim2.new(0.5, 0, 1, if var7 then -var7.Gap.Medium else 0),
				AnchorPoint = Vector2.new(0.5, 1),
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				[reactModule.Change.AbsoluteSize] = function(p1)
					-- upvalues: var9 (ref), checkOverflow (ref)
					var9.current = p1.AbsoluteSize.X
					checkOverflow()
				end
			}, {
				Layout = reactModule.createElement("UIListLayout"),
				reactModule.createElement(shortcutBar, { items = t })
			})
		})
	}, coreGuiService)
end

return ChromeShortcutBar