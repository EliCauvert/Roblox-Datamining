local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local reactModule = require(parent.React)
local editDisplayNameModule = require(script.Parent.EditDisplayName)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local var3 = require(parent.UserProfiles).Stores.UserProfileStore.get()
local useSignalState = require(parent.SignalsReact).useSignalState
local updateUserDisplayNameModule = require(editProfile.Stores.Requests.updateUserDisplayName)
local validateUserDisplayNameModule = require(editProfile.Stores.Requests.validateUserDisplayName)
local analyticsServiceV2Module = require(editProfile.Analytics.AnalyticsServiceV2)

return function(p0) --[[ line: 21 ]]
	-- upvalues: useLocalUserId (ref), reactModule (ref), var3 (ref), useSignalState (ref), analyticsServiceV2Module (ref), updateUserDisplayNameModule (ref), validateUserDisplayNameModule (ref), editDisplayNameModule (ref)
	local var7 = useLocalUserId()
	local var8 = useSignalState(reactModule.useMemo(function() --[[ line: 23 ]]
		-- upvalues: var3 (copy), var7 (ref)
		return var3.fetchNamesByUserIds({ tostring(var7) })
	end, { var7 }))
	local var9 = reactModule.useMemo(function() --[[ line: 28 ]]
		-- upvalues: var8 (ref)
		return if var8 and var8.status == "success" and (var8.data and #var8.data > 0) then var8.data[1].names.getDisplayName(false) or "" else ""
	end, { var8 })
	local var10, var11 = reactModule.useState(var9)
	local var12 = reactModule.useCallback(function(p1) --[[ line: 36 ]]
		-- upvalues: var11 (ref)
		var11(p1)
	end, {})
	reactModule.useEffect(function() --[[ line: 40 ]]
		-- upvalues: analyticsServiceV2Module (copy)
		analyticsServiceV2Module.sendDisplayNameModalLoaded()
	end, {})
	reactModule.useEffect(function() --[[ line: 44 ]]
		-- upvalues: p0 (ref), updateUserDisplayNameModule (copy), var7 (ref), var10 (ref), analyticsServiceV2Module (copy), var8 (ref)
		p0.registerSaveHandler(function() --[[ line: 45 ]]
			-- upvalues: updateUserDisplayNameModule (copy), var7 (copy), var10 (copy), analyticsServiceV2Module (copy), var8 (copy)
			return updateUserDisplayNameModule(tostring(var7), var10):andThen(function(p2) --[[ line: 46 ]]
				-- upvalues: analyticsServiceV2Module (copy), var10 (copy), var8 (copy)
				analyticsServiceV2Module.sendDisplayNameSaved(var10)
				
				if var8 and var8.data and #var8.data > 0 then
					local var13 = var8.data[1]
					
					if var13.names.setDisplayName then
						var13.names.setDisplayName(p2)
					end
				end
			end)
		end)
	end, { p0.registerSaveHandler, var7, var10, var8 })
	
	return reactModule.createElement(editDisplayNameModule, {
		initialDisplayName = var9,
		onDataChange = var12,
		validateDisplayName = function(p3) --[[ line: 58 ]]
			-- upvalues: validateUserDisplayNameModule (copy), var7 (ref)
			return validateUserDisplayNameModule(tostring(var7), p3)
		end,
		updateErrorState = p0.updateErrorState,
		textBoxRef = p0.textBoxRef
	})
end