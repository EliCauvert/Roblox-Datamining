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

function assetList.calculateCanvasSize(p0, p1, p2, p3)
	local current = p0.gridFrameRef.current
	local _ = nil
	local view = p0.props.views[p0.props.view]
	
	if current then
		current.Parent.CanvasSize = UDim2.new(1, 0, 0, math.ceil(p2 / p1) * (p3 + 10) + (view.TopSizeY + 15))
	end
end

function assetList.init(p4)
	-- upvalues: roactModule (ref), fFlagAddNewPlayerListMobileFocusNav (ref)
	local _ = nil
	local view = p4.props.views[p4.props.view]
	p4.gridFrameRef = roactModule.createRef()
	p4.state = {
		assetCardSizeX = view.AssetCardMaxSizeX,
		assetCardSizeY = view.AssetCardMaxSizeY,
		assetCardsLoaded = if fFlagAddNewPlayerListMobileFocusNav then false else nil
	}
end

function assetList.render(p5)
	-- upvalues: roactModule (ref), assetCardModule (ref), skeleton (ref), fFlagAddNewPlayerListMobileFocusNav (ref)
	local _ = nil
	local view = p5.props.views[p5.props.view]
	local assets = p5.props.assets
	local maxAssetCardsPerRow = view.MaxAssetCardsPerRow
	local assetCardSizeX = p5.state.assetCardSizeX
	local assetCardSizeY = p5.state.assetCardSizeY
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
	local var11 = 0
	
	for i, v in pairs(assets) do
		var11 += 1
		t[v.assetId] = roactModule.createElement(assetCardModule, { assetInfo = v, assetCardSizeX = assetCardSizeX })
	end
	if var11 == 0 then
		for i_1 = 1, 30 do
			t[i_1] = roactModule.createElement(skeleton, { Size = UDim2.new(1, 0, 0, assetCardSizeX) })
		end
	elseif fFlagAddNewPlayerListMobileFocusNav then
		p5:setState({ assetCardsLoaded = true })
	end
	p5:calculateCanvasSize(maxAssetCardsPerRow, var11, assetCardSizeY)
	
	return roactModule.createElement("Frame", {
		Size = UDim2.new(1, -(2 * view.BorderPaddingSize), 1, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = 3,
		[roactModule.Ref] = p5.gridFrameRef,
		[roactModule.Change.AbsoluteSize] = function(_)
			-- upvalues: p5 (ref)
			spawn(function()
				-- upvalues: p5 (copy)
				p5:resize()
			end)
		end
	}, t)
end

function assetList.didMount(p6)
	p6:resize()
	p6.mounted = true
end

function assetList.updateAssetsFromBundles(value)
	-- upvalues: cryoModule (ref)
	local bundles = value.props.bundles
	local assetBundles = value.props.assetBundles
	local assets = value.props.assets
	local var12 = cryoModule.Dictionary.keys(assets)
	
	if not bundles or cryoModule.isEmpty(bundles) then return end
	local var13 = 1
	
	for i, v in pairs(bundles) do
		local assetIds = v.assetIds
		
		for i_1 = 1, #assetIds do
			local var14 = tostring(assetIds[i_1])
			
			if table.find(var12, var14) then
				local var15 = assetBundles[var14] or {}
				
				if #var15 == 1 or var13 == 1 and #var15 > 1 and (assets[var14] and assets[var14].parentBundleId == nil) then
					value.props.dispatchSetAssetFromBundleInfo(var14, v)
				end
			end
		end
		var13 += 1
	end
end

function assetList.didUpdate(p7, p8)
	-- upvalues: fFlagAddNewPlayerListMobileFocusNav (ref), guiService (ref)
	if p7.props.view ~= p8.view then
		p7:resize()
	end
	if p7.mounted and p7.props.gamepadEnabled and (not p7.props.detailsInformation.viewingDetails and p7.props.visible) and (if fFlagAddNewPlayerListMobileFocusNav then p7.state.assetCardsLoaded else true) then
		guiService.SelectedCoreObject = p7.gridFrameRef.current:FindFirstChildWhichIsA("GuiObject")
	end
	if p7.props.assetBundles ~= p8.assetBundles or p7.props.bundles ~= p8.bundles then
		p7:updateAssetsFromBundles()
	end
end

function assetList.willUnmount(p9)
	p9.mounted = false
end

function assetList.resize(p10)
	local current = p10.gridFrameRef.current
	local _ = nil
	local view = p10.props.views[p10.props.view]
	
	if current then
		local maxAssetCardsPerRow = view.MaxAssetCardsPerRow
		local floored = math.floor((current.AbsoluteSize.X - 10 * (maxAssetCardsPerRow - 1)) / maxAssetCardsPerRow)
		local minValue = math.min(floored, view.AssetCardMaxSizeX)
		local minValue_1 = math.min(floored / 0.68, view.AssetCardMaxSizeY)
		
		if p10.state.assetCardSizeX ~= minValue or p10.state.assetCardSizeY ~= minValue_1 then
			p10:setState({ assetCardSizeX = minValue, assetCardSizeY = minValue_1 })
		end
	end
end

return roactRoduxModule.connect(function(p12, _)
	return {
		view = p12.view,
		visible = p12.visible,
		assets = p12.assets,
		bundles = p12.bundles,
		assetBundles = p12.assetBundles,
		detailsInformation = p12.detailsInformation,
		gamepadEnabled = p12.gamepadEnabled
	}
end, function(p13)
	-- upvalues: setAssetFromBundleInfoModule (ref)
	return {
		dispatchSetAssetFromBundleInfo = function(value, p14)
			-- upvalues: p13 (ref), setAssetFromBundleInfoModule (copy)
			p13(setAssetFromBundleInfoModule(value, p14))
		end
	}
end)(function(value)
	-- upvalues: roactModule (ref), inspectAndBuyContextModule (ref), cryoModule (ref), assetList (ref)
	return roactModule.createElement(inspectAndBuyContextModule.Consumer, {
		render = function(p11)
			-- upvalues: cryoModule (copy), value (ref), roactModule (copy), assetList (copy)
			return roactModule.createElement(assetList, cryoModule.Dictionary.join(value, { views = p11 }))
		end
	})
end)