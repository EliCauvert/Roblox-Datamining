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

return reactModule.memo(function(p0) --[[ line: 57 | named "InExpDropdownWithPopover" ]]
	-- upvalues: reactModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), view (ref), text (ref), icon (ref), iconName (ref), popover (ref), sideModalDropdownButtonModule (ref), popoverAlign (ref), t (ref), radius (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var7, var8 = reactModule.useState(false)
	local var9 = reactModule.useRef(nil)
	local var10, var11 = reactModule.useState(0)
	local onOpenChange = p0.onOpenChange
	local var12 = reactModule.useCallback(function(p1) --[[ line: 67 ]]
		-- upvalues: onOpenChange (ref), var8 (ref)
		if onOpenChange then
			onOpenChange(p1)
		end
		var8(p1)
	end, { onOpenChange })
	local var13 = reactModule.useMemo(function() --[[ line: 74 ]]
		-- upvalues: p0 (ref)
		if p0.value == nil then
			return nil
		end
		for i, v in p0.items do
			if v.id == p0.value then
				return v
			end
		end
		return nil
	end, { p0.items, p0.value })
	local var14 = reactModule.useCallback(function() --[[ line: 86 ]]
		-- upvalues: var12 (ref), var7 (ref)
		var12(not var7)
	end, { var7, var12 })
	local var15 = reactModule.useCallback(function() --[[ line: 90 ]]
		-- upvalues: var12 (ref)
		var12(false)
	end, { var12 })
	local var16 = reactModule.useMemo(function() --[[ line: 94 ]]
		-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var15 (ref)
		return {
			[focusNavigationEventNameEnum.NavigateBack] = { handler = inputHandlersModule.onRelease(var15) }
		}
	end, { var15 })
	local var17 = if var13 then var13.text else p0.placeholder or ""
	local items = p0.items
	local onItemChanged = p0.onItemChanged
	local value = p0.value
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y padding-top-xxsmall",
		ref = var9,
		onAbsoluteSizeChanged = function(value) --[[ line: 145 ]]
			-- upvalues: var11 (ref)
			var11(value.AbsoluteSize.X)
		end,
		LayoutOrder = p0.LayoutOrder
	}, {
		Popover = reactModule.createElement(popover.Root, { isOpen = var7 }, {
			Trigger = reactModule.createElement(sideModalDropdownButtonModule, { onActivated = var14, text = var17 }),
			Anchor = reactModule.createElement(popover.Anchor, { anchorRef = var9 }),
			Menu = reactModule.createElement(popover.Content, {
				hasArrow = false,
				align = popoverAlign.End,
				side = t,
				onPressedOutside = var15,
				radius = radius.Medium
			}, reactModule.createElement(focusRoot, {
				surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.ModerationOverlay,
				isFocusable = var7,
				isAutoFocusRoot = var7,
				isIsolated = var7,
				eventHandlers = var16
			}, {
				Menu = reactModule.createElement(view, {
					tag = "col align-x-center align-y-center gap-xsmall auto-y padding-xsmall stroke-default radius-medium",
					Size = UDim2.new(0, var10 - 2, 0, -2)
				}, reactModule.useMemo(function() --[[ line: 107 ]]
					-- upvalues: items (ref), value (ref), reactModule (copy), view (copy), var12 (ref), onItemChanged (ref), text (copy), icon (copy), iconName (copy)
					local t = {}
					
					for i, v in items do
						local id = v.id
						local var19 = id == value
						t[`item-{tostring(id)}`] = reactModule.createElement(view, {
							LayoutOrder = i,
							onActivated = function() --[[ line: 114 ]]
								-- upvalues: var12 (copy), onItemChanged (copy), id (ref)
								var12(false)
								onItemChanged(id)
							end,
							selection = { Selectable = true },
							tag = {
								["row flex-between size-full-0 auto-y padding-small radius-medium"] = true,
								["bg-shift-200"] = var19
							}
						}, {
							Text = reactModule.createElement(text, {
								TextWrapped = true,
								tag = "auto-xy",
								LayoutOrder = 1,
								Text = v.text,
								TextXAlignment = Enum.TextXAlignment.Left
							}),
							Check = var19 and reactModule.createElement(icon, { LayoutOrder = 2, name = iconName.CheckLarge }) or nil
						})
					end
					return t
				end, { items, value, onItemChanged, var12 }))
			}))
		})
	})
end)