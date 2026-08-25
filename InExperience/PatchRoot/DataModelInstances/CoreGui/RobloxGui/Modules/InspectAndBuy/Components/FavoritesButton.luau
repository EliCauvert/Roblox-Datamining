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

function favoritesButton.init(p0)
	-- upvalues: getSelectionImageObjectRoundedModule (ref), contextActionService (ref), favorite (ref)
	p0.selectedImage = getSelectionImageObjectRoundedModule()
	p0.fetchFavoriteRetries = 0
	contextActionService:BindCoreAction("FavoriteGamepadShortcut", function(_, p1, _)
		-- upvalues: p0 (ref)
		if p1 == Enum.UserInputState.End then
			p0:activateButton()
			
			return Enum.ContextActionResult.Sink
		end
		return Enum.ContextActionResult.Pass
	end, false, favorite)
end

function favoritesButton.willUpdate(p2, p3)
	-- upvalues: utilityFunctionsModule (ref)
	local gotFavoriteForDetailsItem = p3.gotFavoriteForDetailsItem
	local getFavoriteForAsset = p2.props.getFavoriteForAsset
	local getFavoriteForBundle = p2.props.getFavoriteForBundle
	
	if p3 and (p3.assetInfo and (not gotFavoriteForDetailsItem and p2.fetchFavoriteRetries < 10)) then
		local assetInfo = p3.assetInfo
		local var17 = assetInfo and assetInfo.parentBundleId ~= nil
		coroutine.wrap(function()
			-- upvalues: var17 (ref), getFavoriteForAsset (ref), assetInfo (ref), utilityFunctionsModule (copy), getFavoriteForBundle (ref)
			if var17 then
				getFavoriteForBundle(utilityFunctionsModule.getBundleId(assetInfo))
				
				return
			end
			getFavoriteForAsset(assetInfo.assetId)
		end)()
		p2.fetchFavoriteRetries += 1
	end
end

function favoritesButton.activateButton(p4)
	-- upvalues: utilityFunctionsModule (ref)
	local isFavorited = p4.props.isFavorited
	local isDetailsItemPartOfBundleAndOffsale = p4.props.IsDetailsItemPartOfBundleAndOffsale
	local createFavoriteForAsset = p4.props.createFavoriteForAsset
	local deleteFavoriteForAsset = p4.props.deleteFavoriteForAsset
	local createFavoriteForBundle = p4.props.createFavoriteForBundle
	local deleteFavoriteForBundle = p4.props.deleteFavoriteForBundle
	local assetInfo = p4.props.assetInfo
	
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

function favoritesButton.render(p5)
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
		SelectionImageObject = p5.selectedImage,
		Visible = true,
		[roactModule.Ref] = p5.props.favoriteButtonRef,
		[roactModule.Event.Activated] = function()
			-- upvalues: p5 (ref)
			p5:activateButton()
		end
	}, {
		FavoriteIcon = roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(0, 26, 0, 26),
			Position = UDim2.new(0, 22, 0, 22),
			Image = if p5.props.isFavorited then "rbxasset://textures/ui/InspectMenu/ico_favorite.png" else "rbxasset://textures/ui/InspectMenu/ico_favorite_off.png",
			ImageColor3 = colorsModule.White
		})
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p6, _)
	-- upvalues: gotFavoriteForDetailsItemModule (ref), getIsFavoriteModule (ref), isDetailsItemPartOfBundleAndOffsaleModule (ref)
	return {
		view = p6.view,
		assetInfo = p6.assets[p6.detailsInformation.assetId],
		bundleInfo = p6.bundles,
		gotFavoriteForDetailsItem = gotFavoriteForDetailsItemModule(p6),
		isFavorited = getIsFavoriteModule(p6),
		IsDetailsItemPartOfBundleAndOffsale = isDetailsItemPartOfBundleAndOffsaleModule(p6)
	}
end, function(p7)
	-- upvalues: createFavoriteForAssetModule (ref), deleteFavoriteForAssetModule (ref), createFavoriteForBundleModule (ref), deleteFavoriteForBundleModule (ref), getFavoriteForAssetModule (ref), getFavoriteForBundleModule (ref)
	return {
		createFavoriteForAsset = function(value)
			-- upvalues: p7 (ref), createFavoriteForAssetModule (copy)
			p7(createFavoriteForAssetModule(value))
		end,
		deleteFavoriteForAsset = function(value)
			-- upvalues: p7 (ref), deleteFavoriteForAssetModule (copy)
			p7(deleteFavoriteForAssetModule(value))
		end,
		createFavoriteForBundle = function(p8)
			-- upvalues: p7 (ref), createFavoriteForBundleModule (copy)
			p7(createFavoriteForBundleModule(p8))
		end,
		deleteFavoriteForBundle = function(p9)
			-- upvalues: p7 (ref), deleteFavoriteForBundleModule (copy)
			p7(deleteFavoriteForBundleModule(p9))
		end,
		getFavoriteForAsset = function(value)
			-- upvalues: p7 (ref), getFavoriteForAssetModule (copy)
			p7(getFavoriteForAssetModule(value))
		end,
		getFavoriteForBundle = function(p10)
			-- upvalues: p7 (ref), getFavoriteForBundleModule (copy)
			p7(getFavoriteForBundleModule(p10))
		end
	}
end)(favoritesButton)