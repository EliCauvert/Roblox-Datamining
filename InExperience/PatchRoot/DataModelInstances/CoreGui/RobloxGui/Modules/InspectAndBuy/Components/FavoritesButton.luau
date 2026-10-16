local CorePackages = game:GetService("CorePackages")
local ContextActionService = game:GetService("ContextActionService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Parent = script.Parent.Parent
local ColorsModule = require(Parent.Colors)
local CreateFavoriteForAssetModule = require(Parent.Thunks.CreateFavoriteForAsset)
local DeleteFavoriteForAssetModule = require(Parent.Thunks.DeleteFavoriteForAsset)
local CreateFavoriteForBundleModule = require(Parent.Thunks.CreateFavoriteForBundle)
local DeleteFavoriteForBundleModule = require(Parent.Thunks.DeleteFavoriteForBundle)
local GetFavoriteForAssetModule = require(Parent.Thunks.GetFavoriteForAsset)
local GetFavoriteForBundleModule = require(Parent.Thunks.GetFavoriteForBundle)
local GotFavoriteForDetailsItemModule = require(Parent.Selectors.GotFavoriteForDetailsItem)
local IsDetailsItemPartOfBundleAndOffsaleModule = require(Parent.Selectors.IsDetailsItemPartOfBundleAndOffsale)
local GetIsFavoriteModule = require(Parent.Selectors.GetIsFavorite)
local UtilityFunctionsModule = require(Parent.UtilityFunctions)
local GetSelectionImageObjectRoundedModule = require(Parent.getSelectionImageObjectRounded)
local Favorite = require(script.Parent.Common.ControllerShortcutKeycodes).Favorite
local FavoritesButton = RoactModule.PureComponent:extend("FavoritesButton")

function FavoritesButton.init(p1) --[[ Line: 28 ]]
	-- upvalues: GetSelectionImageObjectRoundedModule (copy), ContextActionService (copy), Favorite (copy)
	p1.selectedImage = GetSelectionImageObjectRoundedModule()
	p1.fetchFavoriteRetries = 0
	ContextActionService:BindCoreAction("FavoriteGamepadShortcut", function(_, UserInputState, _) --[[ Line: 32 ]]
		-- upvalues: p1 (copy)
		if UserInputState == Enum.UserInputState.End then
			p1:activateButton()
			
			return Enum.ContextActionResult.Sink
		else
			return Enum.ContextActionResult.Pass
		end
	end, false, Favorite)
end

function FavoritesButton.willUpdate(p1, p2) --[[ Line: 41 ]]
	-- upvalues: UtilityFunctionsModule (copy)
	local GotFavoriteForDetailsItem = p2.gotFavoriteForDetailsItem
	local GetFavoriteForAssetFunction = p1.props.getFavoriteForAsset
	local GetFavoriteForBundleFunction = p1.props.getFavoriteForBundle
	
	if p2 and (p2.assetInfo and (not GotFavoriteForDetailsItem and p1.fetchFavoriteRetries < 10)) then
		local AssetInfo = p2.assetInfo
		local HasParentBundleId: boolean = AssetInfo and AssetInfo.parentBundleId ~= nil
		coroutine.wrap(function() --[[ Line: 55 ]]
			-- upvalues: HasParentBundleId (copy), GetFavoriteForAssetFunction (copy), AssetInfo (copy), UtilityFunctionsModule (upval), GetFavoriteForBundleFunction (copy)
			if HasParentBundleId then
				GetFavoriteForBundleFunction((UtilityFunctionsModule.getBundleId(AssetInfo)))
				
				return
			else
				GetFavoriteForAssetFunction(AssetInfo.assetId)
			end
		end)()
		p1.fetchFavoriteRetries += 1
	end
end

function FavoritesButton.activateButton(p1) --[[ Line: 67 ]]
	-- upvalues: UtilityFunctionsModule (copy)
	local IsDetailsItemPartOfBundleAndOffsale = p1.props.IsDetailsItemPartOfBundleAndOffsale
	local CreateFavoriteForAssetFunction: (any) -> () = p1.props.createFavoriteForAsset
	local DeleteFavoriteForAssetFunction: (any) -> () = p1.props.deleteFavoriteForAsset
	local CreateFavoriteForBundleFunction: (any) -> () = p1.props.createFavoriteForBundle
	local DeleteFavoriteForBundleFunction: (any) -> () = p1.props.deleteFavoriteForBundle
	local AssetInfo = p1.props.assetInfo
	
	if p1.props.isFavorited then
		if IsDetailsItemPartOfBundleAndOffsale then
			DeleteFavoriteForBundleFunction((UtilityFunctionsModule.getBundleId(AssetInfo)))
			
			return
		else
			DeleteFavoriteForAssetFunction(AssetInfo.assetId)
			
			return
		end
	elseif IsDetailsItemPartOfBundleAndOffsale then
		CreateFavoriteForBundleFunction((UtilityFunctionsModule.getBundleId(AssetInfo)))
		
		return
	else
		CreateFavoriteForAssetFunction(AssetInfo.assetId)
	end
end

function FavoritesButton:willUnmount() --[[ Line: 93 ]]
	-- upvalues: ContextActionService (copy)
	ContextActionService:UnbindCoreAction("FavoriteGamepadShortcut")
end

function FavoritesButton.render(p1) --[[ Line: 97 ]]
	-- upvalues: RoactModule (copy), ColorsModule (copy)
	return RoactModule.createElement("ImageButton", {
		AnchorPoint = Vector2.new(0.5, 0),
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 44, 0, 44),
		LayoutOrder = 1,
		Image = "rbxasset://textures/ui/InspectMenu/Button_outline.png",
		ImageColor3 = ColorsModule.White,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(5, 5, 120, 20),
		SelectionImageObject = p1.selectedImage,
		Visible = true,
		[RoactModule.Ref] = p1.props.favoriteButtonRef,
		[RoactModule.Event.Activated] = function() --[[ Line: 114 ]]
			-- upvalues: p1 (copy)
			p1:activateButton()
		end
	}, {
		FavoriteIcon = RoactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(0, 26, 0, 26),
			Position = UDim2.new(0, 22, 0, 22),
			Image = if p1.props.isFavorited then "rbxasset://textures/ui/InspectMenu/ico_favorite.png" else "rbxasset://textures/ui/InspectMenu/ico_favorite_off.png",
			ImageColor3 = ColorsModule.White
		})
	})
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1, _) --[[ Line: 129 ]]
	-- upvalues: GotFavoriteForDetailsItemModule (copy), GetIsFavoriteModule (copy), IsDetailsItemPartOfBundleAndOffsaleModule (copy)
	return {
		view = p1.view,
		assetInfo = p1.assets[p1.detailsInformation.assetId],
		bundleInfo = p1.bundles,
		gotFavoriteForDetailsItem = GotFavoriteForDetailsItemModule(p1),
		isFavorited = GetIsFavoriteModule(p1),
		IsDetailsItemPartOfBundleAndOffsale = IsDetailsItemPartOfBundleAndOffsaleModule(p1)
	}
end, function(Callback) --[[ Line: 140 ]]
	-- upvalues: CreateFavoriteForAssetModule (copy), DeleteFavoriteForAssetModule (copy), CreateFavoriteForBundleModule (copy), DeleteFavoriteForBundleModule (copy), GetFavoriteForAssetModule (copy), GetFavoriteForBundleModule (copy)
	return {
		createFavoriteForAsset = function(p1) --[[ Line: 142 ]]
			-- upvalues: Callback (copy), CreateFavoriteForAssetModule (upval)
			Callback(CreateFavoriteForAssetModule(p1))
		end,
		deleteFavoriteForAsset = function(p1) --[[ Line: 145 ]]
			-- upvalues: Callback (copy), DeleteFavoriteForAssetModule (upval)
			Callback(DeleteFavoriteForAssetModule(p1))
		end,
		createFavoriteForBundle = function(p1) --[[ Line: 148 ]]
			-- upvalues: Callback (copy), CreateFavoriteForBundleModule (upval)
			Callback(CreateFavoriteForBundleModule(p1))
		end,
		deleteFavoriteForBundle = function(p1) --[[ Line: 151 ]]
			-- upvalues: Callback (copy), DeleteFavoriteForBundleModule (upval)
			Callback(DeleteFavoriteForBundleModule(p1))
		end,
		getFavoriteForAsset = function(p1) --[[ Line: 154 ]]
			-- upvalues: Callback (copy), GetFavoriteForAssetModule (upval)
			Callback(GetFavoriteForAssetModule(p1))
		end,
		getFavoriteForBundle = function(p1) --[[ Line: 157 ]]
			-- upvalues: Callback (copy), GetFavoriteForBundleModule (upval)
			Callback(GetFavoriteForBundleModule(p1))
		end
	}
end)(FavoritesButton)