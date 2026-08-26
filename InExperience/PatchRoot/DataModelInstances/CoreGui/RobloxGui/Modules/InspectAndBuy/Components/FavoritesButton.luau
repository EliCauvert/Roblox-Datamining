local corePackagesService = game:GetService("CorePackages")
local contextActionService = game:GetService("ContextActionService")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local parent = script.Parent.Parent
local colorsModule = require(parent.Colors)
local createFavoriteForAssetModule = require(parent.Thunks.CreateFavoriteForAsset)
local deleteFavoriteForAssetModule = require(parent.Thunks.DeleteFavoriteForAsset)
local createFavoriteForBundleModule = require(parent.Thunks.CreateFavoriteForBundle)
local deleteFavoriteForBundleModule = require(parent.Thunks.DeleteFavoriteForBundle)
local getFavoriteForAssetModule = require(parent.Thunks.GetFavoriteForAsset)
local getFavoriteForBundleModule = require(parent.Thunks.GetFavoriteForBundle)
local gotFavoriteForDetailsItemModule = require(parent.Selectors.GotFavoriteForDetailsItem)
local isDetailsItemPartOfBundleAndOffsaleModule = require(parent.Selectors.IsDetailsItemPartOfBundleAndOffsale)
local getIsFavoriteModule = require(parent.Selectors.GetIsFavorite)
local utilityFunctionsModule = require(parent.UtilityFunctions)
local getSelectionImageObjectRoundedModule = require(parent.getSelectionImageObjectRounded)
local favorite = require(script.Parent.Common.ControllerShortcutKeycodes).Favorite
local favoritesButton = roactModule.PureComponent:extend("FavoritesButton")

function favoritesButton.init(p1)
	-- upvalues: getSelectionImageObjectRoundedModule (ref), contextActionService (ref), favorite (ref)
	p1.selectedImage = getSelectionImageObjectRoundedModule()
	p1.fetchFavoriteRetries = 0
	contextActionService:BindCoreAction("FavoriteGamepadShortcut", function(_, p2, _)
		-- upvalues: p1 (ref)
		if p2 == Enum.UserInputState.End then
			p1:activateButton()
			
			return Enum.ContextActionResult.Sink
		end
		return Enum.ContextActionResult.Pass
	end, false, favorite)
end

function favoritesButton.willUpdate(p1, p2)
	-- upvalues: utilityFunctionsModule (ref)
	local gotFavoriteForDetailsItem = p2.gotFavoriteForDetailsItem
	local getFavoriteForAsset = p1.props.getFavoriteForAsset
	local getFavoriteForBundle = p1.props.getFavoriteForBundle
	
	if p2 and (p2.assetInfo and (not gotFavoriteForDetailsItem and p1.fetchFavoriteRetries < 10)) then
		local assetInfo = p2.assetInfo
		local var1 = assetInfo and assetInfo.parentBundleId ~= nil
		coroutine.wrap(function()
			-- upvalues: var1 (ref), getFavoriteForAsset (ref), assetInfo (ref), utilityFunctionsModule (copy), getFavoriteForBundle (ref)
			if var1 then
				getFavoriteForBundle(utilityFunctionsModule.getBundleId(assetInfo))
				
				return
			end
			getFavoriteForAsset(assetInfo.assetId)
		end)()
		p1.fetchFavoriteRetries += 1
	end
end

function favoritesButton.activateButton(p1)
	-- upvalues: utilityFunctionsModule (ref)
	local isFavorited = p1.props.isFavorited
	local isDetailsItemPartOfBundleAndOffsale = p1.props.IsDetailsItemPartOfBundleAndOffsale
	local createFavoriteForAsset = p1.props.createFavoriteForAsset
	local deleteFavoriteForAsset = p1.props.deleteFavoriteForAsset
	local createFavoriteForBundle = p1.props.createFavoriteForBundle
	local deleteFavoriteForBundle = p1.props.deleteFavoriteForBundle
	local assetInfo = p1.props.assetInfo
	
	if isFavorited then
		if isDetailsItemPartOfBundleAndOffsale then
			deleteFavoriteForBundle(utilityFunctionsModule.getBundleId(assetInfo))
			
			return
		end
		deleteFavoriteForAsset(assetInfo.assetId)
		
		return
	elseif isDetailsItemPartOfBundleAndOffsale then
		createFavoriteForBundle(utilityFunctionsModule.getBundleId(assetInfo))
		
		return
	end
	createFavoriteForAsset(assetInfo.assetId)
end

function favoritesButton.willUnmount(_)
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction("FavoriteGamepadShortcut")
end

function favoritesButton.render(p1)
	-- upvalues: roactModule (ref), colorsModule (ref)
	return roactModule.createElement("ImageButton", {
		AnchorPoint = Vector2.new(0.5, 0),
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 44, 0, 44),
		LayoutOrder = 1,
		Image = "rbxasset://textures/ui/InspectMenu/Button_outline.png",
		ImageColor3 = colorsModule.White,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(5, 5, 120, 20),
		SelectionImageObject = p1.selectedImage,
		Visible = true,
		[roactModule.Ref] = p1.props.favoriteButtonRef,
		[roactModule.Event.Activated] = function()
			-- upvalues: p1 (ref)
			p1:activateButton()
		end
	}, {
		FavoriteIcon = roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(0, 26, 0, 26),
			Position = UDim2.new(0, 22, 0, 22),
			Image = if p1.props.isFavorited then "rbxasset://textures/ui/InspectMenu/ico_favorite.png" else "rbxasset://textures/ui/InspectMenu/ico_favorite_off.png",
			ImageColor3 = colorsModule.White
		})
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p1, _)
	-- upvalues: gotFavoriteForDetailsItemModule (ref), getIsFavoriteModule (ref), isDetailsItemPartOfBundleAndOffsaleModule (ref)
	return {
		view = p1.view,
		assetInfo = p1.assets[p1.detailsInformation.assetId],
		bundleInfo = p1.bundles,
		gotFavoriteForDetailsItem = gotFavoriteForDetailsItemModule(p1),
		isFavorited = getIsFavoriteModule(p1),
		IsDetailsItemPartOfBundleAndOffsale = isDetailsItemPartOfBundleAndOffsaleModule(p1)
	}
end, function(p1)
	-- upvalues: createFavoriteForAssetModule (ref), deleteFavoriteForAssetModule (ref), createFavoriteForBundleModule (ref), deleteFavoriteForBundleModule (ref), getFavoriteForAssetModule (ref), getFavoriteForBundleModule (ref)
	return {
		createFavoriteForAsset = function(value)
			-- upvalues: p1 (ref), createFavoriteForAssetModule (copy)
			p1(createFavoriteForAssetModule(value))
		end,
		deleteFavoriteForAsset = function(value)
			-- upvalues: p1 (ref), deleteFavoriteForAssetModule (copy)
			p1(deleteFavoriteForAssetModule(value))
		end,
		createFavoriteForBundle = function(p2)
			-- upvalues: p1 (ref), createFavoriteForBundleModule (copy)
			p1(createFavoriteForBundleModule(p2))
		end,
		deleteFavoriteForBundle = function(p2)
			-- upvalues: p1 (ref), deleteFavoriteForBundleModule (copy)
			p1(deleteFavoriteForBundleModule(p2))
		end,
		getFavoriteForAsset = function(value)
			-- upvalues: p1 (ref), getFavoriteForAssetModule (copy)
			p1(getFavoriteForAssetModule(value))
		end,
		getFavoriteForBundle = function(p2)
			-- upvalues: p1 (ref), getFavoriteForBundleModule (copy)
			p1(getFavoriteForBundleModule(p2))
		end
	}
end)(favoritesButton)