local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local Dictionary = require(Parent.llama).Dictionary
local Actions = ExpChat.Actions

local function findFirstChildByNameAndClass(Character, Name, ClassName) --[[ Line: 16 ]]
	for _, child in ipairs(Character:GetChildren()) do
		if child.Name == Name and child:IsA(ClassName) then
			return child
		end
	end
	return nil
end

return require(Parent.Rodux).createReducer({}, {
	[require(Actions.AdorneeAdded).name] = function(p1, p2) --[[ Line: 27 ]]
		-- upvalues: findFirstChildByNameAndClass (copy), Dictionary (copy)
		local Head = findFirstChildByNameAndClass(p2.character, "Head", "BasePart")
		
		return Dictionary.join(p1, {
			[p2.userId] = if p2.humanoid.Health == 0 then Head else p2.character
		})
	end,
	[require(Actions.HumanoidDied).name] = function(p1, p2) --[[ Line: 36 ]]
		-- upvalues: findFirstChildByNameAndClass (copy), Dictionary (copy)
		local v1 = p1[p2.userId]
		
		return Dictionary.join(p1, {
			[p2.userId] = if v1 then findFirstChildByNameAndClass(v1, "Head", "BasePart") or v1 else nil
		})
	end,
	[require(Parent.ExpChatShared).Actions.PlayerRemoved.name] = function(p1, p2) --[[ Line: 48 ]]
		-- upvalues: Dictionary (copy)
		return Dictionary.removeKey(p1, p2.userId)
	end
})