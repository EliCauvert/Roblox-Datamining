local avatarEditorService = game:GetService("AvatarEditorService")
local parent = script.Parent.Parent
local openPromptModule = require(parent.Actions.OpenPrompt)
local getOutfitNameModule = require(parent.Network.GetOutfitName)
local promptTypeModule = require(parent.PromptType)

return function(p1, p2, p3)
	-- upvalues: getOutfitNameModule (ref), openPromptModule (ref), promptTypeModule (ref), avatarEditorService (ref)
	return function(p4)
		-- upvalues: getOutfitNameModule (copy), p1 (ref), openPromptModule (copy), promptTypeModule (copy), p2 (ref), p3 (ref), avatarEditorService (copy)
		getOutfitNameModule(p1):andThen(function(p5)
			-- upvalues: p4 (ref), openPromptModule (copy), promptTypeModule (copy), p1 (copy), p2 (copy), p3 (copy)
			p4:dispatch(openPromptModule(promptTypeModule.UpdateOutfit, {
				outfitId = p1,
				outfitName = p5,
				humanoidDescription = p2,
				rigType = p3
			}))
		end, function(_)
			-- upvalues: avatarEditorService (copy)
			avatarEditorService:SignalUpdateOutfitFailed()
		end)
	end
end