local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local WithNavigationFunction = require(CorePackages.Packages.RoactNavigation).withNavigation
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local RoactFitComponents = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents
local FitFrameVertical = RoactFitComponents.FitFrameVertical
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local CurrentlySellingRowModule = require(Modules.AvatarExperience.Common.Components.ItemDetails.SellPage.CurrentlySellingRow)
local FitTextLabel = RoactFitComponents.FitTextLabel
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local CurrentlySellingList = RoactModule.PureComponent:extend("CurrentlySellingList")

function CurrentlySellingList.init(p1)
	-- upvalues: AvatarScreen (copy), RoactGamepadModule (copy)
	function p1.removeSoldItem(UserAssetId)
		-- upvalues: p1 (copy), AvatarScreen (upval)
		p1.props.navigation.navigate(AvatarScreen.RemoveCurrentlySellingItemPrompt, {
			itemId = p1.props.itemId,
			userAssetId = UserAssetId,
			onOverlayClosed = p1.props.onOverlayClosed
		})
		p1:setState({ restorePreviousChildFocus = false })
	end
	
	p1:setState({ restorePreviousChildFocus = true })
	
	function p1.onFocusGained()
		-- upvalues: p1 (copy)
		if not p1.state.restorePreviousChildFocus then
			p1:setState({ restorePreviousChildFocus = true })
		end
	end
	
	p1.focusableRefs = RoactGamepadModule.createRefCache()
end

function CurrentlySellingList.createRemovableList(p1, Theme)
	-- upvalues: CatalogConstantsModule (copy), RoactModule (copy), FitFrameVertical (copy), CurrentlySellingRowModule (copy)
	local AssetInfo = p1.props.assetInfo
	local CurrentlySellingList = p1.props.currentlySellingList
	local ItemRestrictions = AssetInfo and AssetInfo.itemRestrictions
	local ItemRestriction = ItemRestrictions and ItemRestrictions[CatalogConstantsModule.ItemRestrictions.LimitedUnique]
	
	local function _(p2: number)
		-- upvalues: CurrentlySellingList (copy), p1 (copy)
		return p2 >= 1 and p2 <= #CurrentlySellingList and p1.focusableRefs[p2] or nil
	end
	
	local Elements = {}
	
	if CurrentlySellingList then
		for LayoutOrder, UserAssetId in CurrentlySellingList do
			local v1 = LayoutOrder - 1
			local FocusableRef = v1 >= 1 and v1 <= #CurrentlySellingList and p1.focusableRefs[v1] or nil
			local v2 = LayoutOrder + 1
			Elements["CurrentlySellingRow" .. LayoutOrder] = RoactModule.createElement(FitFrameVertical, {
				BackgroundTransparency = 1,
				width = UDim.new(1, 0),
				contentPadding = UDim.new(0, 8),
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				LayoutOrder = LayoutOrder
			}, {
				CurrentlySellingRow = RoactModule.createElement(CurrentlySellingRowModule, {
					isLimitedUnique = ItemRestriction,
					horizontalPadding = 24,
					LayoutOrder = 1,
					onActivated = function()
						-- upvalues: p1 (copy), UserAssetId (copy)
						p1.removeSoldItem(UserAssetId)
					end,
					userAssetId = UserAssetId,
					NextSelectionUp = FocusableRef,
					NextSelectionDown = v2 >= 1 and v2 <= #CurrentlySellingList and p1.focusableRefs[v2] or nil,
					[RoactModule.Ref] = LayoutOrder >= 1 and LayoutOrder <= #CurrentlySellingList and p1.focusableRefs[LayoutOrder] or nil,
					onFocusGained = p1.onFocusGained
				}),
				Divider = RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					LayoutOrder = 2,
					BackgroundColor3 = Theme.Divider.Color,
					BackgroundTransparency = Theme.Divider.Transparency,
					Size = UDim2.new(1, -24, 0, 1)
				})
			})
		end
	end
	return Elements
end

function CurrentlySellingList.renderLocalized(p2, p3)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), Focusable (copy), FitFrameVertical (copy), RoactFitComponents (copy), FitTextLabel (copy)
	local LayoutOrder = p2.props.LayoutOrder
	local CurrentlySellingList = p2.props.currentlySellingList
	
	return WithStyleFunction(function(p4)
		-- upvalues: p2 (copy), RoactModule (upval), Focusable (upval), FitFrameVertical (upval), LayoutOrder (copy), CurrentlySellingList (copy), RoactFitComponents (upval), FitTextLabel (upval), p3 (copy)
		local _Font = p4.Font
		local Theme = p4.Theme
		
		return RoactModule.createElement(Focusable[FitFrameVertical], {
			width = UDim.new(1, 0),
			contentPadding = UDim.new(0, 6),
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			BackgroundTransparency = 1,
			LayoutOrder = LayoutOrder,
			NextSelectionLeft = p2.props.NextSelectionLeft,
			NextSelectionRight = p2.props.NextSelectionRight,
			NextSelectionUp = p2.props.NextSelectionUp,
			NextSelectionDown = p2.props.NextSelectionDown,
			[RoactModule.Ref] = p2.props.forwardRef,
			defaultChild = CurrentlySellingList and #CurrentlySellingList > 0 and p2.focusableRefs[1] or nil,
			restorePreviousChildFocus = p2.state.restorePreviousChildFocus
		}, {
			CurrentlySellingLabelContainer = RoactModule.createElement(FitFrameVertical, {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				width = UDim.new(1, 0),
				margin = RoactFitComponents.Rect.quad(0, 0, 0, 24)
			}, {
				CurrentlySellingLabel = RoactModule.createElement(FitTextLabel, {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					width = UDim.new(1, 0),
					Font = _Font.CaptionSubHeader.Font,
					Text = p3.headerText,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextSize = _Font.BaseSize * _Font.CaptionSubHeader.RelativeSize,
					TextColor3 = Theme.TextEmphasis.Color
				})
			}),
			CurrentlySellingRowContainer = RoactModule.createElement(FitFrameVertical, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				width = UDim.new(1, 0),
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left
			}, (p2:createRemovableList(Theme)))
		})
	end)
end

function CurrentlySellingList.render(p2)
	-- upvalues: WithLocalizationFunction (copy)
	local CurrentlySellingList = p2.props.currentlySellingList
	
	if not CurrentlySellingList or #CurrentlySellingList == 0 then return end
	return WithLocalizationFunction({ headerText = "Feature.Catalog.Label.OnSale" })(function(p3)
		-- upvalues: p2 (copy)
		return p2:renderLocalized(p3)
	end)
end

local WithNavigationResult = WithNavigationFunction((RoactRoduxModule.connect(function(p2, p3)
	return {
		assetInfo = p2.AvatarExperience.Common.AssetInfos[p3.itemId],
		currentlySellingList = p2.AvatarExperience.Catalog.Sell.CurrentlySellingAssets[p3.itemId]
	}
end, nil)(CurrentlySellingList)))

return RoactModule.forwardRef(function(p2, ForwardRef)
	-- upvalues: RoactModule (copy), WithNavigationResult (ref), CryoModule (copy)
	return RoactModule.createElement(WithNavigationResult, CryoModule.Dictionary.join(p2, { forwardRef = ForwardRef }))
end)