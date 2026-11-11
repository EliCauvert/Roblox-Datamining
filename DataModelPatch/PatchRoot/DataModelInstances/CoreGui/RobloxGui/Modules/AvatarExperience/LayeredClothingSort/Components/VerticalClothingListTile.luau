local CorePackages = game:GetService("CorePackages")
local RunService = game:GetService("RunService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local TModule = require(CorePackages.Packages.t)
local CryoModule = require(CorePackages.Packages.Cryo)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ConstantsModule = require(Modules.AvatarExperience.AvatarRefinement.Constants)
local DraggableTileModule = require(Modules.AvatarExperience.LayeredClothingSort.Components.DraggableTile)
local LCSortMoreButtonModule = require(Modules.AvatarExperience.LayeredClothingSort.Components.LCSortMoreButton)
local LCSortArrowNavModule = require(Modules.AvatarExperience.LayeredClothingSort.Components.LCSortArrowNav)
local WrapResult = UIBloxModule.Utility.SpringAnimatedItem.wrap(RoactGamepadModule.Focusable.Frame)
local UserLibModule = require(CorePackages.Workspace.Packages.UserLib)
local Constants = UserLibModule.Utils.Constants
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local _UDim = UDim.new(0, 10)
local SpringOptions = { dampingRatio = 1, frequency = 10 }
local VerticalClothingListTile = RoactModule.PureComponent:extend("VerticalClothingListTile")
VerticalClothingListTile.validateProps = TModule.strictInterface({
	asset = TModule.table,
	selectedAssetId = TModule.optional(TModule.string),
	positionYOffset = TModule.number,
	dragging = TModule.boolean,
	positionBinding = TModule.union(TModule.UDim2, TModule.table),
	isTileSelected = TModule.boolean,
	tileIndex = TModule.number,
	contextualOptionsVisible = TModule.union(TModule.boolean, TModule.table),
	updateContextualOptionsVisible = TModule.callback,
	resetSelectedTile = TModule.callback,
	initializeDrag = TModule.callback,
	onEndClick = TModule.callback,
	tileRef = TModule.optional(TModule.table),
	lastInputIsGamepad = TModule.boolean,
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	wrapperRef = TModule.optional(TModule.table)
})
VerticalClothingListTile.defaultProps = { lastInputIsGamepad = false }

function VerticalClothingListTile.init(p1)
	-- upvalues: RoactModule (copy)
	p1.tileRef = p1.props.tileRef or RoactModule.createRef()
	p1.timeOfInputBegan = 0
	p1.clickAndHoldConn = nil
	p1:setState({ dragAfterShortPress = false })
end

function VerticalClothingListTile.disconnectConn(p1)
	if p1.clickAndHoldConn then
		p1.clickAndHoldConn:Disconnect()
		p1.clickAndHoldConn = nil
	end
end

function VerticalClothingListTile.renderSelectedTile(p1, _, p2)
	-- upvalues: Constants (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), ConstantsModule (copy), RoactModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), RoactGamepadModule (copy), _UDim (copy), DraggableTileModule (copy), IsVRAppBuildFunction (copy), LCSortMoreButtonModule (copy), LCSortArrowNavModule (copy)
	local Theme = p2.Theme
	local _UDim2 = UDim2.fromOffset(ConstantsModule.Tile.Padding + ConstantsModule.Tile.Size / 2, p1.props.positionYOffset + ConstantsModule.Tile.Size / 2)
	
	return RoactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then "Frame" else RoactGamepadModule.Focusable.Frame, {
		Active = true,
		BackgroundTransparency = 1,
		Size = UDim2.fromOffset(ConstantsModule.Tile.SelectedSize, ConstantsModule.Tile.SelectedSize),
		Position = (p1.props.dragging or p1.state.dragAfterShortPress) and p1.props.positionBinding or _UDim2,
		AnchorPoint = Vector2.new(0.5, 0.5),
		[RoactModule.Event.InputBegan] = function(p3, Input)
			-- upvalues: p1 (copy), ConstantsModule (upval)
			local UserInputType = Input.UserInputType
			
			if not p1.props.dragging and (UserInputType == Enum.UserInputType.MouseButton1 or UserInputType == Enum.UserInputType.Touch) then
				p1:setState({ dragAfterShortPress = true })
				p1.props.updateContextualOptionsVisible(false)
				p1.props.initializeDrag(p3, Input, p1.props.asset, p1.props.tileIndex, ConstantsModule.Tile.Size / 2)
				
				return
			end
		end
	}, {
		SelectionBackground = not p1.props.lastInputIsGamepad and RoactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			ZIndex = 3,
			BackgroundColor3 = Theme.IconEmphasis.Color,
			Size = UDim2.fromScale(1, 1)
		}, {
			UICorner = RoactModule.createElement("UICorner", { CornerRadius = _UDim })
		}),
		ItemTile = RoactModule.createElement(DraggableTileModule, {
			isSelectedByTap = true,
			ZIndex = 4,
			thumbnail = GetRbxthumbWithTypeSizeAndOptionsFunction(p1.props.asset.id, Constants.RbxthumbTypes.Asset, 150),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.new(1, -4, 1, -4),
			assetTypeId = p1.props.asset.typeId
		}),
		LCSortMoreButton = if IsVRAppBuildFunction() then nil else RoactModule.createElement(LCSortMoreButtonModule, {
			ZIndex = 2,
			Visible = p1.props.contextualOptionsVisible,
			asset = p1.props.asset,
			onUnequip = p1.props.resetSelectedTile
		}),
		LCSortArrowNav = RoactModule.createElement(LCSortArrowNavModule, {
			Visible = p1.props.contextualOptionsVisible,
			index = p1.props.tileIndex,
			asset = p1.props.asset
		})
	})
end

function VerticalClothingListTile.renderUnselectedTile(p1, _)
	-- upvalues: Constants (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), RoactModule (copy), WrapResult (copy), ConstantsModule (copy), RunService (copy), SpringOptions (copy), DraggableTileModule (copy)
	return RoactModule.createElement(WrapResult, {
		animatedValues = { positionY = p1.props.positionYOffset },
		mapValuesToProps = function(p2)
			-- upvalues: ConstantsModule (upval)
			return {
				Position = UDim2.fromOffset(ConstantsModule.Tile.Padding, p2.positionY)
			}
		end,
		regularProps = {
			Active = true,
			BackgroundTransparency = 1,
			Size = UDim2.fromOffset(ConstantsModule.Tile.Size, ConstantsModule.Tile.Size),
			AnchorPoint = Vector2.new(0, 0),
			[RoactModule.Event.InputBegan] = function(p2, Input)
				-- upvalues: p1 (copy), RunService (upval), ConstantsModule (upval)
				if p1.props.dragging then return end
				local UserInputType = Input.UserInputType
				
				if UserInputType ~= Enum.UserInputType.MouseButton1 and UserInputType ~= Enum.UserInputType.Touch then return end
				if Input.UserInputState == Enum.UserInputState.Begin then
					p1:disconnectConn()
					p1.timeOfInputBegan = tick()
					p1.clickAndHoldConn = RunService.RenderStepped:connect(function(_)
						-- upvalues: p1 (upval), ConstantsModule (upval), p2 (copy), Input (copy)
						if ConstantsModule.LongPressSeconds <= tick() - p1.timeOfInputBegan then
							if not p1.props.dragging then
								p1.props.initializeDrag(p2, Input, p1.props.asset, p1.props.tileIndex)
							end
							p1:disconnectConn()
						end
					end)
					
					return
				end
			end,
			[RoactModule.Event.InputEnded] = function(p2, Input)
				-- upvalues: p1 (copy)
				if p1.props.dragging or not p1.clickAndHoldConn then return end
				local UserInputType = Input.UserInputType
				
				if UserInputType ~= Enum.UserInputType.MouseButton1 and UserInputType ~= Enum.UserInputType.Touch then return end
				if Input.UserInputState == Enum.UserInputState.Change then
					p1.props.initializeDrag(p2, Input, p1.props.asset, p1.props.tileIndex)
					p1:disconnectConn()
					
					return
				else
					p1:disconnectConn()
					p1.props.updateContextualOptionsVisible(true)
					p1.props.onEndClick(p1.props.asset)
				end
			end
		},
		springOptions = SpringOptions
	}, {
		ItemTile = RoactModule.createElement(DraggableTileModule, {
			thumbnail = GetRbxthumbWithTypeSizeAndOptionsFunction(p1.props.asset.id, Constants.RbxthumbTypes.Asset, 150),
			imageTransparency = if p1.props.selectedAssetId == nil then 0 else 0.5,
			assetTypeId = p1.props.asset.typeId
		})
	})
end

function VerticalClothingListTile.renderWithProviders(p1, Callback, p2)
	-- upvalues: RoactModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), RoactGamepadModule (copy), CursorKind (copy)
	return RoactModule.createElement("Frame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		ZIndex = if p1.props.isTileSelected then 6 else 4,
		SelectionGroup = if FFlagAXMigrateAXToGlobalAutofocus then true else nil,
		SelectionBehaviorUp = if FFlagAXMigrateAXToGlobalAutofocus and p1.props.isTileSelected then Enum.SelectionBehavior.Stop else nil,
		SelectionBehaviorDown = if FFlagAXMigrateAXToGlobalAutofocus and p1.props.isTileSelected then Enum.SelectionBehavior.Stop else nil,
		[RoactModule.Ref] = p1.props.wrapperRef,
		NextSelectionUp = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.props.NextSelectionUp,
		NextSelectionDown = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.props.NextSelectionDown,
		NextSelectionRight = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.props.NextSelectionRight,
		NextSelectionLeft = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.props.NextSelectionLeft
	}, (RoactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then "Frame" else RoactGamepadModule.Focusable.Frame, {
		[RoactModule.Ref] = p1.tileRef,
		SelectionImageObject = Callback(CursorKind.RoundedRectNoInset)
	}, p1.props.isTileSelected and p1:renderSelectedTile(Callback, p2) or p1:renderUnselectedTile(Callback))))
end

function VerticalClothingListTile.render(p1)
	-- upvalues: WithSelectionCursorProviderFunction (copy), WithStyleFunction (copy)
	return WithSelectionCursorProviderFunction(function(p2)
		-- upvalues: WithStyleFunction (upval), p1 (copy)
		return WithStyleFunction(function(p3)
			-- upvalues: p1 (upval), p2 (copy)
			return p1:renderWithProviders(p2, p3)
		end)
	end)
end

function VerticalClothingListTile.didUpdate(p1, p2)
	if p1.state.dragAfterShortPress and not p1.props.isTileSelected and p2.isTileSelected then
		p1:setState({ dragAfterShortPress = false })
	end
end

function VerticalClothingListTile.willUnmount(p1)
	p1:disconnectConn()
end

return RoactModule.forwardRef(function(p1, WrapperRef)
	-- upvalues: RoactModule (copy), VerticalClothingListTile (copy), CryoModule (copy)
	return RoactModule.createElement(VerticalClothingListTile, CryoModule.Dictionary.join(p1, { wrapperRef = WrapperRef }))
end)