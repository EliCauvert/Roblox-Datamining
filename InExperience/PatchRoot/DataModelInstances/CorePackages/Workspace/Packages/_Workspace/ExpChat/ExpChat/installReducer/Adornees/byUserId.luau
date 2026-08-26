local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local expChatSharedModule = require(parent.ExpChatShared)
local actions = expChat.Actions

local function findFirstChildByNameAndClass(p1, p2, p3)
	for i, v in ipairs(p1:GetChildren()) do
		if v.Name == p2 and v:IsA(p3) then
			return v
		end
	end
	return nil
end

return roduxModule.createReducer({}, {
	[require(actions.AdorneeAdded).name] = function(p4, p5)
		-- upvalues: findFirstChildByNameAndClass (ref), dictionary (ref)
		return dictionary.join(p4, {
			[p5.userId] = if p5.humanoid.Health == 0 then findFirstChildByNameAndClass(p5.character, "Head", "BasePart") else p5.character
		})
	end,
	[require(actions.HumanoidDied).name] = function(p4, p5)
		-- upvalues: findFirstChildByNameAndClass (ref), dictionary (ref)
		local userId = p4[p5.userId]
		
		return dictionary.join(p4, {
			[p5.userId] = if userId then findFirstChildByNameAndClass(userId, "Head", "BasePart") or userId else nil
		})
	end,
	[expChatSharedModule.Actions.PlayerRemoved.name] = function(p4, p5)
		-- upvalues: dictionary (ref)
		return dictionary.removeKey(p4, p5.userId)
	end
})