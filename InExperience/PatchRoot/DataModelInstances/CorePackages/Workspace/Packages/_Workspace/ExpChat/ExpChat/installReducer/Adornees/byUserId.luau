local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local RoduxModule = require(Parent.Rodux)
local Dictionary = require(Parent.llama).Dictionary
local ExpChatSharedModule = require(Parent.ExpChatShared)
local Actions = ExpChat.Actions
local AdorneeAddedModule = require(Actions.AdorneeAdded)
local PlayerRemoved = ExpChatSharedModule.Actions.PlayerRemoved
local HumanoidDiedModule = require(Actions.HumanoidDied)

local function findFirstChildByNameAndClass(Character, Name, ClassName)
	for _, child in ipairs(Character:GetChildren()) do
		if child.Name == Name and child:IsA(ClassName) then
			return child
		end
	end
	return nil
end

return RoduxModule.createReducer({}, {
	[AdorneeAddedModule.name] = function(p1, p2)
		-- upvalues: findFirstChildByNameAndClass (copy), Dictionary (copy)
		local Head = findFirstChildByNameAndClass(p2.character, "Head", "BasePart")
		
		return Dictionary.join(p1, {
			[p2.userId] = if p2.humanoid.Health == 0 then Head else p2.character
		})
	end,
	[HumanoidDiedModule.name] = function(p1, p2)
		-- upvalues: findFirstChildByNameAndClass (copy), Dictionary (copy)
		local v1 = p1[p2.userId]
		
		return Dictionary.join(p1, {
			[p2.userId] = if v1 then findFirstChildByNameAndClass(v1, "Head", "BasePart") or v1 else nil
		})
	end,
	[PlayerRemoved.name] = function(p1, p2)
		-- upvalues: Dictionary (copy)
		return Dictionary.removeKey(p1, p2.userId)
	end
})