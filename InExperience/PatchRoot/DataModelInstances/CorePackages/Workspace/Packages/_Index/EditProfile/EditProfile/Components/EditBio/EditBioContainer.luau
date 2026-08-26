local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local reactModule = require(parent.React)
local editBioModule = require(script.Parent.EditBio)
local promiseModule = require(parent.Promise)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local editProfileStoreModule = require(editProfile.Stores.EditProfileStore)
local useSignalState = require(parent.SignalsReact).useSignalState
local analyticsServiceV2Module = require(editProfile.Analytics.AnalyticsServiceV2)

return function(p1)
	-- upvalues: useLocalUserId (ref), editProfileStoreModule (ref), useSignalState (ref), reactModule (ref), analyticsServiceV2Module (ref), promiseModule (ref), editBioModule (ref)
	local var1 = useLocalUserId()
	local data = useSignalState(editProfileStoreModule.getDescription(var1).data) or ""
	local var2, var3 = reactModule.useState(data)
	local var4, var5 = reactModule.useState(nil)
	local var6 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), var5 (ref)
		var3(p2)
		var5(nil)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), data (ref)
		var3(data)
	end, { data })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), editProfileStoreModule (copy), var1 (ref), var2 (ref), var5 (ref), analyticsServiceV2Module (copy), promiseModule (copy)
		p1.registerSaveHandler(function()
			-- upvalues: editProfileStoreModule (copy), var1 (copy), var2 (copy), var5 (copy), analyticsServiceV2Module (copy), promiseModule (copy)
			return editProfileStoreModule.updateDescription(var1, var2):catch(function(p2)
				-- upvalues: var5 (copy), analyticsServiceV2Module (copy), promiseModule (copy)
				if not p2 then return end
				local statusCode = nil
				
				if p2.errors and p2.errors[1] then
					statusCode = p2.errors[1].code
				elseif p2.statusCode then
					statusCode = p2.statusCode
				end
				if statusCode then
					var5(statusCode)
					analyticsServiceV2Module.sendError(statusCode)
				end
				return promiseModule.reject(p2)
			end)
		end)
	end, { p1.registerSaveHandler, var1, var2 })
	
	return reactModule.createElement(editBioModule, {
		bioText = var2,
		onDataChange = var6,
		errorCode = var4,
		textBoxRef = p1.textBoxRef
	})
end