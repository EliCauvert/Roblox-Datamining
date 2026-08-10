local foundation = game:GetService("CorePackages").Packages._Index.Foundation.Foundation
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local bottomSheetModule = require(script.Parent.BottomSheet)
local centerSheetModule = require(script.Parent.CenterSheet)
local sideSheetModule = require(script.Parent.SideSheet)
local useScreenModule = require(foundation.Providers.Overlay.useScreen)
local guiService = require(foundation.Utility.Wrappers).Services.GuiService
local _ = require(foundation.Enums.DialogSize)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local _ = require(script.Parent.Types)
local t = { testId = "--foundation-sheet" }

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 23 | named "Sheet" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), useScreenModule (ref), guiService (ref), reactUtilsModule (ref), bottomSheetModule (ref), centerSheetModule (ref), sideSheetModule (ref)
	local var13
	local var8 = withDefaultsModule(p0, t)
	local var9, var10 = reactModule.useState(var8.isOpen == nil or var8.isOpen)
	local var11 = reactModule.useRef(nil)
	local var12 = useScreenModule()
	local useState = reactModule.useState
	
	if var12 then
		var13 = var12.AbsoluteSize.Y < var12.AbsoluteSize.X
		var13 = nil
	else
		var13 = true
	end
	useState, var13 = useState(var13)
	local var14, var15 = reactModule.useState(guiService.ViewportDisplaySize)
	reactModule.useImperativeHandle(var8.sheetRef, function() --[[ line: 33 ]]
		-- upvalues: var11 (ref)
		return var11.current
	end, {})
	reactModule.useEffect(function() --[[ line: 37 ]]
		-- upvalues: var8 (ref), var11 (ref), var10 (ref)
		if var8.isOpen == false and var11.current then
			var11.current.close()
			
			return
		elseif var8.isOpen then
			var10(true)
		end
	end, { var8.isOpen })
	reactModule.useEffect(function() --[[ line: 45 ]]
		-- upvalues: var9 (ref), var8 (ref), var10 (ref)
		if not var9 and var8.isOpen then
			var10(true)
		end
	end, { var9 })
	reactUtilsModule.useEventConnection(guiService:GetPropertyChangedSignal("ViewportDisplaySize"), function() --[[ line: 51 ]]
		-- upvalues: var15 (ref), guiService (copy)
		var15(guiService.ViewportDisplaySize)
	end, {})
	reactModule.useLayoutEffect(function() --[[ line: 55 ]]
		-- upvalues: var12 (ref), var13 (ref)
		local var17 = nil
		
		if var12 then
			var13(var12.AbsoluteSize.Y < var12.AbsoluteSize.X)
			var17 = var12:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 59 ]]
				-- upvalues: var13 (copy), var12 (copy)
				var13(var12.AbsoluteSize.Y < var12.AbsoluteSize.X)
			end)
		end
		return function() --[[ line: 64 ]]
			-- upvalues: var17 (write)
			if var17 then
				var17:Disconnect()
			end
		end
	end, { var12 })
	
	if not var9 then
		return nil
	end
	local cloned = table.clone(var8)
	cloned.isOpen = nil
	cloned.ref = p1
	cloned.sheetRef = var11
	cloned.displaySize = var14
	
	function cloned.onClose() --[[ line: 80 ]]
		-- upvalues: var8 (ref), var10 (ref)
		if var8.onClose then
			var8.onClose()
		end
		var10(false)
	end
	
	return if var14 == Enum.DisplaySize.Small and not useState then reactModule.createElement(bottomSheetModule, cloned) elseif var8.preferCenterSheet then reactModule.createElement(centerSheetModule, cloned) else reactModule.createElement(sideSheetModule, cloned)
end))