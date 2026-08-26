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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), useScreenModule (ref), guiService (ref), reactUtilsModule (ref), bottomSheetModule (ref), centerSheetModule (ref), sideSheetModule (ref)
	local var1
	local var2 = withDefaultsModule(p1, t)
	local var3, var4 = reactModule.useState(var2.isOpen == nil or var2.isOpen)
	local var5 = reactModule.useRef(nil)
	local var6 = useScreenModule()
	local useState = reactModule.useState
	
	if var6 then
		var1 = var6.AbsoluteSize.Y < var6.AbsoluteSize.X
		var1 = nil
	else
		var1 = true
	end
	useState, var13 = useState(var1)
	local var7, var8 = reactModule.useState(guiService.ViewportDisplaySize)
	reactModule.useImperativeHandle(var2.sheetRef, function()
		-- upvalues: var5 (ref)
		return var5.current
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var5 (ref), var4 (ref)
		if var2.isOpen == false and var5.current then
			var5.current.close()
			
			return
		elseif var2.isOpen then
			var4(true)
		end
	end, { var2.isOpen })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var2 (ref), var4 (ref)
		if not var3 and var2.isOpen then
			var4(true)
		end
	end, { var3 })
	reactUtilsModule.useEventConnection(guiService:GetPropertyChangedSignal("ViewportDisplaySize"), function()
		-- upvalues: var8 (ref), guiService (copy)
		var8(guiService.ViewportDisplaySize)
	end, {})
	reactModule.useLayoutEffect(function()
		-- upvalues: var6 (ref), var1 (ref)
		local var9 = nil
		
		if var6 then
			var1(var6.AbsoluteSize.Y < var6.AbsoluteSize.X)
			var9 = var6:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: var1 (copy), var6 (copy)
				var1(var6.AbsoluteSize.Y < var6.AbsoluteSize.X)
			end)
		end
		return function()
			-- upvalues: var9 (write)
			if var9 then
				var9:Disconnect()
			end
		end
	end, { var6 })
	
	if not var3 then
		return nil
	end
	local cloned = table.clone(var2)
	cloned.isOpen = nil
	cloned.ref = p2
	cloned.sheetRef = var5
	cloned.displaySize = var7
	
	function cloned.onClose()
		-- upvalues: var2 (ref), var4 (ref)
		if var2.onClose then
			var2.onClose()
		end
		var4(false)
	end
	
	return if var7 == Enum.DisplaySize.Small and not useState then reactModule.createElement(bottomSheetModule, cloned) elseif var2.preferCenterSheet then reactModule.createElement(centerSheetModule, cloned) else reactModule.createElement(sideSheetModule, cloned)
end))