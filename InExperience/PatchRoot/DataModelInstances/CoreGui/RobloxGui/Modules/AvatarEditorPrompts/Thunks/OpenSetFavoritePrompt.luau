local avatarEditorService = game:GetService("AvatarEditorService")
local marketplaceService = game:GetService("MarketplaceService")
local promiseModule = require(game:GetService("CorePackages").Packages.Promise)
local parent = script.Parent.Parent
local openPromptModule = require(parent.Actions.OpenPrompt)
local promptTypeModule = require(parent.PromptType)

return function(p1, p2, p3)
	-- upvalues: promiseModule (ref), marketplaceService (ref), openPromptModule (ref), promptTypeModule (ref), avatarEditorService (ref)
	return function(p4)
		-- upvalues: promiseModule (copy), p2 (ref), marketplaceService (copy), p1 (ref), openPromptModule (copy), promptTypeModule (copy), p3 (ref), avatarEditorService (copy)
		return promiseModule.new(function(p5, p6)
			-- upvalues: p2 (copy), marketplaceService (copy), p1 (copy), p4 (ref), openPromptModule (copy), promptTypeModule (copy), p3 (copy), avatarEditorService (copy)
			local var1 = if p2 == Enum.AvatarItemType.Asset then Enum.InfoType.Asset else Enum.InfoType.Bundle
			local ok, status = pcall(function()
				-- upvalues: marketplaceService (copy), p1 (copy), var1 (write)
				return marketplaceService:GetProductInfoAsync(p1, var1)
			end)
			
			if ok then
				p4:dispatch(openPromptModule(promptTypeModule.SetFavorite, {
					itemId = p1,
					itemName = status.Name,
					itemType = p2,
					shouldFavorite = p3
				}))
				p5()
			else
				avatarEditorService:SignalSetFavoriteFailed()
				p6()
			end
		end)
	end
end