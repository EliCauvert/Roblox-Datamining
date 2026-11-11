local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local ReactModule = require(MomentsCreation.Parent.React)
local UserInputService = game:GetService("UserInputService")
local ComputeKeyboardInsetModule = require(MomentsCreation.Utils.computeKeyboardInset)
local GetFFlagMomentsDescriptionKeyboardAvoidanceFixModule = require(MomentsCreation.Flags.GetFFlagMomentsDescriptionKeyboardAvoidanceFix)

return function(p1)
	-- upvalues: GetFFlagMomentsDescriptionKeyboardAvoidanceFixModule (copy), ReactModule (copy), ComputeKeyboardInsetModule (copy), UserInputService (copy)
	local FFlagMomentsDescriptionKeyboardAvoidanceFixModule = GetFFlagMomentsDescriptionKeyboardAvoidanceFixModule()
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), ComputeKeyboardInsetModule (upval), p1 (copy), UserInputService (upval), FFlagMomentsDescriptionKeyboardAvoidanceFixModule (copy), UseBindingResult2 (copy), UseStateResult2 (copy)
		local Current = UseRefResult.current
		local KeyboardInsetModule = ComputeKeyboardInsetModule(p1, UserInputService.OnScreenKeyboardVisible, UserInputService.OnScreenKeyboardPosition.Y, if Current == nil then 0 else Current.AbsolutePosition.Y + Current.AbsoluteSize.Y, if FFlagMomentsDescriptionKeyboardAvoidanceFixModule then UserInputService.OnScreenKeyboardSize.Y else 1e999)
		
		if FFlagMomentsDescriptionKeyboardAvoidanceFixModule then
			UseBindingResult2(KeyboardInsetModule)
			
			return
		else
			UseStateResult2(KeyboardInsetModule)
		end
	end, { p1, FFlagMomentsDescriptionKeyboardAvoidanceFixModule })
	local UseResult1 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), UseResult (copy)
		UseRefResult.current = Current
		UseResult()
	end, { UseResult })
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy), p1 (copy), UserInputService (upval)
		UseResult()
		
		if not p1 then return end
		local Connections = {
			UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(UseResult),
			UserInputService:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(UseResult),
			UserInputService:GetPropertyChangedSignal("OnScreenKeyboardSize"):Connect(UseResult)
		}
		
		return function()
			-- upvalues: Connections (copy)
			for _, connection in Connections do
				connection:Disconnect()
			end
		end
	end, { p1, UseResult })
	
	return if FFlagMomentsDescriptionKeyboardAvoidanceFixModule then UseBindingResult else UseStateResult, UseResult1
end