local foundation = script:FindFirstAncestor("Foundation")
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
	local var16
	local var11 = withDefaultsModule(p0, t)
	local var12, var13 = reactModule.useState(var11.isOpen == nil or var11.isOpen)
	local var14 = reactModule.useRef(nil)
	local var15 = if flagsModule.FoundationOverlayKeyboardAwarenessHardened then useScreenModule() else useOverlayModule()
	local useState = reactModule.useState
	
	if var15 then
		var16 = var15.AbsoluteSize.Y < var15.AbsoluteSize.X
		var16 = nil
	else
		var16 = true
	end
	useState, var16 = useState(var16)
	local var17, var18 = reactModule.useState(guiService.ViewportDisplaySize)
	reactModule.useImperativeHandle(var11.sheetRef, function() --[[ line: 36 ]]
		-- upvalues: var14 (ref)
		return var14.current
	end, {})
	reactModule.useEffect(function() --[[ line: 40 ]]
		-- upvalues: var11 (ref), var14 (ref), var13 (ref)
		if var11.isOpen == false and var14.current then
			var14.current.close()
			
			return
		elseif var11.isOpen then
			var13(true)
		end
	end, { var11.isOpen })
	reactModule.useEffect(function() --[[ line: 48 ]]
		-- upvalues: var12 (ref), var11 (ref), var13 (ref)
		if not var12 and var11.isOpen then
			var13(true)
		end
	end, { var12 })
	reactUtilsModule.useEventConnection(guiService:GetPropertyChangedSignal("ViewportDisplaySize"), function() --[[ line: 54 ]]
		-- upvalues: var18 (ref), guiService (copy)
		var18(guiService.ViewportDisplaySize)
	end, {})
	reactModule.useLayoutEffect(function() --[[ line: 58 ]]
		-- upvalues: var15 (ref), var16 (ref)
		local var20 = nil
		
		if var15 then
			var16(var15.AbsoluteSize.Y < var15.AbsoluteSize.X)
			var20 = var15:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 62 ]]
				-- upvalues: var16 (copy), var15 (copy)
				var16(var15.AbsoluteSize.Y < var15.AbsoluteSize.X)
			end)
		end
		return function() --[[ line: 67 ]]
			-- upvalues: var20 (write)
			if var20 then
				var20:Disconnect()
			end
		end
	end, { var15 })
	
	if not var12 then
		return nil
	end
	local cloned = table.clone(var11)
	cloned.isOpen = nil
	cloned.ref = p1
	cloned.sheetRef = var14
	cloned.displaySize = var17
	
	function cloned.onClose() --[[ line: 83 ]]
		-- upvalues: var11 (ref), var13 (ref)
		if var11.onClose then
			var11.onClose()
		end
		var13(false)
	end
	
	return if var17 == Enum.DisplaySize.Small and not useState then reactModule.createElement(bottomSheetModule, cloned) elseif var11.preferCenterSheet then reactModule.createElement(centerSheetModule, cloned) else reactModule.createElement(sideSheetModule, cloned)
end))