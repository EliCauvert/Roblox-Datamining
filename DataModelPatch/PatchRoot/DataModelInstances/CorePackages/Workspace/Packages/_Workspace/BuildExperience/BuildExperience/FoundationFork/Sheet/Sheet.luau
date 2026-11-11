local Foundation = game:GetService("CorePackages").Packages._Index.Foundation.Foundation
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ReactUtilsModule = require(Parent.ReactUtils)
local FlagsModule = require(Foundation.Utility.Flags)
local BottomSheetModule = require(script.Parent.BottomSheet)
local CenterSheetModule = require(script.Parent.CenterSheet)
local SideSheetModule = require(script.Parent.SideSheet)
local UseOverlayModule = require(Foundation.Providers.Overlay.useOverlay)
local UseScreenModule = require(Foundation.Providers.Overlay.useScreen)
local GuiService = require(Foundation.Utility.Wrappers).Services.GuiService
local _ = require(Foundation.Enums.DialogSize)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local _ = require(script.Parent.Types)
local config = { testId = "--foundation-sheet" }

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config (copy), ReactModule (copy), FlagsModule (copy), UseScreenModule (copy), UseOverlayModule (copy), GuiService (copy), ReactUtilsModule (copy), BottomSheetModule (copy), CenterSheetModule (copy), SideSheetModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseStateResult, UseStateResult2 = ReactModule.useState(WithDefaultsModuleResult.isOpen == nil or WithDefaultsModuleResult.isOpen)
	local UseRefResult = ReactModule.useRef(nil)
	local UseScreenModuleResult = if FlagsModule.FoundationOverlayKeyboardAwarenessHardened then UseScreenModule() else UseOverlayModule()
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(not UseScreenModuleResult or UseScreenModuleResult.AbsoluteSize.Y < UseScreenModuleResult.AbsoluteSize.X)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(GuiService.ViewportDisplaySize)
	ReactModule.useImperativeHandle(WithDefaultsModuleResult.sheetRef, function()
		-- upvalues: UseRefResult (copy)
		return UseRefResult.current
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: WithDefaultsModuleResult (copy), UseRefResult (copy), UseStateResult2 (copy)
		if WithDefaultsModuleResult.isOpen == false and UseRefResult.current then
			UseRefResult.current.close()
			
			return
		end
		if WithDefaultsModuleResult.isOpen then
			UseStateResult2(true)
		end
	end, { WithDefaultsModuleResult.isOpen })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), WithDefaultsModuleResult (copy), UseStateResult2 (copy)
		if not UseStateResult and WithDefaultsModuleResult.isOpen then
			UseStateResult2(true)
		end
	end, { UseStateResult })
	ReactUtilsModule.useEventConnection(GuiService:GetPropertyChangedSignal("ViewportDisplaySize"), function()
		-- upvalues: UseStateResult2_2 (copy), GuiService (upval)
		UseStateResult2_2(GuiService.ViewportDisplaySize)
	end, {})
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseScreenModuleResult (copy), UseStateResult2_1 (copy)
		local Connection = nil
		
		if UseScreenModuleResult then
			UseStateResult2_1(UseScreenModuleResult.AbsoluteSize.Y < UseScreenModuleResult.AbsoluteSize.X)
			Connection = UseScreenModuleResult:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: UseStateResult2_1 (upval), UseScreenModuleResult (upval)
				UseStateResult2_1(UseScreenModuleResult.AbsoluteSize.Y < UseScreenModuleResult.AbsoluteSize.X)
			end)
		end
		return function()
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
			end
		end
	end, { UseScreenModuleResult })
	
	if not UseStateResult then
		return nil
	end
	local Copy = table.clone(WithDefaultsModuleResult)
	Copy.isOpen = nil
	Copy.ref = Ref
	Copy.sheetRef = UseRefResult
	
	if not FlagsModule.FoundationSideSheetNewWidthCalculation then
		Copy.displaySize = UseStateResult3
	end
	function Copy.onClose()
		-- upvalues: WithDefaultsModuleResult (copy), UseStateResult2 (copy)
		if WithDefaultsModuleResult.onClose then
			WithDefaultsModuleResult.onClose()
		end
		UseStateResult2(false)
	end
	
	return if UseStateResult3 == Enum.DisplaySize.Small and not UseStateResult1 then ReactModule.createElement(BottomSheetModule, Copy) elseif WithDefaultsModuleResult.preferCenterSheet then ReactModule.createElement(CenterSheetModule, Copy) else ReactModule.createElement(SideSheetModule, Copy)
end))