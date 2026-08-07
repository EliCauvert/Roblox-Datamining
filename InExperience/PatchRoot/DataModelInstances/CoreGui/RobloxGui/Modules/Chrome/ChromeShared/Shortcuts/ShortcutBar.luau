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
local serviceModule = require(chromeShared.Service)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local isSpatial = require(corePackagesService.Workspace.Packages.AppCommonLib).isSpatial
local fFlagGamepadIconSupportCheck = sharedFlagsModule.FFlagGamepadIconSupportCheck

function ChromeShortcutBar(_) --[[ line: 28 ]]
	-- upvalues: reactModule (ref), useTokens (ref), useObservableValueModule (ref), viewportUtilModule (ref), fFlagGamepadIconSupportCheck (ref), gamepadConnectorModule (ref), serviceModule (ref), userInputService (ref), isSpatial (ref), fFlagEnableConsoleExpControls (ref), reactRobloxModule (ref), constantsModule (ref), shortcutBar (ref), coreGuiService (ref)
	local var13, var14 = reactModule.useState({})
	local var15, var16 = reactModule.useState({})
	local var17, var18 = reactModule.useBinding(false)
	local var19 = useTokens()
	local var20 = useObservableValueModule(viewportUtilModule.screenSize)
	local var21 = reactModule.useRef(0)
	
	local function checkOverflow() --[[ line: 37 ]]
		-- upvalues: var21 (ref), var20 (ref), var13 (ref), var16 (ref)
		if var20.X < var21.current then
			local var25 = 1
			
			for i, v in var13 do
				if v.displayPriority <= var13[var25].displayPriority then
					var25 = i
				end
			end
			local cloned = table.clone(var13)
			table.remove(cloned, var25)
			var16(cloned)
		end
	end
	
	reactModule.useEffect(function() --[[ line: 54 ]]
		-- upvalues: var16 (ref), checkOverflow (ref)
		var16({})
		checkOverflow()
	end, { var20 })
	reactModule.useEffect(function() --[[ line: 59 ]]
		-- upvalues: fFlagGamepadIconSupportCheck (copy), gamepadConnectorModule (copy), serviceModule (copy), var14 (ref), var16 (ref), userInputService (copy), isSpatial (copy), fFlagEnableConsoleExpControls (copy), var18 (ref)
		local function updateShortcuts() --[[ line: 60 ]]
			-- upvalues: fFlagGamepadIconSupportCheck (copy), gamepadConnectorModule (copy), serviceModule (copy), var14 (copy), var16 (copy)
			if fFlagGamepadIconSupportCheck and not gamepadConnectorModule:getGamepadActive():get() then
				return
			end
			var14(serviceModule:getCurrentShortcuts())
			var16({})
		end
		
		serviceModule:onShortcutBarChanged():connect(updateShortcuts)
		
		if fFlagGamepadIconSupportCheck then
			userInputService.LastInputTypeChanged:Connect(updateShortcuts)
		end
		if not isSpatial() then
			local showTopBar = gamepadConnectorModule:getShowTopBar()
			local gamepadActive = gamepadConnectorModule:getGamepadActive()
			
			if fFlagEnableConsoleExpControls then
				local function shouldHideShortcutBar() --[[ line: 79 ]]
					-- upvalues: showTopBar (ref), gamepadActive (ref), serviceModule (copy)
					serviceModule:setHideShortcutBar("TopBar", not showTopBar:get() or not gamepadActive:get())
				end
				
				serviceModule:setHideShortcutBar("TopBar", not showTopBar:get() or not gamepadActive:get())
				showTopBar:connect(shouldHideShortcutBar)
				gamepadActive:connect(shouldHideShortcutBar)
				
				return
			end
			local function shouldShowShortcutBar() --[[ line: 87 ]]
				-- upvalues: showTopBar (ref), gamepadActive (ref), var18 (copy)
				var18(showTopBar:get() and gamepadActive:get())
			end
			
			showTopBar:connect(shouldShowShortcutBar)
			gamepadActive:connect(shouldShowShortcutBar)
		end
	end, {})
	local t = {}
	
	for i, v in if #var15 > 0 then var15 else var13 do
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
			Enabled = if fFlagEnableConsoleExpControls then nil else var17
		}, {
			reactModule.createElement("Frame", {
				Name = "ShortcutBarWrapper",
				AutomaticSize = Enum.AutomaticSize.XY,
				Position = UDim2.new(0.5, 0, 1, if var19 then -var19.Gap.Medium else 0),
				AnchorPoint = Vector2.new(0.5, 1),
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				[reactModule.Change.AbsoluteSize] = function(p0) --[[ line: 128 ]]
					-- upvalues: var21 (ref), checkOverflow (ref)
					var21.current = p0.AbsoluteSize.X
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