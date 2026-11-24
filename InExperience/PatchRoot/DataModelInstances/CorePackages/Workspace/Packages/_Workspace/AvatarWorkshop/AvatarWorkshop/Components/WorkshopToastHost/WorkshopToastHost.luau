local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local Parent = AvatarWorkshop.Parent
local ReactModule = require(Parent.React)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local WorkshopToastModule = require(AvatarWorkshop.Components.WorkshopToast.WorkshopToast)
local GetToastStoreModule = require(AvatarWorkshop.Stores.Getters.getToastStore)

return function()
	-- upvalues: UseSignalStateFunction (copy), GetToastStoreModule (copy), ReactModule (copy), WorkshopToastModule (copy)
	local UseSignalStateResult = UseSignalStateFunction(GetToastStoreModule)
	local UseSignalStateResult1 = UseSignalStateFunction(UseSignalStateResult.getToast)
	local UseSignalStateResult2 = UseSignalStateFunction(UseSignalStateResult.getToastId)
	local ExpireFunction = UseSignalStateResult.expire
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseSignalStateResult2 (copy), ExpireFunction (copy)
		if UseSignalStateResult2 then
			ExpireFunction(UseSignalStateResult2)
		end
	end, { ExpireFunction, UseSignalStateResult2 })
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy)
		return function()
			-- upvalues: UseSignalStateResult (upval)
			local ToastId = UseSignalStateResult.getToastId(false)
			
			if ToastId then
				UseSignalStateResult.expire(ToastId)
			end
		end
	end, { UseSignalStateResult })
	
	return if UseSignalStateResult1 == nil or UseSignalStateResult2 == nil then nil else ReactModule.createElement(WorkshopToastModule, {
		key = UseSignalStateResult2,
		title = UseSignalStateResult1.title,
		actions = UseSignalStateResult1.actions,
		onDismiss = UseResult,
		testId = UseSignalStateResult1.testId
	})
end