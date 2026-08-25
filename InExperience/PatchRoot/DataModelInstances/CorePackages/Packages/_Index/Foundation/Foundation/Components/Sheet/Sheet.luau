local foundation = script:FindFirstAncestor("Foundation")
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

return reactModule.memo(reactModule.forwardRef(function(p0, p1)
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), useScreenModule (ref), guiService (ref), reactUtilsModule (ref), bottomSheetModule (ref), centerSheetModule (ref), sideSheetModule (ref)
	local var14
	local var9 = withDefaultsModule(p0, t)
	local var10, var11 = reactModule.useState(var9.isOpen == nil or var9.isOpen)
	local var12 = reactModule.useRef(nil)
	local var13 = useScreenModule()
	local useState = reactModule.useState
	
	if var13 then
		var14 = var13.AbsoluteSize.Y < var13.AbsoluteSize.X
		var14 = nil
	else
		var14 = true
	end
	useState, var14 = useState(var14)
	local var15, var16 = reactModule.useState(guiService.ViewportDisplaySize)
	reactModule.useImperativeHandle(var9.sheetRef, function()
		-- upvalues: var12 (ref)
		return var12.current
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), var12 (ref), var11 (ref)
		if var9.isOpen == false and var12.current then
			var12.current.close()
			
			return
		elseif var9.isOpen then
			var11(true)
		end
	end, { var9.isOpen })
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), var9 (ref), var11 (ref)
		if not var10 and var9.isOpen then
			var11(true)
		end
	end, { var10 })
	reactUtilsModule.useEventConnection(guiService:GetPropertyChangedSignal("ViewportDisplaySize"), function()
		-- upvalues: var16 (ref), guiService (copy)
		var16(guiService.ViewportDisplaySize)
	end, {})
	reactModule.useLayoutEffect(function()
		-- upvalues: var13 (ref), var14 (ref)
		local var18 = nil
		
		if var13 then
			var14(var13.AbsoluteSize.Y < var13.AbsoluteSize.X)
			var18 = var13:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: var14 (copy), var13 (copy)
				var14(var13.AbsoluteSize.Y < var13.AbsoluteSize.X)
			end)
		end
		return function()
			-- upvalues: var18 (write)
			if var18 then
				var18:Disconnect()
			end
		end
	end, { var13 })
	
	if not var10 then
		return nil
	end
	local cloned = table.clone(var9)
	cloned.isOpen = nil
	cloned.ref = p1
	cloned.sheetRef = var12
	cloned.displaySize = var15
	
	function cloned.onClose()
		-- upvalues: var9 (ref), var11 (ref)
		if var9.onClose then
			var9.onClose()
		end
		var11(false)
	end
	
	return if var15 == Enum.DisplaySize.Small and not useState then reactModule.createElement(bottomSheetModule, cloned) elseif var9.preferCenterSheet then reactModule.createElement(centerSheetModule, cloned) else reactModule.createElement(sideSheetModule, cloned)
end))