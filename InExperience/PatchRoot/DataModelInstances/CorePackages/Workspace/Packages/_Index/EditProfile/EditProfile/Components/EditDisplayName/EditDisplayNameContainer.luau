local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local reactModule = require(parent.React)
local editDisplayNameModule = require(script.Parent.EditDisplayName)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local var1 = require(parent.UserProfiles).Stores.UserProfileStore.get()
local useSignalState = require(parent.SignalsReact).useSignalState
local updateUserDisplayNameModule = require(editProfile.Stores.Requests.updateUserDisplayName)
local validateUserDisplayNameModule = require(editProfile.Stores.Requests.validateUserDisplayName)
local analyticsServiceV2Module = require(editProfile.Analytics.AnalyticsServiceV2)

return function(p1)
	-- upvalues: useLocalUserId (ref), reactModule (ref), var1 (ref), useSignalState (ref), analyticsServiceV2Module (ref), updateUserDisplayNameModule (ref), validateUserDisplayNameModule (ref), editDisplayNameModule (ref)
	local var2 = useLocalUserId()
	local var3 = useSignalState(reactModule.useMemo(function()
		-- upvalues: var1 (copy), var2 (ref)
		return var1.fetchNamesByUserIds({ tostring(var2) })
	end, { var2 }))
	local var4 = reactModule.useMemo(function()
		-- upvalues: var3 (ref)
		return if var3 and var3.status == "success" and (var3.data and #var3.data > 0) then var3.data[1].names.getDisplayName(false) or "" else ""
	end, { var3 })
	local var5, var6 = reactModule.useState(var4)
	local var7 = reactModule.useCallback(function(p2)
		-- upvalues: var6 (ref)
		var6(p2)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: analyticsServiceV2Module (copy)
		analyticsServiceV2Module.sendDisplayNameModalLoaded()
	end, {})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), updateUserDisplayNameModule (copy), var2 (ref), var5 (ref), analyticsServiceV2Module (copy), var3 (ref)
		p1.registerSaveHandler(function()
			-- upvalues: updateUserDisplayNameModule (copy), var2 (copy), var5 (copy), analyticsServiceV2Module (copy), var3 (copy)
			return updateUserDisplayNameModule(tostring(var2), var5):andThen(function(p2)
				-- upvalues: analyticsServiceV2Module (copy), var5 (copy), var3 (copy)
				analyticsServiceV2Module.sendDisplayNameSaved(var5)
				
				if var3 and var3.data and #var3.data > 0 then
					local var8 = var3.data[1]
					
					if var8.names.setDisplayName then
						var8.names.setDisplayName(p2)
					end
				end
			end)
		end)
	end, { p1.registerSaveHandler, var2, var5, var3 })
	
	return reactModule.createElement(editDisplayNameModule, {
		initialDisplayName = var4,
		onDataChange = var7,
		validateDisplayName = function(p2)
			-- upvalues: validateUserDisplayNameModule (copy), var2 (ref)
			return validateUserDisplayNameModule(tostring(var2), p2)
		end,
		updateErrorState = p1.updateErrorState,
		textBoxRef = p1.textBoxRef
	})
end