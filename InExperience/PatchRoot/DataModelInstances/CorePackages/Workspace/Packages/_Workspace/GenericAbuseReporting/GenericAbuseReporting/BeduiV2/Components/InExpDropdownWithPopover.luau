local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local foundationModule = require(parent.Foundation)
local inputHandlersModule = require(parent.InputHandlers)
local reactModule = require(parent.React)
local _ = require(parent.ReactFocusNavigation)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local focusRoot = focusNavigationUtilsModule.FocusRoot
local icon = foundationModule.Icon
local iconName = foundationModule.Enums.IconName
local popover = foundationModule.Popover
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide
local radius = foundationModule.Enums.Radius
local text = foundationModule.Text
local view = foundationModule.View
local sideModalDropdownButtonModule = require(genericAbuseReporting.Common.SideModalDropdownButton)
local t = { offset = 5, position = popoverSide.Bottom }

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), view (ref), text (ref), icon (ref), iconName (ref), popover (ref), sideModalDropdownButtonModule (ref), popoverAlign (ref), t (ref), radius (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var1, var2 = reactModule.useState(false)
	local var3 = reactModule.useRef(nil)
	local var4, var5 = reactModule.useState(0)
	local onOpenChange = p1.onOpenChange
	local var6 = reactModule.useCallback(function(p2)
		-- upvalues: onOpenChange (ref), var2 (ref)
		if onOpenChange then
			onOpenChange(p2)
		end
		var2(p2)
	end, { onOpenChange })
	local var7 = reactModule.useMemo(function()
		-- upvalues: p1 (ref)
		if p1.value == nil then
			return nil
		end
		for i, v in p1.items do
			if v.id == p1.value then
				return v
			end
		end
		return nil
	end, { p1.items, p1.value })
	local var8 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), var1 (ref)
		var6(not var1)
	end, { var1, var6 })
	local var9 = reactModule.useCallback(function()
		-- upvalues: var6 (ref)
		var6(false)
	end, { var6 })
	local var10 = reactModule.useMemo(function()
		-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var9 (ref)
		return {
			[focusNavigationEventNameEnum.NavigateBack] = { handler = inputHandlersModule.onRelease(var9) }
		}
	end, { var9 })
	local var11 = if var7 then var7.text else p1.placeholder or ""
	local items = p1.items
	local onItemChanged = p1.onItemChanged
	local value = p1.value
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y padding-top-xxsmall",
		ref = var3,
		onAbsoluteSizeChanged = function(value)
			-- upvalues: var5 (ref)
			var5(value.AbsoluteSize.X)
		end,
		LayoutOrder = p1.LayoutOrder
	}, {
		Popover = reactModule.createElement(popover.Root, { isOpen = var1 }, {
			Trigger = reactModule.createElement(sideModalDropdownButtonModule, { onActivated = var8, text = var11 }),
			Anchor = reactModule.createElement(popover.Anchor, { anchorRef = var3 }),
			Menu = reactModule.createElement(popover.Content, {
				hasArrow = false,
				align = popoverAlign.End,
				side = t,
				onPressedOutside = var9,
				radius = radius.Medium
			}, reactModule.createElement(focusRoot, {
				surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.ModerationOverlay,
				isFocusable = var1,
				isAutoFocusRoot = var1,
				isIsolated = var1,
				eventHandlers = var10
			}, {
				Menu = reactModule.createElement(view, {
					tag = "col align-x-center align-y-center gap-xsmall auto-y padding-xsmall stroke-default radius-medium",
					Size = UDim2.new(0, var4 - 2, 0, -2)
				}, reactModule.useMemo(function()
					-- upvalues: items (ref), value (ref), reactModule (copy), view (copy), var6 (ref), onItemChanged (ref), text (copy), icon (copy), iconName (copy)
					local t = {}
					
					for i, v in items do
						local id = v.id
						local var12 = id == value
						t[`item-{tostring(id)}`] = reactModule.createElement(view, {
							LayoutOrder = i,
							onActivated = function()
								-- upvalues: var6 (copy), onItemChanged (copy), id (ref)
								var6(false)
								onItemChanged(id)
							end,
							selection = { Selectable = true },
							tag = {
								["row flex-between size-full-0 auto-y padding-small radius-medium"] = true,
								["bg-shift-200"] = var12
							}
						}, {
							Text = reactModule.createElement(text, {
								TextWrapped = true,
								tag = "auto-xy",
								LayoutOrder = 1,
								Text = v.text,
								TextXAlignment = Enum.TextXAlignment.Left
							}),
							Check = var12 and reactModule.createElement(icon, { LayoutOrder = 2, name = iconName.CheckLarge }) or nil
						})
					end
					return t
				end, { items, value, onItemChanged, var6 }))
			}))
		})
	})
end)