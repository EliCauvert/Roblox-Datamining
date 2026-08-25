local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local reactModule = require(parent.React)
local editBioModule = require(script.Parent.EditBio)
local promiseModule = require(parent.Promise)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local editProfileStoreModule = require(editProfile.Stores.EditProfileStore)
local useSignalState = require(parent.SignalsReact).useSignalState
local analyticsServiceV2Module = require(editProfile.Analytics.AnalyticsServiceV2)

return function(p0)
	-- upvalues: useLocalUserId (ref), editProfileStoreModule (ref), useSignalState (ref), reactModule (ref), analyticsServiceV2Module (ref), promiseModule (ref), editBioModule (ref)
	local var6 = useLocalUserId()
	local data = useSignalState(editProfileStoreModule.getDescription(var6).data) or ""
	local var8, var9 = reactModule.useState(data)
	local var10, var11 = reactModule.useState(nil)
	local var12 = reactModule.useCallback(function(p1)
		-- upvalues: var9 (ref), var11 (ref)
		var9(p1)
		var11(nil)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), data (ref)
		var9(data)
	end, { data })
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), editProfileStoreModule (copy), var6 (ref), var8 (ref), var11 (ref), analyticsServiceV2Module (copy), promiseModule (copy)
		p0.registerSaveHandler(function()
			-- upvalues: editProfileStoreModule (copy), var6 (copy), var8 (copy), var11 (copy), analyticsServiceV2Module (copy), promiseModule (copy)
			return editProfileStoreModule.updateDescription(var6, var8):catch(function(p2)
				-- upvalues: var11 (copy), analyticsServiceV2Module (copy), promiseModule (copy)
				if not p2 then return end
				local statusCode = nil
				
				if p2.errors and p2.errors[1] then
					statusCode = p2.errors[1].code
				elseif p2.statusCode then
					statusCode = p2.statusCode
				end
				if statusCode then
					var11(statusCode)
					analyticsServiceV2Module.sendError(statusCode)
				end
				return promiseModule.reject(p2)
			end)
		end)
	end, { p0.registerSaveHandler, var6, var8 })
	
	return reactModule.createElement(editBioModule, {
		bioText = var8,
		onDataChange = var12,
		errorCode = var10,
		textBoxRef = p0.textBoxRef
	})
end