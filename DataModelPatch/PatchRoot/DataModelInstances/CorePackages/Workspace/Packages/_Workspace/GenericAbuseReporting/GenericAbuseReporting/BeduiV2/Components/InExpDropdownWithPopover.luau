local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FoundationModule = require(Parent.Foundation)
local InputHandlersModule = require(Parent.InputHandlers)
local ReactModule = require(Parent.React)
local _ = require(Parent.ReactFocusNavigation)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local Popover = FoundationModule.Popover
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local Radius = FoundationModule.Enums.Radius
local Text = FoundationModule.Text
local View = FoundationModule.View
local SideModalDropdownButtonModule = require(GenericAbuseReporting.Common.SideModalDropdownButton)
local Side = {
	offset = 5,
	position = FoundationModule.Enums.PopoverSide.Bottom
}

return ReactModule.memo(function(Frame)
	-- upvalues: ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), View (copy), Text (copy), Icon (copy), IconName (copy), Popover (copy), SideModalDropdownButtonModule (copy), PopoverAlign (copy), Side (copy), Radius (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local OnOpenChangeFunction = Frame.onOpenChange
	local UseResult = ReactModule.useCallback(function(p1)
		-- upvalues: OnOpenChangeFunction (copy), UseStateResult2 (copy)
		if OnOpenChangeFunction then
			OnOpenChangeFunction(p1)
		end
		UseStateResult2(p1)
	end, { OnOpenChangeFunction })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Frame (copy)
		if Frame.value == nil then
			return nil
		end
		for _, item in Frame.items do
			if item.id == Frame.value then
				return item
			end
		end
		return nil
	end, { Frame.items, Frame.value })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseResult (copy)
		UseResult(false)
	end, { UseResult })
	local Items = Frame.items
	local OnItemChangedFunction = Frame.onItemChanged
	local Value = Frame.value
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y padding-top-xxsmall",
		ref = UseRefResult,
		onAbsoluteSizeChanged = function(Frame)
			-- upvalues: UseStateResult2_1 (copy)
			UseStateResult2_1(Frame.AbsoluteSize.X)
		end,
		LayoutOrder = Frame.LayoutOrder
	}, {
		Popover = ReactModule.createElement(Popover.Root, { isOpen = UseStateResult }, {
			Trigger = ReactModule.createElement(SideModalDropdownButtonModule, {
				onActivated = ReactModule.useCallback(function()
					-- upvalues: UseResult (copy), UseStateResult (copy)
					UseResult(not UseStateResult)
				end, { UseStateResult, UseResult }),
				text = if UseMemoResult then UseMemoResult.text else Frame.placeholder or ""
			}),
			Anchor = ReactModule.createElement(Popover.Anchor, { anchorRef = UseRefResult }),
			Menu = ReactModule.createElement(Popover.Content, {
				hasArrow = false,
				align = PopoverAlign.End,
				side = Side,
				onPressedOutside = UseResult1,
				radius = Radius.Medium
			}, ReactModule.createElement(FocusRoot, {
				surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.ModerationOverlay,
				isFocusable = UseStateResult,
				isAutoFocusRoot = UseStateResult,
				isIsolated = UseStateResult,
				eventHandlers = ReactModule.useMemo(function()
					-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), UseResult1 (copy)
					return {
						[FocusNavigationEventNameEnum.NavigateBack] = { handler = InputHandlersModule.onRelease(UseResult1) }
					}
				end, { UseResult1 })
			}, {
				Menu = ReactModule.createElement(View, {
					tag = "col align-x-center align-y-center gap-xsmall auto-y padding-xsmall stroke-default radius-medium",
					Size = UDim2.new(0, UseStateResult1 - 2, 0, -2)
				}, (ReactModule.useMemo(function()
					-- upvalues: Items (copy), Value (copy), ReactModule (upval), View (upval), UseResult (copy), OnItemChangedFunction (copy), Text (upval), Icon (upval), IconName (upval)
					local Elements = {}
					
					for LayoutOrder, item in Items do
						local Id = item.id
						local IsIdMatch = Id == Value
						Elements[`item-{tostring(Id)}`] = ReactModule.createElement(View, {
							LayoutOrder = LayoutOrder,
							onActivated = function()
								-- upvalues: UseResult (upval), OnItemChangedFunction (upval), Id (copy)
								UseResult(false)
								OnItemChangedFunction(Id)
							end,
							selection = { Selectable = true },
							tag = {
								["row flex-between size-full-0 auto-y padding-small radius-medium"] = true,
								["bg-shift-200"] = IsIdMatch
							}
						}, {
							Text = ReactModule.createElement(Text, {
								TextWrapped = true,
								tag = "auto-xy",
								LayoutOrder = 1,
								Text = item.text,
								TextXAlignment = Enum.TextXAlignment.Left
							}),
							Check = IsIdMatch and ReactModule.createElement(Icon, { LayoutOrder = 2, name = IconName.CheckLarge }) or nil
						})
					end
					return Elements
				end, { Items, Value, OnItemChangedFunction, UseResult })))
			}))
		})
	})
end)