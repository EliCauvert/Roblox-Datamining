local avatarEditorService = game:GetService("AvatarEditorService")
local parent = script.Parent.Parent
local openPromptModule = require(parent.Actions.OpenPrompt)
local getOutfitNameModule = require(parent.Network.GetOutfitName)
local promptTypeModule = require(parent.PromptType)

return function(p0, p1, p2)
	-- upvalues: getOutfitNameModule (ref), openPromptModule (ref), promptTypeModule (ref), avatarEditorService (ref)
	return function(p3)
		-- upvalues: getOutfitNameModule (copy), p0 (ref), openPromptModule (copy), promptTypeModule (copy), p1 (ref), p2 (ref), avatarEditorService (copy)
		getOutfitNameModule(p0):andThen(function(p4)
			-- upvalues: p3 (ref), openPromptModule (copy), promptTypeModule (copy), p0 (copy), p1 (copy), p2 (copy)
			p3:dispatch(openPromptModule(promptTypeModule.UpdateOutfit, {
				outfitId = p0,
				outfitName = p4,
				humanoidDescription = p1,
				rigType = p2
			}))
		end, function(_)
			-- upvalues: avatarEditorService (copy)
			avatarEditorService:SignalUpdateOutfitFailed()
		end)
	end
end