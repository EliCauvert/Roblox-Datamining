local Parent = script:FindFirstAncestor("TenFootUiGlobalNav").Parent
local ReactModule = require(Parent.React)
local GlobalNavDisplayOption = require(Parent.TenFootUiCommon).TenFootUiRNTypes.GlobalNavDisplayOption

return function(p1, Callback)
	-- upvalues: ReactModule (copy), GlobalNavDisplayOption (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(GlobalNavDisplayOption.ShowAll)
	ReactModule.useEffect(function()
		-- upvalues: Callback (copy), p1 (copy), UseStateResult2 (copy), GlobalNavDisplayOption (upval)
		local CallbackResult = Callback(p1)
		
		if CallbackResult and CallbackResult.globalNavDisplayOption then
			UseStateResult2(CallbackResult.globalNavDisplayOption)
			
			return
		else
			UseStateResult2(GlobalNavDisplayOption.ShowAll)
		end
	end, { p1, Callback })
	
	return UseStateResult
end