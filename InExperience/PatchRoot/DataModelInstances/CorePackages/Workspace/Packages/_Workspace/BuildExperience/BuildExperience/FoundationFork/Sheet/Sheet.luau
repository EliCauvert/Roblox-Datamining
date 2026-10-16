local Foundation = game:GetService("CorePackages").Packages._Index.Foundation.Foundation
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ReactUtilsModule = require(Parent.ReactUtils)
local BottomSheetModule = require(script.Parent.BottomSheet)
local CenterSheetModule = require(script.Parent.CenterSheet)
local SideSheetModule = require(script.Parent.SideSheet)
local UseScreenModule = require(Foundation.Providers.Overlay.useScreen)
local GuiService = require(Foundation.Utility.Wrappers).Services.GuiService
local _ = require(Foundation.Enums.DialogSize)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local _ = require(script.Parent.Types)
local config = { testId = "--foundation-sheet" }

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 23 | Named "Sheet" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), ReactModule (copy), UseScreenModule (copy), GuiService (copy), ReactUtilsModule (copy), BottomSheetModule (copy), CenterSheetModule (copy), SideSheetModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseStateResult, UseStateResult2 = ReactModule.useState(WithDefaultsModuleResult.isOpen == nil or WithDefaultsModuleResult.isOpen)
	local UseRefResult = ReactModule.useRef(nil)
	local UseScreenModuleResult = UseScreenModule()
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(not UseScreenModuleResult or UseScreenModuleResult.AbsoluteSize.Y < UseScreenModuleResult.AbsoluteSize.X)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(GuiService.ViewportDisplaySize)
	ReactModule.useImperativeHandle(WithDefaultsModuleResult.sheetRef, function() --[[ Line: 33 ]]
		-- upvalues: UseRefResult (copy)
		return UseRefResult.current
	end, {})
	ReactModule.useEffect(function() --[[ Line: 37 ]]
		-- upvalues: WithDefaultsModuleResult (copy), UseRefResult (copy), UseStateResult2 (copy)
		if WithDefaultsModuleResult.isOpen == false and UseRefResult.current then
			UseRefResult.current.close()
			
			return
		end
		if WithDefaultsModuleResult.isOpen then
			UseStateResult2(true)
		end
	end, { WithDefaultsModuleResult.isOpen })
	ReactModule.useEffect(function() --[[ Line: 45 ]]
		-- upvalues: UseStateResult (copy), WithDefaultsModuleResult (copy), UseStateResult2 (copy)
		if not UseStateResult and WithDefaultsModuleResult.isOpen then
			UseStateResult2(true)
		end
	end, { UseStateResult })
	ReactUtilsModule.useEventConnection(GuiService:GetPropertyChangedSignal("ViewportDisplaySize"), function() --[[ Line: 51 ]]
		-- upvalues: UseStateResult2_2 (copy), GuiService (upval)
		UseStateResult2_2(GuiService.ViewportDisplaySize)
	end, {})
	ReactModule.useLayoutEffect(function() --[[ Line: 55 ]]
		-- upvalues: UseScreenModuleResult (copy), UseStateResult2_1 (copy)
		local Connection = nil
		
		if UseScreenModuleResult then
			UseStateResult2_1(UseScreenModuleResult.AbsoluteSize.Y < UseScreenModuleResult.AbsoluteSize.X)
			Connection = UseScreenModuleResult:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 59 ]]
				-- upvalues: UseStateResult2_1 (upval), UseScreenModuleResult (upval)
				UseStateResult2_1(UseScreenModuleResult.AbsoluteSize.Y < UseScreenModuleResult.AbsoluteSize.X)
			end)
		end
		return function() --[[ Line: 64 ]]
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
			end
		end
	end, { UseScreenModuleResult })
	
	if UseStateResult then
		local Copy = table.clone(WithDefaultsModuleResult)
		Copy.isOpen = nil
		Copy.ref = Ref
		Copy.sheetRef = UseRefResult
		Copy.displaySize = UseStateResult3
		
		function Copy.onClose() --[[ Line: 80 ]]
			-- upvalues: WithDefaultsModuleResult (copy), UseStateResult2 (copy)
			if WithDefaultsModuleResult.onClose then
				WithDefaultsModuleResult.onClose()
			end
			UseStateResult2(false)
		end
		
		return if UseStateResult3 == Enum.DisplaySize.Small and not UseStateResult1 then ReactModule.createElement(BottomSheetModule, Copy) elseif WithDefaultsModuleResult.preferCenterSheet then ReactModule.createElement(CenterSheetModule, Copy) else ReactModule.createElement(SideSheetModule, Copy)
	else
		return nil
	end
end))