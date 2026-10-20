local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local TutilsModule = require(Parent.tutils)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local _ = require(ExpChat.installReducer.Messages)

return function()
	-- upvalues: UseSelectorFunction (copy), TutilsModule (copy)
	return (UseSelectorFunction(function(p1)
		return p1.Messages
	end, TutilsModule.shallowEqual))
end