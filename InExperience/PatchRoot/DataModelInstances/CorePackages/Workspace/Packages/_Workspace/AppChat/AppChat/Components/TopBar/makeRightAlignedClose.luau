local Parent = script:FindFirstAncestor("AppChat").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)

return function(Callback, Callback1)
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	return function()
		-- upvalues: Callback (copy), ReactModule (upval), FoundationModule (upval), Callback1 (copy)
		local CallbackResult = if Callback then Callback() else nil
		
		return if CallbackResult then ReactModule.createElement(FoundationModule.View, { tag = "row align-y-center gap-xsmall auto-xy" }, {
			Actions = ReactModule.createElement(FoundationModule.View, {
				tag = "row align-y-center gap-xsmall auto-xy",
				LayoutOrder = 1
			}, { Content = CallbackResult }),
			CloseButton = ReactModule.createElement(FoundationModule.View, { tag = "auto-xy", LayoutOrder = 2 }, { Button = Callback1() })
		}) else Callback1()
	end
end