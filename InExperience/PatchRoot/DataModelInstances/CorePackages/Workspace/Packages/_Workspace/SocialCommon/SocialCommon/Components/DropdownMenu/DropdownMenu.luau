local Parent = script:FindFirstAncestor("SocialCommon").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local InputHandlersModule = require(Parent.InputHandlers)
local _ = require(Parent.ReactFocusNavigation)
local FoundationModule = require(Parent.Foundation)
local Menu = FoundationModule.Menu
local InputSize = FoundationModule.Enums.InputSize
local PopoverSide = FoundationModule.Enums.PopoverSide
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local _UDim = UDim.new(0, 300)
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

return function(p1)
	-- upvalues: ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), EventMap (copy), CryoModule (copy), Menu (copy), _UDim (copy), InputSize (copy), PopoverSide (copy), PopoverAlign (copy)
	local IsOpen = p1.isOpen
	local OnCloseFunction = p1.onClose
	local UseFocusRootResult = UseFocusRootFunction({
		isAutoFocusRoot = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
		isFocusable = IsOpen,
		eventMap = EventMap,
		eventHandlers = ReactModule.useMemo(function()
			-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), OnCloseFunction (copy)
			return {
				[FocusNavigationEventNameEnum.NavigateBack] = {
					handler = InputHandlersModule.onRelease(function(p2)
						-- upvalues: OnCloseFunction (upval)
						OnCloseFunction()
						p2:cancel()
					end)
				}
			}
		end, { OnCloseFunction })
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CryoModule (upval), p1 (copy), OnCloseFunction (copy)
		return CryoModule.List.map(p1.items, function(p2)
			-- upvalues: CryoModule (upval), OnCloseFunction (upval)
			local OnActivatedFunction = p2.onActivated
			
			return if OnActivatedFunction then CryoModule.Dictionary.join(p2, {
				onActivated = function(p3)
					-- upvalues: OnCloseFunction (upval), OnActivatedFunction (copy)
					OnCloseFunction()
					OnActivatedFunction(p3)
				end
			}) else p2
		end)
	end, { p1.items, OnCloseFunction })
	
	return if IsOpen then ReactModule.createElement(Menu, {
		isOpen = p1.isOpen,
		anchorRef = p1.anchorRef,
		width = p1.width or _UDim,
		size = p1.size or InputSize.Medium,
		side = p1.side or PopoverSide.Bottom,
		align = p1.align or PopoverAlign.End,
		onPressedOutside = OnCloseFunction,
		onActivated = OnCloseFunction,
		ref = UseFocusRootResult,
		items = UseMemoResult
	}) else nil
end