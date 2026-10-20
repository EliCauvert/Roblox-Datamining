local AvatarEditorService = game:GetService("AvatarEditorService")
local MarketplaceService = game:GetService("MarketplaceService")
local PromiseModule = require(game:GetService("CorePackages").Packages.Promise)
local Parent = script.Parent.Parent
local OpenPromptModule = require(Parent.Actions.OpenPrompt)
local PromptTypeModule = require(Parent.PromptType)

return function(AssetId, ItemType, ShouldFavorite)
	-- upvalues: PromiseModule (copy), MarketplaceService (copy), OpenPromptModule (copy), PromptTypeModule (copy), AvatarEditorService (copy)
	return function(p1)
		-- upvalues: PromiseModule (upval), ItemType (copy), MarketplaceService (upval), AssetId (copy), OpenPromptModule (upval), PromptTypeModule (upval), ShouldFavorite (copy), AvatarEditorService (upval)
		return PromiseModule.new(function(Callback: () -> (), Callback1: () -> ())
			-- upvalues: ItemType (upval), MarketplaceService (upval), AssetId (upval), p1 (copy), OpenPromptModule (upval), PromptTypeModule (upval), ShouldFavorite (upval), AvatarEditorService (upval)
			local Asset = nil
			Asset = if ItemType == Enum.AvatarItemType.Asset then Enum.InfoType.Asset else Enum.InfoType.Bundle
			local Success, Result = pcall(function()
				-- upvalues: MarketplaceService (upval), AssetId (upval), Asset (ref)
				return if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then MarketplaceService:GetProductInfoAsync(AssetId, Asset) else MarketplaceService:GetProductInfo(AssetId, Asset)
			end)
			
			if Success then
				p1:dispatch(OpenPromptModule(PromptTypeModule.SetFavorite, {
					itemId = AssetId,
					itemName = Result.Name,
					itemType = ItemType,
					shouldFavorite = ShouldFavorite
				}))
				Callback()
			else
				AvatarEditorService:SignalSetFavoriteFailed()
				Callback1()
			end
		end)
	end
end