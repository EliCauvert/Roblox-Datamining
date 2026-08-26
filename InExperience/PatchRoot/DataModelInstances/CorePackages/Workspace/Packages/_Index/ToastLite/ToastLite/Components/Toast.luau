local parent = script:FindFirstAncestor("ToastLite").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local toastRoduxModule = require(parent.ToastRodux)
local UIBloxModule = require(parent.UIBlox)
local toast = UIBloxModule.App.Dialog.Toast
local images = UIBloxModule.App.ImageSet.Images
local toastType = toastRoduxModule.Enums.ToastType
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useStyle = UIBloxModule.Core.Style.useStyle
local t = {
	Info = images["icons/logo/block"],
	Warning = images["icons/status/alert"],
	Success = images["icons/actions/accept"]
}
local t_1 = {
	[toastType.InformationMessage] = t.Info,
	[toastType.SuccessConfirmation] = t.Success,
	[toastType.NetworkingError] = t.Warning
}
local t_2 = {
	duration = 3,
	springOptions = { frequency = 4, damping = 1 }
}

local function selectCurrentMessage(p1)
	return p1.currentToastMessages[1]
end

return function(p1)
	-- upvalues: cryoModule (ref), t_2 (ref), useDispatch (ref), useSelector (ref), selectCurrentMessage (ref), useStyle (ref), reactModule (ref), toastRoduxModule (ref), toastType (ref), t_1 (ref), toast (ref)
	local var1 = cryoModule.Dictionary.join(t_2, p1)
	local var2 = useDispatch()
	local var3 = useSelector(selectCurrentMessage)
	local tokens = useStyle().Tokens
	local var4 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), toastRoduxModule (copy)
		var2(toastRoduxModule.Actions.RemoveCurrentToastMessage())
	end, { var2 })
	
	local var5 = function()
		-- upvalues: var3 (ref), var4 (ref)
		if var3 then
			var4()
		end
	end
	
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var4 (ref)
		if var3 and (not next(var3) or not var3.toastTitle) then
			var4()
		end
	end, { var3, var4 })
	
	if var3 == nil then
		return nil
	end
	local toastType_1 = var3.toastType
	
	return reactModule.createElement(toast, {
		show = true,
		duration = var1.duration,
		position = UDim2.new(0.5, 0, 0, tokens.Size.Size_500),
		springOptions = var1.springOptions,
		toastContent = {
			iconImage = if toastType_1 ~= nil then nil else t_1[toastType_1],
			onActivated = if toastType_1 == toastType.QuickLaunchError then var5 else nil,
			onDismissed = var4,
			sequenceNumber = var3.sequenceNumber,
			toastSubtitle = var3.toastSubtitle,
			toastTitle = var3.toastTitle
		}
	})
end