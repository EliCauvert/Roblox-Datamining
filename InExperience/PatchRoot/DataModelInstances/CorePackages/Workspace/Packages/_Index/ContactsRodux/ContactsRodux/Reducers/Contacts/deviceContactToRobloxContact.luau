local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local types = parent.Types
local roduxModule = require(parent_1.Rodux)
local dashModule = require(parent_1.Dash)
local _ = require(types.ActionTypes)
local _ = require(types.ReducerTypes)
local getDeepValue = require(parent_1.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local t = {}

return function(p1)
	-- upvalues: roduxModule (ref), t (ref), getDeepValue (ref), dashModule (ref)
	return roduxModule.createReducer(t, {
		[p1.networkingContacts.UploadContactsByUser.Succeeded.name] = function(_, p2)
			-- upvalues: getDeepValue (copy), dashModule (copy)
			if getDeepValue(p2, "responseBody.matchedContactFields") then
				local t = {}
				dashModule.forEach(p2.responseBody.matchedContactFields, function(p3)
					-- upvalues: t (ref)
					if not t[p3.idAssignedByFE] then
						t[p3.idAssignedByFE] = {}
					end
					t[p3.idAssignedByFE][p3.userContactId] = true
				end)
				
				return t
			end
			return {}
		end
	})
end