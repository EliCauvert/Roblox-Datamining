local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local Types = Parent.Types
local RoduxModule = require(Parent1.Rodux)
local DashModule = require(Parent1.Dash)
local _ = require(Types.ActionTypes)
local _ = require(Types.ReducerTypes)
local GetDeepValueFunction = require(Parent1.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local t = {}

return function(p1) --[[ Line: 12 ]]
	-- upvalues: RoduxModule (copy), t (copy), GetDeepValueFunction (copy), DashModule (copy)
	return RoduxModule.createReducer(t, {
		[p1.networkingContacts.UploadContactsByUser.Succeeded.name] = function(_, p2) --[[ Line: 16 ]]
			-- upvalues: GetDeepValueFunction (upval), DashModule (upval)
			if GetDeepValueFunction(p2, "responseBody.matchedContactFields") then
				local t = {}
				DashModule.forEach(p2.responseBody.matchedContactFields, function(p3) --[[ Line: 27 ]]
					-- upvalues: t (copy)
					if not t[p3.idAssignedByFE] then
						t[p3.idAssignedByFE] = {}
					end
					t[p3.idAssignedByFE][p3.userContactId] = true
				end)
				
				return t
			else
				return {}
			end
		end
	})
end