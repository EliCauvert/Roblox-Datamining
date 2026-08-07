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

local function _() --[[ line: 30 | named "getVROverlaySurfaceGui" ]]
	-- upvalues: coreGuiService (ref)
	local luaAppScreenGui = coreGuiService:FindFirstChild("LuaAppScreenGui")
	
	return if luaAppScreenGui then luaAppScreenGui:FindFirstChild("MainAppScreen_SurfaceGui") else nil
end

local function convertToMenuItems(p0, p1) --[[ line: 38 ]]
	-- upvalues: dashModule (ref)
	return dashModule.map(p0, function(p2) --[[ line: 42 ]]
		-- upvalues: dashModule (copy), p1 (ref)
		return {
			items = dashModule.map(p2.items, function(p3) --[[ line: 44 ]]
				-- upvalues: p1 (copy)
				local displayValue = p3.displayValue
				
				return {
					id = p3.id,
					onActivated = function() --[[ line: 46 ]]
						-- upvalues: p1 (copy), p3 (ref)
						p1()
						p3.onActivated()
					end,
					isDisabled = p3.isDisabled,
					text = displayValue.text or "",
					icon = displayValue.icon
				}
			end)
		}
	end)
end

return function(p4) --[[ line: 63 | named "ContextualMenu" ]]
	-- upvalues: useIsSpatial (ref), reactModule (ref), coreGuiService (ref), convertToMenuItems (ref), overlayProvider (ref), menu (ref), popoverAlign (ref), inputSize (ref)
	local var7 = useIsSpatial()
	
	return reactModule.createElement(overlayProvider, {
		gui = reactModule.useMemo(function() --[[ line: 65 ]]
			-- upvalues: var7 (ref), coreGuiService (copy)
			if not var7 then
				return nil
			end
			local luaAppScreenGui = coreGuiService:FindFirstChild("LuaAppScreenGui")
			
			return if luaAppScreenGui then luaAppScreenGui:FindFirstChild("MainAppScreen_SurfaceGui") else nil
		end, { var7 })
	}, {
		Menu = reactModule.createElement(menu, {
			isOpen = p4.isOpen,
			align = p4.align or popoverAlign.End,
			anchorRef = p4.anchorRef,
			items = reactModule.useMemo(function() --[[ line: 69 ]]
				-- upvalues: convertToMenuItems (copy), p4 (ref)
				return convertToMenuItems(p4.menuItems, p4.closeMenu)
			end, { p4.menuItems, p4.closeMenu }),
			onPressedOutside = p4.closeMenu,
			ref = p4.menuRef,
			size = inputSize.Medium
		})
	})
end