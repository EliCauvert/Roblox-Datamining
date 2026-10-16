local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local _ = require(ProfilePlatform.Components.CTARow.Types)
local CoreGui = game:GetService("CoreGui")
local ReactModule = require(Parent.React)
local DashModule = require(Parent.Dash)
local FoundationModule = require(Parent.Foundation)
local UseIsSpatialFunction = require(Parent.Responsive).useIsSpatial
local Menu = FoundationModule.Menu
local OverlayProvider = FoundationModule.OverlayProvider
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local InputSize = FoundationModule.Enums.InputSize

local function _() --[[ Line: 30 | Named "getVROverlaySurfaceGui" ]]
	-- upvalues: CoreGui (copy)
	local LuaAppScreenGui = CoreGui:FindFirstChild("LuaAppScreenGui")
	
	return if LuaAppScreenGui then LuaAppScreenGui:FindFirstChild("MainAppScreen_SurfaceGui") else nil
end

local function convertToMenuItems(MenuItems, Callback) --[[ Line: 38 ]]
	-- upvalues: DashModule (copy)
	return DashModule.map(MenuItems, function(p1) --[[ Line: 42 ]]
		-- upvalues: DashModule (upval), Callback (copy)
		return {
			items = DashModule.map(p1.items, function(p2) --[[ Line: 44 ]]
				-- upvalues: Callback (upval)
				local DisplayValue = p2.displayValue
				
				return {
					id = p2.id,
					onActivated = function() --[[ Line: 46 ]]
						-- upvalues: Callback (upval), p2 (copy)
						Callback()
						p2.onActivated()
					end,
					isDisabled = p2.isDisabled,
					text = DisplayValue.text or "",
					icon = DisplayValue.icon
				}
			end)
		}
	end)
end

return function(p1) --[[ Line: 63 | Named "ContextualMenu" ]]
	-- upvalues: UseIsSpatialFunction (copy), ReactModule (copy), CoreGui (copy), convertToMenuItems (copy), OverlayProvider (copy), Menu (copy), PopoverAlign (copy), InputSize (copy)
	local UseIsSpatialResult = UseIsSpatialFunction()
	
	return (ReactModule.createElement(OverlayProvider, {
		gui = ReactModule.useMemo(function() --[[ Line: 65 ]]
			-- upvalues: UseIsSpatialResult (copy), CoreGui (upval)
			if UseIsSpatialResult then
				local LuaAppScreenGui = CoreGui:FindFirstChild("LuaAppScreenGui")
				
				return if LuaAppScreenGui then LuaAppScreenGui:FindFirstChild("MainAppScreen_SurfaceGui") else nil
			else
				return nil
			end
		end, { UseIsSpatialResult })
	}, {
		Menu = ReactModule.createElement(Menu, {
			isOpen = p1.isOpen,
			align = p1.align or PopoverAlign.End,
			anchorRef = p1.anchorRef,
			items = ReactModule.useMemo(function() --[[ Line: 69 ]]
				-- upvalues: convertToMenuItems (upval), p1 (copy)
				return convertToMenuItems(p1.menuItems, p1.closeMenu)
			end, { p1.menuItems, p1.closeMenu }),
			onPressedOutside = p1.closeMenu,
			ref = p1.menuRef,
			size = InputSize.Medium
		})
	}))
end