local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local Parent = script.Parent.Parent
local RoactModule = require(CorePackages.Packages.Roact)
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Skeleton = require(CorePackages.Packages.Foundation).Skeleton
local AssetCardModule = require(Parent.Components.AssetCard)
local InspectAndBuyContextModule = require(Parent.Components.InspectAndBuyContext)
local SetAssetFromBundleInfoModule = require(Parent.Actions.SetAssetFromBundleInfo)
local FFlagAddNewPlayerListMobileFocusNav = require(CorePackages.Workspace.Packages.PlayerList).Flags.FFlagAddNewPlayerListMobileFocusNav
local AssetList = RoactModule.PureComponent:extend("AssetList")

function AssetList.calculateCanvasSize(p1, MaxAssetCardsPerRow, Count, AssetCardSizeY: number) --[[ Line: 25 ]]
	local Current = p1.gridFrameRef.current
	local View = p1.props.views[p1.props.view]
	
	if Current then
		Current.Parent.CanvasSize = UDim2.new(1, 0, 0, math.ceil(Count / MaxAssetCardsPerRow) * (AssetCardSizeY + 10) + (View.TopSizeY + 15))
	end
end

function AssetList.init(p1) --[[ Line: 38 ]]
	-- upvalues: RoactModule (copy), FFlagAddNewPlayerListMobileFocusNav (copy)
	local View = p1.props.views[p1.props.view]
	p1.gridFrameRef = RoactModule.createRef()
	p1.state = {
		assetCardSizeX = View.AssetCardMaxSizeX,
		assetCardSizeY = View.AssetCardMaxSizeY,
		assetCardsLoaded = not FFlagAddNewPlayerListMobileFocusNav and nil
	}
end

function AssetList.render(p1) --[[ Line: 52 ]]
	-- upvalues: RoactModule (copy), AssetCardModule (copy), Skeleton (copy), FFlagAddNewPlayerListMobileFocusNav (copy)
	local View = p1.props.views[p1.props.view]
	local MaxAssetCardsPerRow = View.MaxAssetCardsPerRow
	local AssetCardSizeX = p1.state.assetCardSizeX
	local AssetCardSizeY = p1.state.assetCardSizeY
	local Count = 0
	local Elements = {
		UIGridLayout = RoactModule.createElement("UIGridLayout", {
			CellPadding = UDim2.new(0, 10, 0, 10),
			CellSize = UDim2.new(0, AssetCardSizeX, 0, AssetCardSizeY),
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			FillDirectionMaxCells = MaxAssetCardsPerRow
		})
	}
	
	for _, asset in pairs(p1.props.assets) do
		Count += 1
		Elements[asset.assetId] = RoactModule.createElement(AssetCardModule, { assetInfo = asset, assetCardSizeX = AssetCardSizeX })
	end
	if Count == 0 then
		for i = 1, 30 do
			Elements[i] = RoactModule.createElement(Skeleton, { Size = UDim2.new(1, 0, 0, AssetCardSizeX) })
		end
	elseif FFlagAddNewPlayerListMobileFocusNav then
		p1:setState({ assetCardsLoaded = true })
	end
	p1:calculateCanvasSize(MaxAssetCardsPerRow, Count, AssetCardSizeY)
	
	return RoactModule.createElement("Frame", {
		Size = UDim2.new(1, -(2 * View.BorderPaddingSize), 1, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = 3,
		[RoactModule.Ref] = p1.gridFrameRef,
		[RoactModule.Change.AbsoluteSize] = function(_) --[[ Line: 104 ]]
			-- upvalues: p1 (copy)
			spawn(function() --[[ Line: 105 ]]
				-- upvalues: p1 (upval)
				p1:resize()
			end)
		end
	}, Elements)
end

function AssetList.didMount(p2) --[[ Line: 112 ]]
	p2:resize()
	p2.mounted = true
end

function AssetList.updateAssetsFromBundles(p2) --[[ Line: 126 ]]
	-- upvalues: CryoModule (copy)
	local Bundles = p2.props.bundles
	local AssetBundles = p2.props.assetBundles
	local Assets = p2.props.assets
	local KeysResult = CryoModule.Dictionary.keys(Assets)
	
	if not Bundles or CryoModule.isEmpty(Bundles) then return end
	local Count = 1
	
	for _, bundle in pairs(Bundles) do
		local AssetIds = bundle.assetIds
		
		for i = 1, #AssetIds do
			local Text = tostring(AssetIds[i])
			
			if table.find(KeysResult, Text) then
				local AssetBundle = AssetBundles[Text] or {}
				
				if #AssetBundle == 1 or Count == 1 and #AssetBundle > 1 and Assets[Text] and Assets[Text].parentBundleId == nil then
					p2.props.dispatchSetAssetFromBundleInfo(Text, bundle)
				end
			end
		end
		Count += 1
	end
end

function AssetList.didUpdate(p3, p4) --[[ Line: 166 ]]
	-- upvalues: FFlagAddNewPlayerListMobileFocusNav (copy), GuiService (copy)
	if p3.props.view ~= p4.view then
		p3:resize()
	end
	if p3.mounted and p3.props.gamepadEnabled and not p3.props.detailsInformation.viewingDetails and p3.props.visible and (not FFlagAddNewPlayerListMobileFocusNav or p3.state.assetCardsLoaded) then
		GuiService.SelectedCoreObject = p3.gridFrameRef.current:FindFirstChildWhichIsA("GuiObject")
	end
	if p3.props.assetBundles ~= p4.assetBundles or p3.props.bundles ~= p4.bundles then
		p3:updateAssetsFromBundles()
	end
end

function AssetList.willUnmount(p3) --[[ Line: 186 ]]
	p3.mounted = false
end

function AssetList.resize(p3) --[[ Line: 190 ]]
	local Current = p3.gridFrameRef.current
	local View = p3.props.views[p3.props.view]
	
	if Current then
		local MaxAssetCardsPerRow: number = View.MaxAssetCardsPerRow
		local Floored = math.floor((Current.AbsoluteSize.X - 10 * (MaxAssetCardsPerRow - 1)) / MaxAssetCardsPerRow)
		local Smallest = math.min(Floored, View.AssetCardMaxSizeX)
		local Smallest1 = math.min(Floored / 0.68, View.AssetCardMaxSizeY)
		
		if p3.state.assetCardSizeX ~= Smallest or p3.state.assetCardSizeY ~= Smallest1 then
			p3:setState({ assetCardSizeX = Smallest, assetCardSizeY = Smallest1 })
		end
	end
end

return RoactRoduxModule.connect(function(p3, _) --[[ Line: 221 ]]
	return {
		view = p3.view,
		visible = p3.visible,
		assets = p3.assets,
		bundles = p3.bundles,
		assetBundles = p3.assetBundles,
		detailsInformation = p3.detailsInformation,
		gamepadEnabled = p3.gamepadEnabled
	}
end, function(Callback) --[[ Line: 231 ]]
	-- upvalues: SetAssetFromBundleInfoModule (copy)
	return {
		dispatchSetAssetFromBundleInfo = function(p3, p4) --[[ Line: 233 ]]
			-- upvalues: Callback (copy), SetAssetFromBundleInfoModule (upval)
			Callback(SetAssetFromBundleInfoModule(p3, p4))
		end
	}
end)(function(p3) --[[ Line: 212 | Named "AssetListWrapper" ]]
	-- upvalues: RoactModule (copy), InspectAndBuyContextModule (copy), CryoModule (copy), AssetList (copy)
	return RoactModule.createElement(InspectAndBuyContextModule.Consumer, {
		render = function(Views) --[[ Line: 214 ]]
			-- upvalues: CryoModule (upval), p3 (copy), RoactModule (upval), AssetList (upval)
			return RoactModule.createElement(AssetList, (CryoModule.Dictionary.join(p3, { views = Views })))
		end
	})
end)