local avatarEditorService = game:GetService("AvatarEditorService")
local parent = script.Parent.Parent
local openPromptModule = require(parent.Actions.OpenPrompt)
local getOutfitNameModule = require(parent.Network.GetOutfitName)
local promptTypeModule = require(parent.PromptType)

return function(p1)
	-- upvalues: getOutfitNameModule (ref), openPromptModule (ref), promptTypeModule (ref), avatarEditorService (ref)
	return function(p2)
		-- upvalues: getOutfitNameModule (copy), p1 (ref), openPromptModule (copy), promptTypeModule (copy), avatarEditorService (copy)
		getOutfitNameModule(p1):andThen(function(p3)
			-- upvalues: p2 (ref), openPromptModule (copy), promptTypeModule (copy), p1 (copy)
			p2:dispatch(openPromptModule(promptTypeModule.RenameOutfit, { outfitId = p1, outfitName = p3 }))
		end, function(_)
			-- upvalues: avatarEditorService (copy)
			avatarEditorService:SignalRenameOutfitFailed()
		end)
	end
end