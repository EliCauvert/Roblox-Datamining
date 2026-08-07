local avatarEditorService = game:GetService("AvatarEditorService")
local marketplaceService = game:GetService("MarketplaceService")
local promiseModule = require(game:GetService("CorePackages").Packages.Promise)
local parent = script.Parent.Parent
local openPromptModule = require(parent.Actions.OpenPrompt)
local promptTypeModule = require(parent.PromptType)

return function(p0, p1, p2) --[[ line: 12 ]]
	-- upvalues: promiseModule (ref), marketplaceService (ref), openPromptModule (ref), promptTypeModule (ref), avatarEditorService (ref)
	return function(p3) --[[ line: 13 ]]
		-- upvalues: promiseModule (copy), p1 (ref), marketplaceService (copy), p0 (ref), openPromptModule (copy), promptTypeModule (copy), p2 (ref), avatarEditorService (copy)
		return promiseModule.new(function(p4, p5) --[[ line: 14 ]]
			-- upvalues: p1 (copy), marketplaceService (copy), p0 (copy), p3 (ref), openPromptModule (copy), promptTypeModule (copy), p2 (copy), avatarEditorService (copy)
			local var5 = if p1 == Enum.AvatarItemType.Asset then Enum.InfoType.Asset else Enum.InfoType.Bundle
			local ok, status = pcall(function() --[[ line: 22 ]]
				-- upvalues: marketplaceService (copy), p0 (copy), var5 (write)
				return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then marketplaceService:GetProductInfoAsync(p0, var5) else marketplaceService:GetProductInfo(p0, var5)
			end)
			
			if ok then
				p3:dispatch(openPromptModule(promptTypeModule.SetFavorite, {
					itemId = p0,
					itemName = status.Name,
					itemType = p1,
					shouldFavorite = p2
				}))
				p4()
			else
				avatarEditorService:SignalSetFavoriteFailed()
				p5()
			end
		end)
	end
end