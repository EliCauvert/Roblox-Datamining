local avatarEditorService = game:GetService("AvatarEditorService")
local _ = game:GetService("CorePackages")
local _ = game:GetService("HttpRbxApiService")
local parent = script.Parent.Parent
local openPromptModule = require(parent.Actions.OpenPrompt)
local getOutfitNameModule = require(parent.Network.GetOutfitName)
local promptTypeModule = require(parent.PromptType)

return function(p0)
	-- upvalues: getOutfitNameModule (ref), openPromptModule (ref), promptTypeModule (ref), avatarEditorService (ref)
	return function(p1)
		-- upvalues: getOutfitNameModule (copy), p0 (ref), openPromptModule (copy), promptTypeModule (copy), avatarEditorService (copy)
		getOutfitNameModule(p0):andThen(function(p2)
			-- upvalues: p1 (ref), openPromptModule (copy), promptTypeModule (copy), p0 (copy)
			p1:dispatch(openPromptModule(promptTypeModule.DeleteOutfit, { outfitId = p0, outfitName = p2 }))
		end, function(_)
			-- upvalues: avatarEditorService (copy)
			avatarEditorService:SignalDeleteOutfitFailed()
		end)
	end
end