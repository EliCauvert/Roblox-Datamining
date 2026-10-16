local EditProfile = script:FindFirstAncestor("EditProfile")
local Parent = EditProfile.Parent
local ReactModule = require(Parent.React)
local EditDisplayNameModule = require(script.Parent.EditDisplayName)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local GetResult = require(Parent.UserProfiles).Stores.UserProfileStore.get()
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UpdateUserDisplayNameModule = require(EditProfile.Stores.Requests.updateUserDisplayName)
local ValidateUserDisplayNameModule = require(EditProfile.Stores.Requests.validateUserDisplayName)
local AnalyticsServiceV2Module = require(EditProfile.Analytics.AnalyticsServiceV2)

return function(p1) --[[ Line: 21 ]]
	-- upvalues: UseLocalUserIdFunction (copy), ReactModule (copy), GetResult (copy), UseSignalStateFunction (copy), AnalyticsServiceV2Module (copy), UpdateUserDisplayNameModule (copy), ValidateUserDisplayNameModule (copy), EditDisplayNameModule (copy)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseSignalStateResult = UseSignalStateFunction((ReactModule.useMemo(function() --[[ Line: 23 ]]
		-- upvalues: GetResult (upval), UseLocalUserIdResult (copy)
		return GetResult.fetchNamesByUserIds({ (tostring(UseLocalUserIdResult)) })
	end, { UseLocalUserIdResult })))
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 28 ]]
		-- upvalues: UseSignalStateResult (copy)
		return UseSignalStateResult and UseSignalStateResult.status == "success" and UseSignalStateResult.data and #UseSignalStateResult.data > 0 and UseSignalStateResult.data[1].names.getDisplayName(false) or ""
	end, { UseSignalStateResult })
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseMemoResult)
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 36 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(p2)
	end, {})
	ReactModule.useEffect(function() --[[ Line: 40 ]]
		-- upvalues: AnalyticsServiceV2Module (upval)
		AnalyticsServiceV2Module.sendDisplayNameModalLoaded()
	end, {})
	ReactModule.useEffect(function() --[[ Line: 44 ]]
		-- upvalues: p1 (copy), UpdateUserDisplayNameModule (upval), UseLocalUserIdResult (copy), UseStateResult (copy), AnalyticsServiceV2Module (upval), UseSignalStateResult (copy)
		p1.registerSaveHandler(function() --[[ Line: 45 ]]
			-- upvalues: UpdateUserDisplayNameModule (upval), UseLocalUserIdResult (upval), UseStateResult (upval), AnalyticsServiceV2Module (upval), UseSignalStateResult (upval)
			return UpdateUserDisplayNameModule(tostring(UseLocalUserIdResult), UseStateResult):andThen(function(Result) --[[ Line: 46 ]]
				-- upvalues: AnalyticsServiceV2Module (upval), UseStateResult (upval), UseSignalStateResult (upval)
				AnalyticsServiceV2Module.sendDisplayNameSaved(UseStateResult)
				
				if UseSignalStateResult and UseSignalStateResult.data and #UseSignalStateResult.data > 0 then
					local Entry = UseSignalStateResult.data[1]
					
					if Entry.names.setDisplayName then
						Entry.names.setDisplayName(Result)
					end
				end
			end)
		end)
	end, {
		p1.registerSaveHandler,
		UseLocalUserIdResult,
		UseStateResult,
		UseSignalStateResult
	})
	
	return ReactModule.createElement(EditDisplayNameModule, {
		initialDisplayName = UseMemoResult,
		onDataChange = UseResult,
		validateDisplayName = function(p2) --[[ Line: 58 ]]
			-- upvalues: ValidateUserDisplayNameModule (upval), UseLocalUserIdResult (copy)
			return ValidateUserDisplayNameModule(tostring(UseLocalUserIdResult), p2)
		end,
		updateErrorState = p1.updateErrorState,
		textBoxRef = p1.textBoxRef
	})
end