local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local expChatSharedModule = require(parent.ExpChatShared)
local actions = expChat.Actions

local function findFirstChildByNameAndClass(p0, p1, p2) --[[ line: 16 ]]
	for i, v in ipairs(p0:GetChildren()) do
		if v.Name == p1 and v:IsA(p2) then
			return v
		end
	end
	return nil
end

return roduxModule.createReducer({}, {
	[require(actions.AdorneeAdded).name] = function(p3, p4) --[[ line: 27 ]]
		-- upvalues: findFirstChildByNameAndClass (ref), dictionary (ref)
		return dictionary.join(p3, {
			[p4.userId] = if p4.humanoid.Health == 0 then findFirstChildByNameAndClass(p4.character, "Head", "BasePart") else p4.character
		})
	end,
	[require(actions.HumanoidDied).name] = function(p5, p6) --[[ line: 36 ]]
		-- upvalues: findFirstChildByNameAndClass (ref), dictionary (ref)
		local userId = p5[p6.userId]
		
		return dictionary.join(p5, {
			[p6.userId] = if userId then findFirstChildByNameAndClass(userId, "Head", "BasePart") or userId else nil
		})
	end,
	[expChatSharedModule.Actions.PlayerRemoved.name] = function(p7, p8) --[[ line: 48 ]]
		-- upvalues: dictionary (ref)
		return dictionary.removeKey(p7, p8.userId)
	end
})