local RoduxCall = script:FindFirstAncestor("RoduxCall")
local Parent = RoduxCall.Parent
local TModule = require(Parent.t)
local CryoModule = require(Parent.Cryo)
local EnumsModule = require(RoduxCall.Enums)
local SuggestedCalleeModelModule = {}

function SuggestedCalleeModelModule.new(p1) --[[ Line: 9 ]]
	-- upvalues: SuggestedCalleeModelModule (copy)
	assert(SuggestedCalleeModelModule.isValid(p1))
	SuggestedCalleeModelModule.__index = SuggestedCalleeModelModule
	setmetatable(p1, SuggestedCalleeModelModule)
	
	return p1
end

function SuggestedCalleeModelModule.mock(p1) --[[ Line: 21 ]]
	-- upvalues: SuggestedCalleeModelModule (copy)
	local P1 = p1 or {}
	
	return (SuggestedCalleeModelModule.new({
		lastLocation = "",
		userId = P1.userId or 12345,
		userPresenceType = P1.userPresenceType or "Offline"
	}))
end

function SuggestedCalleeModelModule.format(p1) --[[ Line: 33 ]]
	-- upvalues: CryoModule (copy), EnumsModule (copy)
	return CryoModule.Dictionary.join(p1, {
		userPresenceType = EnumsModule.PresenceType[p1.userPresenceType]
	})
end

SuggestedCalleeModelModule.isValid = TModule.strictInterface({
	userId = TModule.number,
	userPresenceType = function(p1): boolean --[[ Line: 41 ]]
		-- upvalues: EnumsModule (copy)
		return EnumsModule.PresenceType[p1] ~= nil
	end,
	lastLocation = TModule.string
})

return SuggestedCalleeModelModule