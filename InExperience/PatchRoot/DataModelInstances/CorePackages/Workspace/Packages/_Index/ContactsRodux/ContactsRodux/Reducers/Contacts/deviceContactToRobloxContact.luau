local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local types = parent.Types
local roduxModule = require(parent_1.Rodux)
local dashModule = require(parent_1.Dash)
local _ = require(types.ActionTypes)
local _ = require(types.ReducerTypes)
local getDeepValue = require(parent_1.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local t = {}

return function(p0)
	-- upvalues: roduxModule (ref), t (ref), getDeepValue (ref), dashModule (ref)
	return roduxModule.createReducer(t, {
		[p0.networkingContacts.UploadContactsByUser.Succeeded.name] = function(_, p1)
			-- upvalues: getDeepValue (copy), dashModule (copy)
			if getDeepValue(p1, "responseBody.matchedContactFields") then
				local t = {}
				dashModule.forEach(p1.responseBody.matchedContactFields, function(p2)
					-- upvalues: t (ref)
					if not t[p2.idAssignedByFE] then
						t[p2.idAssignedByFE] = {}
					end
					t[p2.idAssignedByFE][p2.userContactId] = true
				end)
				
				return t
			end
			return {}
		end
	})
end