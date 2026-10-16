local CorePackages = game:GetService("CorePackages")
local Parent = script.Parent.Parent
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local UtilityFunctionsModule = require(Parent.UtilityFunctions)
local GetAssetFavoriteCountModule = require(Parent.Thunks.GetAssetFavoriteCount)
local GetBundleFavoriteCountModule = require(Parent.Thunks.GetBundleFavoriteCount)
local GotCurrentFavoriteCountModule = require(Parent.Selectors.GotCurrentFavoriteCount)
local GetSelectionImageObjectRegularModule = require(Parent.getSelectionImageObjectRegular)
local Favorites = RoactModule.PureComponent:extend("Favorites")

function Favorites.setText(p1) --[[ Line: 22 ]]
	-- upvalues: UtilityFunctionsModule (copy)
	local AssetInfo = p1.props.assetInfo or {}
	local BundleInfo = p1.props.bundleInfo
	
	if AssetInfo.parentBundleId ~= nil then
		local BundleId = UtilityFunctionsModule.getBundleId(AssetInfo)
		
		if BundleInfo[BundleId] then
			p1.numFavorites = BundleInfo[BundleId].numFavorites
			
			return
		end
	elseif AssetInfo then
		p1.numFavorites = AssetInfo.numFavorites
	end
end

function Favorites.init(p1) --[[ Line: 38 ]]
	-- upvalues: GetSelectionImageObjectRegularModule (copy)
	p1.numFavorites = ""
	p1.selectionImageObject = GetSelectionImageObjectRegularModule()
end

function Favorites.willUpdate(p1, p2) --[[ Line: 43 ]]
	-- upvalues: UtilityFunctionsModule (copy)
	local GetAssetFavoriteCountFunction = p1.props.getAssetFavoriteCount
	local GetBundleFavoriteCountFunction = p1.props.getBundleFavoriteCount
	
	if p2.assetInfo then
		local AssetInfo = p2.assetInfo
		local HasParentBundleId = AssetInfo.parentBundleId ~= nil
		
		if not p2.gotCurrentFavoriteCount then
			coroutine.wrap(function() --[[ Line: 58 ]]
				-- upvalues: HasParentBundleId (copy), GetAssetFavoriteCountFunction (copy), AssetInfo (copy), UtilityFunctionsModule (upval), GetBundleFavoriteCountFunction (copy)
				if HasParentBundleId then
					GetBundleFavoriteCountFunction((UtilityFunctionsModule.getBundleId(AssetInfo)))
					
					return
				else
					GetAssetFavoriteCountFunction(AssetInfo.assetId)
				end
			end)()
		end
	end
end

function Favorites.render(p1) --[[ Line: 70 ]]
	-- upvalues: RoactModule (copy), AppFonts (copy)
	p1:setText()
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 3,
		Size = UDim2.new(1, 0, 0, 16)
	}, {
		FavoriteIcon = RoactModule.createElement("ImageButton", {
			Selectable = false,
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/InspectMenu/ico_favorite.png",
			Size = UDim2.new(0, 16, 0, 16),
			SelectionImageObject = p1.selectionImageObject
		}),
		FavoriteText = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextSize = 12,
			Size = UDim2.new(1, -16, 1, 0),
			Position = UDim2.new(0, 21, 0, 0),
			Text = p1.numFavorites or "",
			Font = AppFonts.default:getDefault(),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextColor3 = Color3.new(1, 1, 1)
		})
	})
end

function Favorites:shouldUpdate(p1): boolean --[[ Line: 98 ]]
	return if p1.detailsInformation.viewingDetails then true else false
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1, _) --[[ Line: 106 ]]
	-- upvalues: GotCurrentFavoriteCountModule (copy)
	return {
		detailsInformation = p1.detailsInformation,
		assetInfo = p1.assets[p1.detailsInformation.assetId],
		bundleInfo = p1.bundles,
		gotCurrentFavoriteCount = GotCurrentFavoriteCountModule(p1)
	}
end, function(Callback) --[[ Line: 115 ]]
	-- upvalues: GetAssetFavoriteCountModule (copy), GetBundleFavoriteCountModule (copy)
	return {
		getAssetFavoriteCount = function(p1) --[[ Line: 117 ]]
			-- upvalues: Callback (copy), GetAssetFavoriteCountModule (upval)
			Callback(GetAssetFavoriteCountModule(p1))
		end,
		getBundleFavoriteCount = function(p1) --[[ Line: 120 ]]
			-- upvalues: Callback (copy), GetBundleFavoriteCountModule (upval)
			Callback(GetBundleFavoriteCountModule(p1))
		end
	}
end)(Favorites)