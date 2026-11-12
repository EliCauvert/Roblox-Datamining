local Parent = script.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local ResponsiveModule = require(Parent1.Responsive)
local GetWizardViewportLayoutModule = require(Parent.getWizardViewportLayout)

return function()
	-- upvalues: ResponsiveModule (copy), ReactModule (copy), GetWizardViewportLayoutModule (copy)
	local UseDeviceInsetsResult = ResponsiveModule.useDeviceInsets()
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local FullscreenGuiResult = ResponsiveModule.HardwareSafeAreaInsets.fullscreenGui()
	local _Rect = Rect.new(FullscreenGuiResult.AbsolutePosition, FullscreenGuiResult.AbsolutePosition + FullscreenGuiResult.AbsoluteSize)
	
	return if UseStateResult and UseStateResult.Width > 0 and UseStateResult.Height > 0 then GetWizardViewportLayoutModule(UseStateResult, _Rect, UseDeviceInsetsResult) else nil, (ReactModule.useCallback(function(Frame: Frame)
		-- upvalues: UseStateResult2 (copy)
		if Frame ~= nil then
			local _Rect = Rect.new(Frame.AbsolutePosition, Frame.AbsolutePosition + Frame.AbsoluteSize)
			UseStateResult2(function(p1)
				-- upvalues: _Rect (copy)
				return if p1 == _Rect then p1 else _Rect
			end)
			
			return
		end
	end, {}))
end