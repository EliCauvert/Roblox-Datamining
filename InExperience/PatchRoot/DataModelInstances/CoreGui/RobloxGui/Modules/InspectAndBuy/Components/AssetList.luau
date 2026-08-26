local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local parent = script.Parent.Parent
local roactModule = require(corePackagesService.Packages.Roact)
local cryoModule = require(corePackagesService.Packages.Cryo)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local skeleton = require(corePackagesService.Packages.Foundation).Skeleton
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local assetCardModule = require(parent.Components.AssetCard)
local inspectAndBuyContextModule = require(parent.Components.InspectAndBuyContext)
local setAssetFromBundleInfoModule = require(parent.Actions.SetAssetFromBundleInfo)
local fFlagAddNewPlayerListMobileFocusNav = playerListModule.Flags.FFlagAddNewPlayerListMobileFocusNav
local assetList = roactModule.PureComponent:extend("AssetList")

function assetList.calculateCanvasSize(p1, p2, p3, p4)
	local current = p1.gridFrameRef.current
	local _ = nil
	local view = p1.props.views[p1.props.view]
	
	if current then
		current.Parent.CanvasSize = UDim2.new(1, 0, 0, math.ceil(p3 / p2) * (p4 + 10) + (view.TopSizeY + 15))
	end
end

function assetList.init(p1)
	-- upvalues: roactModule (ref), fFlagAddNewPlayerListMobileFocusNav (ref)
	local _ = nil
	local view = p1.props.views[p1.props.view]
	p1.gridFrameRef = roactModule.createRef()
	p1.state = {
		assetCardSizeX = view.AssetCardMaxSizeX,
		assetCardSizeY = view.AssetCardMaxSizeY,
		assetCardsLoaded = if fFlagAddNewPlayerListMobileFocusNav then false else nil
	}
end

function assetList.render(p1)
	-- upvalues: roactModule (ref), assetCardModule (ref), skeleton (ref), fFlagAddNewPlayerListMobileFocusNav (ref)
	local _ = nil
	local view = p1.props.views[p1.props.view]
	local assets = p1.props.assets
	local maxAssetCardsPerRow = view.MaxAssetCardsPerRow
	local assetCardSizeX = p1.state.assetCardSizeX
	local assetCardSizeY = p1.state.assetCardSizeY
	local t = {
		UIGridLayout = roactModule.createElement("UIGridLayout", {
			CellPadding = UDim2.new(0, 10, 0, 10),
			CellSize = UDim2.new(0, assetCardSizeX, 0, assetCardSizeY),
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			FillDirectionMaxCells = maxAssetCardsPerRow
		})
	}
	local var1 = 0
	
	for i, v in pairs(assets) do
		var1 += 1
		t[v.assetId] = roactModule.createElement(assetCardModule, { assetInfo = v, assetCardSizeX = assetCardSizeX })
	end
	if var1 == 0 then
		for i_1 = 1, 30 do
			t[i_1] = roactModule.createElement(skeleton, { Size = UDim2.new(1, 0, 0, assetCardSizeX) })
		end
	elseif fFlagAddNewPlayerListMobileFocusNav then
		p1:setState({ assetCardsLoaded = true })
	end
	p1:calculateCanvasSize(maxAssetCardsPerRow, var1, assetCardSizeY)
	
	return roactModule.createElement("Frame", {
		Size = UDim2.new(1, -(2 * view.BorderPaddingSize), 1, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = 3,
		[roactModule.Ref] = p1.gridFrameRef,
		[roactModule.Change.AbsoluteSize] = function(_)
			-- upvalues: p1 (ref)
			spawn(function()
				-- upvalues: p1 (copy)
				p1:resize()
			end)
		end
	}, t)
end

function assetList.didMount(p2)
	p2:resize()
	p2.mounted = true
end

function assetList.updateAssetsFromBundles(value)
	-- upvalues: cryoModule (ref)
	local bundles = value.props.bundles
	local assetBundles = value.props.assetBundles
	local assets = value.props.assets
	local var2 = cryoModule.Dictionary.keys(assets)
	
	if not bundles or cryoModule.isEmpty(bundles) then return end
	local var3 = 1
	
	for i, v in pairs(bundles) do
		local assetIds = v.assetIds
		
		for i_1 = 1, #assetIds do
			local var4 = tostring(assetIds[i_1])
			
			if table.find(var2, var4) then
				local var5 = assetBundles[var4] or {}
				
				if #var5 == 1 or var3 == 1 and #var5 > 1 and (assets[var4] and assets[var4].parentBundleId == nil) then
					value.props.dispatchSetAssetFromBundleInfo(var4, v)
				end
			end
		end
		var3 += 1
	end
end

function assetList.didUpdate(p2, p3)
	-- upvalues: fFlagAddNewPlayerListMobileFocusNav (ref), guiService (ref)
	if p2.props.view ~= p3.view then
		p2:resize()
	end
	if p2.mounted and p2.props.gamepadEnabled and (not p2.props.detailsInformation.viewingDetails and p2.props.visible) and (if fFlagAddNewPlayerListMobileFocusNav then p2.state.assetCardsLoaded else true) then
		guiService.SelectedCoreObject = p2.gridFrameRef.current:FindFirstChildWhichIsA("GuiObject")
	end
	if p2.props.assetBundles ~= p3.assetBundles or p2.props.bundles ~= p3.bundles then
		p2:updateAssetsFromBundles()
	end
end

function assetList.willUnmount(p2)
	p2.mounted = false
end

function assetList.resize(p2)
	local current = p2.gridFrameRef.current
	local _ = nil
	local view = p2.props.views[p2.props.view]
	
	if current then
		local maxAssetCardsPerRow = view.MaxAssetCardsPerRow
		local floored = math.floor((current.AbsoluteSize.X - 10 * (maxAssetCardsPerRow - 1)) / maxAssetCardsPerRow)
		local minValue = math.min(floored, view.AssetCardMaxSizeX)
		local minValue_1 = math.min(floored / 0.68, view.AssetCardMaxSizeY)
		
		if p2.state.assetCardSizeX ~= minValue or p2.state.assetCardSizeY ~= minValue_1 then
			p2:setState({ assetCardSizeX = minValue, assetCardSizeY = minValue_1 })
		end
	end
end

return roactRoduxModule.connect(function(p2, _)
	return {
		view = p2.view,
		visible = p2.visible,
		assets = p2.assets,
		bundles = p2.bundles,
		assetBundles = p2.assetBundles,
		detailsInformation = p2.detailsInformation,
		gamepadEnabled = p2.gamepadEnabled
	}
end, function(p2)
	-- upvalues: setAssetFromBundleInfoModule (ref)
	return {
		dispatchSetAssetFromBundleInfo = function(value, p3)
			-- upvalues: p2 (ref), setAssetFromBundleInfoModule (copy)
			p2(setAssetFromBundleInfoModule(value, p3))
		end
	}
end)(function(value)
	-- upvalues: roactModule (ref), inspectAndBuyContextModule (ref), cryoModule (ref), assetList (ref)
	return roactModule.createElement(inspectAndBuyContextModule.Consumer, {
		render = function(p2)
			-- upvalues: cryoModule (copy), value (ref), roactModule (copy), assetList (copy)
			return roactModule.createElement(assetList, cryoModule.Dictionary.join(value, { views = p2 }))
		end
	})
end)