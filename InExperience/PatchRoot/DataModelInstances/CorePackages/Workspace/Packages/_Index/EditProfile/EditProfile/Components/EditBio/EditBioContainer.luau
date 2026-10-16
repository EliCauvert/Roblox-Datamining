local EditProfile = script:FindFirstAncestor("EditProfile")
local Parent = EditProfile.Parent
local ReactModule = require(Parent.React)
local EditBioModule = require(script.Parent.EditBio)
local PromiseModule = require(Parent.Promise)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local EditProfileStoreModule = require(EditProfile.Stores.EditProfileStore)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local AnalyticsServiceV2Module = require(EditProfile.Analytics.AnalyticsServiceV2)

return function(p1) --[[ Line: 18 ]]
	-- upvalues: UseLocalUserIdFunction (copy), EditProfileStoreModule (copy), UseSignalStateFunction (copy), ReactModule (copy), AnalyticsServiceV2Module (copy), PromiseModule (copy), EditBioModule (copy)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseSignalStateResult = UseSignalStateFunction(EditProfileStoreModule.getDescription(UseLocalUserIdResult).data) or ""
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseSignalStateResult)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 26 ]]
		-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy)
		UseStateResult2(p2)
		UseStateResult2_1(nil)
	end, {})
	ReactModule.useEffect(function() --[[ Line: 31 ]]
		-- upvalues: UseStateResult2 (copy), UseSignalStateResult (copy)
		UseStateResult2(UseSignalStateResult)
	end, { UseSignalStateResult })
	ReactModule.useEffect(function() --[[ Line: 35 ]]
		-- upvalues: p1 (copy), EditProfileStoreModule (upval), UseLocalUserIdResult (copy), UseStateResult (copy), UseStateResult2_1 (copy), AnalyticsServiceV2Module (upval), PromiseModule (upval)
		p1.registerSaveHandler(function() --[[ Line: 36 ]]
			-- upvalues: EditProfileStoreModule (upval), UseLocalUserIdResult (upval), UseStateResult (upval), UseStateResult2_1 (upval), AnalyticsServiceV2Module (upval), PromiseModule (upval)
			return EditProfileStoreModule.updateDescription(UseLocalUserIdResult, UseStateResult):catch(function(Err) --[[ Line: 37 ]]
				-- upvalues: UseStateResult2_1 (upval), AnalyticsServiceV2Module (upval), PromiseModule (upval)
				if not Err then return end
				local Code = nil
				
				if Err.errors and Err.errors[1] then
					Code = Err.errors[1].code
				elseif Err.statusCode then
					Code = Err.statusCode
				end
				if Code then
					UseStateResult2_1(Code)
					AnalyticsServiceV2Module.sendError(Code)
				end
				return PromiseModule.reject(Err)
			end)
		end)
	end, {
		p1.registerSaveHandler,
		UseLocalUserIdResult,
		UseStateResult
	})
	
	return ReactModule.createElement(EditBioModule, {
		bioText = UseStateResult,
		onDataChange = UseResult,
		errorCode = UseStateResult1,
		textBoxRef = p1.textBoxRef
	})
end