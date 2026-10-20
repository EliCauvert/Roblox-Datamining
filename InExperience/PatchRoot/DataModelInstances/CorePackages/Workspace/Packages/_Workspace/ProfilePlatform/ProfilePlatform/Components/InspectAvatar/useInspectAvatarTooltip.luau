local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local v1 = require(ProfilePlatform.Stores.GetInspectAvatarTooltipStore)(false)

return function()
	-- upvalues: UseSignalStateFunction (copy), v1 (copy), ReactModule (copy)
	local UseSignalStateResult = UseSignalStateFunction(v1.getIsOpen)
	ReactModule.useEffect(function()
		-- upvalues: v1 (upval)
		v1.tryShow()
		
		return function()
			-- upvalues: v1 (upval)
			v1.hide()
		end
	end, {})
	
	return {
		showTooltip = UseSignalStateResult,
		onDismiss = v1.permanentlyDismiss
	}
end