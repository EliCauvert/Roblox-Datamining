local foundation = game:GetService("CorePackages").Packages._Index.Foundation.Foundation
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local flagsModule = require(foundation.Utility.Flags)
local bottomSheetModule = require(script.Parent.BottomSheet)
local centerSheetModule = require(script.Parent.CenterSheet)
local sideSheetModule = require(script.Parent.SideSheet)
local useOverlayModule = require(foundation.Providers.Overlay.useOverlay)
local useScreenModule = require(foundation.Providers.Overlay.useScreen)
local guiService = require(foundation.Utility.Wrappers).Services.GuiService
local _ = require(foundation.Enums.DialogSize)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local _ = require(script.Parent.Types)
local t = { testId = "--foundation-sheet" }

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 26 | named "Sheet" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), flagsModule (ref), useScreenModule (ref), useOverlayModule (ref), guiService (ref), reactUtilsModule (ref), bottomSheetModule (ref), centerSheetModule (ref), sideSheetModule (ref)
	local var15
	local var10 = withDefaultsModule(p0, t)
	local var11, var12 = reactModule.useState(var10.isOpen == nil or var10.isOpen)
	local var13 = reactModule.useRef(nil)
	local var14 = if flagsModule.FoundationOverlayKeyboardAwarenessHardened then useScreenModule() else useOverlayModule()
	local useState = reactModule.useState
	
	if var14 then
		var15 = var14.AbsoluteSize.Y < var14.AbsoluteSize.X
		var15 = nil
	else
		var15 = true
	end
	useState, var15 = useState(var15)
	local var16, var17 = reactModule.useState(guiService.ViewportDisplaySize)
	reactModule.useImperativeHandle(var10.sheetRef, function() --[[ line: 36 ]]
		-- upvalues: var13 (ref)
		return var13.current
	end, {})
	reactModule.useEffect(function() --[[ line: 40 ]]
		-- upvalues: var10 (ref), var13 (ref), var12 (ref)
		if var10.isOpen == false and var13.current then
			var13.current.close()
			
			return
		elseif var10.isOpen then
			var12(true)
		end
	end, { var10.isOpen })
	reactModule.useEffect(function() --[[ line: 48 ]]
		-- upvalues: var11 (ref), var10 (ref), var12 (ref)
		if not var11 and var10.isOpen then
			var12(true)
		end
	end, { var11 })
	reactUtilsModule.useEventConnection(guiService:GetPropertyChangedSignal("ViewportDisplaySize"), function() --[[ line: 54 ]]
		-- upvalues: var17 (ref), guiService (copy)
		var17(guiService.ViewportDisplaySize)
	end, {})
	reactModule.useLayoutEffect(function() --[[ line: 58 ]]
		-- upvalues: var14 (ref), var15 (ref)
		local var19 = nil
		
		if var14 then
			var15(var14.AbsoluteSize.Y < var14.AbsoluteSize.X)
			var19 = var14:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 62 ]]
				-- upvalues: var15 (copy), var14 (copy)
				var15(var14.AbsoluteSize.Y < var14.AbsoluteSize.X)
			end)
		end
		return function() --[[ line: 67 ]]
			-- upvalues: var19 (write)
			if var19 then
				var19:Disconnect()
			end
		end
	end, { var14 })
	
	if not var11 then
		return nil
	end
	local cloned = table.clone(var10)
	cloned.isOpen = nil
	cloned.ref = p1
	cloned.sheetRef = var13
	
	if not flagsModule.FoundationSideSheetNewWidthCalculation then
		cloned.displaySize = var16
	end
	function cloned.onClose() --[[ line: 85 ]]
		-- upvalues: var10 (ref), var12 (ref)
		if var10.onClose then
			var10.onClose()
		end
		var12(false)
	end
	
	return if var16 == Enum.DisplaySize.Small and not useState then reactModule.createElement(bottomSheetModule, cloned) elseif var10.preferCenterSheet then reactModule.createElement(centerSheetModule, cloned) else reactModule.createElement(sideSheetModule, cloned)
end))