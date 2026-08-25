local corePackagesService = game:GetService("CorePackages")
local parent = script.Parent.Parent
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local appFonts = require(corePackagesService.Workspace.Packages.Style).AppFonts
local utilityFunctionsModule = require(parent.UtilityFunctions)
local getAssetFavoriteCountModule = require(parent.Thunks.GetAssetFavoriteCount)
local getBundleFavoriteCountModule = require(parent.Thunks.GetBundleFavoriteCount)
local gotCurrentFavoriteCountModule = require(parent.Selectors.GotCurrentFavoriteCount)
local getSelectionImageObjectRegularModule = require(parent.getSelectionImageObjectRegular)
local favorites = roactModule.PureComponent:extend("Favorites")

function favorites.setText(value)
	-- upvalues: utilityFunctionsModule (ref)
	local assetInfo = value.props.assetInfo or {}
	local bundleInfo = value.props.bundleInfo
	
	if assetInfo.parentBundleId ~= nil then
		local bundleId = utilityFunctionsModule.getBundleId(assetInfo)
		
		if bundleInfo[bundleId] then
			value.numFavorites = bundleInfo[bundleId].numFavorites
			
			return
		end
	elseif assetInfo then
		value.numFavorites = assetInfo.numFavorites
	end
end

function favorites.init(p0)
	-- upvalues: getSelectionImageObjectRegularModule (ref)
	p0.numFavorites = ""
	p0.selectionImageObject = getSelectionImageObjectRegularModule()
end

function favorites.willUpdate(p1, p2)
	-- upvalues: utilityFunctionsModule (ref)
	local getAssetFavoriteCount = p1.props.getAssetFavoriteCount
	local getBundleFavoriteCount = p1.props.getBundleFavoriteCount
	
	if p2.assetInfo then
		local assetInfo = p2.assetInfo
		local var11 = assetInfo.parentBundleId ~= nil
		
		if not p2.gotCurrentFavoriteCount then
			coroutine.wrap(function()
				-- upvalues: var11 (ref), getAssetFavoriteCount (ref), assetInfo (ref), utilityFunctionsModule (copy), getBundleFavoriteCount (ref)
				if var11 then
					getBundleFavoriteCount(utilityFunctionsModule.getBundleId(assetInfo))
					
					return
				end
				getAssetFavoriteCount(assetInfo.assetId)
			end)()
		end
	end
end

function favorites.render(p3)
	-- upvalues: roactModule (ref), appFonts (ref)
	p3:setText()
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 3,
		Size = UDim2.new(1, 0, 0, 16)
	}, {
		FavoriteIcon = roactModule.createElement("ImageButton", {
			Selectable = false,
			BackgroundTransparency = 1,
			Image = "rbxasset://textures/ui/InspectMenu/ico_favorite.png",
			Size = UDim2.new(0, 16, 0, 16),
			SelectionImageObject = p3.selectionImageObject
		}),
		FavoriteText = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextSize = 12,
			Size = UDim2.new(1, -16, 1, 0),
			Position = UDim2.new(0, 21, 0, 0),
			Text = p3.numFavorites or "",
			Font = appFonts.default:getDefault(),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextColor3 = Color3.new(1, 1, 1)
		})
	})
end

function favorites.shouldUpdate(_, p4)
	return p4.detailsInformation.viewingDetails
end

return roactRoduxModule.UNSTABLE_connect2(function(p5, _)
	-- upvalues: gotCurrentFavoriteCountModule (ref)
	return {
		detailsInformation = p5.detailsInformation,
		assetInfo = p5.assets[p5.detailsInformation.assetId],
		bundleInfo = p5.bundles,
		gotCurrentFavoriteCount = gotCurrentFavoriteCountModule(p5)
	}
end, function(p6)
	-- upvalues: getAssetFavoriteCountModule (ref), getBundleFavoriteCountModule (ref)
	return {
		getAssetFavoriteCount = function(value)
			-- upvalues: p6 (ref), getAssetFavoriteCountModule (copy)
			p6(getAssetFavoriteCountModule(value))
		end,
		getBundleFavoriteCount = function(p7)
			-- upvalues: p6 (ref), getBundleFavoriteCountModule (copy)
			p6(getBundleFavoriteCountModule(p7))
		end
	}
end)(favorites)