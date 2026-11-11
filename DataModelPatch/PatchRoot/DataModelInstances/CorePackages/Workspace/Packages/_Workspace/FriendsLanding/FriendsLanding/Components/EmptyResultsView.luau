local FriendsLanding = script:FindFirstAncestor("FriendsLanding")
local Parent = FriendsLanding.Parent
local DependenciesModule = require(FriendsLanding.dependencies)
local Roact = DependenciesModule.Roact
local WithLocalizationFunction = DependenciesModule.withLocalization
local UIBlox = DependenciesModule.UIBlox
local WithStyleFunction = UIBlox.Style.withStyle
local Images = UIBlox.App.ImageSet.Images
local ImageSetLabel = UIBlox.Core.ImageSet.ImageSetLabel
local TextKeysModule = require(FriendsLanding.Common.TextKeys)
local ConstantsModule = require(FriendsLanding.Common.Constants)
local AppFonts = require(Parent.Style).AppFonts
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local Image = FoundationModule.Image
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FoundationCloudAssetsModule = require(Parent.FoundationCloudAssets)
local Assets = FoundationCloudAssetsModule.Assets
local PreloadAssetFunction = FoundationCloudAssetsModule.preloadAsset
local MigrateEmptyResultsViewToFoundation = game:DefineFastFlag("MigrateEmptyResultsViewToFoundation", false)
local FFlagConnectionsToFriendsRename = require(Parent.SharedFlags).FFlagConnectionsToFriendsRename
local EmptyResultsView = Roact.PureComponent:extend("EmptyResultsView")
EmptyResultsView.defaultProps = { layoutOrder = 0, pageLoadingTimeReport = nil }

local function _(p1)
	-- upvalues: PreloadAssetFunction (copy), Assets (copy)
	PreloadAssetFunction(p1)
	local Asset = Assets[p1]
	
	return Asset.assetId, Asset.size
end

function EmptyResultsView.render(p1)
	-- upvalues: WithStyleFunction (copy), WithLocalizationFunction (copy), FFlagConnectionsToFriendsRename (copy), TextKeysModule (copy), Roact (copy), ConstantsModule (copy), MigrateEmptyResultsViewToFoundation (copy), Image (copy), ImageSetLabel (copy), Images (copy), AppFonts (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: WithLocalizationFunction (upval), FFlagConnectionsToFriendsRename (upval), TextKeysModule (upval), Roact (upval), ConstantsModule (upval), p1 (copy), MigrateEmptyResultsViewToFoundation (upval), Image (upval), ImageSetLabel (upval), Images (upval), AppFonts (upval)
		return WithLocalizationFunction({
			noResultsText = "CommonUI.Messages.Response.NoResults",
			addFriendsBtn = if FFlagConnectionsToFriendsRename then TextKeysModule.ADD_FRIENDS_BTN else TextKeysModule.ADD_CONNECTIONS_BTN
		})(function(p3)
			-- upvalues: Roact (upval), ConstantsModule (upval), p1 (upval), MigrateEmptyResultsViewToFoundation (upval), Image (upval), ImageSetLabel (upval), Images (upval), p2 (copy), AppFonts (upval)
			return Roact.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, -(ConstantsModule.TOP_BAR_HEIGHT + 45)),
				LayoutOrder = p1.props.layoutOrder
			}, {
				IndicatorInner = Roact.createElement("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.XY,
					Size = UDim2.new(0, 0, 0, 0),
					Position = UDim2.new(0.5, 0, 0.4, 0),
					AnchorPoint = Vector2.new(0.5, 0.4)
				}, {
					UIList = Roact.createElement("UIListLayout", {
						VerticalAlignment = Enum.VerticalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						Padding = UDim.new(0, 0)
					}),
					Imagelabel = if MigrateEmptyResultsViewToFoundation then Roact.createElement(Image, {
						LayoutOrder = 1,
						Image = p1.props.assetId,
						Size = UDim2.fromOffset(p1.props.assetSize.X, p1.props.assetSize.Y)
					}) else Roact.createElement(ImageSetLabel, {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Image = Images["icons/status/oof_xlarge"],
						ImageColor3 = p2.Theme.TextMuted.Color,
						ImageTransparency = p2.Theme.TextMuted.Transparency,
						Size = UDim2.new(0, 96, 0, 96)
					}),
					Textlabel = Roact.createElement("TextLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						AutomaticSize = Enum.AutomaticSize.XY,
						Font = AppFonts.default:getDefault(),
						Size = UDim2.new(0, 0, 0, 0),
						Text = p3.noResultsText,
						TextColor3 = p2.Theme.TextMuted.Color,
						TextSize = p2.Font.Header2.RelativeSize * p2.Font.BaseSize,
						TextTransparency = p2.Theme.TextMuted.Transparency
					})
				})
			})
		end)
	end)
end

local function EmptyResultsViewContainer(p1)
	-- upvalues: PreloadAssetFunction (copy), Assets (copy), UseTokensFunction (copy), Roact (copy), EmptyResultsView (copy), CryoModule (copy)
	PreloadAssetFunction("pictograms/collaborators")
	local PictogramsCollaborators = Assets["pictograms/collaborators"]
	
	return Roact.createElement(EmptyResultsView, CryoModule.Dictionary.join(p1, {
		assetSize = PictogramsCollaborators.size / 3,
		assetId = PictogramsCollaborators.assetId,
		tokens = UseTokensFunction()
	}))
end

return if MigrateEmptyResultsViewToFoundation then EmptyResultsViewContainer else EmptyResultsView