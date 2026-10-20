local Parent = script:FindFirstAncestor("ToastLite").Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local ToastRoduxModule = require(Parent.ToastRodux)
local UIBloxModule = require(Parent.UIBlox)
local Toast = UIBloxModule.App.Dialog.Toast
local Images = UIBloxModule.App.ImageSet.Images
local ToastType = ToastRoduxModule.Enums.ToastType
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local config = {
	Info = Images["icons/logo/block"],
	Warning = Images["icons/status/alert"],
	Success = Images["icons/actions/accept"]
}
local config1 = {
	[ToastType.InformationMessage] = config.Info,
	[ToastType.SuccessConfirmation] = config.Success,
	[ToastType.NetworkingError] = config.Warning
}
local config2 = {
	duration = 3,
	springOptions = { frequency = 4, damping = 1 }
}

local function selectCurrentMessage(p1)
	return p1.currentToastMessages[1]
end

return function(p1)
	-- upvalues: CryoModule (copy), config2 (copy), UseDispatchFunction (copy), UseSelectorFunction (copy), selectCurrentMessage (copy), UseStyleFunction (copy), ReactModule (copy), ToastRoduxModule (copy), ToastType (copy), config1 (copy), Toast (copy)
	local JoinResult = CryoModule.Dictionary.join(config2, p1)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction(selectCurrentMessage)
	local Tokens = UseStyleFunction().Tokens
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), ToastRoduxModule (upval)
		UseDispatchResult(ToastRoduxModule.Actions.RemoveCurrentToastMessage())
	end, { UseDispatchResult })
	
	local function v18()
		-- upvalues: UseSelectorResult (copy), UseResult (copy)
		if UseSelectorResult then
			UseResult()
		end
	end
	
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), UseResult (copy)
		if UseSelectorResult and (not next(UseSelectorResult) or not UseSelectorResult.toastTitle) then
			UseResult()
		end
	end, { UseSelectorResult, UseResult })
	
	if UseSelectorResult == nil then
		return nil
	else
		local ToastType1 = UseSelectorResult.toastType
		
		return ReactModule.createElement(Toast, {
			show = true,
			duration = JoinResult.duration,
			position = UDim2.new(0.5, 0, 0, Tokens.Size.Size_500),
			springOptions = JoinResult.springOptions,
			toastContent = {
				iconImage = if ToastType1 == nil then nil else config1[ToastType1],
				onActivated = if ToastType1 == ToastType.QuickLaunchError then v18 else nil,
				onDismissed = UseResult,
				sequenceNumber = UseSelectorResult.sequenceNumber,
				toastSubtitle = UseSelectorResult.toastSubtitle,
				toastTitle = UseSelectorResult.toastTitle
			}
		})
	end
end