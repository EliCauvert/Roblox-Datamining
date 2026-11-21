local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local Parent = AvatarWorkshop.Parent
local ReactModule = require(Parent.React)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local WorkshopWindowContextModule = require(AvatarWorkshop.Contexts.WorkshopWindowContext)
local GetAvatarStateStoreModule = require(AvatarWorkshop.Stores.Getters.getAvatarStateStore)
local GetUiStateStoreModule = require(AvatarWorkshop.Stores.Getters.getUiStateStore)
local RespawnDialogModule = require(script.Parent.RespawnDialog)

return function()
	-- upvalues: ReactModule (copy), WorkshopWindowContextModule (copy), UseSignalStateFunction (copy), GetAvatarStateStoreModule (copy), GetUiStateStoreModule (copy), RespawnDialogModule (copy)
	local UseContextResult = ReactModule.useContext(WorkshopWindowContextModule)
	local UseSignalStateResult = UseSignalStateFunction(GetAvatarStateStoreModule)
	local UseSignalStateResult1 = UseSignalStateFunction(GetUiStateStoreModule)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(true)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		UseRefResult.current = true
		
		return function()
			-- upvalues: UseRefResult (upval)
			UseRefResult.current = false
		end
	end, {})
	local OnCloseFunction = UseContextResult.onClose
	local RespawnFunction = UseContextResult.respawn
	local SetIsRespawnDialogOpenFunction = UseSignalStateResult1.setIsRespawnDialogOpen
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: SetIsRespawnDialogOpenFunction (copy)
		SetIsRespawnDialogOpenFunction(false)
	end, { SetIsRespawnDialogOpenFunction })
	local UseRefResult1 = ReactModule.useRef(false)
	local UseResult1 = ReactModule.useCallback(function(p1)
		-- upvalues: UseRefResult1 (copy), UseStateResult2 (copy), UseSignalStateResult (copy), UseRefResult (copy), UseResult (copy), OnCloseFunction (copy), RespawnFunction (copy)
		if not UseRefResult1.current then
			UseRefResult1.current = true
			UseStateResult2(p1)
			task.spawn(function()
				-- upvalues: UseSignalStateResult (upval), UseRefResult1 (upval), UseRefResult (upval), UseStateResult2 (upval), UseResult (upval), OnCloseFunction (upval), p1 (copy), RespawnFunction (upval)
				local SaveResult = UseSignalStateResult.save()
				UseRefResult1.current = false
				
				if UseRefResult.current then
					UseStateResult2(nil)
					
					if SaveResult then
						UseResult()
						OnCloseFunction()
					end
				end
				if SaveResult and p1 == "Respawn" then
					RespawnFunction()
				end
			end)
			
			return
		end
	end, {
		UseSignalStateResult,
		UseResult,
		OnCloseFunction,
		RespawnFunction
	})
	
	return ReactModule.createElement(RespawnDialogModule, {
		respawnEnabled = UseContextResult.respawnEnabled,
		savingChoice = UseStateResult,
		onRespawn = ReactModule.useCallback(function()
			-- upvalues: UseResult1 (copy)
			UseResult1("Respawn")
		end, { UseResult1 }),
		onDefer = ReactModule.useCallback(function()
			-- upvalues: UseResult1 (copy)
			UseResult1("Defer")
		end, { UseResult1 }),
		onClose = ReactModule.useCallback(function()
			-- upvalues: UseRefResult1 (copy), UseResult (copy)
			if not UseRefResult1.current then
				UseResult()
			end
		end, { UseResult })
	})
end