local dependenciesModule = require(script:FindFirstAncestor("PYMKCarousel").dependencies)
local roduxUsers = dependenciesModule.RoduxUsers
local convertActions = dependenciesModule.convertActions
local llama = dependenciesModule.llama
local usersActionAdaptor = dependenciesModule.usersActionAdaptor
local usersOmniActionAdaptorModule = require(script.Parent.usersOmniActionAdaptor)
local t = { byUserId = {}, byUsername = {} }
local var1 = roduxUsers.installReducer()

local _ = function(p1)
	-- upvalues: llama (ref), usersActionAdaptor (ref), roduxUsers (ref), usersOmniActionAdaptorModule (ref)
	return llama.Dictionary.join(usersActionAdaptor(roduxUsers), usersOmniActionAdaptorModule(p1))
end

return function(p1)
	-- upvalues: convertActions (ref), var1 (ref), llama (ref), usersActionAdaptor (ref), roduxUsers (ref), usersOmniActionAdaptorModule (ref), t (ref)
	return convertActions(var1, llama.Dictionary.join(usersActionAdaptor(roduxUsers), usersOmniActionAdaptorModule(p1)), t)
end