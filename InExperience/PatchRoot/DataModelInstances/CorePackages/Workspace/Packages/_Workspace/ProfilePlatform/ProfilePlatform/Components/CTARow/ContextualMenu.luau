local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local _ = require(profilePlatform.Components.CTARow.Types)
local coreGuiService = game:GetService("CoreGui")
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local useIsSpatial = require(parent.Responsive).useIsSpatial
local menu = foundationModule.Menu
local overlayProvider = foundationModule.OverlayProvider
local popoverAlign = foundationModule.Enums.PopoverAlign
local inputSize = foundationModule.Enums.InputSize

local function _()
	-- upvalues: coreGuiService (ref)
	local luaAppScreenGui = coreGuiService:FindFirstChild("LuaAppScreenGui")
	
	return if luaAppScreenGui then luaAppScreenGui:FindFirstChild("MainAppScreen_SurfaceGui") else nil
end

local function convertToMenuItems(p1, p2)
	-- upvalues: dashModule (ref)
	return dashModule.map(p1, function(p3)
		-- upvalues: dashModule (copy), p2 (ref)
		return {
			items = dashModule.map(p3.items, function(p4)
				-- upvalues: p2 (copy)
				local displayValue = p4.displayValue
				
				return {
					id = p4.id,
					onActivated = function()
						-- upvalues: p2 (copy), p4 (ref)
						p2()
						p4.onActivated()
					end,
					isDisabled = p4.isDisabled,
					text = displayValue.text or "",
					icon = displayValue.icon
				}
			end)
		}
	end)
end

return function(p1)
	-- upvalues: useIsSpatial (ref), reactModule (ref), coreGuiService (ref), convertToMenuItems (ref), overlayProvider (ref), menu (ref), popoverAlign (ref), inputSize (ref)
	local var1 = useIsSpatial()
	
	return reactModule.createElement(overlayProvider, {
		gui = reactModule.useMemo(function()
			-- upvalues: var1 (ref), coreGuiService (copy)
			if not var1 then
				return nil
			end
			local luaAppScreenGui = coreGuiService:FindFirstChild("LuaAppScreenGui")
			
			return if luaAppScreenGui then luaAppScreenGui:FindFirstChild("MainAppScreen_SurfaceGui") else nil
		end, { var1 })
	}, {
		Menu = reactModule.createElement(menu, {
			isOpen = p1.isOpen,
			align = p1.align or popoverAlign.End,
			anchorRef = p1.anchorRef,
			items = reactModule.useMemo(function()
				-- upvalues: convertToMenuItems (copy), p1 (ref)
				return convertToMenuItems(p1.menuItems, p1.closeMenu)
			end, { p1.menuItems, p1.closeMenu }),
			onPressedOutside = p1.closeMenu,
			ref = p1.menuRef,
			size = inputSize.Medium
		})
	})
end