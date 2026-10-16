local Parent = script:FindFirstAncestor("Responsive").Parent
local ReactModule = require(Parent.React)
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService

return function() --[[ Line: 6 | Named "useIsInFullScreen" ]]
	-- upvalues: UseRoactServiceFunction (copy), RoactServiceTagsModule (copy), ReactModule (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactServiceTagsModule.AppUserGameSettings)
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseRoactServiceResult:InFullScreen())
	ReactModule.useEffect(function() --[[ Line: 10 ]]
		-- upvalues: UseStateResult2 (copy), UseRoactServiceResult (copy)
		UseStateResult2(UseRoactServiceResult:InFullScreen())
		local FullscreenChangedConnection = UseRoactServiceResult.FullscreenChanged:Connect(function(IsFullscreen) --[[ Line: 12 ]]
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(IsFullscreen)
		end)
		
		return function() --[[ Line: 16 ]]
			-- upvalues: FullscreenChangedConnection (copy)
			FullscreenChangedConnection:Disconnect()
		end
	end, {})
	
	return UseStateResult
end