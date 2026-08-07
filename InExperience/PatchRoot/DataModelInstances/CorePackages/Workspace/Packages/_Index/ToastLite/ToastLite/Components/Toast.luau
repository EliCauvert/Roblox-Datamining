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

local function selectCurrentMessage(p0) --[[ line: 49 ]]
	return p0.currentToastMessages[1]
end

return function(p1) --[[ line: 53 | named "Toast" ]]
	-- upvalues: cryoModule (ref), t_2 (ref), useDispatch (ref), useSelector (ref), selectCurrentMessage (ref), useStyle (ref), reactModule (ref), toastRoduxModule (ref), toastType (ref), t_1 (ref), toast (ref)
	local var9 = cryoModule.Dictionary.join(t_2, p1)
	local var10 = useDispatch()
	local var11 = useSelector(selectCurrentMessage)
	local tokens = useStyle().Tokens
	local var12 = reactModule.useCallback(function() --[[ line: 61 ]]
		-- upvalues: var10 (ref), toastRoduxModule (copy)
		var10(toastRoduxModule.Actions.RemoveCurrentToastMessage())
	end, { var10 })
	
	local var13 = function() --[[ line: 66 ]]
		-- upvalues: var11 (ref), var12 (ref)
		if var11 then
			var12()
		end
	end
	
	reactModule.useEffect(function() --[[ line: 73 ]]
		-- upvalues: var11 (ref), var12 (ref)
		if var11 and (not next(var11) or not var11.toastTitle) then
			var12()
		end
	end, { var11, var12 })
	
	if var11 == nil then
		return nil
	end
	local toastType_1 = var11.toastType
	
	return reactModule.createElement(toast, {
		show = true,
		duration = var9.duration,
		position = UDim2.new(0.5, 0, 0, tokens.Size.Size_500),
		springOptions = var9.springOptions,
		toastContent = {
			iconImage = if toastType_1 ~= nil then nil else t_1[toastType_1],
			onActivated = if toastType_1 == toastType.QuickLaunchError then var13 else nil,
			onDismissed = var12,
			sequenceNumber = var11.sequenceNumber,
			toastSubtitle = var11.toastSubtitle,
			toastTitle = var11.toastTitle
		}
	})
end